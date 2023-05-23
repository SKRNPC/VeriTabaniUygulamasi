
namespace WindowsFormsApp5
{
    partial class Form1
    {
        /// <summary>
        ///Gerekli tasarımcı değişkeni.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///Kullanılan tüm kaynakları temizleyin.
        /// </summary>
        ///<param name="disposing">yönetilen kaynaklar dispose edilmeliyse doğru; aksi halde yanlış.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer üretilen kod

        /// <summary>
        /// Tasarımcı desteği için gerekli metot - bu metodun 
        ///içeriğini kod düzenleyici ile değiştirmeyin.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.button1 = new System.Windows.Forms.Button();
            this.label7 = new System.Windows.Forms.Label();
            this.btnSoruSil = new System.Windows.Forms.Button();
            this.btnSoruEkle = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.txtSecenekD = new System.Windows.Forms.TextBox();
            this.txtSecenekC = new System.Windows.Forms.TextBox();
            this.txtSecenekB = new System.Windows.Forms.TextBox();
            this.txtSecenekA = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.rtxtSoru = new System.Windows.Forms.RichTextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtDersId = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.txtSoruId = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtSecenekId = new System.Windows.Forms.TextBox();
            this.cmbZorluk = new System.Windows.Forms.ComboBox();
            this.cmbDogruCevap = new System.Windows.Forms.ComboBox();
            this.btnGuncelle = new System.Windows.Forms.Button();
            this.btnAra = new System.Windows.Forms.Button();
            this.txtAra = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.btnToplamSoru = new System.Windows.Forms.Button();
            this.btnSilinen = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(2, 2);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(1244, 225);
            this.dataGridView1.TabIndex = 0;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(468, 445);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(139, 28);
            this.button1.TabIndex = 1;
            this.button1.Text = "Listele";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(445, 324);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(121, 17);
            this.label7.TabIndex = 39;
            this.label7.Text = "DOĞRU CEVAP : ";
            // 
            // btnSoruSil
            // 
            this.btnSoruSil.Location = new System.Drawing.Point(638, 411);
            this.btnSoruSil.Name = "btnSoruSil";
            this.btnSoruSil.Size = new System.Drawing.Size(139, 28);
            this.btnSoruSil.TabIndex = 38;
            this.btnSoruSil.Text = "Soru Sil";
            this.btnSoruSil.UseVisualStyleBackColor = true;
            this.btnSoruSil.Click += new System.EventHandler(this.btnSoruSil_Click);
            // 
            // btnSoruEkle
            // 
            this.btnSoruEkle.Location = new System.Drawing.Point(468, 411);
            this.btnSoruEkle.Name = "btnSoruEkle";
            this.btnSoruEkle.Size = new System.Drawing.Size(139, 28);
            this.btnSoruEkle.TabIndex = 37;
            this.btnSoruEkle.Text = "Soru Ekle";
            this.btnSoruEkle.UseVisualStyleBackColor = true;
            this.btnSoruEkle.Click += new System.EventHandler(this.btnSoruEkle_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(489, 296);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(77, 17);
            this.label6.TabIndex = 33;
            this.label6.Text = "ZORLUK : ";
            // 
            // txtSecenekD
            // 
            this.txtSecenekD.Location = new System.Drawing.Point(95, 511);
            this.txtSecenekD.Name = "txtSecenekD";
            this.txtSecenekD.Size = new System.Drawing.Size(304, 22);
            this.txtSecenekD.TabIndex = 32;
            // 
            // txtSecenekC
            // 
            this.txtSecenekC.Location = new System.Drawing.Point(95, 472);
            this.txtSecenekC.Name = "txtSecenekC";
            this.txtSecenekC.Size = new System.Drawing.Size(304, 22);
            this.txtSecenekC.TabIndex = 31;
            // 
            // txtSecenekB
            // 
            this.txtSecenekB.Location = new System.Drawing.Point(95, 432);
            this.txtSecenekB.Name = "txtSecenekB";
            this.txtSecenekB.Size = new System.Drawing.Size(304, 22);
            this.txtSecenekB.TabIndex = 30;
            // 
            // txtSecenekA
            // 
            this.txtSecenekA.Location = new System.Drawing.Point(95, 392);
            this.txtSecenekA.Name = "txtSecenekA";
            this.txtSecenekA.Size = new System.Drawing.Size(304, 22);
            this.txtSecenekA.TabIndex = 29;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(33, 514);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(23, 17);
            this.label5.TabIndex = 28;
            this.label5.Text = "D)";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(33, 475);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(22, 17);
            this.label4.TabIndex = 27;
            this.label4.Text = "C)";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(33, 435);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(22, 17);
            this.label3.TabIndex = 26;
            this.label3.Text = "B)";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(33, 395);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(22, 17);
            this.label2.TabIndex = 25;
            this.label2.Text = "A)";
            // 
            // rtxtSoru
            // 
            this.rtxtSoru.Location = new System.Drawing.Point(95, 233);
            this.rtxtSoru.Name = "rtxtSoru";
            this.rtxtSoru.Size = new System.Drawing.Size(304, 134);
            this.rtxtSoru.TabIndex = 24;
            this.rtxtSoru.Text = "";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.label1.Location = new System.Drawing.Point(33, 236);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(60, 17);
            this.label1.TabIndex = 23;
            this.label1.Text = "SORU : ";
            // 
            // txtDersId
            // 
            this.txtDersId.Location = new System.Drawing.Point(565, 356);
            this.txtDersId.Name = "txtDersId";
            this.txtDersId.Size = new System.Drawing.Size(100, 22);
            this.txtDersId.TabIndex = 42;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(489, 359);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(75, 17);
            this.label8.TabIndex = 41;
            this.label8.Text = "DERS ID : ";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(489, 265);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(77, 17);
            this.label9.TabIndex = 43;
            this.label9.Text = "SORU ID : ";
            // 
            // txtSoruId
            // 
            this.txtSoruId.Location = new System.Drawing.Point(567, 262);
            this.txtSoruId.Name = "txtSoruId";
            this.txtSoruId.Size = new System.Drawing.Size(100, 22);
            this.txtSoruId.TabIndex = 44;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(465, 236);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(101, 17);
            this.label10.TabIndex = 45;
            this.label10.Text = "SEÇENEK ID : ";
            // 
            // txtSecenekId
            // 
            this.txtSecenekId.Location = new System.Drawing.Point(567, 231);
            this.txtSecenekId.Name = "txtSecenekId";
            this.txtSecenekId.Size = new System.Drawing.Size(100, 22);
            this.txtSecenekId.TabIndex = 46;
            // 
            // cmbZorluk
            // 
            this.cmbZorluk.FormattingEnabled = true;
            this.cmbZorluk.Location = new System.Drawing.Point(567, 293);
            this.cmbZorluk.Name = "cmbZorluk";
            this.cmbZorluk.Size = new System.Drawing.Size(121, 24);
            this.cmbZorluk.TabIndex = 47;
            // 
            // cmbDogruCevap
            // 
            this.cmbDogruCevap.FormattingEnabled = true;
            this.cmbDogruCevap.Location = new System.Drawing.Point(565, 321);
            this.cmbDogruCevap.Name = "cmbDogruCevap";
            this.cmbDogruCevap.Size = new System.Drawing.Size(121, 24);
            this.cmbDogruCevap.TabIndex = 48;
            // 
            // btnGuncelle
            // 
            this.btnGuncelle.Location = new System.Drawing.Point(638, 445);
            this.btnGuncelle.Name = "btnGuncelle";
            this.btnGuncelle.Size = new System.Drawing.Size(139, 28);
            this.btnGuncelle.TabIndex = 49;
            this.btnGuncelle.Text = "Güncelle";
            this.btnGuncelle.UseVisualStyleBackColor = true;
            this.btnGuncelle.Click += new System.EventHandler(this.btnGuncelle_Click);
            // 
            // btnAra
            // 
            this.btnAra.Location = new System.Drawing.Point(671, 507);
            this.btnAra.Name = "btnAra";
            this.btnAra.Size = new System.Drawing.Size(139, 24);
            this.btnAra.TabIndex = 50;
            this.btnAra.Text = "ID Ara";
            this.btnAra.UseVisualStyleBackColor = true;
            this.btnAra.Click += new System.EventHandler(this.btnAra_Click);
            // 
            // txtAra
            // 
            this.txtAra.Location = new System.Drawing.Point(565, 509);
            this.txtAra.Name = "txtAra";
            this.txtAra.Size = new System.Drawing.Size(100, 22);
            this.txtAra.TabIndex = 51;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(455, 511);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(109, 17);
            this.label11.TabIndex = 52;
            this.label11.Text = "Soru id Giriniz : ";
            // 
            // btnToplamSoru
            // 
            this.btnToplamSoru.Location = new System.Drawing.Point(853, 277);
            this.btnToplamSoru.Name = "btnToplamSoru";
            this.btnToplamSoru.Size = new System.Drawing.Size(104, 64);
            this.btnToplamSoru.TabIndex = 53;
            this.btnToplamSoru.Text = "Toplam soru tablosu";
            this.btnToplamSoru.UseVisualStyleBackColor = true;
            this.btnToplamSoru.Click += new System.EventHandler(this.btnToplamSoru_Click);
            // 
            // btnSilinen
            // 
            this.btnSilinen.Location = new System.Drawing.Point(987, 277);
            this.btnSilinen.Name = "btnSilinen";
            this.btnSilinen.Size = new System.Drawing.Size(104, 64);
            this.btnSilinen.TabIndex = 54;
            this.btnSilinen.Text = "Silinenler Tablosu";
            this.btnSilinen.UseVisualStyleBackColor = true;
            this.btnSilinen.Click += new System.EventHandler(this.btnSilinen_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(1121, 277);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(104, 64);
            this.button2.TabIndex = 55;
            this.button2.Text = "Değişen Tablosu";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1249, 559);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.btnSilinen);
            this.Controls.Add(this.btnToplamSoru);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.txtAra);
            this.Controls.Add(this.btnAra);
            this.Controls.Add(this.btnGuncelle);
            this.Controls.Add(this.cmbDogruCevap);
            this.Controls.Add(this.cmbZorluk);
            this.Controls.Add(this.txtSecenekId);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.txtSoruId);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.txtDersId);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.btnSoruSil);
            this.Controls.Add(this.btnSoruEkle);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtSecenekD);
            this.Controls.Add(this.txtSecenekC);
            this.Controls.Add(this.txtSecenekB);
            this.Controls.Add(this.txtSecenekA);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.rtxtSoru);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Form1";
            this.Text = "3";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button btnSoruSil;
        private System.Windows.Forms.Button btnSoruEkle;
        private System.Windows.Forms.Label label6;
        public System.Windows.Forms.TextBox txtSecenekD;
        public System.Windows.Forms.TextBox txtSecenekC;
        public System.Windows.Forms.TextBox txtSecenekB;
        public System.Windows.Forms.TextBox txtSecenekA;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        public System.Windows.Forms.RichTextBox rtxtSoru;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtDersId;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtSoruId;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txtSecenekId;
        private System.Windows.Forms.ComboBox cmbZorluk;
        private System.Windows.Forms.ComboBox cmbDogruCevap;
        private System.Windows.Forms.Button btnGuncelle;
        private System.Windows.Forms.Button btnAra;
        private System.Windows.Forms.TextBox txtAra;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Button btnToplamSoru;
        private System.Windows.Forms.Button btnSilinen;
        private System.Windows.Forms.Button button2;
    }
}

