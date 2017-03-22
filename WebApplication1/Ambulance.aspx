<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ambulance.aspx.cs" Inherits="WebApplication1.Ambulance" %>

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
                            <li class="subMenu  ">


                                <a href="../Department.aspx">Department</a>


                            </li>

                            <li class="subMenu ">


                                <a href="../Doctor.aspx">Doctor</a>


                            </li>
                            <li class="subMenu ">


                                <a href="../Patient.aspx">Patient</a>


                            </li>
                            <li class="subMenu selected">


                                <a href="../Ambulance.aspx">Ambulance</a>


                            </li>
                    </nav>
                </nav>
                <center>
                   
                 <br />
                    <p>CAR</p>
                      <br />
                    <asp:GridView ID="GVCAR" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="car_id" DataSourceID="SqlDataSource1"  OnRowDeleted="GVCAR_RowDeleted" OnRowUpdated="GVCAR_RowUpdated" OnSelectedIndexChanged="GVCAR_SelectedIndexChanged" OnSelectedIndexChanging="GVCAR_SelectedIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="car_id" HeaderText="car_id" ReadOnly="True" SortExpression="car_id" />
                            <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
                            <asp:BoundField DataField="hospital_id" HeaderText="hospital_id" SortExpression="hospital_id" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConflictDetection="CompareAllValues" 
                        ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
                        DeleteCommand="DELETE FROM [car] WHERE [car_id] = @original_car_id AND (([model] = @original_model) OR ([model] IS NULL AND @original_model IS NULL)) AND [hospital_id] = @original_hospital_id" 
                        InsertCommand="INSERT INTO [car] ([car_id], [model], [hospital_id]) VALUES (@car_id, @model, @hospital_id)" 
                        OldValuesParameterFormatString="original_{0}" 
                        SelectCommand="SELECT * FROM [car] WHERE ([hospital_id] = @hospital_id)" 
                        UpdateCommand="UPDATE [car] SET [model] = @model, [hospital_id] = @hospital_id WHERE [car_id] = @original_car_id AND (([model] = @original_model) OR ([model] IS NULL AND @original_model IS NULL)) AND [hospital_id] = @original_hospital_id" OnDeleted="SqlDataSource1_Deleted" OnSelected="SqlDataSource1_Selected" OnUpdated="SqlDataSource1_Updated">
                        <DeleteParameters>
                            <asp:Parameter Name="original_car_id" Type="String" />
                            <asp:Parameter Name="original_model" Type="String" />
                            <asp:Parameter Name="original_hospital_id" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="car_id" Type="String" />
                            <asp:Parameter Name="model" Type="String" />
                            <asp:Parameter Name="hospital_id" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="model" Type="String" />
                            <asp:Parameter Name="hospital_id" Type="String" />
                            <asp:Parameter Name="original_car_id" Type="String" />
                            <asp:Parameter Name="original_model" Type="String" />
                            <asp:Parameter Name="original_hospital_id" Type="String" />
                        </UpdateParameters>
                        <SelectParameters>
                         <asp:SessionParameter DefaultValue="-1" Name="hospital_id" SessionField="hospital_id" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <p>Car Detail</p>
                    <br />

                    <asp:DetailsView ID="DVCar" runat="server" AutoGenerateRows="False" DataKeyNames="car_id" DataSourceID="SqlDataSourceDVCar" OnItemInserted="DVCar_ItemInserted" OnPreRender="DVCar_PreRender">
                        <Fields>
                            <asp:BoundField DataField="car_id" HeaderText="car_id" ReadOnly="True" SortExpression="car_id" />
                            <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
                            <asp:BoundField DataField="hospital_id" HeaderText="hospital_id" SortExpression="hospital_id" />
                            <asp:CommandField ShowInsertButton="True" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSourceDVCar" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:myConnectionString %>" DeleteCommand="DELETE FROM [car] WHERE [car_id] = @original_car_id AND (([model] = @original_model) OR ([model] IS NULL AND @original_model IS NULL)) AND [hospital_id] = @original_hospital_id" InsertCommand="INSERT INTO [car] ([car_id], [model], [hospital_id]) VALUES (@car_id, @model, @hospital_id)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [car] WHERE ([car_id] = @car_id)" UpdateCommand="UPDATE [car] SET [model] = @model, [hospital_id] = @hospital_id WHERE [car_id] = @original_car_id AND (([model] = @original_model) OR ([model] IS NULL AND @original_model IS NULL)) AND [hospital_id] = @original_hospital_id" OnInserted="SqlDataSourceDVCar_Inserted">
                        <DeleteParameters>
                            <asp:Parameter Name="original_car_id" Type="String" />
                            <asp:Parameter Name="original_model" Type="String" />
                            <asp:Parameter Name="original_hospital_id" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="car_id" Type="String" />
                            <asp:Parameter Name="model" Type="String" />
                            <asp:Parameter Name="hospital_id" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="-1" Name="car_id" SessionField="Car_id" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="model" Type="String" />
                            <asp:Parameter Name="hospital_id" Type="String" />
                            <asp:Parameter Name="original_car_id" Type="String" />
                            <asp:Parameter Name="original_model" Type="String" />
                            <asp:Parameter Name="original_hospital_id" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                     <br />
                    <p>Helicopter</p>
                      <br />
                    <asp:GridView ID="GVHelicopter" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="helicopter_id" DataSourceID="SqlDataSourceHelicopter" OnRowDeleted="GVHelicopter_RowDeleted" OnRowUpdated="GVHelicopter_RowUpdated" OnSelectedIndexChanged="GVHelicopter_SelectedIndexChanged" OnSelectedIndexChanging="GVHelicopter_SelectedIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="helicopter_id" HeaderText="helicopter_id" ReadOnly="True" SortExpression="helicopter_id" />
                            <asp:BoundField DataField="brand" HeaderText="brand" SortExpression="brand" />
                            <asp:BoundField DataField="hospital_id" HeaderText="hospital_id" SortExpression="hospital_id" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
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
                    <asp:SqlDataSource ID="SqlDataSourceHelicopter" 
                        runat="server" 
                        ConflictDetection="CompareAllValues"
                         ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
                        DeleteCommand="DELETE FROM [helicopter] WHERE [helicopter_id] = @original_helicopter_id AND (([brand] = @original_brand) OR ([brand] IS NULL AND @original_brand IS NULL)) AND [hospital_id] = @original_hospital_id"
                         InsertCommand="INSERT INTO [helicopter] ([helicopter_id], [brand], [hospital_id]) VALUES (@helicopter_id, @brand, @hospital_id)" 
                        OldValuesParameterFormatString="original_{0}" 
                        SelectCommand="SELECT * FROM [helicopter] WHERE ([hospital_id] = @hospital_id)" 
                        UpdateCommand="UPDATE [helicopter] SET [brand] = @brand, [hospital_id] = @hospital_id WHERE [helicopter_id] = @original_helicopter_id AND (([brand] = @original_brand) OR ([brand] IS NULL AND @original_brand IS NULL)) AND [hospital_id] = @original_hospital_id" OnDeleted="SqlDataSourceHelicopter_Deleted" OnSelected="SqlDataSourceHelicopter_Selected" OnUpdated="SqlDataSourceHelicopter_Updated">
                        <DeleteParameters>
                            <asp:Parameter Name="original_helicopter_id" Type="String" />
                            <asp:Parameter Name="original_brand" Type="String" />
                            <asp:Parameter Name="original_hospital_id" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="helicopter_id" Type="String" />
                            <asp:Parameter Name="brand" Type="String" />
                            <asp:Parameter Name="hospital_id" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="brand" Type="String" />
                            <asp:Parameter Name="hospital_id" Type="String" />
                            <asp:Parameter Name="original_helicopter_id" Type="String" />
                            <asp:Parameter Name="original_brand" Type="String" />
                            <asp:Parameter Name="original_hospital_id" Type="String" />
                        </UpdateParameters>
                         <SelectParameters>
                         <asp:SessionParameter DefaultValue="-1" Name="hospital_id" SessionField="hospital_id" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <p>Helicopter Detail</p>
                    <br />
                    <asp:DetailsView ID="DVHeli" runat="server" AutoGenerateRows="False" DataKeyNames="helicopter_id" DataSourceID="SqlDataSourceDVHeli" OnItemInserted="DVHeli_ItemInserted" OnPreRender="DVHeli_PreRender">
                        <Fields>
                            <asp:BoundField DataField="helicopter_id" HeaderText="helicopter_id" ReadOnly="True" SortExpression="helicopter_id" />
                            <asp:BoundField DataField="brand" HeaderText="brand" SortExpression="brand" />
                            <asp:BoundField DataField="hospital_id" HeaderText="hospital_id" SortExpression="hospital_id" />
                            <asp:CommandField ShowInsertButton="True" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSourceDVHeli" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:myConnectionString %>" DeleteCommand="DELETE FROM [helicopter] WHERE [helicopter_id] = @original_helicopter_id AND (([brand] = @original_brand) OR ([brand] IS NULL AND @original_brand IS NULL)) AND [hospital_id] = @original_hospital_id" InsertCommand="INSERT INTO [helicopter] ([helicopter_id], [brand], [hospital_id]) VALUES (@helicopter_id, @brand, @hospital_id)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [helicopter] WHERE ([helicopter_id] = @helicopter_id)" UpdateCommand="UPDATE [helicopter] SET [brand] = @brand, [hospital_id] = @hospital_id WHERE [helicopter_id] = @original_helicopter_id AND (([brand] = @original_brand) OR ([brand] IS NULL AND @original_brand IS NULL)) AND [hospital_id] = @original_hospital_id" OnInserted="SqlDataSourceDVHeli_Inserted">
                        <DeleteParameters>
                            <asp:Parameter Name="original_helicopter_id" Type="String" />
                            <asp:Parameter Name="original_brand" Type="String" />
                            <asp:Parameter Name="original_hospital_id" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="helicopter_id" Type="String" />
                            <asp:Parameter Name="brand" Type="String" />
                            <asp:Parameter Name="hospital_id" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="-1" Name="helicopter_id" SessionField="Helicopter_id" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="brand" Type="String" />
                            <asp:Parameter Name="hospital_id" Type="String" />
                            <asp:Parameter Name="original_helicopter_id" Type="String" />
                            <asp:Parameter Name="original_brand" Type="String" />
                            <asp:Parameter Name="original_hospital_id" Type="String" />
                        </UpdateParameters>
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
