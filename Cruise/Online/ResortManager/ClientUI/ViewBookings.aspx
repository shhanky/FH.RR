<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewBookings.aspx.cs" Inherits="ViewBookings" %>

<%@ Register TagName="PageHeaderControl" TagPrefix="phc" Src="~/userControl/pageheader.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Booking List</title>
    <script language="javascript" type="text/javascript" src="../js/calendar/calendar.js"></script>
    <script language="javascript" type="text/javascript" src="../js/calendar/calendar-en.js"></script>
    <script language="javascript" type="text/javascript" src="../js/calendar/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="../js/global.js"></script>
    <script language="javascript" type="text/javascript" src="../js/client/viewbookings.js"></script>
    <link rel="stylesheet" type="text/css" media="all" href="../css/pageheader.css" />
    <link rel="stylesheet" type="text/css" media="all" href="../style.css" />
    <link rel="stylesheet" type="text/css" media="all" href="../css/viewbookings.css" />
    <link rel="stylesheet" type="text/css" media="all" href="../css/calendar-blue2.css"
        title="win2k-cold-1" />
    <style type="text/css">
        .auto-style1
        {
            width: 79px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <phc:PageHeaderControl ID="pageheader1" runat="server" PageTitle="Bookings List" />
        <div>
            <asp:ScriptManager ID="scmgrViewBookings" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="pnlViewBookings" runat="server">
                <ContentTemplate>
                    <table id="filtersection" class="filtersection">
                        <tr>
                            <td class="filtersectionCell">
                                Check-In:</td>
                            <td class="filtersectionCell">
                                <asp:TextBox CssClass="input" ID="txtStartDate" runat="server" Font-Size="8pt" Width="95px"></asp:TextBox>
                                <input type="button" class="datebutton" id="btnStartDate" name="btnStartDate" onfocus="return setupCalendar('txtStartDate','btnStartDate')"
                                    onclick="return setupCalendar('txtStartDate','btnStartDate')" value="..." /></td>
                            <td class="filtersectionCell">
                                Check-out:</td>
                            <td class="filtersectionCell">
                                <asp:TextBox CssClass="input" ID="txtEndDate" runat="server" Font-Size="8pt" Width="95px"></asp:TextBox>
                                <input type="button" class="datebutton" id="btnEndDate" name="btnEndDate" onclick="return setupCalendar('txtEndDate','btnEndDate')"
                                    onfocus="return setupCalendar('txtEndDate','btnEndDate')" value="..." /></td>
                            <td class="filtersectionCell">
                                Booking Code:</td>
                            <td class="filtersectionCell">
                                <asp:TextBox CssClass="input" ID="txtBookingCode" runat="server" Font-Size="8pt" Width="213px"></asp:TextBox></td>
                            <td class="filtersectionCell">
                                </td>
                            <td class="filtersectionCell">
                                </td>                            
                        </tr>
                        <tr>
                            <td class="filtersectionCell">
                                Accom Type:</td>
                            <td class="filtersectionCell">
                                <asp:DropDownList CssClass="select" ID="ddlAccomType" runat="server" OnSelectedIndexChanged="ddlAccomType_SelectedIndexChanged"
                                    Width="150px">
                                </asp:DropDownList></td>
                            <td class="filtersectionCell">
                                Booking State:</td>
                            <td class="filtersectionCell">
                                <asp:DropDownList CssClass="select" ID="ddlBookingStatusTypes" runat="server" Width="125px">
                                </asp:DropDownList></td>
                            <td class="filtersectionCell">
                                Agent:</td>
                            <td class="filtersectionCell">
                                <asp:DropDownList CssClass="select" ID="ddlAgent" runat="server" Width="220px">
                                </asp:DropDownList></td>
                            <td class="filtersectionCell">
                                </td>
                            <td class="filtersectionCell">
                                <asp:Button CssClass="appbutton" ID="btnShow" runat="server" Text="Show" OnClick="btnShow_Click" /></td>                           
                        </tr>
                    </table>
                    <div id="gridsection">
                        <asp:DataGrid ID="dgBookings" DataKeyField="BookingID" runat="server" AutoGenerateColumns="False"
                            Width="989px" OnEditCommand="dgBookings_EditCommand" CellPadding="4" ForeColor="#333333"
                            GridLines="None" OnDeleteCommand="dgBookings_DeleteCommand" OnItemCommand="dgBookings_ItemCommand"
                            AllowPaging="True" OnPageIndexChanged="dgBookings_PageIndexChanged" OnItemDataBound="dgBookings_ItemDataBound"
                            PageSize="25">
                            <Columns>
                                <asp:BoundColumn DataField="startdateformatted" HeaderText="Check In">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="enddateformatted" HeaderText="Check Out">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="BookingCode" HeaderText="Booking Code">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="AccomodationType" HeaderText="Accom Type">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="BookingReference" HeaderText="Booking Ref">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="BookingStatus" HeaderText="Booking Status" Visible="False">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:BoundColumn>
                                <asp:ButtonColumn CommandName="Edit" HeaderText="[...]" Text="Edit">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:ButtonColumn>
                                <asp:ButtonColumn CommandName="View" HeaderText="[...]" Text="View">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:ButtonColumn>
                                <asp:ButtonColumn CommandName="Delete" Text="Delete" HeaderText="[...]" Visible="False">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:ButtonColumn>
                                <asp:ButtonColumn CommandName="confirmation" HeaderText="[...]" Text="Confirm">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:ButtonColumn>
                                <asp:ButtonColumn CommandName="viewtourist" HeaderText="[...]" Text="View Tourist">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:ButtonColumn>
                                <asp:ButtonColumn CommandName="addtourist" HeaderText="[...]" Text="Add Tourist">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:ButtonColumn>
                                <asp:ButtonColumn CommandName="CFormForeignNational" HeaderText="[...]" Text="C-Form Foreign National">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:ButtonColumn>
                                <asp:ButtonColumn CommandName="CFormIndianNational" HeaderText="[...]" Text="C-Form Indian National">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:ButtonColumn>
                                <asp:ButtonColumn CommandName="uploadtourist" HeaderText="[...]" Text="Upload Tourist">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:ButtonColumn>
                                

                                <asp:BoundColumn DataField="ProposedBooking" HeaderText="ProposedBooking" Visible="false">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="HasForeignTourists" HeaderText="HasForeignTourists" Visible="false">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="HasIndianTourists" HeaderText="HasIndianTourists" Visible="false">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:BoundColumn>
                                
                                  <asp:BoundColumn DataField="CharteredBooking" HeaderText="CharteredBooking" Visible="false">
                                    <ItemStyle CssClass="column" />
                                    <HeaderStyle CssClass="columnHeader" />
                                </asp:BoundColumn>
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditItemStyle BackColor="#2461BF" />
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" Mode="NumericPages" />
                            <AlternatingItemStyle BackColor="White" />
                            <ItemStyle BackColor="#EFF3FB" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        </asp:DataGrid>
                    </div>
                    <table id="LegendSection">
                        <tr>
                            <td style="background-color: blue; width: 80px; color: White; padding-left: 4px;">
                                Proposed</td>
                            <td style="background-color: Aqua; width: 80px; padding-left: 4px;">
                                Booked</td>
                            <td style="background-color: orange; width: 80px; padding-left: 4px;">
                                Wait Listed</td>
                            <td style="background-color: Lime; width: 80px; padding-left: 4px;">
                                Confirmed</td>
                            <td style="background-color: Red; width: 80px; padding-left: 4px;">
                                Cancelled</td>
                             <td style=" padding-left: 4px;" class="auto-style1">
                                * Chartered Booking</td>

                        </tr>
                    </table>
             



                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </form>
</body>
</html>
