<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patient.aspx.cs" Inherits="WebApplication1.Patient" %>

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
                            <li class="subMenu selected">


                                <a href="../Patient.aspx">Patient</a>


                            </li>
                            <li class="subMenu ">


                                <a href="../Ambulance.aspx">Ambulance</a>


                            </li>
                    </nav>
                </nav>
                <center>
                    <br />
                    <p>Patient</p>
                    <p>&nbsp;</p>
                    <b></b>
                    <b></b>
               <asp:GridView ID="GVPatient" runat="server" CellPadding="4" 
                   DataSourceID="SqlDataSourcePatient" ForeColor="#333333" GridLines="None" AllowPaging="True" 
                   AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ssn" 
                   OnRowDeleted="GVPatient_RowDeleted" OnRowUpdated="GVPatient_RowUpdated" 
                   OnSelectedIndexChanged="GVPatient_SelectedIndexChanged" 
                    OnSelectedIndexChanging="GVPatient_SelectedIndexChanging" 
                  >
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
                 <asp:SqlDataSource ID="SqlDataSourcePatient" runat="server" 
                     ConflictDetection="CompareAllValues" 
                     ConnectionString="<%$ ConnectionStrings:myConnectionString %>"
                      DeleteCommand="DELETE FROM [patient] WHERE [ssn] = @original_ssn AND [fname] = @original_fname AND (([minit] = @original_minit) OR ([minit] IS NULL AND @original_minit IS NULL)) AND [lname] = @original_lname AND [age] = @original_age AND (([sex] = @original_sex) OR ([sex] IS NULL AND @original_sex IS NULL)) AND [hospital_id] = @original_hospital_id AND (([period_in_hospital] = @original_period_in_hospital) OR ([period_in_hospital] IS NULL AND @original_period_in_hospital IS NULL))" InsertCommand="INSERT INTO [patient] ([ssn], [fname], [minit], [lname], [age], [sex], [hospital_id], [period_in_hospital]) VALUES (@ssn, @fname, @minit, @lname, @age, @sex, @hospital_id, @period_in_hospital)" OldValuesParameterFormatString="original_{0}" 
                     SelectCommand="SELECT * FROM [patient] WHERE ([hospital_id] = @hospital_id)" UpdateCommand="UPDATE [patient] SET [fname] = @fname, [minit] = @minit, [lname] = @lname, [age] = @age, [sex] = @sex, [hospital_id] = @hospital_id, [period_in_hospital] = @period_in_hospital WHERE [ssn] = @original_ssn AND [fname] = @original_fname AND (([minit] = @original_minit) OR ([minit] IS NULL AND @original_minit IS NULL)) AND [lname] = @original_lname AND [age] = @original_age AND (([sex] = @original_sex) OR ([sex] IS NULL AND @original_sex IS NULL)) AND [hospital_id] = @original_hospital_id AND (([period_in_hospital] = @original_period_in_hospital) OR ([period_in_hospital] IS NULL AND @original_period_in_hospital IS NULL))" OnDeleted="SqlDataSourcePatient_Deleted" OnSelected="SqlDataSourcePatient_Selected" OnUpdated="SqlDataSourcePatient_Updated">
                     <DeleteParameters>
                         <asp:Parameter Name="original_ssn" Type="String" />
                         <asp:Parameter Name="original_fname" Type="String" />
                         <asp:Parameter Name="original_minit" Type="String" />
                         <asp:Parameter Name="original_lname" Type="String" />
                         <asp:Parameter Name="original_age" Type="Int32" />
                         <asp:Parameter Name="original_sex" Type="String" />
                         <asp:Parameter Name="original_hospital_id" Type="String" />
                         <asp:Parameter Name="original_period_in_hospital" Type="Int32" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="ssn" Type="String" />
                         <asp:Parameter Name="fname" Type="String" />
                         <asp:Parameter Name="minit" Type="String" />
                         <asp:Parameter Name="lname" Type="String" />
                         <asp:Parameter Name="age" Type="Int32" />
                         <asp:Parameter Name="sex" Type="String" />
                         <asp:Parameter Name="hospital_id" Type="String" />
                         <asp:Parameter Name="period_in_hospital" Type="Int32" />
                     </InsertParameters>
                     <SelectParameters>
                         <asp:SessionParameter DefaultValue="-1" Name="hospital_id" SessionField="hospital_id" Type="String" />
                     </SelectParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="fname" Type="String" />
                         <asp:Parameter Name="minit" Type="String" />
                         <asp:Parameter Name="lname" Type="String" />
                         <asp:Parameter Name="age" Type="Int32" />
                         <asp:Parameter Name="sex" Type="String" />
                         <asp:Parameter Name="hospital_id" Type="String" />
                         <asp:Parameter Name="period_in_hospital" Type="Int32" />
                         <asp:Parameter Name="original_ssn" Type="String" />
                         <asp:Parameter Name="original_fname" Type="String" />
                         <asp:Parameter Name="original_minit" Type="String" />
                         <asp:Parameter Name="original_lname" Type="String" />
                         <asp:Parameter Name="original_age" Type="Int32" />
                         <asp:Parameter Name="original_sex" Type="String" />
                         <asp:Parameter Name="original_hospital_id" Type="String" />
                         <asp:Parameter Name="original_period_in_hospital" Type="Int32" />
                     </UpdateParameters>
                    </asp:SqlDataSource>

                    <br />
                    <p>Detail</p>
                    <br />
                    <asp:DetailsView ID="DVPatient" 
                        runat="server" 
                        AutoGenerateRows="False"
                         DataKeyNames="ssn" 
                        DataSourceID="SqlDataSourceDVPatient" 
                        OnItemInserted="DVPatient_ItemInserted" OnPreRender="DVPatient_PreRender"

                     
                          >
                        
       

                        <Fields>
                            <asp:BoundField DataField="ssn" HeaderText="ssn" ReadOnly="True" SortExpression="ssn" />
                            <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                            <asp:BoundField DataField="minit" HeaderText="minit" SortExpression="minit" />
                            <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                            <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                            <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                            <asp:BoundField DataField="hospital_id" HeaderText="hospital_id" SortExpression="hospital_id" />
                            <asp:BoundField DataField="period_in_hospital" HeaderText="period_in_hospital" SortExpression="period_in_hospital" />
                            <asp:CommandField ShowInsertButton="True" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSourceDVPatient" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:myConnectionString %>" DeleteCommand="DELETE FROM [patient] WHERE [ssn] = @original_ssn AND [fname] = @original_fname AND (([minit] = @original_minit) OR ([minit] IS NULL AND @original_minit IS NULL)) AND [lname] = @original_lname AND [age] = @original_age AND (([sex] = @original_sex) OR ([sex] IS NULL AND @original_sex IS NULL)) AND [hospital_id] = @original_hospital_id AND (([period_in_hospital] = @original_period_in_hospital) OR ([period_in_hospital] IS NULL AND @original_period_in_hospital IS NULL))" InsertCommand="INSERT INTO [patient] ([ssn], [fname], [minit], [lname], [age], [sex], [hospital_id], [period_in_hospital]) VALUES (@ssn, @fname, @minit, @lname, @age, @sex, @hospital_id, @period_in_hospital)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [patient] WHERE ([ssn] = @ssn)" UpdateCommand="UPDATE [patient] SET [fname] = @fname, [minit] = @minit, [lname] = @lname, [age] = @age, [sex] = @sex, [hospital_id] = @hospital_id, [period_in_hospital] = @period_in_hospital WHERE [ssn] = @original_ssn AND [fname] = @original_fname AND (([minit] = @original_minit) OR ([minit] IS NULL AND @original_minit IS NULL)) AND [lname] = @original_lname AND [age] = @original_age AND (([sex] = @original_sex) OR ([sex] IS NULL AND @original_sex IS NULL)) AND [hospital_id] = @original_hospital_id AND (([period_in_hospital] = @original_period_in_hospital) OR ([period_in_hospital] IS NULL AND @original_period_in_hospital IS NULL))" OnInserted="SqlDataSourceDVPatient_Inserted">
                        <DeleteParameters>
                            <asp:Parameter Name="original_ssn" Type="String" />
                            <asp:Parameter Name="original_fname" Type="String" />
                            <asp:Parameter Name="original_minit" Type="String" />
                            <asp:Parameter Name="original_lname" Type="String" />
                            <asp:Parameter Name="original_age" Type="Int32" />
                            <asp:Parameter Name="original_sex" Type="String" />
                            <asp:Parameter Name="original_hospital_id" Type="String" />
                            <asp:Parameter Name="original_period_in_hospital" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ssn" Type="String" />
                            <asp:Parameter Name="fname" Type="String" />
                            <asp:Parameter Name="minit" Type="String" />
                            <asp:Parameter Name="lname" Type="String" />
                            <asp:Parameter Name="age" Type="Int32" />
                            <asp:Parameter Name="sex" Type="String" />
                            <asp:Parameter Name="hospital_id" Type="String" />
                            <asp:Parameter Name="period_in_hospital" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="-1" Name="ssn" SessionField="Patient_ssn" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="fname" Type="String" />
                            <asp:Parameter Name="minit" Type="String" />
                            <asp:Parameter Name="lname" Type="String" />
                            <asp:Parameter Name="age" Type="Int32" />
                            <asp:Parameter Name="sex" Type="String" />
                            <asp:Parameter Name="hospital_id" Type="String" />
                            <asp:Parameter Name="period_in_hospital" Type="Int32" />
                            <asp:Parameter Name="original_ssn" Type="String" />
                            <asp:Parameter Name="original_fname" Type="String" />
                            <asp:Parameter Name="original_minit" Type="String" />
                            <asp:Parameter Name="original_lname" Type="String" />
                            <asp:Parameter Name="original_age" Type="Int32" />
                            <asp:Parameter Name="original_sex" Type="String" />
                            <asp:Parameter Name="original_hospital_id" Type="String" />
                            <asp:Parameter Name="original_period_in_hospital" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />



                    <br />
                    <p>diagnose</p>
                    <p>&nbsp;</p>
                    <b></b>
                    <asp:DetailsView ID="DVDiagnose" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSourceDiagnose" DataKeyNames="pssn,dssn" >
                        <Fields>
                            <asp:BoundField DataField="pssn" HeaderText="pssn" ReadOnly="True" SortExpression="pssn" />
                            <asp:BoundField DataField="dssn" HeaderText="dssn" ReadOnly="True" SortExpression="dssn" />
                            <asp:BoundField DataField="disease_name" HeaderText="disease_name" SortExpression="disease_name" />
                        </Fields>
                    </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSourceDiagnose" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
                    SelectCommand="SELECT * FROM [diagnose] WHERE ([pssn] = @pssn)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="pssn" SessionField="Patient_ssn" Type="String" />
                    </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <p>Doctor</p>
                    <br />
                    <asp:DetailsView ID="DVDoctor" runat="server" AutoGenerateRows="False" DataKeyNames="ssn" DataSourceID="SqlDataSourceDoctor" >
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
                        </Fields>
                   
                    </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSourceDoctor" runat="server" ConnectionString="<%$ ConnectionStrings:myConnectionString %>" SelectCommand="SELECT * FROM [doctor] WHERE ([ssn] = @ssn)">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="-1" Name="ssn" SessionField="Doctor_ssn" Type="String" />
                            </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                </center>
            </div>

        </div>
        <footer>
            <p>Developer: Jing Peng and Trung Duc Huynh</p>
        </footer>
    </form>
</body>
</html>
