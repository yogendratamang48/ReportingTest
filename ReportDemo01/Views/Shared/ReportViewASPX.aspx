<%@ Page Language="C#"  CodeBehind="ReportViewASPX.aspx.cs" Inherits="ReportDemo01.Views.Shared.ReportViewASPX" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report Viewer in MVC5</title>
    <script runat="server">
        void Page_load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //List<ReportDemo01.Application> app = null;
                ReportDemo01.Application app = null;
                using (ReportDemo01.ShangrilaReportsEntities dc=new ReportDemo01.ShangrilaReportsEntities())
                {
                    app = dc.Applications.FirstOrDefault(a => a.ApplicationId == 1);
                }

                //Map control Report to rdlc File
                rptDhito.LocalReport.ReportPath = Server.MapPath("~/Reports/RPDhito.rdlc");
                rptDhito.LocalReport.DataSources.Clear();

                //Create New Data Source
                ReportDataSource rdc = new ReportDataSource("MyDataset", app);
                
                //Add Data Source to the Local Report
                rptDhito.LocalReport.DataSources.Add(rdc);
                rptDhito.LocalReport.Refresh();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="rptDhito" AsyncRendering="false"  SizeToReportContent="true" runat="server"></rsweb:ReportViewer>
    </div>
    </form>
</body>
</html>
