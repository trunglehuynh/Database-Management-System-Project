<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctor.aspx.cs" Inherits="WebApplication1.Doctor" %>

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

                            <li class="subMenu selected">


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
                <center>
        <!-- <table style="width:50%;">
        <tr><td><p>Department Name  </p></td>
        <td>  <asp:TextBox ID="TBdname" runat="server" >   </asp:TextBox> </td>
        <td> <asp:Button ID="Button1" runat="server" Text="Insert" OnClick="OnInseart"></asp:Button></td>

        </tr>

        </table>
         !-->
                    
                    <br />
                    <p>Doctor</p>
                    <br />

                <asp:GridView ID="GVDoctor" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ssn" DataSourceID="SqlDataSourceDoctor" ForeColor="#333333" GridLines="None"
                     OnSelectedIndexChanging="GVDoctor_SelectedIndexChanging" OnRowDeleted="GVDoctor_RowDeleted" OnRowUpdated="GVDoctor_RowUpdated" OnSelectedIndexChanged="GVDoctor_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ssn" HeaderText="ssn" ReadOnly="True" SortExpression="ssn" />
                        <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                        <asp:BoundField DataField="minit" HeaderText="minit" SortExpression="minit" />
                        <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                        <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                        <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                        <asp:BoundField DataField="experience" HeaderText="experience" SortExpression="experience" />
                        <asp:BoundField DataField="dno" HeaderText="dno" SortExpression="dno" />
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
                 <asp:SqlDataSource ID="SqlDataSourceDoctor" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
                     DeleteCommand="DELETE FROM [doctor] WHERE [ssn] = @original_ssn AND [fname] = @original_fname AND (([minit] = @original_minit) OR ([minit] IS NULL AND @original_minit IS NULL)) AND [lname] = @original_lname AND [age] = @original_age AND (([sex] = @original_sex) OR ([sex] IS NULL AND @original_sex IS NULL)) AND [experience] = @original_experience AND (([dno] = @original_dno) OR ([dno] IS NULL AND @original_dno IS NULL)) AND (([hospital_id] = @original_hospital_id) OR ([hospital_id] IS NULL AND @original_hospital_id IS NULL))"
                      InsertCommand="INSERT INTO [doctor] ([ssn], [fname], [minit], [lname], [age], [sex], [experience], [dno], [hospital_id]) VALUES (@ssn, @fname, @minit, @lname, @age, @sex, @experience, @dno, @hospital_id)" 
                     OldValuesParameterFormatString="original_{0}" 
                     SelectCommand="SELECT * FROM [doctor] WHERE (([hospital_id] = @hospital_id))" 
                     UpdateCommand="UPDATE [doctor] SET [fname] = @fname, [minit] = @minit, [lname] = @lname, [age] = @age, [sex] = @sex, [experience] = @experience, [dno] = @dno, [hospital_id] = @hospital_id WHERE [ssn] = @original_ssn AND [fname] = @original_fname AND (([minit] = @original_minit) OR ([minit] IS NULL AND @original_minit IS NULL)) AND [lname] = @original_lname AND [age] = @original_age AND (([sex] = @original_sex) OR ([sex] IS NULL AND @original_sex IS NULL)) AND [experience] = @original_experience AND (([dno] = @original_dno) OR ([dno] IS NULL AND @original_dno IS NULL)) AND (([hospital_id] = @original_hospital_id) OR ([hospital_id] IS NULL AND @original_hospital_id IS NULL))" OnDeleted="SqlDataSourceDoctor_Deleted" OnUpdated="SqlDataSourceDoctor_Updated">
                     <DeleteParameters>
                         <asp:Parameter Name="original_ssn" Type="String" />
                         <asp:Parameter Name="original_fname" Type="String" />
                         <asp:Parameter Name="original_minit" Type="String" />
                         <asp:Parameter Name="original_lname" Type="String" />
                         <asp:Parameter Name="original_age" Type="Int32" />
                         <asp:Parameter Name="original_sex" Type="String" />
                         <asp:Parameter Name="original_experience" Type="Int32" />
                         <asp:Parameter Name="original_dno" Type="String" />
                         <asp:Parameter Name="original_hospital_id" Type="String" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="ssn" Type="String" />
                         <asp:Parameter Name="fname" Type="String" />
                         <asp:Parameter Name="minit" Type="String" />
                         <asp:Parameter Name="lname" Type="String" />
                         <asp:Parameter Name="age" Type="Int32" />
                         <asp:Parameter Name="sex" Type="String" />
                         <asp:Parameter Name="experience" Type="Int32" />
                         <asp:Parameter Name="dno" Type="String" />
                         <asp:Parameter Name="hospital_id" Type="String" />
                     </InsertParameters>
                     <SelectParameters>
                         <asp:SessionParameter DefaultValue="-1" Name="hospital_id" SessionField="hospital_id" Type="String" />
                         <asp:SessionParameter DefaultValue="-1" Name="dno" SessionField="Department_number" Type="String" />
                     </SelectParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="fname" Type="String" />
                         <asp:Parameter Name="minit" Type="String" />
                         <asp:Parameter Name="lname" Type="String" />
                         <asp:Parameter Name="age" Type="Int32" />
                         <asp:Parameter Name="sex" Type="String" />
                         <asp:Parameter Name="experience" Type="Int32" />
                         <asp:Parameter Name="dno" Type="String" />
                         <asp:Parameter Name="hospital_id" Type="String" />
                         <asp:Parameter Name="original_ssn" Type="String" />
                         <asp:Parameter Name="original_fname" Type="String" />
                         <asp:Parameter Name="original_minit" Type="String" />
                         <asp:Parameter Name="original_lname" Type="String" />
                         <asp:Parameter Name="original_age" Type="Int32" />
                         <asp:Parameter Name="original_sex" Type="String" />
                         <asp:Parameter Name="original_experience" Type="Int32" />
                         <asp:Parameter Name="original_dno" Type="String" />
                         <asp:Parameter Name="original_hospital_id" Type="String" />
                     </UpdateParameters>
                    </asp:SqlDataSource>  
                    
                    <br />
                    <p>Detail</p>
                    <br />
                     <asp:DetailsView ID="DVDoctor" runat="server" AutoGenerateRows="False" DataKeyNames="ssn" DataSourceID="SqlDataSource2" OnItemInserted="DVDoctor_ItemInserted" OnPreRender="DVDoctor_PreRender">
                         <Fields>
                             <asp:BoundField DataField="ssn" HeaderText="ssn" ReadOnly="True" SortExpression="ssn" />
                             <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                             <asp:BoundField DataField="minit" HeaderText="minit" SortExpression="minit" />
                             <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                             <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                             <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                             <asp:BoundField DataField="experience" HeaderText="experience" SortExpression="experience" />
                             <asp:BoundField DataField="dno" HeaderText="dno" SortExpression="dno" />
                             <asp:BoundField DataField="hospital_id" HeaderText="hospital_id" SortExpression="hospital_id" />
                             <asp:CommandField ShowInsertButton="True" />
                         </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:myConnectionString %>" DeleteCommand="DELETE FROM [doctor] WHERE [ssn] = @original_ssn AND [fname] = @original_fname AND (([minit] = @original_minit) OR ([minit] IS NULL AND @original_minit IS NULL)) AND [lname] = @original_lname AND [age] = @original_age AND (([sex] = @original_sex) OR ([sex] IS NULL AND @original_sex IS NULL)) AND [experience] = @original_experience AND (([dno] = @original_dno) OR ([dno] IS NULL AND @original_dno IS NULL)) AND (([hospital_id] = @original_hospital_id) OR ([hospital_id] IS NULL AND @original_hospital_id IS NULL))" InsertCommand="INSERT INTO [doctor] ([ssn], [fname], [minit], [lname], [age], [sex], [experience], [dno], [hospital_id]) VALUES (@ssn, @fname, @minit, @lname, @age, @sex, @experience, @dno, @hospital_id)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [doctor] WHERE ([ssn] = @ssn)" UpdateCommand="UPDATE [doctor] SET [fname] = @fname, [minit] = @minit, [lname] = @lname, [age] = @age, [sex] = @sex, [experience] = @experience, [dno] = @dno, [hospital_id] = @hospital_id WHERE [ssn] = @original_ssn AND [fname] = @original_fname AND (([minit] = @original_minit) OR ([minit] IS NULL AND @original_minit IS NULL)) AND [lname] = @original_lname AND [age] = @original_age AND (([sex] = @original_sex) OR ([sex] IS NULL AND @original_sex IS NULL)) AND [experience] = @original_experience AND (([dno] = @original_dno) OR ([dno] IS NULL AND @original_dno IS NULL)) AND (([hospital_id] = @original_hospital_id) OR ([hospital_id] IS NULL AND @original_hospital_id IS NULL))" OnInserted="SqlDataSource2_Inserted" OnSelected="SqlDataSource2_Selected">
                        <DeleteParameters>
                            <asp:Parameter Name="original_ssn" Type="String" />
                            <asp:Parameter Name="original_fname" Type="String" />
                            <asp:Parameter Name="original_minit" Type="String" />
                            <asp:Parameter Name="original_lname" Type="String" />
                            <asp:Parameter Name="original_age" Type="Int32" />
                            <asp:Parameter Name="original_sex" Type="String" />
                            <asp:Parameter Name="original_experience" Type="Int32" />
                            <asp:Parameter Name="original_dno" Type="String" />
                            <asp:Parameter Name="original_hospital_id" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ssn" Type="String" />
                            <asp:Parameter Name="fname" Type="String" />
                            <asp:Parameter Name="minit" Type="String" />
                            <asp:Parameter Name="lname" Type="String" />
                            <asp:Parameter Name="age" Type="Int32" />
                            <asp:Parameter Name="sex" Type="String" />
                            <asp:Parameter Name="experience" Type="Int32" />
                            <asp:Parameter Name="dno" Type="String" />
                            <asp:Parameter Name="hospital_id" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="-1" Name="ssn" SessionField="Doctor_ssn" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="fname" Type="String" />
                            <asp:Parameter Name="minit" Type="String" />
                            <asp:Parameter Name="lname" Type="String" />
                            <asp:Parameter Name="age" Type="Int32" />
                            <asp:Parameter Name="sex" Type="String" />
                            <asp:Parameter Name="experience" Type="Int32" />
                            <asp:Parameter Name="dno" Type="String" />
                            <asp:Parameter Name="hospital_id" Type="String" />
                            <asp:Parameter Name="original_ssn" Type="String" />
                            <asp:Parameter Name="original_fname" Type="String" />
                            <asp:Parameter Name="original_minit" Type="String" />
                            <asp:Parameter Name="original_lname" Type="String" />
                            <asp:Parameter Name="original_age" Type="Int32" />
                            <asp:Parameter Name="original_sex" Type="String" />
                            <asp:Parameter Name="original_experience" Type="Int32" />
                            <asp:Parameter Name="original_dno" Type="String" />
                            <asp:Parameter Name="original_hospital_id" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <br />
                    <p>Patient</p>
                    <br />

				<asp:GridView ID="GVPatient" runat="server" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" 
					OnSelectedIndexChanging="GVPatient_SelectedIndexChanging"
                     OnSelectedIndexChanged="GVPatient_SelectedIndexChanged"
                     DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ssn">
					<AlternatingRowStyle BackColor="White" />
					<Columns>
                        <asp:BoundField DataField="ssn" HeaderText="ssn" ReadOnly="True" SortExpression="ssn" />
                        <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                        <asp:BoundField DataField="minit" HeaderText="minit" SortExpression="minit" />
                        <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                        <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                        <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                        <asp:BoundField DataField="hospital_id" HeaderText="hospital_id" SortExpression="hospital_id" />
                        <asp:BoundField DataField="period_in_hospital" HeaderText="period_in_hospital" SortExpression="period_in_hospital" />
                        <asp:BoundField DataField="disease_name" HeaderText="disease_name" SortExpression="disease_name" />

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
               
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
    SelectCommand="SELECT [patient].*,[diagnose].disease_name FROM [patient] ,  [diagnose] WHERE ( [ssn] = [pssn] and [dssn]=@Doctor_ssn)">
     <SelectParameters>
                         <asp:SessionParameter DefaultValue="-1" Name="Doctor_ssn" SessionField="Doctor_ssn" Type="String" />
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
