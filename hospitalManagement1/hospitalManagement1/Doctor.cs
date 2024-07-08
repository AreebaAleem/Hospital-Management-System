using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace hospitalManagement1
{
    public partial class Doctor : Form
    {
        public Doctor()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-K08IIJP\\SQLEXPRESS;Initial Catalog =hospital_Management2; Integrated Security = true");
        private void button1_Click(object sender, EventArgs e)
        {
            string selectCommand = "select * from vwPatientAppointmentwithDoctor";
            
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand, con);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);
            dataGridView1.DataSource = dataSet.Tables[0];
            con.Close();



        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
