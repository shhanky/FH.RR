﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BALCustomers
/// </summary>
public class BALCustomers
{
	public BALCustomers()
	{
		//
		// TODO: Add constructor logic here
		//
	}


          public string Title{get;set;}
          public string FirstName{get;set;}
          public string LastName{get;set;}
          public string Email{get;set;}
          public string Telephone{get;set;}
          public string Address1{get;set;}
          public string Address2{get;set;}
          public string City{get;set;}
          public string State{get;set;}
          public string PostalCode{get;set;}
          public int CountryId{get;set;}
          public string action { get; set; }
          public string Password { get; set; }

          public int CustId { get; set; }

          public string PaymentMethod { get; set; }
         
}