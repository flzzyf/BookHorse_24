﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookEdit.aspx.cs" Inherits="Web_Admin_BookEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="BsBook" DeleteMethod="DeleteBsBook" SelectMethod="FindBsBook" TypeName="BsBookBLL" UpdateMethod="EditBsBook" OnUpdated="ObjectDataSource1_Updated">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="bookID" Type="Int32" DefaultValue="400" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataSourceID="ObjectDataSource1" DefaultMode="Edit" ForeColor="#333333" GridLines="None" Height="50px" HorizontalAlign="Center" Width="432px" OnItemUpdated="DetailsView1_ItemUpdated" OnModeChanging="DetailsView1_ModeChanging">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" Width="50px" />
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:TemplateField HeaderText="类别" SortExpression="CatID">
                    <EditItemTemplate>
                        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="FindBsCategories" TypeName="BsCategoryBLL">
                        </asp:ObjectDataSource>
                        <br />
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ObjectDataSource2" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("CatID") %>'>
                        </asp:DropDownList>
                        <br />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Summary") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Summary") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="书名" SortExpression="Name" />
                <asp:BoundField DataField="Price" HeaderText="价格" SortExpression="Price" />
                <asp:TemplateField HeaderText="简介" SortExpression="Summary">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Height="173px" Text='<%# Bind("Summary") %>' TextMode="MultiLine" Width="319px"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CatID") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CatID") %>'></asp:Label>
                    </ItemTemplate>
                    
                </asp:TemplateField>
                <asp:BoundField DataField="Author" HeaderText="作者" SortExpression="Author" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" DeleteCommand="DELETE FROM [BsBook] WHERE [ID] = @ID" InsertCommand="INSERT INTO [BsBook] ([CatID], [Name], [Image], [Price], [Summary], [Author]) VALUES (@CatID, @Name, @Image, @Price, @Summary, @Author)" SelectCommand="SELECT * FROM [BsBook] WHERE ([ID] = @ID)" UpdateCommand="UPDATE [BsBook] SET [CatID] = @CatID, [Name] = @Name, [Image] = @Image, [Price] = @Price, [Summary] = @Summary, [Author] = @Author WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CatID" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="Summary" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="bookID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CatID" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="Summary" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Edit" ForeColor="Black" GridLines="Vertical" Height="50px" HorizontalAlign="Center" Width="452px">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:TemplateField HeaderText="CatID" SortExpression="CatID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CatID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CatID") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID">
                        </asp:DropDownList>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [BsCategory]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:TemplateField HeaderText="Summary" SortExpression="Summary">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Height="107px" Text='<%# Bind("Summary") %>' TextMode="MultiLine" Width="255px"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Summary") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Summary") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
        </asp:DetailsView>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
