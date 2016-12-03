﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BALPackageMaster
/// </summary>
public class BALPackageMaster
{
	public BALPackageMaster()
	{

	}
    public string _Action { get; set; }
    public string _packageId { get; set; }
    public string _packageName { get; set; }
    public int _NoOfNights { get; set; }
    public string _pakageType { get; set; }
    public string _MasterPackageId { get; set; }
    public int _BoardingFrom { get; set; }
    public int _BoardingTo { get; set; }
    public int _HotelId { get; set; }
    public DateTime _creationDate { get; set; }
    public string _night { get; set; }
    public int _cityId { get; set; }
    public bool _AllowCheckIn { get; set; }
    public bool _AllowCheckOut { get; set; }
    

}