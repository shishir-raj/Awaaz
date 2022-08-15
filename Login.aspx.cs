using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Project_Awaaz
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da;

        protected void Page_Load(object sender, EventArgs e)
        {

            con = new SqlConnection(@"Data Source=LAPTOP-H5KP0AKL\SQLEXPRESS;Initial Catalog=awaaz;Integrated Security=True");
            con.Open();
           
            
                Panel1.Enabled = false;
                Panel1.Visible = false;
            
            Button b1 = (Button)Master.FindControl("Button1");
            b1.Enabled = false;
            b1.Visible = false;
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Login button click event;
            DataTable dt = new DataTable();
            string s1 = "SELECT * from userData";
            da = new SqlDataAdapter(s1, con);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows) {
                if (TextBox8.Text == dr[1].ToString())
                {
                    if (TextBox9.Text == dr[2].ToString())
                    {
                        Session["user"] = TextBox8.Text;
                        Response.Redirect("home.aspx");
                    }
                    else
                        Label1.Text = "Password Incorrect!";

                }
                else {
                    Label1.Text = "User NOT found!";

                }

            }

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            //Signup button click event;
            Panel1.Visible = true;
            Panel1.Enabled = true;
            Panel2.Visible = false;
            Panel2.Enabled = false;
     
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
   
            string s1 = "SELECT TOP 1 userid from userData ORDER BY userid DESC";
            da = new SqlDataAdapter(s1, con);
            da.Fill(dt);
            string id = dt.Rows[0][0].ToString();
            int i = Int32.Parse(id);
            i++;
            string s = "INSERT into userData (userid, username, name,password,email,phone,dob,country) VALUES ('"+i+"','"+TextBox1.Text+"','"+TextBox1.Text+ "','" + TextBox2.Text + "','" + TextBox7.Text + "','" + TextBox5.Text + "','" + TextBox4.Text + "', '" + TextBox6.Text + "')";
            cmd = new SqlCommand(s,con);
            cmd.ExecuteNonQuery();
            Session["user"] = TextBox1.Text;
            Response.Redirect("home.aspx");


          

        }
    }
}