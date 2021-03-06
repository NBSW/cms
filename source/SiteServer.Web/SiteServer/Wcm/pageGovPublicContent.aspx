﻿<%@ Page Language="C#" Inherits="SiteServer.BackgroundPages.Wcm.PageGovPublicContent" %>
<%@ Register TagPrefix="bairong" Namespace="SiteServer.BackgroundPages.Controls" Assembly="SiteServer.BackgroundPages" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--#include file="../inc/header.aspx"-->
</head>

<body>
<!--#include file="../inc/openWindow.html"-->
<form class="form-inline" runat="server">
  <asp:Literal id="ltlBreadCrumb" runat="server" />
  <bairong:alerts runat="server" />

  <script type="text/javascript">
  $(document).ready(function()
  {
    loopRows(document.getElementById('contents'), function(cur){ cur.onclick = chkSelect; });
    $(".popover-hover").popover({trigger:'hover',html:true});
  });
  </script>

    <asp:PlaceHolder ID="phContentButtons" Visible="false" runat="server">
      <div class="well well-small">
        <asp:Literal ID="ltlContentButtons" runat="server"></asp:Literal>
        <div id="contentSearch" style="display:none;margin-top:10px;">
          时间从：
          <bairong:DateTimeTextBox ID="DateFrom" class="input-small" Columns="12" runat="server" />
          目标：
          <asp:DropDownList ID="SearchType" class="input-medium" runat="server"> </asp:DropDownList>
          关键字：
          <asp:TextBox class="input-medium" ID="Keyword" runat="server" />
          <asp:Button class="btn" OnClick="Search_OnClick" ID="Search" Text="搜 索" runat="server" />
        </div>
      </div>
    </asp:PlaceHolder>

    <table id="contents" class="table table-bordered table-hover">
      <tr class="info thead">
        <td>内容标题(点击查看)</td>
        <asp:Literal ID="ltlColumnHeadRows" runat="server"></asp:Literal>
        <td width="50">状态</td>
        <td width="30">&nbsp;</td>
        <td width="20">
          <input onclick="_checkFormAll(this.checked)" type="checkbox" />
        </td>
      </tr>
      <asp:Repeater ID="rptContents" runat="server">
        <itemtemplate>
            <tr>
                <td>
                    <asp:Literal ID="ltlItemTitle" runat="server"></asp:Literal>
                </td>
                <asp:Literal ID="ltlColumnItemRows" runat="server"></asp:Literal>
                <td class="center" style="width: 50px;">
                    <nobr><asp:Literal ID="ltlItemStatus" runat="server"></asp:Literal></nobr>
                </td>
                <td class="center" style="width: 30px;">
                    <asp:Literal ID="ltlItemEditUrl" runat="server"></asp:Literal>
                </td>
                <td class="center" style="width: 20px;">
                    <input type="checkbox" name="ContentIDCollection" value='<%#DataBinder.Eval(Container.DataItem, "ID")%>' />
                </td>
            </tr>
        </itemtemplate>
      </asp:Repeater>
    </table>

    <bairong:sqlPager id="spContents" runat="server" class="table table-pager" />

</form>
</body>
</html>
