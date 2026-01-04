using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Geeta_Fast_Food.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.Url.AbsoluteUri.ToString().Contains("Default.aspx"))
            {
                form1.Attributes.Add("class", "sub_page");
            }
            else
            {
                form1.Attributes.Remove("class");

                // load the control
                Control SliderWebUserControl = (Control)Page.LoadControl("SliderWebUserControl.ascx");

                // add the control to the panel
                palSliderUC.Controls.Add(SliderWebUserControl);


            }
            if (Session["userId"] != null)
            {
                lbLoginOrLogout.Text = "Logout";
                Utils utils= new Utils();
                Session["cartCount"] = utils.cartCount(Convert.ToInt32(Session["userId"])).ToString();  
            }
            else
            {
                lbLoginOrLogout.Text = "Login";
                Session["cartCount"] = "0";
            }
        }

        protected void lbLoginOrLogout_Click(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Login.aspx"); 
            }
        }

        protected void lbRegistrationOrProfile_Click(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
            {
                lbRegisterOrProfile.ToolTip = "User Profile";
                Response.Redirect("Profile.aspx");
            }
            else
            {
                lbRegisterOrProfile.ToolTip = "User Registration";
                Response.Redirect("Registration.aspx");
            }
        }
    }
}