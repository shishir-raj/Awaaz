using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Awaaz
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Button2.Visible = false;
                Button1.Visible = true;
            }
          
            if (Session["user"] != null)
            {
                Button1.Visible = false;
                Button2.Visible = true;
                Label1.Text = "Welcome " + Session["user"];


            }

        }
       

        protected void Button1_Click(object sender, EventArgs e)
        {
   
            Response.Redirect("Login.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("home.aspx");
        }
    }
}