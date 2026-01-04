using System;
using System.Collections.Generic;
using System.Data;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;

namespace Geeta_Fast_Food.User
{
    public partial class Payment : System.Web.UI.Page
    {
        string senderEmail = ConfigurationManager.AppSettings["SMTPEmail"];
        string senderPassword = ConfigurationManager.AppSettings["SMTPPassword"];

        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr, dr1;
        DataTable dt;
        SqlTransaction transaction= null;
        string _name = string.Empty; string _cardNo = string.Empty; string _expiryDate = string.Empty; string _cvv = string.Empty;
        string _address = string.Empty; string _paymentMode = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userId"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
               
            }
        }


        private void SendOrderConfirmationEmail(string userEmail, string invoiceHtml, int orderId)
        {
            try
            {
                string smtpServer = "smtp.gmail.com";
                int smtpPort = 587;
                string senderEmail = "supershivam877@gmail.com";
                string senderPassword = "dmmkrarbniftgdzg"; // Avoid hardcoding in production; use secure config

                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(senderEmail);
                mail.To.Add(userEmail); // Customer's email
                mail.Bcc.Add("supershivam877@gmail.com"); // Owner's email
                mail.Subject = "Order Confirmation - Order ID: " + orderId;
                mail.Body = "<h2>Thank you for your order!</h2>";
                mail.Body += "<p>Your order details are below:</p>";
                mail.Body += invoiceHtml;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient(smtpServer, smtpPort);
                smtp.Credentials = new System.Net.NetworkCredential(senderEmail, senderPassword);
                smtp.EnableSsl = true;
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error sending email: " + ex.Message + "')</script>");
            }
        }


        private string GetUserEmail(int userId)
        {
            string email = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT Email FROM Users WHERE UserId = @UserId", con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        email = cmd.ExecuteScalar()?.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error fetching email: " + ex.Message + "')</script>");
            }
            return email;
        }


        private string GenerateInvoice(DataTable orderDetails)
        {
            StringBuilder invoiceBuilder = new StringBuilder();
            invoiceBuilder.Append("<table border='1' style='width:100%;border-collapse:collapse;'>");
            invoiceBuilder.Append("<tr><th>Order No</th><th>Product ID</th><th>Quantity</th><th>Order Date</th></tr>");

            foreach (DataRow row in orderDetails.Rows)
            {
                invoiceBuilder.Append("<tr>");
                invoiceBuilder.Append($"<td>{row["OrderNo"]}</td>");
                invoiceBuilder.Append($"<td>{row["ProductId"]}</td>");
                invoiceBuilder.Append($"<td>{row["Quantity"]}</td>");
                invoiceBuilder.Append($"<td>{row["OrderDate"]}</td>");
                invoiceBuilder.Append("</tr>");
            }

            invoiceBuilder.Append("</table>");
            return invoiceBuilder.ToString();
        }


        protected void lbCardSubmit_Click(object sender, EventArgs e)
         {
            _name = txtName.Text.Trim();
            _cardNo = txtCardNo.Text.Trim();
            _cardNo = string.Format("************{0}", txtCardNo.Text.Trim().Substring(12, 4));
            _expiryDate = txtExpMonth.Text.Trim() + "/" + txtExpYear.Text.Trim();
            _cvv = txtCvv.Text.Trim();
            _address= txtAddress.Text.Trim();
            _paymentMode = "card";
            if(Session["userId"] != null)
            {
                OrderPayment(_name, _cardNo, _expiryDate, _cvv, _address, _paymentMode);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void lbCodSubmit_Click(object sender, EventArgs e)
        {

            _address = txtCODAddress.Text.Trim();
            _paymentMode = "cod";
            if (Session["userId"] != null)
            {
                OrderPayment(_name, _cardNo, _expiryDate, _cvv, _address, _paymentMode);
               
                               GenerateInvoice(dt); // Call helper method to format order details
                
                // Send email
           
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        void OrderPayment(string name, string cardNo, string expiryDate, string cvv, string address, string paymentMode)
        {
            int payementId; int productId; int quantity; 
            dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[7] {
            new DataColumn("OrderNo",typeof(string)),
             new DataColumn("ProductId",typeof(int)),
             new DataColumn("Quantity",typeof(int)),
             new DataColumn("UserId",typeof(int)),
             new DataColumn("Status",typeof(string)),
             new DataColumn("PaymentId",typeof(int)),
             new DataColumn("OrderDate",typeof(DateTime)),
            });
            con = new SqlConnection(Connection.GetConnectionString());
            con.Open();
            #region Sql Transaction
            transaction = con.BeginTransaction();
            cmd = new SqlCommand("Save_Payment", con, transaction);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@CardNo", cardNo);
            cmd.Parameters.AddWithValue("@ExpiryDate", expiryDate);
            cmd.Parameters.AddWithValue("@Cvv", cvv);
            cmd.Parameters.AddWithValue("@Address", address);
            cmd.Parameters.AddWithValue("@PaymentMode", paymentMode);
            cmd.Parameters.Add("@InsertedId", SqlDbType.Int);
            cmd.Parameters["@InsertedId"].Direction = ParameterDirection.Output;
            try
            {
                cmd.ExecuteNonQuery();
                payementId = Convert.ToInt32(cmd.Parameters["@InsertedId"].Value);
                

                #region Getting Cart Item's
                cmd = new SqlCommand("Cart_Crud", con, transaction);
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    
                    productId = (int)dr["ProductId"];
                    quantity = (int)dr["Quantity"];
                    // Update Product quantity
                    UpdateQuantity(productId, quantity, transaction, con);

                    // Update Product quantity End

                    // Delete Cart Item 
                    DeleteCartItem(productId, transaction, con);
                    // Delete Cart Item End

                    dt.Rows.Add(Utils.GetUniqueId(), productId, quantity, (int)Session["userId"], "Pending", payementId, Convert.ToDateTime(DateTime.Now));
                }
                dr.Close();
                
                #endregion Getting Cart Item's

                #region Order Details
                if (dt.Rows.Count > 0)
                {
                    cmd = new SqlCommand("Save_Orders", con, transaction);
                    cmd.Parameters.AddWithValue("@tblOrders", dt);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }
                
                #endregion Order Details

                transaction.Commit();
                // Send Email Notification
                string userEmail = GetUserEmail((int)Session["userId"]);
                string invoiceHtml = GenerateInvoice(dt);
                SendOrderConfirmationEmail(userEmail, invoiceHtml, payementId);
                lblMsg.Visible = true;
                lblMsg.Text = "Your item Ordered successsful";
                lblMsg.CssClass = "alert alert-success";
                Response.AddHeader("REFRESH", "1;URL=Invoice.aspx?id=" + payementId);
            }
            catch (Exception e)
            {
                try
                {
                    transaction.Rollback();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                }

            }
            finally
            {
                con.Close();
            }
            #endregion Sql Transaction

        }

        void UpdateQuantity(int _productId, int _quantity, SqlTransaction sqlTransaction, SqlConnection sqlConnection)
        {
            int dbQuantity;
            cmd = new SqlCommand("Product_curd", sqlConnection, sqlTransaction);
            cmd.Parameters.AddWithValue("@Action", "GETBYID");
            cmd.Parameters.AddWithValue("@ProductId", _productId);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                dr1 = cmd.ExecuteReader();  
                while(dr1.Read())
                {
                    dbQuantity = (int)dr1["Quantity"];
                    if(dbQuantity > _quantity && dbQuantity > 2)
                    {
                        dbQuantity = dbQuantity - _quantity;
                        cmd = new SqlCommand("Product_curd", sqlConnection, sqlTransaction);
                        cmd.Parameters.AddWithValue("@Action", "QTYUPDATE");
                        cmd.Parameters.AddWithValue("@Quantity", dbQuantity);
                        cmd.Parameters.AddWithValue("@ProductId", _productId);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.ExecuteNonQuery();

                    }
                }
                dr1.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.StackTrace.ToString() + "')</script>");
            }
            


        }

        void DeleteCartItem(int _productId,  SqlTransaction sqlTransaction, SqlConnection sqlConnection)
        {
            cmd = new SqlCommand("Cart_Crud", sqlConnection, sqlTransaction);
            cmd.Parameters.AddWithValue("@Action", "DELETE");
            cmd.Parameters.AddWithValue("@ProductId", _productId);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
             cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            
        }

    }
}