<%@ Page Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://login.salesforce.com/canvas/sdk/js/37.0/canvas-all.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jsforce/1.7.0/jsforce.min.js"></script>

    <title>Canvas App</title>

    <script>
        $(document).ready(function(){
            $('#supportTable tr:nth-child(odd)').addClass('odd');
        });
    </script>

    <style>
        #supportTable, th, td {
            border: 1px solid black;
        }

        #supportTable {
            border-collapse:collapse;
        }

        .odd{
            background-color: whitesmoke;
        }
            
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        .request {
            font-family: Courier New, Courier, monospace;
            display:none;
            width: 100%;
        }

        #userTable {
            width: 100%;
            border: 1px solid black;
            border-collapse: collapse;
        }

            #userTable th {
                text-align: left;
            }
    </style>
</head>



<body>
    <form id="form1" runat="server">
        <div style="width: 100%; padding: 5px; background-color: aliceblue;">
            <table id="userTable" style="width:1000px;">
                <tr>
                    <th style="width: 150px;">User:</th>
                    <td>
                        <%=UserName %>
                    </td>
                </tr>
                <tr>
                    <th>Account:</th>
                    <td>
                        <%=accountName %>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <h3>ISupport Tickets</h3>
            <table id="supportTable" style="width:1000px;">
                <thead>
                    <tr>
                        <th>Number</th>
                        <th>Name</th>
                        <th>Created Date</th>
                        <th>Status</th>
                        <th>State</th>
                        <th>Last Updated</th>
                    </tr>
                </thead>
                <tr>
                    <td>12345</td>
                    <td>Ticket 12345</td>
                    <td>7/12/2016</td>
                    <td>Open</td>
                    <td>State?</td>
                    <td>8/10/2016</td>
                </tr>
                <tr>
                    <td>12366</td>
                    <td>Ticket 12366</td>
                    <td>7/19/2016</td>
                    <td>Open</td>
                    <td>State?</td>
                    <td>8/19/2016</td>
                </tr>
            </table>

        </div>
        <asp:HyperLink Text="other page" ID="link2" runat="server"  Target="_self" NavigateUrl="~/GridSample.aspx" />
        <div class="request">
            <%=SignedRequestStatus%>
        </div>
        <br />
        signedRequest:
        <div style="width:100%; border: solid 1px gray; padding:5px;">
        <%=signedRequest %>
        </div>


    </form>
</body>
</html>
