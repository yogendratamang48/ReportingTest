using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Reporting.WebForms;

namespace ReportDemo01.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetReport()
        {
            List<Home> homes = new List<Home>();

            Warning[] warnings;
            string mimeType;
            string[] streamids;
            string encoding;
            string filenameExtension;

            using (ShangrilaReportsEntities dc = new ShangrilaReportsEntities())
            {
                homes = dc.Homes.ToList();
            }

            var viewer = new ReportViewer();
            viewer.LocalReport.ReportPath = @"Reports\RPDhito.rdlc";
            ReportDataSource rdc = new ReportDataSource("MyDataset", homes);
            viewer.LocalReport.DataSources.Add(rdc);
            viewer.LocalReport.Refresh();
            var bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);
            return new FileContentResult(bytes, mimeType);
        }
    }
}