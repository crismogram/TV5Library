<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPage.master" AutoEventWireup="true" CodeFile="P2Reports.aspx.cs" Inherits="Report_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />

    <div class="col-lg-12 text-left">
        <ul class="breadcrumb">
            <li><a href="../MemberArea/Dashboard.cshtml">Dashboard</a></li>
            <li class="active">P2 Reports</li>
        </ul>
    </div>



<form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            </Scripts>

        </telerik:RadScriptManager>

        <script type="text/javascript">
        //Put your JavaScript code here.
        </script>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadGrid1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>

        <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Sunset">
        </telerik:RadSkinManager>

        <div>
            <div class="text-muted">
                <span class="text-left">Export: </span>
                <asp:Button CssClass="btn-link btn" ID="Button1" runat="server" Text="Word" OnClick="Button1_Click" />
                <span>/</span>
                <asp:Button CssClass="btn-link btn" ID="Button3" runat="server" Text="CSV" OnClick="Button3_Click" />
                <span class="text-right">Include: </span>
                <asp:CheckBox ID="CB1" runat="server" Checked="true" Text="P2 Number" />
                <asp:CheckBox ID="CB2" runat="server" Checked="true" Text="Serial Number" />
                <asp:CheckBox ID="CB3" runat="server" Checked="true" Text="Transaction Date/Time"/>
                <asp:CheckBox ID="CB4" runat="server" Checked="true" Text="Action"/>
                <asp:CheckBox ID="CB5" runat="server" Checked="true" Text="Library User"/>
                <asp:CheckBox ID="CB6" runat="server" Checked="true" Text="Librarian"/>
                <asp:CheckBox ID="CB7" runat="server" Checked="true" Text="Details"/>
             </div>

            <hr />
            <asp:SqlDataSource SelectCommand="SELECT P2.P2Number AS [P2 Number], P2.SerialNumber AS [Serial Number], P2Transact.TDate AS [Transaction Date/Time], P2Transact.TAction AS Action, P2Transact.MemberName AS [Library User], UserProfile.LastName AS Librarian, P2Transact.Details FROM P2 INNER JOIN P2Transact ON P2.ID = P2Transact.ItemID INNER JOIN UserProfile ON P2Transact.LibrarianID = UserProfile.UserId" ConnectionString="<%$ ConnectionStrings:LibraryDBConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource1" runat="server"></asp:SqlDataSource>

            <telerik:RadGrid GridLines="Both" DataSourceID="DataSource1" ID="RadGrid1" runat="server" RenderMode="Lightweight"
                 AllowSorting="true" ShowFooter="true" AllowPaging="true" PageSize="10" Width="100%" AllowFilteringByColumn="true" MasterTableView-ShowFooter="true" >
                <GroupingSettings CaseSensitive="false" />
                <MasterTableView AutoGenerateColumns="false" AllowFilteringByColumn="true" ShowFooter="true" GridLines="Both">
                    <Columns>
                        <telerik:GridBoundColumn DataField="P2 Number" HeaderText="P2 Number" FilterControlWidth="50px" AllowFiltering="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="true" DataField="Serial Number" HeaderText="Serial Number" FilterControlWidth="100px" AllowFiltering="true">
                        </telerik:GridBoundColumn>

                        <telerik:GridDateTimeColumn DataField="Transaction Date/Time" HeaderText="Transaction Date/Time" FilterControlWidth="180px"
                             PickerType="DatePicker" EnableRangeFiltering="true" ItemStyle-HorizontalAlign="Center" DataFormatString="{0: MMMM dd yyyy hh:mm tt}">
                            <HeaderStyle Width="150px" />
                        </telerik:GridDateTimeColumn>

                        <telerik:GridBoundColumn DataField="Action" HeaderText="Action" FilterControlWidth="70px" AllowFiltering="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Library User" HeaderText="Library User" FilterControlWidth="80px" AllowFiltering="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Librarian" HeaderText="Librarian" FilterControlWidth="70px" AllowFiltering="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Details" HeaderText="Details" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                    
                </MasterTableView>

                <ExportSettings ExportOnlyData="False" FileName="ExportedRadGrid" OpenInNewWindow="True" IgnorePaging="True" />
            </telerik:RadGrid>
        </div>
    </form>
<br /><br /><br />


</asp:Content>