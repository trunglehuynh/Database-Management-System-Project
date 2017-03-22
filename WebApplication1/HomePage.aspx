<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="WebApplication1.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title ID="title">Hopital Management System</title>
    <meta http-equiv="Content-Type" content="text/html ; charset=UTF-8" />
    <link href="Styles/Home.css" rel="stylesheet" />
    
</head>

<body>
    <form ID="form1" runat="server">
        <header>

            <header align="center">
                <h1>Hospital Management System</h1>
            </header>
        </header>

        <div ID="MainBody">
            <h1 class="SmallH1" >Login</h1>
             <nav>
                    <nav>
                        <ul>
                             <li class="subMenu  selected">


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
                            <li class="subMenu ">


                                <a href="../Ambulance.aspx">Ambulance</a>


                            </li>
                    </nav>
                </nav>
            
            <br />
            <p>
                Username: 
            <asp:TextBox  runat="server" ID="TBUsername"></asp:TextBox>
            </p>
            <br />
            <p>
                Password:
                 <asp:TextBox ID="TBPassword" TextMode="password" runat="server"></asp:TextBox>

            </p>

            <br />
            <br />
            <br />
            <asp:Button ID="login" runat="server" Text="login" CssClass="button" Height="44px" Width="200px" OnClick="login_Click" />
             <br />
            <asp:Button ID="Logout" runat="server" Text="logout" CssClass="button" Height="44px" Width="200px" OnClick="logout_Click" Visible="False" />


        </div>

        <footer>
            <p>Developer: Jing Peng and Trung Duc Huynh</p>
        </footer>


    </form>


</body>
</html>
