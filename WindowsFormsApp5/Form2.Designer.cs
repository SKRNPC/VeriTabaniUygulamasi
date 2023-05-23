
namespace WindowsFormsApp5
{
    partial class Form2
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dtgridToplamSoru = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dtgridToplamSoru)).BeginInit();
            this.SuspendLayout();
            // 
            // dtgridToplamSoru
            // 
            this.dtgridToplamSoru.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgridToplamSoru.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgridToplamSoru.GridColor = System.Drawing.SystemColors.ControlDarkDark;
            this.dtgridToplamSoru.Location = new System.Drawing.Point(0, 0);
            this.dtgridToplamSoru.Name = "dtgridToplamSoru";
            this.dtgridToplamSoru.RowHeadersWidth = 51;
            this.dtgridToplamSoru.RowTemplate.Height = 24;
            this.dtgridToplamSoru.Size = new System.Drawing.Size(788, 309);
            this.dtgridToplamSoru.TabIndex = 0;
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.dtgridToplamSoru);
            this.Name = "Form2";
            this.Text = "Form2";
            ((System.ComponentModel.ISupportInitialize)(this.dtgridToplamSoru)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        public System.Windows.Forms.DataGridView dtgridToplamSoru;
    }
}