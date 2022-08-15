<%@ Page Title="SignUp" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_Awaaz.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:Panel ID="Panel2" runat="server">
           
    <div class="main-content">

   
            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Login</h1>
                    </div>

                    <div class="form-row">
                        <asp:Label ID="Label8" runat="server" Text="Username"></asp:Label><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-row">
                         <asp:Label ID="Label9" runat="server" Text="Password"></asp:Label><asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                   
                    </div>

                    <div class="form-row">
                        <div class="log">
                        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                            &nbsp&nbsp&nbsp&nbsp&nbsp
                        <asp:Button ID="Button2" runat="server" Text="Sign up" OnClick="Button2_Click" />
                    </div>
                        <div class="form-row">
                            <asp:Button ID="Button4" runat="server" Text="Login with Google" CssClass="center" />    
                        </div>
                 
                        </div>

                </div>
                
            </div>
        </div>
       </asp:Panel>
    
    <asp:Panel ID="Panel1" runat="server">

    <div class="main-content">

   

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Create an account</h1>
                    </div>

                    <div class="form-row">
                        <asp:Label ID="Label1" runat="server" Text="Name" ForeColor="white"></asp:Label><asp:TextBox ID="TextBox1" runat="server" ForeColor="White" ></asp:TextBox>
                    </div>

                    <div class="form-row">
                     
                            <asp:Label ID="Label2" runat="server" Text="Password" ForeColor="white"></asp:Label><asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    
                    </div>


                    <div class="form-row">
                            <asp:Label ID="Label3" runat="server" Text="Confirm Password" ForeColor="white"></asp:Label><asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-row">
                        <asp:Label ID="Label7" runat="server" Text="Email" ForeColor="white"></asp:Label><asp:TextBox ID="TextBox7" runat="server" TextMode="Email" ForeColor="White" ></asp:TextBox>  
                      </div>


                    <div class="form-row">
                        <asp:Label ID="Label4" runat="server" Text="Date of Birth" ForeColor="white"></asp:Label>
                        <div class="form-row">
                        <asp:TextBox ID="TextBox4" runat="server" TextMode="Date" BackColor="#2A1015" ForeColor="White" ></asp:TextBox>
                            </div>
                    </div>
                    
                    <div class="form-row">
                        <asp:Label ID="Label5" runat="server" Text="Phone Number" ForeColor="white"></asp:Label><asp:TextBox ID="TextBox5" runat="server" TextMode="SingleLine" CssClass="form-row" ForeColor="White" ></asp:TextBox> 
                    </div>

                      <div class="form-row">
                        <asp:Label ID="Label6" runat="server" Text="Country" ForeColor="white"></asp:Label><asp:TextBox ID="TextBox6" runat="server" ForeColor="White" ></asp:TextBox>
                      </div>


                    <div class="form-row">
                      <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button3_Click" />
                    </div>

                </div>
            </div>

    </div>
    </asp:Panel>
</asp:Content>
