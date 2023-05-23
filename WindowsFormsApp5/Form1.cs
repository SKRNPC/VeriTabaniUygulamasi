using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp5
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port = 5432; Database=dbSinav; user Id=postgres; password=Ks2523348");
        private void button1_Click(object sender, EventArgs e)
        {
            string sorgu = "select * from soru";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void btnSoruEkle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut1 = new NpgsqlCommand("insert into secenek(secenek_id,secenek_a,secenek_b,secenek_c,secenek_d) values " +
                "(@p1,@p2,@p3,@p4,@p5)", baglanti);
            komut1.Parameters.AddWithValue("@p1", int.Parse(txtSecenekId.Text));
            komut1.Parameters.AddWithValue("@p2", txtSecenekA.Text);
            komut1.Parameters.AddWithValue("@p3", txtSecenekB.Text);
            komut1.Parameters.AddWithValue("@p4", txtSecenekC.Text);
            komut1.Parameters.AddWithValue("@p5", txtSecenekD.Text);
            komut1.ExecuteNonQuery();
            NpgsqlCommand komut2 = new NpgsqlCommand("insert into soru(soru_id,sorumetni,zorluk,dogrucevap,secenek_id,ders_id) values" +
                "(@p1,@p2,@p3,@p4,@p5,@p6)", baglanti);
            komut2.Parameters.AddWithValue("@p1", int.Parse(txtSoruId.Text));
            komut2.Parameters.AddWithValue("@p2", rtxtSoru.Text);
            komut2.Parameters.AddWithValue("@p3", int.Parse(cmbZorluk.SelectedValue.ToString())) ;
            komut2.Parameters.AddWithValue("@p4", cmbDogruCevap.Text);
            komut2.Parameters.AddWithValue("@p5", int.Parse(txtSecenekId.Text));
            komut2.Parameters.AddWithValue("@p6", int.Parse(txtDersId.Text));
            komut2.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("oldu");


        }

        private void Form1_Load(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select * from zorluk", baglanti);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmbZorluk.DisplayMember = "zorluk_derece";
            cmbZorluk.ValueMember = "zorluk_id";
            cmbZorluk.DataSource = dt;
           
            NpgsqlDataAdapter da2 = new NpgsqlDataAdapter("select * from dogru_secenek", baglanti);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            cmbDogruCevap.DisplayMember = "dogru_cevap";
            cmbDogruCevap.ValueMember = "cevap_id";
            cmbDogruCevap.DataSource = dt2;
            baglanti.Close();





        }

        private void btnSoruSil_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut3 = new NpgsqlCommand("delete from soru where soru_id=@p1",baglanti);
            komut3.Parameters.AddWithValue("@p1", int.Parse(txtSoruId.Text));
            komut3.ExecuteNonQuery();
            NpgsqlCommand komut4 = new NpgsqlCommand("delete from secenek where secenek_id=@p1", baglanti);
            komut4.Parameters.AddWithValue("@p1", int.Parse(txtSecenekId.Text));
            komut4.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("sildi");
        }

        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut4 = new NpgsqlCommand("update soru set sorumetni=@p1,zorluk=@p2,dogrucevap=@p3,ders_id=@p4 where soru_id=@p5", baglanti);
            komut4.Parameters.AddWithValue("@p1", rtxtSoru.Text);
            komut4.Parameters.AddWithValue("@p2", cmbZorluk.Text);
            komut4.Parameters.AddWithValue("@p3", cmbDogruCevap.Text);
            komut4.Parameters.AddWithValue("@p4", int.Parse(txtDersId.Text));
            komut4.Parameters.AddWithValue("@p5", int.Parse(txtSoruId.Text));
            komut4.ExecuteNonQuery();
            NpgsqlCommand komut5 = new NpgsqlCommand("update secenek set secenek_a=@p1,secenek_b=@p2,secenek_c=@p3,secenek_d=@p4 where secenek_id=@p5", baglanti);
            komut5.Parameters.AddWithValue("@p1", txtSecenekA.Text);
            komut5.Parameters.AddWithValue("@p2", txtSecenekB.Text);
            komut5.Parameters.AddWithValue("@p3", txtSecenekC.Text);
            komut5.Parameters.AddWithValue("@p4", txtSecenekC.Text);
            komut5.Parameters.AddWithValue("@p5", int.Parse(txtSecenekId.Text));
            komut5.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("güncel");
        }

        private void btnAra_Click(object sender, EventArgs e)
        {

            baglanti.Open();
            NpgsqlDataAdapter da=new NpgsqlDataAdapter("Select *From soru where soru_id=@p1", baglanti);
            da.SelectCommand.Parameters.AddWithValue("@p1",  int.Parse(txtAra.Text));
            
            DataSet ds = new DataSet();
            da.Fill(ds,"soru");
            dataGridView1.DataSource = ds.Tables["soru"];
            baglanti.Close();
            
        }

        private void btnToplamSoru_Click(object sender, EventArgs e)
        {
            Form2 f2 = new Form2();
            string sorgu2 = "select * from toplamsoru";
            NpgsqlDataAdapter da3 = new NpgsqlDataAdapter(sorgu2, baglanti);
            DataSet ds = new DataSet();
            da3.Fill(ds);
            f2.dtgridToplamSoru.DataSource = ds.Tables[0];
            f2.ShowDialog();
        }

        private void btnSilinen_Click(object sender, EventArgs e)
        {
            Form3 f3 = new Form3();
            string sorgu3 = "select * from silinensoru";
            NpgsqlDataAdapter da4 = new NpgsqlDataAdapter(sorgu3, baglanti);
            DataSet ds = new DataSet();
            da4.Fill(ds);
            f3.ddtgridSilinenSoru.DataSource = ds.Tables[0];
            f3.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form4 f4 = new Form4();
            string sorgu4 = "select * from ders_id_yeni";
            NpgsqlDataAdapter da5 = new NpgsqlDataAdapter(sorgu4, baglanti);
            DataSet ds = new DataSet();
            da5.Fill(ds);
            f4.dtgridDegisen.DataSource = ds.Tables[0];
            f4.ShowDialog();
        }
    }
}
