<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Dashboard - Hỏi Dân IT</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>

            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/product">Product</a></li>
                                    <li class="breadcrumb-item active">Create Product</li>
                                </ol>
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h3>Create a product</h3>
                                        <hr>
                                        <form:form class="row g-3" method="post" enctype="multipart/form-data"
                                            action="/admin/product/create" modelAttribute="newProduct">
                                            <div class="col-12 mb-3 col-md-6">
                                                <c:set var="errorName">
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="exampleInputEmail1" class="form-label">Name</label>
                                                <form:input type="text" path="name"
                                                    class="form-control ${not empty errorName ? 'is-invalid' :''}" />
                                                ${errorName}
                                            </div>
                                            <div class="col-12 mb-3 col-md-6">
                                                <c:set var="errorPrice">
                                                    <form:errors path="price" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="exampleInputPassword1" class="form-label">Price</label>
                                                <form:input type="text" path="price"
                                                    class="form-control ${not empty errorPrice ? 'is-invalid' :''}" />
                                                ${errorPrice}
                                            </div>
                                            <div class="col-12 mb-3 ">
                                                <label for="exampleInputPassword1" class="form-label">Detail
                                                    Description</label>
                                                <form:input type="text" class="form-control" path="detailDesc" />
                                            </div>
                                            <div class="col-12 mb-3 col-md-6">
                                                <label for="exampleInputPassword1" class="form-label">Short
                                                    Description</label>
                                                <form:input type="text" class="form-control" path="shortDesc" />
                                            </div>
                                            <div class="col-12 mb-3 col-md-6">
                                                <c:set var="errorQuantity">
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="exampleInputPassword1" class="form-label">Quantity</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorQuantity ? 'is-invalid' :''}"
                                                    path="quantity" />
                                                ${errorQuantity}
                                            </div>
                                            <div class="col-12 mb-3 col-md-6">
                                                <label for="exampleInputPassword1" class="form-label">Factory</label>
                                                <form:select class="form-select" path="factory">
                                                    <form:option value="Apple">Apple</form:option>
                                                    <form:option value="Asus">Asus</form:option>
                                                </form:select>
                                            </div>
                                            <div class="col-12 mb-3 col-md-6">
                                                <label for="exampleInputPassword1" class="form-label">Target</label>
                                                <form:select class="form-select" path="target">
                                                    <form:option value="Gaming">Gaming</form:option>
                                                    <form:option value="Laptop">Laptop</form:option>
                                                </form:select>
                                            </div>
                                            <div class="col-12 mb-3 col-md-6">
                                                <label for="avatarFile" class="form-label">Image Product</label>
                                                <input class="form-control" type="file" id="avatarFile"
                                                    accept=".png, .jpg, .jpeg" name="uploadFile" />
                                            </div>
                                            <div class="col-12 mb-3">
                                                <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                    id="avatarPreview">
                                            </div>
                                            <div class="col-12 mb-5">
                                                <button type="submit" class="btn btn-primary">Create</button>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>

                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/chart-area-demo.js"></script>
                <script src="js/chart-bar-demo.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/datatables-simple-demo.js"></script>
            </body>

            </html>