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



            //ReportDataSource objectives = new ReportDataSource("Objectives", lstObjectives);

            ReportParameter lastPageFirstPara = new ReportParameter("LastPageFirstPara",lst.FirstPara.ToString());
            ReportParameter accNumber = new ReportParameter("AccountNumber",lstBanks[0].AccountNumber.ToString());

            viewer.LocalReport.DataSources.Clear();

            viewer.LocalReport.DataSources.Add(rdc);
            viewer.LocalReport.DataSources.Add(ap);
            viewer.LocalReport.DataSources.Add(dtLbof);
            viewer.LocalReport.DataSources.Add(dtLbonf);
            viewer.LocalReport.DataSources.Add(rdLeftObjectives);
            viewer.LocalReport.DataSources.Add(rdRightObjectives);
            viewer.LocalReport.DataSources.Add(projectInvestment);
            viewer.LocalReport.DataSources.Add(banks);
            viewer.LocalReport.SetParameters(new ReportParameter[] { lastPageFirstPara, accNumber});
            //viewer.LocalReport.DataSources.Add(objectives);



            viewer.LocalReport.Refresh();
            
            var bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);
            return new FileContentResult(bytes, mimeType);
        }
    }
}