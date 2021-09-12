<%@ Page Title="BD Editoriales | LibraryML" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BDEditoriales.aspx.cs" Inherits="LibraryML.BDEditoriales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        //Alert Messages
        function swalert(title, text, icon) {
            swal({
                title: title,
                text: text,
                icon: icon,
                button: "Aceptar",
            });
        }
        window.onload = function () {
            abreColapse(0);
        }
    </script>
    <div class="row rowtit">
        <h4 class="left">Editoriales Disponibles</h4>
        <a class="waves-effect waves-light btn-small blue darken-1 right" onclick="abreColapse(0)"><i id="iconl" class="material-icons left">add_circle_outline</i><span id="textn">Nuevo</span></a>
        <asp:TextBox ID="newl" runat="server" CssClass="btnnovisible" Text="0" ClientIDMode="Static"></asp:TextBox>
    </div>
    <ul class="collapsible ulplanner">
        <li>
            <div class="collapsible-body">
                <div class="row rowsinmag">
                    <div class="col s12">
                        <div class="row rowsinmag">
                            <div class="input-field col s6">
                                <asp:TextBox ID="txtnomedit" runat="server" class="validate"></asp:TextBox>
                                <label for="txtnomedit">Nombre Completo</label>
                            </div>
                            <div class="input-field col s6">
                                <asp:TextBox ID="txtciuedit" runat="server" class="validate"></asp:TextBox>
                                <label for="txtciuedit">Ciudad</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row rowsinmag center-align">
                    <asp:LinkButton ID="lnkclean" runat="server" CssClass="lnkclean" OnClick="lnkclean_Click">Limpiar</asp:LinkButton>
                    <asp:LinkButton ID="btnsave" runat="server" CssClass="waves-effect waves-light btn blue darken-1" OnClick="btnsave_Click"><i class="material-icons left">save</i>Grabar</asp:LinkButton>
                    <asp:Label ID="lblid" runat="server" Text="0" Visible="false"></asp:Label>
                </div>
            </div>
        </li>
    </ul>
    <div class="row rowsinmag rowconpad blue lighten-2">
        <div class="col s5">
            <div class="row rowsinmag">
                <asp:Label ID="label3" runat="server" Text="Nombre" CssClass="lbltitgrid"></asp:Label>
            </div>
        </div>
        <div class="col s5">
            <div class="row rowsinmag">
                <asp:Label ID="label2" runat="server" Text="Ciudad" CssClass="lbltitgrid"></asp:Label>
            </div>
        </div>
    </div>
    <div class="row rowsinmag">
        <asp:GridView ID="gridEditorial" runat="server" CssClass="gridnopad" PageSize="300" HorizontalAlign="Center" EmptyDataText="No hay editoriales para mostrar" AutoGenerateColumns="False" ShowHeader="False" DataKeyNames="Id" AlternatingRowStyle-BackColor="#f5f5f5" OnRowCommand="gridEditorial_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="Mensaje">
                    <ItemTemplate>
                        <div class="row rowsinmag rowconpad rowhover">
                            <div class="col s5">
                                <div class="row rowsinmag">
                                    <asp:Label ID="label1" runat="server" Text='<%# Bind("nombre")%>' CssClass="lblcuerpo"></asp:Label>
                                </div>
                            </div>
                            <div class="col s5">
                                <div class="row rowsinmag">
                                    <asp:Label ID="label4" runat="server" Text='<%# Bind("ciudad")%>' CssClass="lblcuerpo"></asp:Label>
                                </div>
                            </div>
                            <div class="col s2 center-align">
                                <div class="row rowsinmag">
                                    <asp:LinkButton ID="lnkedit" runat="server" CssClass="hlfunccards" ToolTip="Editar" CommandName="Editar" CommandArgument="<%# Container.DataItemIndex%>"><i class="small material-icons">edit</i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="id">
                    <ItemTemplate>
                        <asp:Label ID="lblidedito" runat="server" Text='<%# Bind("Id")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#FF9191" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="1px" />
            <HeaderStyle BackColor="#9F7E6B " BorderStyle="Solid" BorderWidth="1px"
                BorderColor="Black" ForeColor="White" />
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10px" Wrap="False" />
            <SelectedRowStyle BorderColor="#7b1fa2" BorderStyle="Solid" BorderWidth="1px" />
        </asp:GridView>
    </div>
</asp:Content>
