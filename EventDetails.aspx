<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="SampleETWithAJS.EventDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" ng-app="myApp">
<head runat="server">
    <title></title>
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
        #map { width: 450px;height: 350px; margin-top: 5px;}

        .overlay {
            display: block;
            text-align: center;
            color: #fff;
            font-size: 13px;
            line-height: 30px;opacity: 0.8; background: #FF0000; border: solid 3px #FE2E2E; border-radius: 4px;box-shadow: 2px 2px 10px #333; text-shadow: 1px 1px 1px #666;padding: 0 2px;}

        .overlay_arrow.above {
            border-left: 16px solid transparent;
            border-right: 16px solid transparent;
            border-top: 16px solid #FE2E2E;
            bottom: -15px;
        }

        .overlay_arrow {
            height: 0;
            left: 50%;
            margin-left: -16px;
            position: absolute;
            width: 0;
        }

        .navbar {
            background: rgb(0, 0, 0);
            top: 0;
        }

        .cursor {
            cursor: pointer;
        }

        .header-intro {
            padding: 50px 0px 30px;
        }

        .btn-success {
            color: #fff;
            background-color: #5cb85c;
            border-color: #4cae4c;
        }

        .btn-error {
            color: #fff;
            background-color: #bf2c50;
            border-color: #4cae4c;
        }
    </style>
</head>
<body>
   <%--<div class="preloader">
        <img src="/img/loader.gif" alt="Preloader image" />
    </div>--%>

    <section class="header-intro">
        <div class="container" ng-controller="headerController">
            <div class="row">
                <div class="col-md-12 arrow">
                    <a href="/">
                        <img src="/Img/arrow.png">
                    </a>
                </div>
                <div class="col-md-12 dwon-intro">
                    <div class="col-md-2 col-sm-2 col-xs-12 dates">
                        <p><span class="mm"><%= month %></span> <span class="dd"><%= date %></span> <span class="yy"><%= year %></span></p>
                    </div>

                    <div class="col-md-7 col-sm-10 col-xs-12 details-intro">
                        <h3><%= title %></h3>
                        <p><span class="event-time"><i class="fa fa-clock-o" aria-hidden="true"></i></span><span class="event-time"><i class="fa fa-map-marker" aria-hidden="true"></i><%= venue %></span></p>
                        <div class="col-md-12" style="padding: 0px;">
                            <p>
                                <label><%= category %></label>

                            </p>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-12 col-xs-12 booking-tab">
                        <div class="col-md-12 booking-tab-info">
                            <h4 id="minPrice">BD 3.4 Onwards <span class="available-book"></span></h4>
                            <p id="bookingStop">Bookings stop Apr. 16PM. 18:00</p>
                        </div>
                        <div class="col-md-12 booking-tab-btn">
                            <button class="btn btn-1 btn-top-fill1" ng-click="GetUrTickets();">Get Your Tickets</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <!--detailed intro-->
    <section class="detialed-cont-wrapp">
        <div class="container" ng-controller="bodyController">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-8 col-sm-12">
                        <div class=" left-side">
                            <div class="col-md-12">
                                <div class="event-desc-01">
                                    <h4>Event Description</h4>
                                    <p id="showMore" style="display: none"><%= description %></p>
                                    <p id="eventDescription" ng-show="myvalue">
                                        <%if (description.Length > 500)
                                          { %>
                                        <%= description.Substring(0,509) %>

                                        <%} %>
                                        <%else
                                          { %>
                                        <%= description %>
                                        <%} %>
                                    </p>
                                    <a ng-click="readMore()">Readmore</a>
                                </div>

                                <div class="col-xs-12" style="padding: 0px;">
                                    <div class="terms_cond">
                                        <h4 class="color-dark-2">Terms & Conditions</h4>
                                        <ul>
                                            <li>Each ticket admits one person only.</li>
                                            <li>Wristbands removed or tampered with will be rendered invalid and WILL NOT be replaced.</li>
                                            <li>No re-entry is permitted for the entire period of the event. Wrist bands will be cut by the security team in case a customer wishes to exit the venue during the period of the event.</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--left section ends-->


                    <!--right section starts-->
                    <div class="col-md-4 col-sm-12">
                        <div class="right-side">
                            <div class="col-md-12">
                                <div class="event-dates">
                                    <h4>Event Dates</h4>
                                    <p><span class="filled cursor active" ng-show="filled"></span><span class="fast-filling cursor" ng-show="fastFilling"></span><span class="for-available cursor" ng-show="forAvailable"></span></p>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="Organizer-details">
                                    <h4>Event Organizers</h4>

                                    <p style="padding-top: 10px;">Name : <span><%= organizerName %></span></p>
                                    <p>Mobile : <span><%= organizerMobile %></span></p>
                                    <p>
                                        Email : <span title="<%= OrganizerMail %>"><%if (OrganizerMail.Length > 25)
                                                                                     { %>
                                            <%= OrganizerMail.Substring(0,25) %>..

                                        <%} %>
                                            <%else
                                                                                     { %>
                                            <%= OrganizerMail %>
                                            <%} %></span>
                                    </p>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="maps">
                                    <div style="overflow: hidden; min-height: 200px; max-width: 340px;">
                                        <div id="map" style="min-height: 200px; max-width: 310px;"></div>

                                    </div>

                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="seatss">
                                    <img src="/img/seatss.jpg" class="img-responsive" />
                                </div>
                            </div>
                        </div>
                        <!--right section ends-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="password" class="modal fade" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" style="display: none; padding-right: 19px; background: rgb(51, 44, 44) none repeat scroll 0% 0%;">
        <div class="modal-dialog" style="margin-top: 87px;">
            <div class="modal-content">
                <div class="modal-header" style="color: white; background-color: rgb(206, 0, 10); text-align: center; height: 50px;">
                    <h4 class="modal-title" style="line-height: 10px; font-weight: 600; color: #fff; padding: 5px 0px; font-size: 20px;">Password Protected</h4>
                </div>
                <div class="modal-body" style="padding: 25px 15px;">
                    <p style="font-size: 18px; margin-bottom: 0px;">
                        <span style="padding-right: 20px;">Enter Event Password</span><input id="txtPassword" style="border: 1px solid #bfbfbf; height: 45px; width: 240px;" type="password">
                        <br>
                    </p>
                </div>
                <div class="modal-footer">
                    <span id="errorMsg" class="text-danger" style="ruby-align: left"></span>
                    <button type="button" class="btn btn-success btn-sm" id="btnOk" style="height: 40px; line-height: 10px;">Ok</button>
                    <button type="button" class="btn btn-error btn-sm" id="btnCancel" style="height: 40px; line-height: 10px; border: 1px solid #bf2c50;">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <form action="/EventBooking.aspx" id="bookform" method="post">
        <input type="hidden" id="event_id" value="<%= eventId %>" name="eventid" />

        <input type="hidden" id="booking_date" name="bookingDate" />
    </form>
     <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-animate.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-1.3.2.js"></script>
    
    <script type="text/javascript">
        var sDate = "";
        var isRecurring = <%= isRecurring%>;


        var angularApp = angular.module("myApp", []);  //-----------main initalising angular application

        angularApp.controller("bodyController", function ($scope) { 
            $scope.myvalue = false;
            $scope.readMore = function () {
                $scope.myvalue = true;
                
            }
        });

        angularApp.controller("headerController", function ($scope) {
            //debugger;
            //var sett = document.getElementsByClassName("filled active")[0];
            
            $scope.GetUrTickets = function () {
                var b = document.querySelectorAll("span.active")[0].getAttribute("date");
                document.getElementById("booking_date").value = b;
                document.getElementById('bookform').submit();
            }
            $scope.fastFilling = true;
            $scope.forAvailable = true;
            $scope.filled = true;
            var eventTime = formatAMPM('<%= startTime %>');
            var text1 = document.getElementsByClassName('fa-clock-o')[0];
            text1.innerHTML = " "+eventTime;
            getLatestThreeDates('<%= startTime%>', '<%= closingDate%>', '<%= time%>', '<%= recurringType%>', $scope);

            function getLatestThreeDates(date1, date2, time, recurringType, $scope) {
             
                var firstDate = new Date(date1);
                var lastDate = new Date(date2 + ' ' + time);
                var recurr = 0;
                if(isRecurring)
                {
                        if (recurringType == 1) {
                        var daysDiff = (lastDate - firstDate) / (1000 * 60 * 60 * 24);
                        daysDiff = Math.round(daysDiff);
                        for (var i = 0; i <= daysDiff; i++) {
                            firstDate = new Date(date1);

                            if (new Date(firstDate.setDate(firstDate.getDate() + i)) > new Date()) {
                                if (recurr == 0) {
                                    var setclass = document.getElementsByClassName('filled')[0];
                                    $scope.filled=true;
                                    var dateText = getMonthName(firstDate.getMonth()) + " " + firstDate.getDate();
                                    setclass.innerHtml = dateText;
                                    setclass.setAttribute("date",firstDate);
                                    recurr++;
                                    firstDate.setDate(firstDate.getDate() + 1);
                                }
                                if (recurr == 1 && new Date(firstDate) <= lastDate) {
                                    $scope.fastFilling = true;
                                    var setclass = document.getElementsByClassName('fast-filling')[0];
                                   setClass.innerHtml=getMonthName(firstDate.getMonth()) + " " + firstDate.getDate();
                                   setClass.setAttribute("date",firstDate);
                                    recurr++;
                                    firstDate.setDate(firstDate.getDate() + 1);
                                }
                                else {
                                    $scope.fastFilling = false;
                                    $scope.forAvailable = false;
                                    $scope.filled = true;
                                }
                                if (recurr == 2 && new Date(firstDate) <= lastDate) {
                                    $scope.forAvailable = true;
                                    var setclass = document.getElementsByClassName('for-available')[0];
                                    setClass = getMonthName(firstDate.getMonth()) + " " + firstDate.getDate();
                                    setClass.setAttribute("date",firstDate);
                                }
                                else {
                                    $scope.forAvailable = false;
                                    $scope.filled = true;
                                    $scope.fastFilling = true;
                                }
                                return;

                            }

                        }

                    }
                    else if (recurringType == 2) {

                    }
                    else if (recurringType == 3) {

                    }
                }
                else{
                    $scope.filled = true;
                    var setclass = document.getElementsByClassName('filled')[0];
                    setclass.setAttribute("date", firstDate);
                    var dateText = getMonthName(firstDate.getMonth()) + " " + firstDate.getDate();
                    setclass.textContent = dateText;
                    document.getElementsByClassName('filled')[0].classList.remove("ng-hide");
                   // removeClass(setclass, 'ng-hide')
                        $scope.fastFilling = false;
                        $scope.forAvailable = false;
                      
               }

            }

            function formatAMPM(date) {
                date = new Date(date);
                var hours = date.getHours();
                var minutes = date.getMinutes();
                var ampm = hours >= 12 ? 'PM' : 'AM';
                hours = hours % 12;
                hours = hours ? hours : 12; // the hour '0' should be '12'
                minutes = minutes < 10 ? '0' + minutes : minutes;
                var strTime = hours + ':' + minutes + ' ' + ampm;
                return strTime;
            }

            function getMonthName(index)
            {
                var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
                return monthNames[index];
            }
        });
       
    </script>
</body>
</html>
