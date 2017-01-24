using Microsoft.Reporting.WebForms;
using ReportDemo01.Reports;
using System;
using System.Collections.Generic;
using System.Data;
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

            Warning[] warnings;
            string mimeType;
            string[] streamids;
            string encoding;
            string filenameExtension;

            using (ShangrilaReportsEntities dc = new ShangrilaReportsEntities())
            {
                homes = dc.Homes.ToList();
                apps = dc.Applications.ToList();
                LoanBasedOnFund lbof = dc.LoanBasedOnFunds.FirstOrDefault(s => s.LoanBasedonFundID == 1);
                lstLbof.Add(lbof);
                lstLbonf = dc.LoanBasedOnNonFunds.ToList();
            }
            
            //DataTable table = ReportsHelper.ConvertoToDataTable(homes);
            var viewer = new ReportViewer();
            viewer.LocalReport.ReportPath = @"Reports\RPDhito.rdlc";
            ReportDataSource rdc = new ReportDataSource("Homes", homes);
            ReportDataSource ap = new ReportDataSource("Applications", apps);
            ReportDataSource dtLbof = new ReportDataSource("LBOF", lstLbof);
            ReportDataSource dtLbonf = new ReportDataSource("LBONF", lstLbonf);
            viewer.LocalReport.DataSources.Add(rdc);
            viewer.LocalReport.DataSources.Add(ap);
            viewer.LocalReport.DataSources.Add(dtLbof);
            viewer.LocalReport.DataSources.Add(dtLbonf);



            viewer.LocalReport.Refresh();
            var bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);
            return new FileContentResult(bytes, mimeType);
        }
    }
}