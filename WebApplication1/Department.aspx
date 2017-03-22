<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="WebApplication1.Department" %>

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
                            <li class="subMenu  ">


                                <a href="../Hospital.aspx">Hospital</a>


                            </li>
                            <li class="subMenu  selected">


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
                <br />
                <center >

<!--<table style="width:50%;">
    <tr><td><p>Department Name  </p></td>
        <td>  <asp:TextBox ID="TBdname" runat="server" >   </asp:TextBox> </td>
        <td> <asp:Button ID="Button1" runat="server" Text="Insert" OnClick="Button1_Click"></asp:Button></td>

    </tr>

</table>
                    !-->
                    
      
                     <br />

                <asp:GridView ID="GVDepartment" runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    DataKeyNames="dno,hospital_id" 
                    DataSourceID="SqlDataSource1"
                     OnSelectedIndexChanging="GVDepartment_SelectedIndexChanging" OnRowDeleted="GVDepartment_RowDeleted" OnRowUpdated="GVDepartment_RowUpdated" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GVDepartment_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="dno" HeaderText="dno" ReadOnly="True" SortExpression="dno" />
                        <asp:BoundField DataField="dname" HeaderText="dname" SortExpression="dname" />
                        <asp:BoundField DataField="hospital_id" HeaderText="hospital_id" ReadOnly="True" SortExpression="hospital_id" />
                        <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" ShowEditButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
                    SelectCommand="SELECT * FROM [department] WHERE ([hospital_id] = @hospital_id)" 
                    DeleteCommand="DELETE FROM [department] WHERE [dno] = @dno AND [hospital_id] = @hospital_id" 
                    InsertCommand="INSERT INTO [department] ([dno], [dname], [hospital_id]) VALUES (@dno, @dname, @hospital_id)" 
                    UpdateCommand="UPDATE [department] SET [dname] = @dname WHERE [dno] = @dno AND [hospital_id] = @hospital_id" OnDeleted="SqlDataSource1_Deleted" OnUpdated="SqlDataSource1_Updated" OnSelected="SqlDataSource1_Selected">
                    <DeleteParameters>
                        <asp:Parameter Name="dno" Type="String" />
                        <asp:Parameter Name="hospital_id" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="dno" Type="String" />
                        <asp:Parameter Name="dname" Type="String" />
                        <asp:Parameter Name="hospital_id" Type="String" />
                        <asp:Parameter  Name="hospital_id"  Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="hospital_id" SessionField="hospital_id" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="dname" Type="String" />
                        <asp:Parameter Name="dno" Type="String" />
                        <asp:Parameter Name="hospital_id" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                    
                    <br />
                    <p>Detail</p>
                    <br />
                <asp:DetailsView ID="DVDepartment" runat="server"  
                    AutoGenerateRows="False" 
                    DataKeyNames="dno,hospital_id" 
                    DataSourceID="SqlDataSource2" OnItemInserted="DVDepartment_ItemInserted" OnPreRender="DVDepartment_PreRender">
                    <Fields>
                        <asp:BoundField DataField="dno" HeaderText="dno" ReadOnly="True" SortExpression="dno" />
                        <asp:BoundField DataField="dname" HeaderText="dname" SortExpression="dname" />
                        <asp:BoundField DataField="hospital_id" HeaderText="hospital_id" ReadOnly="True" SortExpression="hospital_id" />
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                    </asp:DetailsView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:myConnectionString %>" DeleteCommand="DELETE FROM [department] WHERE [dno] = @original_dno AND [hospital_id] = @original_hospital_id AND [dname] = @original_dname" InsertCommand="INSERT INTO [department] ([dno], [dname], [hospital_id]) VALUES (@dno, @dname, @hospital_id)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [department] WHERE (([dno] = @dno) AND ([hospital_id] = @hospital_id))" UpdateCommand="UPDATE [department] SET [dname] = @dname WHERE [dno] = @original_dno AND [hospital_id] = @original_hospital_id AND [dname] = @original_dname" OnInserted="SqlDataSource2_Inserted">
    <DeleteParameters>
        <asp:Parameter Name="original_dno" Type="String" />
        <asp:Parameter Name="original_hospital_id" Type="String" />
        <asp:Parameter Name="original_dname" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="dno" Type="String" />
        <asp:Parameter Name="dname" Type="String" />
        <asp:Parameter Name="hospital_id" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="-1" Name="dno" SessionField="Department_number" Type="String" />
        <asp:SessionParameter DefaultValue="-1" Name="hospital_id" SessionField="hospital_id" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="dname" Type="String" />
        <asp:Parameter Name="original_dno" Type="String" />
        <asp:Parameter Name="original_hospital_id" Type="String" />
        <asp:Parameter Name="original_dname" Type="String" />
    </UpdateParameters>
                    </asp:SqlDataSource>

                    <br />
                    <p>Doctor</p>
                    <br />
            <asp:GridView ID="GVDoctor" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ssn" DataSourceID="SqlDataSourceDoctor" 
                OnSelectedIndexChanging="GVDoctor_SelectedIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ssn" HeaderText="ssn" ReadOnly="True" SortExpression="ssn" />
                    <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                    <asp:BoundField DataField="minit" HeaderText="minit" SortExpression="minit" />
                    <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                    <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                    <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                    <asp:BoundField DataField="experience" HeaderText="experience" SortExpression="experience" />
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
            <asp:SqlDataSource ID="SqlDataSourceDoctor" runat="server" ConnectionString="<%$ ConnectionStrings:myConnectionString %>" SelectCommand="SELECT [ssn], [fname], [minit], [lname], [age], [sex], [experience] FROM [doctor] WHERE (([hospital_id] = @hospital_id) AND ([dno] = @dno))">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="-1" Name="hospital_id" SessionField="hospital_id" Type="String" />
                    <asp:SessionParameter DefaultValue="-1" Name="dno" SessionField="Department_number" Type="String" />
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
