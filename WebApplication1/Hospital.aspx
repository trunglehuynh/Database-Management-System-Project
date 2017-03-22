<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hospital.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title id="title">Hopital Management System</title>
    <meta http-equiv="Content-Type" content="text/html ; charset=UTF-8" />
    <link href="Styles/Home.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div>

            <header>
                <header align="center">
                    <h1>Hospital Management System</h1>
                </header>
            </header>
            <div id="MainBody">
                <h1 id="hospiName" runat="server">Hospital</h1>

                <nav>
                    <nav>
                        <ul>
                             <li class="subMenu  ">


                                <a href="../Homepage.aspx">Homepage</a>


                            </li>
                            <li class="subMenu selected ">


                                <a href="../Hospital.aspx">Hospital</a>


                            </li>
                            <li class="subMenu  ">


                                <a href="../Department.aspx">Department</a>


                            </li>

                            <li class="subMenu ">


                                <a href="../Doctor.aspx">Doctor</a>


                            </li>
                            <li class="subMenu ">


                                <a href="../Patient.aspx">Patient</a>


                            </li>
                            <li class="subMenu ">


                                <a href="../Ambulance.aspx">Ambulance</a>


                            </li>
                    </nav>
                </nav>
                <center>
                 <br />
                <p id ="hos_name" runat="server"> Name:</p>
                <br />
                <p id ="hos_address" runat="server"> Address:</p>
                <br />
                <p id ="Hos_id" runat="server"> ID:</p>

                <br />
                <p>Department</p>
                <br />
                <asp:GridView ID="GVDepartment" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="dno,hospital_id" DataSourceID="SqlDataSourceDepartment" ForeColor="#333333" GridLines="None"
                     OnSelectedIndexChanging="GVDepartment_SelectedIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="dno" HeaderText="dno" ReadOnly="True" SortExpression="dno" />
                        <asp:BoundField DataField="dname" HeaderText="dname" SortExpression="dname" />
                        <asp:BoundField DataField="hospital_id" HeaderText="hospital_id" ReadOnly="True" SortExpression="hospital_id" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:myConnectionString %>" SelectCommand="SELECT * FROM [department] WHERE ([hospital_id] = @hospital_id)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="hospital_id" SessionField="hospital_id" Type="String" />
                    </SelectParameters>
                    </asp:SqlDataSource>
                </center>
            </div>

        </div>
        <footer>
            <p>Developer: Jing Peng and Trung Duc Huynh</p>
        </footer>
    </form>
</body>
</html>
