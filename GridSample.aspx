<%@ Page Language="C#" AutoEventWireup="True" %>

<%@ Import Namespace="System.Data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script language="C#" runat="server">

    string SortExpression;
        public DataView dv;
        DataTable dt = new DataTable();
    ICollection CreateDataSource()
    {
        if (dv == null)
        {            
            Random r = new Random();

            DataTable dt = new DataTable();
            DataRow dr;

            dt.Columns.Add(new DataColumn("IntegerValue", typeof(Int32)));
            dt.Columns.Add(new DataColumn("StringValue", typeof(string)));
            dt.Columns.Add(new DataColumn("CurrencyValue", typeof(double)));

            for (int i = 0; i < 20; i++)
            {
                dr = dt.NewRow();

                dr[0] = i;
                dr[1] = "Item " + r.Next(100);
                dr[2] = 1.23 * (r.Next(50));

                dt.Rows.Add(dr);
            }

            dv = new DataView(dt);

        }

        dv.Sort=SortExpression;
        return dv;
    }

    void Page_Load(Object sender, EventArgs e)
    {
        if (SortExpression == string.Empty)
        {
            SortExpression = "IntegerValue";
        }
        if (!IsPostBack)
        {
            // Load this data only once.

            ItemsGrid.DataSource = CreateDataSource();
            ItemsGrid.DataBind();
        }
    }

    void Sort_Grid(Object sender, DataGridSortCommandEventArgs e)
    {
        SortExpression = e.SortExpression.ToString();
        ItemsGrid.DataSource = CreateDataSource();
        ItemsGrid.DataBind();
    }

</script>

<head runat="server">
    <title>DataGrid Example</title>
</head>
<body>

    <form id="form1" runat="server">

        <h3>DataGrid Example</h3>

        <b>Product List</b>

        <asp:DataGrid ID="ItemsGrid"
            BorderColor="black"
            BorderWidth="1"
            AllowSorting="true"
            CellPadding="3"
            OnSortCommand = "Sort_Grid"
            AutoGenerateColumns="true"
            runat="server">

            <HeaderStyle BackColor="#00aaaa"></HeaderStyle>

        </asp:DataGrid>

    </form>

</body>
</html>
