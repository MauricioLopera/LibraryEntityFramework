<%@ Page Title="LibreriaML | Mauricio Lopera" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LibraryML._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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
            let abrir = document.getElementById('modl').value;

            if (abrir == '1') {
                abrirModal(0);
            } else {
                abreColapse(0);
            }
        }
    </script>

    <div class="row rowtit">
        <h4 class="left">Libros Disponibles</h4>
        <a class="waves-effect waves-light btn-small blue darken-1 right" onclick="abreColapse(0)"><i id="iconl" class="material-icons left">add_circle_outline</i><span id="textn">Nuevo</span></a>
        <asp:TextBox ID="newl" runat="server" CssClass="btnnovisible" Text="0" ClientIDMode="Static"></asp:TextBox>
        <asp:TextBox ID="modl" runat="server" Text="0" ClientIDMode="Static" CssClass="btnnovisible"></asp:TextBox>
    </div>
    <ul class="collapsible ulplanner">
        <li>
            <div class="collapsible-body">
                <div class="row rowsinmag">
                    <div class="col s12 m6">
                        <div class="row rowsinmag">
                            <div class="input-field col s12">
                                <asp:TextBox ID="txttitulo" runat="server" class="validate"></asp:TextBox>
                                <label for="txttitulo">Titulo</label>
                            </div>
                        </div>
                        <div class="row rowsinmag">
                            <div class="input-field col s4">
                                <asp:TextBox ID="txtaño" runat="server" class="validate" TextMode="Number"></asp:TextBox>
                                <label for="txtaño">Año</label>
                            </div>
                            <div class="input-field col s8">
                                <asp:DropDownList ID="listeditorial" runat="server"></asp:DropDownList>
                                <label>Editorial</label>
                            </div>
                        </div>
                    </div>
                    <div class="col s12 m6">
                        <div class="row rowsinmag">
                            <div class="input-field col s12">
                                <asp:TextBox ID="txtsinopsis" runat="server" TextMode="MultiLine" CssClass="materialize-textarea txtsinopsis"></asp:TextBox>
                                <label for="txtsinopsis">Sinopsis</label>
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
                <asp:Label ID="label1" runat="server" Text="Titulo" CssClass="lbltitgrid"></asp:Label>
            </div>
        </div>
        <div class="col s1">
            <div class="row rowsinmag">
                <asp:Label ID="label2" runat="server" Text="Año" CssClass="lbltitgrid"></asp:Label>
            </div>
        </div>
        <div class="col s4">
            <div class="row rowsinmag">
                <asp:Label ID="label3" runat="server" Text="Editorial" CssClass="lbltitgrid"></asp:Label>
            </div>
        </div>
        <div class="col s2 colsinpad center-align">
        </div>
    </div>
    <div class="row rowsinmag">
        <asp:GridView ID="gridLibros" runat="server" CssClass="gridnopad" PageSize="300" HorizontalAlign="Center" EmptyDataText="No hay libros para mostrar" AutoGenerateColumns="False" ShowHeader="False" DataKeyNames="Id" AlternatingRowStyle-BackColor="#f5f5f5" OnRowCommand="gridLibros_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="Mensaje">
                    <ItemTemplate>
                        <div class="row rowsinmag rowconpad rowhover">
                            <div class="col s5">
                                <div class="row rowsinmag">
                                    <asp:Label ID="label1" runat="server" Text='<%# Bind("titulo")%>' CssClass="lblcuerpo"></asp:Label>
                                </div>
                            </div>
                            <div class="col s1">
                                <div class="row rowsinmag">
                                    <asp:Label ID="label2" runat="server" Text='<%# Bind("Publicado")%>' CssClass="lblcuerpo"></asp:Label>
                                </div>
                            </div>
                            <div class="col s4">
                                <div class="row rowsinmag">
                                    <asp:Label ID="label3" runat="server" Text='<%# Bind("Editorial")%>' CssClass="lblcuerpo"></asp:Label>
                                </div>
                            </div>
                            <div class="col s2 center-align">
                                <div class="row rowsinmag">
                                    <asp:LinkButton ID="lnkdetails" runat="server" CssClass="hlfunccards" ToolTip="Detalles" CommandName="Ver" CommandArgument="<%# Container.DataItemIndex%>"><i class="small material-icons">search</i></asp:LinkButton>
                                    <asp:LinkButton ID="lnkedit" runat="server" CssClass="hlfunccards" ToolTip="Editar" CommandName="Editar" CommandArgument="<%# Container.DataItemIndex%>"><i class="small material-icons">edit</i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="id">
                    <ItemTemplate>
                        <asp:Label ID="lblidlibro" runat="server" Text='<%# Bind("Id")%>'></asp:Label>
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
    <div id="modelDetalle" class="modal modal-fixed-footer">
        <div class="modal-content">
            <div class="row center-align">
                <h4>Detalles del Libro</h4>
            </div>
            <div class="row rowconmag">
                <asp:Label ID="Label4" runat="server" Text="Titulo:" CssClass="lblcuerpo subtdet"></asp:Label>
                <asp:Label ID="lbltitdet" runat="server" Text="" CssClass="lblcuerpo"></asp:Label>
            </div>
            <div class="row rowconmag">
                <asp:Label ID="Label5" runat="server" Text="Año Publicación:" CssClass="lblcuerpo subtdet"></asp:Label>
                <asp:Label ID="lblañodet" runat="server" Text="" CssClass="lblcuerpo"></asp:Label>
            </div>
            <div class="row rowconmag">
                <asp:Label ID="Label7" runat="server" Text="Editorial:" CssClass="lblcuerpo subtdet"></asp:Label>
                <asp:Label ID="lbleditorialdet" runat="server" Text="" CssClass="lblcuerpo"></asp:Label>
            </div>
            <div class="row rowconmag">
                <asp:Label ID="Label6" runat="server" Text="Sinopsis:" CssClass="lblcuerpo subtdet"></asp:Label>
                <asp:Label ID="lblsinopdet" runat="server" Text="" CssClass="lblcuerpo detsinop"></asp:Label>
            </div>
            <div class="row rowconmag">
                <asp:Label ID="Label8" runat="server" Text="Autores:" CssClass="lblcuerpo subtdet"></asp:Label>
            </div>
            <div class="row rowsinmag">
                <div class="input-field col s6">
                    <asp:DropDownList ID="listautor" runat="server"></asp:DropDownList>
                </div>
                <div class="input-field col s2">
                    <asp:LinkButton ID="lnkadd" runat="server" CssClass="waves-effect waves-light btn-small blue darken-1 right" OnClick="lnkadd_Click">Asociar</asp:LinkButton>
                </div>
            </div>
            <div class="row rowsinmag">
                <asp:GridView ID="gridautoresdet" runat="server" CssClass="gridnopad" PageSize="20" HorizontalAlign="Center" EmptyDataText="No hay autores asociados" AutoGenerateColumns="False" ShowHeader="False" DataKeyNames="Id" AlternatingRowStyle-BackColor="#f5f5f5" OnRowCommand="gridautoresdet_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Mensaje">
                            <ItemTemplate>
                                <div class="row rowsinmag rowconpad rowhover">
                                    <div class="col s8">
                                        <div class="row rowsinmag">
                                            <asp:Label ID="label1" runat="server" Text='<%# Bind("Autor")%>' CssClass="lblcuerpo"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col s2 center-align">
                                        <div class="row rowsinmag">
                                            <asp:LinkButton ID="lnkdelete" runat="server" CssClass="hlfunccards" ToolTip="Eliminar" CommandName="Eliminar" CommandArgument="<%# Container.DataItemIndex%>"><i class="small material-icons">delete</i></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="id">
                            <ItemTemplate>
                                <asp:Label ID="lblidasoc" runat="server" Text='<%# Bind("Id")%>'></asp:Label>
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
        </div>
        <div class="modal-footer">
            <a href="#!" class="modal-close waves-effect waves-purple btn-flat">Cerrar</a>
        </div>
    </div>
</asp:Content>
