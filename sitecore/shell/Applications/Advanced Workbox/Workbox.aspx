<%@ Page Language="C#" AutoEventWireup="true" Inherits="SitecoreAdvancedWorkbox.Shell.Applications.Workbox" %>

<%@ Register Assembly="Sitecore.Kernel" Namespace="Sitecore.Web.UI.HtmlControls"
    TagPrefix="sc" %>
<%@ Register Assembly="Sitecore.Kernel" Namespace="Sitecore.Web.UI.WebControls" TagPrefix="sc" %>
<%@ Register Assembly="Sitecore.Kernel" Namespace="Sitecore.Web.UI.WebControls.Ribbons"
    TagPrefix="sc" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ca" %>
<%@ Register Src="~/sitecore/shell/Applications/GlobalHeader.ascx" TagName="GlobalHeader" TagPrefix="uc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="Cache-control" content="no-cache"/>
    <meta http-equiv="Cache-control" content="no-store"/>
        
    <title>Sitecore</title>
    <sc:Stylesheet ID="Stylesheet1" Src="Content Manager.css" DeviceDependant="true"
        runat="server" />
    <sc:Stylesheet ID="Stylesheet2" Src="Ribbon.css" DeviceDependant="true" runat="server" />
    <sc:Stylesheet ID="Stylesheet3" Src="Grid.css" DeviceDependant="true" runat="server" />
	  <sc:Stylesheet Src="Content Manager.css" DeviceDependant="true" runat="server" />
	  <sc:Stylesheet Src="Ribbon.css" DeviceDependant="true" runat="server" />
	  <sc:Stylesheet Src="/sitecore/shell/Themes/Standard/default/Grid.css" DeviceDependant="true" runat="server" />
<sc:Script ID="Script2" Src="/sitecore/shell/Controls/Sitecore.js" runat="server" />
    <sc:Script ID="Script3" Src="/sitecore/shell/Controls/SitecoreObjects.js" runat="server" />
    <sc:Script ID="Script4" Src="/sitecore/shell/Applications/Content Manager/Content Editor.js"
        runat="server" />
    <style type="text/css">
        html body {
            overflow:auto;
        }
        div.scRibbonNavigatorButtonsGroupHeader {
            display:none;
        }
        .footer-text { padding: 0 5px 0 0;float: right;color: #ffffff; }
        .footer-text a { color: #ffffff; text-decoration: underline; }
        .footer-text p { margin:0; }
        .footer-text img { vertical-align: bottom; }

        .scRibbon {
            padding-top: 55px;
        }
        td.HeadingCellText {
            color: white;
        }
    </style>
    <script type="text/javascript" language="javascript">

        function Items_onDoubleClick(sender, eventArgs) {
            scForm.postRequest("", "", "", "wf:open");
        }

        function OnResize() {
            var doc = $(document.documentElement);
            var ribbon = $("RibbonContainer");
            var grid = $("ItemsContainer");

            ItemsGrid.render();

            /* re-render again after some "magic amount of time" - without this second re-render grid doesn't pick correct width sometimes */
            setTimeout("ItemsGrid.render()", 150);
        }

        function refresh() {
            ItemsGrid.scHandler.refresh();
        }

        function columnschanged() {
            scForm.postEvent(this, event, 'wf:refresh');
        }

        function filters() {
            var state = document.getElementById('States').value;
            var filter = document.getElementById('Filter').value;
            var language = document.getElementById('Language').value;
            var pagesize = document.getElementById('PageSize').value;
            var itemPath = document.getElementById('ItemPath').value;
            var publishedDate = document.getElementById('PublishedDate').value;
            var showVersions = document.getElementById('ShowVersions').value;
            // scForm.postEvent(this,event,'wf:filters(state='+state+',filter='+filter+',language='+language+',pagesize='+pagesize+', itempath='+itemPath+', publisheddate='+publishedDate+')');
            scForm.postEvent(this, event, 'wf:filters(state=' + state + ',filter=' + filter + ',language=' + language + ',pagesize=' + pagesize + ', itempath=' + itemPath + ', publisheddate=' + publishedDate + ' , showversions=' + showVersions + ')');
        }
        window.onresize = OnResize;
  </script>
</head>
<body style="background: #4E4E4E url(/sitecore/shell/themes/standard/gradients/gray1.gif) 50% 0 repeat-y; height:100%;">
    <form id="WorkboxForm" runat="server">
    <sc:AjaxScriptManager ID="AjaxScriptManager1" runat="server" />
    <sc:ContinuationManager ID="ContinuationManager1" runat="server" />
    <uc:GlobalHeader runat="server" />
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td id="RibbonContainer">              
                <sc:Ribbon runat="server" ID="RibbonPanel" Cacheable="false"/>
            </td>
        </tr>
        <tr>
            <td id="GridCell" height="100%" valign="top" style="background: #e9e9e9" class="scFlexContent">                
                <sc:Border runat="server" ID="ItemsContainer" Class="scStretchAbsolute scMarginAbsolute">
                <ca:Grid ID="ItemsGrid" AutoFocusSearchBox="false" RunningMode="Callback" CssClass="Grid"
                        ShowHeader="true" HeaderCssClass="GridHeader" FillContainer="true" FooterCssClass="GridFooter"
                        GroupByText="" GroupingNotificationText="" GroupByCssClass="GroupByCell" GroupByTextCssClass="GroupByText"
                        GroupBySortAscendingImageUrl="group_asc.gif" GroupBySortDescendingImageUrl="group_desc.gif"
                        GroupBySortImageWidth="10" GroupBySortImageHeight="10" GroupingNotificationTextCssClass="GridHeaderText"
                        GroupingPageSize="5" ManualPaging="true" PagerStyle="Slider" PagerTextCssClass="GridFooterText"
                        PagerButtonWidth="41" PagerButtonHeight="22" PagerImagesFolderUrl="/sitecore/shell/themes/standard/componentart/grid/pager/"
                        ShowSearchBox="false" SearchTextCssClass="GridHeaderText" SearchBoxCssClass="SearchBox"
                        SliderHeight="20" SliderWidth="150" SliderGripWidth="24" SliderPopupOffsetX="20"
                        SliderPopupClientTemplateId="SliderTemplate" 
						TreeLineImagesFolderUrl="/sitecore/shell/themes/standard/componentart/grid/lines/"
                        TreeLineImageWidth="22" TreeLineImageHeight="19" PreExpandOnGroup="false" ImagesBaseUrl="/sitecore/shell/themes/standard/componentart/grid/"
                        IndentCellWidth="22" LoadingPanelClientTemplateId="LoadingFeedbackTemplate" LoadingPanelPosition="MiddleCenter"
                        Width="100%" Height="100%" runat="server" PageSize="100" >
                        <Levels>
                            <ca:GridLevel DataKeyField="SerialNumber" ShowTableHeading="false" ShowSelectorCells="false"
                                RowCssClass="Row" ColumnReorderIndicatorImageUrl="reorder.gif" DataCellCssClass="DataCell"
                                HeadingCellCssClass="HeadingCell" HeadingCellHoverCssClass="HeadingCellHover"
                                HeadingCellActiveCssClass="HeadingCellActive" HeadingRowCssClass="HeadingRow"
                                HeadingTextCssClass="HeadingCellText" SelectedRowCssClass="SelectedRow" GroupHeadingCssClass="GroupHeading"
                                SortAscendingImageUrl="asc.gif" SortDescendingImageUrl="desc.gif" SortImageWidth="13"
                                SortImageHeight="13">
                                <Columns>
                                    <ca:GridColumn DataField="scGridID" Visible="false" IsSearchable="false" />
                                    <ca:GridColumn DataField="SerialNumber" AllowSorting="true" AllowGrouping="false" IsSearchable="true"
                                        SortedDataCellCssClass="SortedDataCell" HeadingText="S.No" runat="server" visible ="false" />
                                    <ca:GridColumn DataField="Name" AllowSorting="true" AllowGrouping="false" IsSearchable="true"
                                        SortedDataCellCssClass="SortedDataCell" HeadingText="Item Name" runat="server" />
                                    <ca:GridColumn DataField="Path" AllowSorting="true" AllowGrouping="false" IsSearchable="true"
                                        SortedDataCellCssClass="SortedDataCell" HeadingText="Item Path" runat="server" />
                                    <ca:GridColumn DataField="ModifiedDate" AllowSorting="true" AllowGrouping="false"
                                        IsSearchable="true" SortedDataCellCssClass="SortedDataCell" HeadingText="Modified Date"
                                        runat="server" />
                                    <ca:GridColumn DataField="Language" AllowSorting="true" AllowGrouping="false" IsSearchable="true"
                                        SortedDataCellCssClass="SortedDataCell" HeadingText="Language" runat="server" />
                                    <ca:GridColumn DataField="Editor" AllowSorting="true" AllowGrouping="false" IsSearchable="true"
                                        SortedDataCellCssClass="SortedDataCell" HeadingText="Editor" runat="server" />
                                    <ca:GridColumn DataField="Version" AllowSorting="true" AllowGrouping="false" IsSearchable="true"
                                        SortedDataCellCssClass="SortedDataCell" HeadingText="Version" runat="server" />
                                    <ca:GridColumn DataField="Comment" AllowSorting="true" AllowGrouping="false" IsSearchable="true"
                                        SortedDataCellCssClass="SortedDataCell" HeadingText="Comment" runat="server"  visible ="false"/>
								<%--	<ca:GridColumn DataField="PublishingStartDate" AllowSorting="true" AllowGrouping="false" IsSearchable="true"
                                        SortedDataCellCssClass="SortedDataCell" HeadingText="PublishingStartDate" runat="server" />
									<ca:GridColumn DataField="RelatedPath" AllowSorting="true" AllowGrouping="false" IsSearchable="true"
                                        SortedDataCellCssClass="SortedDataCell" HeadingText="RelatedPath" runat="server" />--%>
									<ca:GridColumn DataField="ItemGuid" AllowSorting="true" AllowGrouping="false" IsSearchable="true"
                                        SortedDataCellCssClass="SortedDataCell" HeadingText="ItemGuid" runat="server" />
                                </Columns>
                            </ca:GridLevel>
                        </Levels>
                        <ClientEvents>
                            <ItemDoubleClick EventHandler="Items_onDoubleClick" />
                        </ClientEvents>                        
                        <ClientTemplates>                            
                            <ca:ClientTemplate ID="LoadingFeedbackTemplate">
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tr>
                                        <td style="font-size: 10px;">
                                            <sc:Literal ID="Literal1" Text="Loading..." runat="server" />
                                            ;
                                        </td>
                                        <td>
                                            <img src="/sitecore/shell/themes/standard/componentart/grid/spinner.gif" width="16"
                                                height="16" border="0">
                                        </td>
                                    </tr>
                                </table>
                            </ca:ClientTemplate>
                           
							 <ca:ClientTemplate ID="SliderTemplate">
                <div class="SliderPopup">
                   ## DataItem.PageIndex + 1 ## / ## Roles.PageCount ##
                </div>
              </ca:ClientTemplate>
                        </ClientTemplates>
                    </ca:Grid>
                </sc:Border>
            </td>
        </tr>
        <tr>
            <td>
              
            </td>
        </tr>
    </table>    

    </form>
</body>
<head>
    <meta http-equiv="pragma" content="no-cache" />
</head>
</html>
