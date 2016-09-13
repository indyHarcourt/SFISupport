<%@ Page Language="C#" AutoEventWireup="True" CodeFile="GridSample.aspx.cs" Inherits="GridSample" %>

<html>
<head runat="server">
    <title>DataGrid Example</title>
</head>
<body>

    <form id="form1" runat="server">

        <h3>DataGrid Example</h3>

        <b>Product List</b>

    <p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="true" OnSorting="GridView1_Sorting">
        </asp:GridView>
    </p>


    </form>

</body>
</html>
