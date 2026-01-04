<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Geeta_Fast_Food.User.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <!-- Header-->
 <div class="slider">
 <div class="slide">

    <img src="../Images/1.png">
  </div>
  <div class="slide">
    <img src="../Images/20.png">    
  </div>
  <div class="slide">
    <img src="../Images/3.jpg">
  </div>
  <div class="slide">
    <img src="../Images/4.png">
  </div>
  
</div>
<!-- Section-->
<style>
    .book-cover{
        object-fit:contain !important;
        height:auto !important;
    }
    .slider {
  width: 100%;
  height: 500px;
  overflow: hidden;
  position: relative;
}
.slide {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
  transition: opacity 1s ease-in-out;
}
.slide.active {
  opacity: 1;
}
.slide img {
  width: 100%;
  height: 100%;
  
}

</style>

<script>
    var slides = document.querySelectorAll(".slide");
    var currentSlide = 0;
    slides[currentSlide].className = "slide active";
    var slideInterval = setInterval(nextSlide, 3000);

    function nextSlide() {
        slides[currentSlide].className = "slide";
        currentSlide = (currentSlide + 1) % slides.length;
        slides[currentSlide].className = "slide active";
    }
</script>

    <!-- Gallery -->
<div class="row pt-4 pr-4 pl-4">
  <div class="col-lg-4 col-md-12 mb-4 mb-lg-0">
    <img
      src="../Images/Paneer-malai-Tikka.jpg"
      class="w-100 shadow-1-strong rounded mb-4"
      alt="Paneer tika"
    />

    <img
      src="../Images/misal.png" height="740px"
      class="w-100 shadow-5-strong rounded mb-4"
      alt="misal"
    />
  </div>

  <div class="col-lg-4 mb-4 mb-lg-0">
    <img
      src="../Images/vada.png" height="700px"
      class="w-100 shadow-3-strong rounded mb-4"
      alt="Vada pav"
    />

    <img
      src="../Images/Samosa.png" height="400px"
      class="w-100 shadow-1-strong rounded mb-4"
      alt="Samosa"
    />
  </div>

  <div class="col-lg-4 mb-4 mb-lg-0">
    <img
      src="../Images/thali.jpg"
      class="w-100 shadow-1-strong rounded mb-4"
      alt="veg thali"
    />

    <img
      src="../Images/chole.png" height="750px"
      class="w-100 shadow-1-strong rounded mb-4"
      alt="chole bhature"
    />

  </div>
</div>
<!-- Gallery -->

</asp:Content>
