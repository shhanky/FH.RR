﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RoomMaintenanceDates.aspx.cs" Inherits="MasterUI_RoomMaintenanceDates" %>


<%@ Register TagName="PageHeaderControl" TagPrefix="phc" Src="~/userControl/pageheader.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Accomodation Season Master</title>
    <link rel="stylesheet" type="text/css" media="all" href="../css/pageheader.css" />
    <link rel="stylesheet" type="text/css" media="all" href="../style.css" />

    <script language="javascript" type="text/javascript" src="../js/calendar/calendar.js"></script>

    <script language="javascript" type="text/javascript" src="../js/calendar/calendar-en.js"></script>

    <script language="javascript" type="text/javascript" src="../js/calendar/calendar-setup.js"></script>

    <script language="javascript" type="text/javascript" src="../js/master/accommaster.js"></script>

    <script language="javascript" type="text/javascript" src="../js/global.js"></script>

    <link rel="stylesheet" type="text/css" media="all" href="../css/calendar-blue2.css"
        title="win2k-cold-1" />
</head>
<body>
    <form id="form1" runat="server">
    <phc:PageHeaderControl ID="pageheader1" runat="server" PageTitle="Room Maintenance Master" />
    <div>
        <asp:ScriptManager ID="scmgrAccomMaster" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="pnlAccomMaster" runat="server">
            <ContentTemplate>
                <div>
                    <div id="leftCol" style="float: left; margin-right: 10px;">
                        <div id="filterSection">
                            <asp:TreeView ID="tvAccomodations" runat="server" OnSelectedNodeChanged="tvAccomodations_SelectedNodeChanged" 
                               >
                            </asp:TreeView>
                        </div>
                    </div>
                    <div id="rightCol" style="float: left; margin-right: 10px;">
                        <div id="gridsection" class="gridsection" style="float: right">
                            <asp:DataGrid ID="dgRooms" runat="server" AutoGenerateColumns="False"
                                BorderStyle="Ridge" CellPadding="4" DataKeyField="AccomodationId" ForeColor="#333333"
                                GridLines="None" 
                                TabIndex="3" Width="350px" OnSelectedIndexChanged="dgRooms_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanged="dgRooms_PageIndexChanged">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <AlternatingItemStyle BackColor="White" />
                                <ItemStyle BackColor="#EFF3FB" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <Columns>
                                    <asp:BoundColumn DataField="roomId" HeaderText="Room No" Visible="true">
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="StartDate" HeaderText="Start Date" Visible="True" DataFormatString="{0:dd-MMM-yyyy}">
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="EndDate" HeaderText="End Date" Visible="True" DataFormatString="{0:dd-MMM-yyyy}">
                                    </asp:BoundColumn>

                                   

                                    <asp:BoundColumn DataField="AccomName" HeaderText="Accomodation" Visible="True">
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Reason" HeaderText="Reason" Visible="True">
                                    </asp:BoundColumn>
                                    <asp:ButtonColumn CommandName="Select" HeaderText="[...]" Text="Edit"></asp:ButtonColumn>
                                </Columns>
                            </asp:DataGrid>
                        </div>
                        <table id="inputsection" class="inputsection">
                            <tr>
                                <td class="labelcell">Room No:</td>
                                <td class="inputcell">
                                    <asp:DropDownList ID="ddlRoomNo" runat="server" OnSelectedIndexChanged="ddlRoomNo_SelectedIndexChanged"></asp:DropDownList>
                                    </td>
                            </tr>
                            <tr>
                                <td class="labelcell">
                                    Start Date:
                                </td>
                                <td class="inputcell">
                                    <asp:TextBox ID="txtSeasonStartDate" runat="server" CssClass="input" 
                                        TabIndex="6" Width="95px"></asp:TextBox>
                                    <input ID="btnStartDate" class="datebutton" name="btnStartDate" 
                                        onclick="return setupCalendar('txtSeasonStartDate', 'btnStartDate')" 
                                        onfocus="return setupCalendar('txtSeasonStartDate','btnStartDate')" 
                                        tabindex="7" type="button" value="..." />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelcell">
                                     End Date:
                                </td>
                                <td class="inputcell">
                                    <asp:TextBox CssClass="input" ID="txtSeasonEndDate" runat="server" Width="95px" TabIndex="8"></asp:TextBox><input
                                        id="btnEndDate" class="datebutton" name="btnEndDate" onclick="return setupCalendar('txtSeasonEndDate', 'btnEndDate')"
                                        onfocus="return setupCalendar('txtSeasonEndDate','btnEndDate')" type="button"
                                        value="..." tabindex="9" />
                                </td>
                            </tr>
                            <tr>

 <td class="labelcell">
                                     Reason:
                                </td>
                                <td class="inputcell">
                                    <asp:TextBox CssClass="input" ID="txtreason" runat="server" Width="95px" Height="50px" TabIndex="8" TextMode="MultiLine"></asp:TextBox>
                                </td>

                            </tr>

                        </table>
                        <table id="buttonsection" class="buttonsection">
                            <tr>
                                <td>
                                  <asp:Button CssClass="appbutton" ID="btnEdit" runat="server" Height="24px"
                                        Text="Update" Width="65px" TabIndex="10" OnClick="btnEdit_Click" />
                                </td>
                                <td>
                                    <asp:Button CssClass="appbutton" ID="btnDelete" runat="server" Height="24px" 
                                        Text="Delete" Width="65px" TabIndex="11" OnClick="btnDelete_Click" />
                                </td>
                                <td>
                                    <asp:Button CssClass="appbutton" ID="btnCancel" runat="server" 
                                        Text="Cancel" Width="65px" TabIndex="12" OnClick="btnCancel_Click" />
                                </td>
                            </tr>
                        </table>
                        <table id="statussection" class="statussection">
                            <tr>
                                <td>
                                    <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table id="hiddensection" class="hiddensection">
                            <tr>
                                <td>
                                    <asp:HiddenField ID="hfId" runat="server" />
                                    <asp:HiddenField ID="hfOldSeasonStartDate" runat="server" />
                                    <asp:HiddenField ID="hfOldSeasonEndDate" runat="server" />
                                    <asp:HiddenField ID="hfRoomid" runat="server" />
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button CssClass="appbutton" ID="btnAddNew" runat="server" Height="24px"
                                        Text="New" Visible="False" Width="65px" />
                                </td>
                                <td>
                                    <asp:Button CssClass="appbutton" ID="btnSave" runat="server" Height="24px"
                                        Text="Save" Visible="False" Width="65px" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="clear: both">
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
