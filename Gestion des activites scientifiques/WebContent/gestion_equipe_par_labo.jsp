<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Administration |</title>
<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">

<!-- Bootstrap -->	
<link href="vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<!-- Custom Theme Style -->
<link href="build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.html" class="site_title"><i class="fa fa-paw"></i>
							<span>Administration!</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					

					<!-- sidebar menu -->
					<%@ include file="/sidemenu.jsp" %>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<div class="sidebar-footer hidden-small">
						<a data-toggle="tooltip" data-placement="top" title="Settings">
							<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="FullScreen">
							<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <span
							class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Logout"
							href="login.html"> <span class="glyphicon glyphicon-off"
							aria-hidden="true"></span>
						</a>
					</div>
					<!-- /menu footer buttons -->
				</div>
			</div>

			<!-- top navigation -->
			<%@ include file="/top_nav.jsp" %>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								Gestion <small>Axes de recherche</small>
							</h3>
						</div>
						
						
						
					</div>

					<div class="clearfix"></div>
					
						<div class="row">
							<div class="col-md-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>Form</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />
									<form action="<%=request.getContextPath()%>/addEquipe" method="post" enctype="multipart/form-data">
									<div><p style="color:red;"><c:out value="${nomEq}"/></p></div>
										<div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Nom Equipe :<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 ">
												<input type="text" id="last-name" name="nom_eq" required="required" class="form-control">
											</div>
										</div>
										<div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Ajouter des axes a l'equipe:<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 ">
												<select class="form-control"
													name="Axeseq" size="4" multiple required>
													<c:forEach items="${listAxeDequipe}" var="axelist">
													<option value="${axelist.getId_axe_laboratoire()}">${axelist.getNom_axe_laboratoire()}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Chef d'�quipe :<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 ">
												<select class="form-control"
													name="Chef_eq" required>
													<c:forEach items="${ChercheursEns}" var="cherEns">
													<option value="${cherEns.getId_chercheur()}">${cherEns.getNom()} ${cherEns.getPrenom()} </option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div><p style="color:red;"><c:out value="${minCH}"/></p></div>
										<div><p style="color:red;"><c:out value="${Chef_ch}"/></p></div>
										<div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Ajouter des chercheurs (minimum 3):<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 ">
												<select class="form-control"
													name="chercheurs" size="4" multiple required>
													<c:forEach items="${ChercheursSansEq}" var="cherSansEq">
													<option value="${cherSansEq.getId_chercheur()}">${cherSansEq.getNom()} ${cherSansEq.getPrenom()} </option>
													</c:forEach>
												</select>
											</div>
										</div>
										
										
										<div class="ln_solid"></div>
										<div class="item form-group">
											<div class="col-md-6 col-sm-6 offset-md-3">
												<button class="btn btn-primary" type="reset">R�initialiser</button>
												<button type="submit" class="btn btn-success">Ajouter</button>
											</div>
										</div>
									</form>
								</div>
							</div>
								<div class="x_panel">
									<div class="x_title">
										<h2>Gestion</h2>
										<ul class="nav navbar-right panel_toolbox">
											<li><a class="collapse-link"><i
													class="fa fa-chevron-up"></i></a></li>
										</ul>
										<div class="clearfix"></div>
									</div>
									<div class="x_content">
										<!-- start project list -->
										<table class="table table-striped projects">
											<thead>
												<tr>
													<th style="width: 15% scope="row">Num</th>
													<th style="width: 20%">Nom d'equipe</th>
													<th style="width: 30%">chef d'equipe</th>
													<th>Supprimer</th>
													
												</tr>
											</thead>
											<tbody>
												
												<c:forEach items="${equipes}" var="equ">
												<c:set var="count" value="${count + 1}" scope="page"/>
													<tr>
														<td>${count}</td>
														<td>${equ.getNom_equipe()}</td>
														<td>${chercheurdao.getChercheur(equ.getChef_equipe()).getNom()} ${chercheurdao.getChercheur(equ.getChef_equipe()).getPrenom()}</td>
														<td><a href="SupEqFromLabo?ideq=${equ.getId_equipe()}" class="btn btn-danger btn-xs"><i
																class="fa fa-trash-o"></i></a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<!-- end project list -->
										
									
									</div>
								</div>
							</div>
						</div>


				
				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<div class="pull-right">
					Gentelella - Bootstrap Admin Template by <a
						href="https://colorlib.com">Colorlib</a>
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- FastClick -->
	<script src="vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="vendors/nprogress/nprogress.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="build/js/custom.min.js"></script>
</body>
</html>