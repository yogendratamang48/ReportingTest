﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ReportDemo01
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ShangrilaReportsEntities : DbContext
    {
        public ShangrilaReportsEntities()
            : base("name=ShangrilaReportsEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Application> Applications { get; set; }
        public virtual DbSet<Home> Homes { get; set; }
        public virtual DbSet<Land> Lands { get; set; }
        public virtual DbSet<Property> Properties { get; set; }
        public virtual DbSet<LoanBasedOnFund> LoanBasedOnFunds { get; set; }
        public virtual DbSet<LoanBasedOnNonFund> LoanBasedOnNonFunds { get; set; }
        public virtual DbSet<Objective> Objectives { get; set; }
        public virtual DbSet<ProjectInvestment> ProjectInvestments { get; set; }
        public virtual DbSet<BankAccountInfo> BankAccountInfoes { get; set; }
        public virtual DbSet<LastPagePara> LastPageParas { get; set; }
    }
}
