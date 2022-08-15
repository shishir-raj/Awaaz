using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Awaaz
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button b1 = (Button) Master.FindControl("Button1");
            Button b2 = (Button) Master.FindControl("Button2");
            if (Session["user"] == null)
            {
                
                b2.Visible = false;
                b1.Visible = true;
            }

            if (Session["user"] != null)
            {
                b1.Visible = false;
                b2.Visible = true;


            }
        }
    }
}