using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.InteropServices;
using System.Text;
using System.IO;
using System.Media;
using System.Data.SqlClient;
using System.Data;




namespace Project_Awaaz
{
    public partial class Recorder : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da;

        byte []stream;

        [DllImport("winmm.dll")]
        private static extern long mciSendString(string command, StringBuilder retstring, int returnpath, IntPtr callback);

 

        public Recorder() {
            mciSendString("open new Type waveaudio alias recsound ", null, 0, IntPtr.Zero);
            mciSendString("set recsound time format ms bitspersample 16 channels 2 samplespersec 48000 bytespersec 192000 alignment 4", null, 0, IntPtr.Zero);

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            startrecording.Click += new EventHandler(startrecording_Click);

            con = new SqlConnection(@"Data Source=LAPTOP-H5KP0AKL\SQLEXPRESS;Initial Catalog=awaaz;Integrated Security=True");
            con.Open();


        }

        protected void startrecording_Click(object sender, EventArgs e)
        {

            mciSendString("record recsound", null, 0, IntPtr.Zero);
            stoprecording.Click += new EventHandler(stoprecording_Click);

        }

        protected void stoprecording_Click(object sender, EventArgs e)
        {
            mciSendString("save recsound  d:\\name.wav", null, 0, IntPtr.Zero);
            mciSendString("close recsound", null, 0, IntPtr.Zero);
            stream = File.ReadAllBytes(@"d:\name.wav");
            string someString = Encoding.ASCII.GetString(stream);
/*
            string s = "INSERT into Table_1 (audio) VALUES ('" + someString + "')";
            cmd = new SqlCommand(s,con);
            cmd.ExecuteNonQuery();

            string s2 = "SELECT * FROM Table_1";
            da = new SqlDataAdapter(s2, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            foreach (DataRow dr in dt.Rows) {
                string s1 = (string)dr[0];
                byte[] bytes = Encoding.ASCII.GetBytes(s1);

                File.WriteAllBytes(@"d:\name.wav", bytes);

                
                var soundPlayer = new System.Media.SoundPlayer();
                soundPlayer.SoundLocation = @"d:\name.wav";
                soundPlayer.Play();
               


            }*/

            /* 
             Stream s = new MemoryStream(stream);
             System.Media.SoundPlayer mp = new System.Media.SoundPlayer(s);
             mp.Play();*/



        }
    }
}