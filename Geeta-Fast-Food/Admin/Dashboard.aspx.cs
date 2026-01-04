using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Geeta_Fast_Food.Utils;

namespace Geeta_Fast_Food.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {

        private static string connectionString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        [WebMethod]
        public static object GetNewOrders()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 OrderID, CustomerName, TotalAmount FROM Orders WHERE Status = 'Pending' ORDER BY OrderID DESC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    return new
                    {
                        OrderID = dt.Rows[0]["OrderID"],
                        CustomerName = dt.Rows[0]["CustomerName"],
                        TotalAmount = dt.Rows[0]["TotalAmount"]
                    };
                }
            }
            return new { }; // Return empty if no orders
        }

        [WebMethod]
        public static void ConfirmOrder(int orderID)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Orders SET Status = 'Confirmed' WHERE OrderID = @OrderID", con);
                cmd.Parameters.AddWithValue("@OrderID", orderID);
                cmd.ExecuteNonQuery();
            }
        }

        [WebMethod]
        public static void CancelOrder(int orderID)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Orders SET Status = 'Canceled' WHERE OrderID = @OrderID", con);
                cmd.Parameters.AddWithValue("@OrderID", orderID);
                cmd.ExecuteNonQuery();
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "";
                if (Session["admin"] == null)
                {
                    Response.Redirect("../User/Login.aspx");
                }
                else
                {
                    DashboardCount dashboard = new DashboardCount();
                    Session["category"] = Convert.ToInt32(dashboard.Count("CATEGORY"));
                    Session["product"] = Convert.ToInt32(dashboard.Count("PRODUCT"));
                    Session["order"] = Convert.ToInt32(dashboard.Count("ORDER"));
                    Session["delivered"] = Convert.ToInt32(dashboard.Count("DELIVERED"));
                    Session["pending"] = Convert.ToInt32(dashboard.Count("PENDING"));
                    Session["user"] = Convert.ToInt32(dashboard.Count("USER"));
                    Session["soldAmount"] = Convert.ToInt32(dashboard.Count("SOLDAMOUNT"));
                    Session["contact"] = Convert.ToInt32(dashboard.Count("CONTACT"));
                }
            }
        }
    }
}