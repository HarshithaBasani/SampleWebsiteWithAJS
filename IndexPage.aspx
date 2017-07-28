<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexPage.aspx.cs" Inherits="SampleETWithAJS.IndexPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html ng-app="myApp">

<head>
    <link rel="apple-touch-icon" sizes="57x57" href="img/favicons/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="img/favicons/apple-touch-icon-60x60.png">
    <link rel="icon" type="image/png" href="img/favicons/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="img/favicons/favicon-16x16.png" sizes="16x16">
    <link rel="manifest" href="img/favicons/manifest.json">
    <link rel="shortcut icon" href="img/favicons/favicon.ico">
    <meta name="msapplication-TileColor" content="#00a8ff">
    <meta name="msapplication-config" content="img/favicons/browserconfig.xml">
    <meta name="theme-color" content="#ffffff">
    <!-- Normalize -->
    <link rel="stylesheet" type="text/css" href="css/normalize.css">
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <!-- Owl -->
    <link rel="stylesheet" type="text/css" href="css/owl.css">
    <!-- Animate.css -->
    <link rel="stylesheet" type="text/css" href="css/animate.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.1.0/css/font-awesome.min.css">
    <!-- Elegant Icons -->
    <link rel="stylesheet" type="text/css" href="fonts/eleganticons/et-icons.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />
    <style type="text/css">
        table, th, td {
            border: 1px solid grey;
            border-collapse: collapse;
            padding: 5px;
        }

            table tr:nth-child(odd) {
                background-color: #f2f2f2;
            }

            table tr:nth-child(even) {
                background-color: #ffffff;
            }
    </style>
</head>

<body>

    <nav class="navbar">
        <div class="container" ng-controller="headerSection">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/index.aspx">
                    <img src="img/eventtab-logo.png" data-active-url="img/eventtab-logo.png" alt=""></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right main-nav">
                    <li><a href="#intro">Intro</a></li>
                    <li><a href="#services">Popular Events</a></li>
                    <%--<li><a href="#ContactUs">Contact Us</a></li>--%>
                    <li><a href="#ts-sponsors">Partners</a></li>
                    <% if (String.IsNullOrEmpty(Convert.ToString(Session["UserId"])) == true)
                       {%>
                    <li class="login-forms">
                        <button class="btn btn-block" ng-click="open()">Signin</button>
                        <%--<a href="#" id="login" ng-click="open()">Signin</a>--%>
                        </li>
                    <% }
                       else
                       { %>
                    <li class="dropdown ">
                        <a href="#" id="myprofile" class="dropdown-toggle" data-toggle="dropdown">
                            <%--<img class="menu_icons" src="/Images/login_icon.png" />--%>
                            <i class="fa fa-user"></i>
                            Hi <%=Session["Name"] %></a>
                        <ul class="dropdown-menu" id="MyAccount">
                           
                            <li><a href="javascript:;" id="logOut">
                                <i class="icon-key"></i>Log Out </a></li>
                        </ul>
                    </li>
                    <% } %>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
            
         <div modal="showModal" close="cancel()" style="display:none;" class="modal fade" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                            <h4>User Registration</h4>
                        </div>
                      <form name="myForm">
                        <div class="modal-body">
                          
                            <div class="row">
                           <div class="col-sm-12">
                               <input type="text" required  ng-model="registerName" value="" class="form-control" Placeholder="Please Enter your Name" />
                               <span ng-show="errorMsgName">Please enter name</span>
                           </div>
                                </div>
                             <div class="row" style="margin-top:10px;">
                           <div class="col-sm-12">
                               <input type="text" required  ng-model="registerEmail" value="" class="form-control" placeholder="Please enter your Email Id"/>
                                
                           </div>
                                 </div>
                             <div class="row" style="margin-top:10px;">
                           <div class="col-sm-12">
                                    <input type="text" numbers-only required  ng-model="registerPrefix" value="" style="width:112px;" class="form-control" placeholder="Enter prefix"/>
                                 <input type="text" numbers-only required  ng-model="registerMobile" value="" style="width:450px;margin-top: -34px;margin-left: 110px !important;" class="form-control" placeholder="Please enter mobile number"/>
                           </div>
                                 </div>
                             <div class="row" style="margin-top:10px;">
                           <div class="col-sm-12">
                                    <input type="text" required  ng-model="registerPassword" value="" class="form-control" placeholder="Please enter password"/>
                           </div>
                                 </div>
                           <div class="row" style="margin-top:10px;">
                           <div class="col-sm-12">
                                    <input type="text" required  ng-model="registerNationality" value="" class="form-control" placeholder="Please enter Nationality"/>
                           </div>
                               </div>
                        </div>
                        <div class="modal-footer">
                          <button class="btn btn-success" ng-click="myform.$valid && registerUserDetails(registerName,registerEmail,registerPrefix,registerMobile,registerPassword,registerNationality)">SignUp</button>
                          <button class="btn" ng-click="cancel()">Cancel</button>
                        </div>
                          </form>
                      </div>
                 </div>

              </div>
         <div modal="userModal" close="cancel()" style="display:none;" class="modal fade" role="dialog">
              <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                            <h4>User Registration</h4>
                        </div>
                      <form name="myForm1">
                        <div class="modal-body">
                            <div class="row">
                               <div class="col-sm-12">
                                 <input type="text" required  ng-model="userEmail" value="" class="form-control" Placeholder="Please Enter your email" />
                               </div>
                             </div>
                              <div class="row" style="margin-top:10px;">
                                <div class="col-sm-12">
                                    <input type="text" required  ng-model="userPassword" value="" class="form-control" placeholder="Please enter your password"/>
                                </div>
                             </div>
                         </div>
                         <div class="modal-footer">
                           <button class="btn btn-success" ng-click="myForm1.$valid && loginUserDetails(userEmail,userPassword)">Login</button>
                           <button class="btn" ng-click="cancel()">Cancel</button>
                         </div>
                       </form>
                      </div>
                 </div>

              </div>
 <!--sign up modal---------->
   
        </div>
        <!-- /.container-fluid -->
    </nav>
    <section id="services" class="section section-padded home-blog home-blog-two home-blog-three padding-120">
        <div class="cut cut-bottom hidden-xs hidden-sm"></div>
        <div class="container" ng-controller="popularEvents">
            <div class="row text-center title">
                <h2 class="section-heading" style="color: #FFFFFF">Popular Events</h2>
            </div>

            <div class="row" ng-repeat="rows in data">
            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
            <div class="blog-item">
              <div class="image">
                  <div ng-if="rows.Poster == ''">
                        <a href="{{row.EventUrl}}"><img ng-src="{{rows.Poster}}" alt="Blog image" class="img-responsive"></a>
                  </div>
                  <div ng-if="rows.Poster != ''">
                    <a href="{{row.EventUrl}}"><img ng-src="/img/home_blog_04.jpg" alt="Blog image" class="img-responsive"></a>
                  </div>
              </div><!-- image -->
              <div class="blog-content">
               <div>
                
                  <ul class="post-meta">
                  
                    <li><a href="#"><span>{{rows.StartDate}}</span></a></li>
                    <li><span><i class="fa fa-map-marker" aria-hidden="true"></i></span><a href="#"> {{ rows.Location | limitTo: 20 }}{{rows.Location.length > 20 ? '...' : ''}}</a></li> 
                   </ul>
           
                 <!-- post-meta -->
                  <div class="content">
                    <h4><a href="{{row.EventUrl}}">{{rows.Titile}}</a></h4>
                    <p>{{rows.Description}}</p>
                    
                    <a href="{{rows.EventUrl}}" class="default-button"><i class="fa fa-ticket" aria-hidden="true"></i> Book Now</a>
                  </div><!-- content -->
                    <ul class="post-meta post-meta-01">
                    <li><span><i class="fa fa-clock-o" aria-hidden="true"></i></span><a href="#"> {{rows.StartTime}}</a></li>
                        <li><span></span></li>
                        <li><span></span></li>
                   </ul>
                </div>
              
              </div><!-- blog-content -->
            </div><!-- blog item -->
          </div>
         </div>
       </div>
     </section>


    <div class="mobile-nav">
        <ul>
        </ul>
        <a href="#" class="close-link"><i class="fa fa-times" aria-hidden="true"></i></a>
    </div>



    <!-- Scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-animate.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-messages/1.3.14/angular-messages.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-1.3.2.js"></script>
    <script src="Scripts/Plugins/angular-ui-modal.js"></script>
    <script>
        var index = 1;
        var scroling = true, pagecount = 0, isloadmore = false, pageIndex = 1;
        //  var regName = "", regEmail = "", regMobile, regPrefix = "", regNationality = "", regPassword = "";
        var angularApp = angular.module("myApp", ["ui.bootstrap.modal", "ngMessages"]);
        angularApp.controller("popularEvents", function ($scope, $http) {
            //  $scope.IsVisible = $scope.IsVisible ? false : true;
            $http({
                url: "HandlersWeb/Events.ashx?type=1&index=1",
                dataType: 'json',
                method: 'POST',
                headers: {
                    "Content-Type": "application/json"
                }
            }).success(function (response) {
                $scope.data = response.Events;
                console.log("success");
            })
            .error(function (res) {
                alert("Error in database");
            });
        });
        angularApp.controller("headerSection", function ($scope, $http) {
            $scope.open = function () {
                $scope.showModal = true;
            };

            $scope.registerUserDetails = function (regName, regEmail, regPrefix, regMobile, regPassword, regNationality) {
                $http({
                    url: "HandlersWeb/UserLogin.ashx",
                    method: "POST",
                    dataType: "json",
                    params: {
                        type: 1, name: regName, email: regEmail, mobile: regMobile, password: regPassword, nationality: regNationality,
                        source: 1, loginType: "web", loginTypeId: "", prefix: regPrefix
                    },
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).success(function (response) {
                    $scope.showModal = false;
                    console.log("success");
                })
               .error(function (res) {
                   alert("Error in database");
               });
            };

            $scope.cancel = function (name, email, prefix, mobile, password, nationality) {
                $scope.showModal = false;
            };

            $scope.loginUserDetails = function (email, password) {
                $http({
                    url: "HandlersWeb/UserLogin.ashx",
                    method: "POST",
                    dataType: "json",
                    params: {
                        type: 2, email: regEmail, password: password
                    },
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).success(function (response) {
                    $scope.userModal = false;
                    console.log("success");
                })
               .error(function (res) {
                   alert("Error in database");
               });
            };


        });
        angularApp.directive('numbersOnly', function () {
            return {
                require: 'ngModel',
                link: function (scope, element, attr, ngModelCtrl) {
                    function fromUser(text) {
                        if (text) {
                            var transformedInput = text.replace(/[^0-9-]/g, '');
                            if (transformedInput !== text) {
                                ngModelCtrl.$setViewValue(transformedInput);
                                ngModelCtrl.$render();
                            }
                            return transformedInput;
                        }
                        return undefined;
                    }
                    ngModelCtrl.$parsers.push(fromUser);
                }
            };
        });

        //angularApp.directive('myElement', function () {
        //    return {
        //        scope: {
        //            item: '=myElement'
        //        },
        //        restrict: 'EA',
        //        template: '<td> {{ item.Titile }}</td><td> {{ item.Location }}</td><td> {{ item.Description }}</td>'
        //    };
        //})
    </script>

</body>

</html>

