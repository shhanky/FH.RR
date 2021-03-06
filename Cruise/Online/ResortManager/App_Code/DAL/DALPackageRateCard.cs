﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public class DALPackageRateCard
{
    string strCon = string.Empty;
    public DALPackageRateCard()
    {
        strCon = ConfigurationManager.ConnectionStrings["ReservationConnectionString"].ConnectionString;
    }

    #region Getdata
    public DataTable BindControls(BALPackageRateCard obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strCon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("[dbo].[sp_packagemaster]", cn);
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@Action", obj._Action);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            da.SelectCommand.ExecuteReader();
            DataTable dtReturnData = new DataTable();
            cn.Close();
            da.Fill(dtReturnData);
            if (dtReturnData != null)
                return dtReturnData;
            else
                return null;
        }
        catch (Exception)
        {
            return null;
        }
    }

    public DataTable getPackageData(BALPackageRateCard obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strCon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("[dbo].[sp_packagemaster]", cn);
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@Action", obj._Action);
            da.SelectCommand.Parameters.AddWithValue("@RateCardId", obj._RateCardId);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            da.SelectCommand.ExecuteReader();
            DataTable dtReturnData = new DataTable();
            cn.Close();
            da.Fill(dtReturnData);
            if (dtReturnData != null)
                return dtReturnData;
            else
                return null;
        }
        catch (Exception)
        {
            return null;
        }
    }





    #endregion


    #region  Insert/Update Data
    public int AddNewPackageRateCard(BALPackageRateCard obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strCon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.InsertCommand = new SqlCommand("[dbo].[sp_packagemaster]", cn);
            da.InsertCommand.Parameters.AddWithValue("@Action", obj._Action);
            da.InsertCommand.Parameters.AddWithValue("@RateCardId", obj._RateCardId);
            da.InsertCommand.Parameters.AddWithValue("@packageId", obj._packageId);
            da.InsertCommand.Parameters.AddWithValue("@RateCategory", obj._RateCategory);
            da.InsertCommand.Parameters.AddWithValue("@SupplierName", obj._SupplierName);
            da.InsertCommand.Parameters.AddWithValue("@LocationId", obj._LocationId);
            da.InsertCommand.Parameters.AddWithValue("@valFrom", obj._valFrom);
            da.InsertCommand.Parameters.AddWithValue("@ValTo", obj._ValTo);
            da.InsertCommand.Parameters.AddWithValue("@Tax", obj._Tax);
            da.InsertCommand.Parameters.AddWithValue("@Currency", obj._Currency);
            da.InsertCommand.Parameters.AddWithValue("@Date", obj._Date);
            da.InsertCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            int Status = da.InsertCommand.ExecuteNonQuery();
            cn.Close();
            if (Status > 0)
                return Status;
            else
                return 0;
        }
        catch (Exception)
        {
            return 0;
        }
    }
    public int AddRoomRate(BALPackageRateCard obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strCon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.InsertCommand = new SqlCommand("[dbo].[sp_packagemaster]", cn);
            da.InsertCommand.Parameters.AddWithValue("@Action", obj._Action);
            da.InsertCommand.Parameters.AddWithValue("@RateCardId", obj._RateCardId);
            da.InsertCommand.Parameters.AddWithValue("@valFrom", obj._valFrom);
            da.InsertCommand.Parameters.AddWithValue("@ValTo", obj._ValTo);
            da.InsertCommand.Parameters.AddWithValue("@RoomCategoryId", obj._RoomCategoryId);
            da.InsertCommand.Parameters.AddWithValue("@fromPax", obj._fromPax);
            da.InsertCommand.Parameters.AddWithValue("@ToPax", obj._ToPax);
            da.InsertCommand.Parameters.AddWithValue("@ppBc", obj._ppBc);
            da.InsertCommand.Parameters.AddWithValue("@SRSBc", obj._SRSBc);
            da.InsertCommand.Parameters.AddWithValue("@taxEx", obj._taxEx);
            da.InsertCommand.Parameters.AddWithValue("@taxValue", obj._taxValue);
            da.InsertCommand.Parameters.AddWithValue("@PPNc", obj._PPNc);
            da.InsertCommand.Parameters.AddWithValue("@SRSNc", obj._SRSNc);
            da.InsertCommand.Parameters.AddWithValue("@Date", obj._Date);
            da.InsertCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            int Status = da.InsertCommand.ExecuteNonQuery();
            cn.Close();
            if (Status > 0)
                return Status;
            else
                return 0;
        }
        catch (Exception)
        {
            return 0;
        }
    }

    public int updatenewPackageRateCard(BALPackageRateCard obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strCon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.UpdateCommand = new SqlCommand("[dbo].[sp_packagemaster]", cn);
            da.UpdateCommand.Parameters.AddWithValue("@Action", obj._Action);
            da.UpdateCommand.Parameters.AddWithValue("@RateCardId", obj._RateCardId);
            da.UpdateCommand.Parameters.AddWithValue("@packageId", obj._packageId);
            da.UpdateCommand.Parameters.AddWithValue("@RateCategory", obj._RateCategory);
            da.UpdateCommand.Parameters.AddWithValue("@SupplierName", obj._SupplierName);
            da.UpdateCommand.Parameters.AddWithValue("@LocationId", obj._LocationId);
            da.UpdateCommand.Parameters.AddWithValue("@valFrom", obj._valFrom);
            da.UpdateCommand.Parameters.AddWithValue("@ValTo", obj._ValTo);
            da.UpdateCommand.Parameters.AddWithValue("@Tax", obj._Tax);
            da.UpdateCommand.Parameters.AddWithValue("@Currency", obj._Currency);
            da.UpdateCommand.Parameters.AddWithValue("@Date", obj._Date);
            da.UpdateCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            int Status = da.UpdateCommand.ExecuteNonQuery();
            cn.Close();
            if (Status > 0)
                return Status;
            else
                return 0;
        }
        catch (Exception)
        {
            return 0;
        }
    }


    public int UpdateRoomRate(BALPackageRateCard obj)
    {
        try
        {
            SqlConnection cn = new SqlConnection(strCon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.UpdateCommand = new SqlCommand("[dbo].[sp_packagemaster]", cn);
            da.UpdateCommand.Parameters.AddWithValue("@Action", obj._Action);
            da.UpdateCommand.Parameters.AddWithValue("@RateCardId", obj._RateCardId);
            da.UpdateCommand.Parameters.AddWithValue("@valFrom", obj._valFrom);
            da.UpdateCommand.Parameters.AddWithValue("@ValTo", obj._ValTo);
            da.UpdateCommand.Parameters.AddWithValue("@RoomCategoryId", obj._RoomCategoryId);
            da.UpdateCommand.Parameters.AddWithValue("@fromPax", obj._fromPax);
            da.UpdateCommand.Parameters.AddWithValue("@ToPax", obj._ToPax);
            da.UpdateCommand.Parameters.AddWithValue("@ppBc", obj._ppBc);
            da.UpdateCommand.Parameters.AddWithValue("@SRSBc", obj._SRSBc);
            da.UpdateCommand.Parameters.AddWithValue("@taxEx", obj._taxEx);
            da.UpdateCommand.Parameters.AddWithValue("@taxValue", obj._taxValue);
            da.UpdateCommand.Parameters.AddWithValue("@PPNc", obj._PPNc);
            da.UpdateCommand.Parameters.AddWithValue("@SRSNc", obj._SRSNc);
            da.UpdateCommand.Parameters.AddWithValue("@Date", obj._Date);

            da.UpdateCommand.Parameters.AddWithValue("@fromPaxup", obj._fromPaxup);
            da.UpdateCommand.Parameters.AddWithValue("@ToPaxup", obj._ToPaxup);
            da.UpdateCommand.Parameters.AddWithValue("@RoomCategoryIdup", obj._RoomCategoryIdup);
            da.UpdateCommand.CommandType = CommandType.StoredProcedure;
            cn.Open();
            int Status = da.UpdateCommand.ExecuteNonQuery();
            cn.Close();
            if (Status > 0)
                return Status;
            else
                return 0;
        }
        catch (Exception)
        {
            return 0;
        }
    }






    #endregion




}