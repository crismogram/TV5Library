using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using WebMatrix.WebData;

public partial class Report_BetaReports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!WebSecurity.IsAuthenticated)
        {
            Response.Redirect("~/MemberArea/Dashboard");
        }

        GridFilterMenu menu = RadGrid1.FilterMenu;
        int i = 0;
        while (i < menu.Items.Count)
        {
            if (menu.Items[i].Text == "NoFilter" || menu.Items[i].Text == "Contains" || menu.Items[i].Text == "EqualTo" || menu.Items[i].Text == "Between")
            {
                i++;
            }
            else
            {
                menu.Items.RemoveAt(i);
            }
        }


    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (!(CB1.Checked == false && CB2.Checked == false && CB3.Checked == false && CB4.Checked == false && CB5.Checked == false && CB6.Checked == false && CB7.Checked == false))
        {
            ConfigureExport();
            RadGrid1.MasterTableView.ExportToCSV();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!(CB1.Checked == false && CB2.Checked == false && CB3.Checked == false && CB4.Checked == false && CB5.Checked == false && CB6.Checked == false && CB7.Checked == false))
        {
            RadGrid1.ExportSettings.Word.Format = GridWordExportFormat.Docx;
            ConfigureExport();
            RadGrid1.MasterTableView.ExportToWord();
        }

    }

    public void ConfigureExport()
    {
        RadGrid1.ExportSettings.ExportOnlyData = false;
        RadGrid1.ExportSettings.IgnorePaging = true;
        RadGrid1.ExportSettings.OpenInNewWindow = true;
        RadGrid1.ExportSettings.UseItemStyles = false;
        RadGrid1.ExportSettings.FileName = "Beta Tapes Reports";

        RadGrid1.MasterTableView.GetColumn("Beta Number").Visible = CB1.Checked;
        RadGrid1.MasterTableView.GetColumn("Subject").Visible = CB2.Checked;
        RadGrid1.MasterTableView.GetColumn("Transaction Date/Time").Visible = CB3.Checked;
        RadGrid1.MasterTableView.GetColumn("Action").Visible = CB4.Checked;
        RadGrid1.MasterTableView.GetColumn("Library User").Visible = CB5.Checked;
        RadGrid1.MasterTableView.GetColumn("Librarian").Visible = CB6.Checked;
        RadGrid1.MasterTableView.GetColumn("Details").Visible = CB7.Checked;
    }
}
