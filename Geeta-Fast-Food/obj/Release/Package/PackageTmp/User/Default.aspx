<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Geeta_Fast_Food.User.Default" %>

<%@ Import Namespace="Geeta_Fast_Food" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- offer section -->
    
    <section class="offer_section layout_padding-bottom">
        <div class="offer_container">
            <div class="container">
                <div class="heading_container heading_center">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" visible="false"></asp:Label>
                </div>
                <h2>Our Menu's Category
                </h2>
            </div>
                <div class="row">
                    <asp:Repeater ID="rCategory" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6">
                                <div class="box">
                                    <div class="img-box">
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">
                                         <%--  image size should be 225 px * 225 px --%>
<img src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" alt="" />
                                        </a>
                                        
                                    </div>
                                    <div class="detail-box">
                                      <%--  <h5>Tasty Thursdays</h5>--%>
                                        <h6><span style="font-size: 25px; letter-spacing: 3px; font-family: Dancing Script',cursive; "><%# Eval("Name") %></span> </h6>
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">Order Now
                    <svg
                        version="1.1"
                        id="Capa_1"
                        xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink"
                        x="0px"
                        y="0px"
                        viewBox="0 0 456.029 456.029"
                        style="enable-background: new 0 0 456.029 456.029"
                        xml:space="preserve">
                        <g>
                            <g>
                                <path
                                    d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                     c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path
                                    d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                     C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                     c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                     C457.728,97.71,450.56,86.958,439.296,84.91z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path
                                    d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                     c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                            </g>
                        </g>
                        <g></g>
                        <g></g>
                        <g></g>
                        <g></g>
                        <g></g>
                        <g></g>
                        <g></g>
                        <g></g>
                        <g></g>
                        <g></g>
                        <g></g>
                        <g></g>
                        <g></g>
                        <g></g>
                        <g></g>
                    </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                </div>
            </div>
        </div>
    </section>

    <!-- end offer section -->



    <!-- about section -->

    <section class="about_section layout_padding">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="img-box">
                        <img src="../TemplateFile/images/about-img.png" alt="" />
                    </div>
                </div>
                <div class="col-md-8 pl-5">
                    <div class="detail-box">
                        <div class="heading_container">
                            <h2></h2>
                        </div>
                        <p style="font-size: 21px; font-family: Calibri; font-style: italic">
                            Welcome to our veg restaurant! We are a unique dining experience that caters to those who love flavorful, healthy, and sustainable cuisine. Our mission is to provide our customers with a diverse and delicious menu that satisfies their taste buds while being kind to the environment.

Our chefs are passionate about creating dishes that showcase the beauty and flavor of plant-based ingredients. We use only the freshest and finest ingredients, sourced from local farms and suppliers whenever possible. Our menu features a variety of vegan and vegetarian options, as well as gluten-free and dairy-free options.

Our restaurant is designed to provide a comfortable and inviting atmosphere for all our guests. We believe that dining out should be an enjoyable and relaxing experience, and we strive to make that a reality for everyone who visits us.
                        </p>
                        <%-- <a href="">Read More </a>--%>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end about section -->





    <!-- client section -->

    <section class="client_section layout_padding-bottom pt-5">
        <div class="container">
            <div class="heading_container heading_center psudo_white_primary mb_45">


                <h2>What Says Our Customers</h2>
            </div>
            <div class="carousel-wrap row">
                <div class="owl-carousel client_owl-carousel">
                    <div class="item">
                        <div class="box">
                            <div class="detail-box">
                                <p>
                                    This place serves awesome ghar jaisa thali at a very reasonable rate. I have eaten from this place for around 7-8 times.
                                    Rate doesn't burn your pocket at all. Food is delicious. Quantity is also good for 2 persons in one thali. 
                                    Must try is Veg. Rice Thali. My husband and I like its food very much.
                                </p>
                                <h6>Manisha Mohta</h6>
                                <p></p>
                            </div>
                            <div class="img-box">
                                <img src="../TemplateFile/images/client1.jpg" alt="" class="box-img" />
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="box">
                            <div class="detail-box">
                                <p>
                                    The best food place nearby IIT Main Gate and its affordable. Its a small place but serves fresh and tasty food. Samosa, Vada Pav,
                                    Usal Pav are some of the best dishes by Geeta Fast Food. Veg Thali is available for lunch/dinner. 
                                    Thali includes 4 Chapathi, Rice bowl, 2 Sabji, Dal, Curd, Sweet and Papad. Its limited one but sufficient for 1 person.
                                </p>
                                <h6>Shantanu Gokhal</h6>
                                <p></p>
                            </div>
                            <div class="img-box">
                                <img src="../TemplateFile/images/client2.jpg" alt="" class="box-img" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end client section -->
</asp:Content>
