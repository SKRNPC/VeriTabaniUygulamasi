
namespace WindowsFormsApp5
{
    partial class Form3
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
            this.ddtgridSilinenSoru = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.ddtgridSilinenSoru)).BeginInit();
            this.SuspendLayout();
            // 
            // ddtgridSilinenSoru
            // 
            this.ddtgridSilinenSoru.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ddtgridSilinenSoru.Location = new System.Drawing.Point(0, 0);
            this.ddtgridSilinenSoru.Name = "ddtgridSilinenSoru";
            this.ddtgridSilinenSoru.RowHeadersWidth = 51;
            this.ddtgridSilinenSoru.RowTemplate.Height = 24;
            this.ddtgridSilinenSoru.Size = new System.Drawing.Size(799, 348);
            this.ddtgridSilinenSoru.TabIndex = 0;
            // 
            // Form3
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.ddtgridSilinenSoru);
            this.Name = "Form3";
            this.Text = "Form3";
            ((System.ComponentModel.ISupportInitialize)(this.ddtgridSilinenSoru)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        public System.Windows.Forms.DataGridView ddtgridSilinenSoru;
    }
}