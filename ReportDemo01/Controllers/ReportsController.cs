using CrystalDecisions.CrystalReports.Engine;
using Microsoft.Reporting.WebForms;
using ReportDemo01.Reports;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReportDemo01.Controllers
{
    public class ReportsController : Controller
    {
        // GET: Reports
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Report()
        {
            var ReportPath = Server.MapPath("~/Reports/RPDhito.rdlc");

            RenderReport(ReportPath);

            return View();
        }

        public FileContentResult RenderReport(string ReportPath)
        {

            List<Home> homes;
            List<Application> apps;
            List< LoanBasedOnFund> lstLbof=new List<LoanBasedOnFund>();

            List<LoanBasedOnNonFund> lstLbonf;
            IEnumerable<Objective> lstObjectives;
            List<Objective> lftObjectives;
            List<Objective> rtObjectives;
            List<BankAccountInfo> lstBanks;
            List<ProjectInvestment> lstProjectInvestments=new List<ProjectInvestment>();
            LastPagePara lst;
          

            Warning[] warnings;
            string mimeType;
            string[] streamids;
            string encoding;
            string filenameExtension;
            List<String> lstString;
            List<LongMessage> lstLongMessage=new List<LongMessage>();

            using (ShangrilaReportsEntities dc = new ShangrilaReportsEntities())
            {
                homes = dc.Homes.ToList();
                apps = dc.Applications.ToList();
                LoanBasedOnFund lbof = dc.LoanBasedOnFunds.FirstOrDefault(s => s.LoanBasedonFundID == 1);
                lstLbof.Add(lbof);
                lstLbonf = dc.LoanBasedOnNonFunds.ToList();
                lstObjectives = dc.Objectives.ToList();
                lstBanks = dc.BankAccountInfoes.ToList();
                ProjectInvestment pi = dc.ProjectInvestments.FirstOrDefault(s => s.ProjectInvestmentID == 1);
                lstProjectInvestments.Add(pi);
                lst = dc.LastPageParas.FirstOrDefault(a => a.LastPageParaID == 1);
            }
            lftObjectives = lstObjectives.Where((c, i) => i % 2 == 0).ToList();
            rtObjectives = lstObjectives.Where((c, i) => i % 2 != 0).ToList();
            lstString = ReportsHelper.GetText(lst.FirstPara.ToString(), 120).ToList();
            foreach(string item in lstString)
            {
                lstLongMessage.Add(new LongMessage { Message = item });
            }

            //DataTable table = ReportsHelper.ConvertoToDataTable(homes);
            var viewer = new ReportViewer();
            viewer.LocalReport.ReportPath = @"Reports\EkalKarjaForm.rdlc";
            ReportDataSource rdc = new ReportDataSource("Homes", homes);
            ReportDataSource ap = new ReportDataSource("Applications", apps);
            ReportDataSource dtLbof = new ReportDataSource("LBOF", lstLbof);
            ReportDataSource dtLbonf = new ReportDataSource("LBONF", lstLbonf);
            ReportDataSource rdLeftObjectives = new ReportDataSource("ObjectivesLeft", lftObjectives);
            ReportDataSource rdRightObjectives = new ReportDataSource("ObjectivesRight", rtObjectives);
            ReportDataSource projectInvestment = new ReportDataSource("ProjectInvestment", lstProjectInvestments);
            ReportDataSource banks = new ReportDataSource("BankAccountInfo", lstBanks);
            ReportDataSource rdMessage = new ReportDataSource("LongMessage", lstLongMessage);
            



            //ReportDataSource objectives = new ReportDataSource("Objectives", lstObjectives);

            ReportParameter lastPageFirstPara = new ReportParameter("LastPageFirstPara",lst.FirstPara.ToString());
            ReportParameter accNumber = new ReportParameter("AccountNumber",lstBanks[0].AccountNumber.ToString());
            //ReportParameter ListOfStrings = new ReportParameter("ListOfString", lstString);


            viewer.LocalReport.DataSources.Clear();

            viewer.LocalReport.DataSources.Add(rdc);
            viewer.LocalReport.DataSources.Add(ap);
            viewer.LocalReport.DataSources.Add(dtLbof);
            viewer.LocalReport.DataSources.Add(dtLbonf);
            viewer.LocalReport.DataSources.Add(rdLeftObjectives);
            viewer.LocalReport.DataSources.Add(rdRightObjectives);
            viewer.LocalReport.DataSources.Add(projectInvestment);
            viewer.LocalReport.DataSources.Add(banks);
            viewer.LocalReport.DataSources.Add(rdMessage);
            //viewer.LocalReport.DataSources.Add(lstStrings);
            viewer.LocalReport.SetParameters(new ReportParameter[] { lastPageFirstPara, accNumber});
            //viewer.LocalReport.DataSources.Add(objectives);



            viewer.LocalReport.Refresh();
            
            var bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);
            return new FileContentResult(bytes, mimeType);
        }

        public ActionResult ExportCustomers()
        {
            List<LastPagePara> allPara = new List<LastPagePara>();
            using(ShangrilaReportsEntities context = new ShangrilaReportsEntities())
            {
                allPara = context.LastPageParas.ToList();
            }


            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Reports"), "CrystalPersonalInfo.rpt"));

            rd.SetDataSource(allPara);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            stream.Seek(0, SeekOrigin.Begin);
            return File(stream, "application/pdf", "CustomerList.pdf");
        }
    }
}