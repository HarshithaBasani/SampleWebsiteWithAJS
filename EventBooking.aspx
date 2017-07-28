<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventBooking.aspx.cs" Inherits="SampleETWithAJS.EventBooking" %>

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
    <style>
        .btn-success {
            color: #fff;
            background-color: #5cb85c;
            border-color: #4cae4c;
        }

        .btn-sm {
            padding: 5px 7px !important;
            font-size: 13px;
        }
    </style>
</head>
<body>
    <input type="hidden" id="hdnCurrency" value="" />
    <section class="detail-wrapper">
        <div class="container" ng-controller="eventBooking">
            <div class="row padd-90" style="margin-top:15px;">
                <div class="col-xs-12 col-md-8">
                    <div class="col-xs-12">
                        <div class="if-seats" id="chooseSeats">
                            <a href="#">Click here to choose your seats</a>
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="if-class">
                            <div class="col-lg-5 col-md-5 col-sm-9  col-xs-7 seat-class" id="tickets">
                                <div class="col-md-12" style="font-size: 14px; line-height: 18px; padding: 0px; margin-bottom: 30px; font-weight: 700;" >Select your class</div>
                                 <p style="color: #00cd72" ng-repeat="TicketDetails1 in EventTickets">{{TicketDetails1.TicketCategory}} <span>({{TicketDetails1.Currency}}  </span>{{TicketDetails1.Price }}) </p>
                            </div>

                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-5 seat-class">
                                <div class="col-md-12 hidden-xs" style="font-size: 14px; line-height: 18px; margin-bottom: 30px; font-weight: 700;">No of seats</div>
                                <div class="col-md-12 hidden-md hidden-lg hidden-sm" style="font-size: 14px; line-height: 18px; margin-bottom: 30px; font-weight: 700;">seats</div>
                                <div class="col-md-12" id="selectDropDown" ng-repeat="TicketDetails in EventTickets">
                               <div class="col-md-12">
                                        <div class="select-dropdown">
                                            <select class='noOfTicketsDDl'  id="{{TicketDetails.TicketId}}" 
                                               ticket="{{TicketDetails.TicketCategory}}" price="{{TicketDetails.Price }}" 
                                               currency="{{TicketDetails.Currency}}" name="dropChange"  
                                                serviceCharge="{{TicketDetails.ServiceCharge}}" 
                                                 ng-change="DropDownChnaged(TicketDetails.TicketId, TicketDetails.Price, TicketDetails.Currency, TicketDetails.ServiceCharge,TicketDetails.TicketCategory, dropValue)" ng-model="dropValue">
                                             <option value="0">---Please select---</option>
                                           <option value='02'>02</option><option value='04'>04</option>"
                                            <option value='06'>06</option><option value='08'>08</option><option value='10'>10</option><option value='12'>12</option>
                                           </select>
                                        </div>
                                    </div>
                                   
                                    </div>
                            </div>


                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 to-amount" >
                                <div class="col-md-12" style="font-size: 14px; line-height: 18px; padding: 0px; margin-bottom: 20px; font-weight: 700;">Total Amount</div>
                                <p id="ticketsAmount" style="font-size:30px;" >{{bindSelectedValue}}</p>
                                
                            </div>
                          

                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="user-info">
                            <form class="simple-from" name="myForm">
                                <div class="simple-group">
                                    <!--<h3 class="small-title">User Information</h3>-->
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-block type-2 clearfix">
                                                <div class="form-label color-dark-2">Your Name</div>
                                                <div class="input-style-1 b-50 brd-0 type-2 color-3">
                                                    <input type="text" placeholder="Enter your name" id="userName" value="<%= Session["Name"] %>" ng-model="name" ng-minlength="3"/>
                                                   <span class="text-danger" ng-show="myForm.name.$error.minlength">Username is too short</span>
                                                    <span class="text-danger" ng-show="myForm.name.$error.required">Please enter name</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-block type-2 clearfix">
                                                <div class="form-label color-dark-2">E-mail Address</div>
                                                <div class="input-style-1 b-50 brd-0 type-2 color-3">
                                                    <input type="text" placeholder="Enter your e-mail adress" id="userEmail" value="<%=Session["Email"] %>" ng-model="email"/>
                                                    <span class="text-danger" ng-show="myForm.email.$invalid && !myForm.email.$pristine">Please enter email</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-block type-2 clearfix">
                                                <div class="form-label color-dark-2">Country Code</div>
                                                <div class="input-style-1 b-50 brd-0 type-2 color-3">
													<input type="text" onkeypress="return isNumber(event);" placeholder="973" id="userMobCode" maxlength="3" name="txtMobCode" style="width:23% ! important;float:left ! important" value="<%=Session["Prefix"] %>" ng-model="prefix">
												  
												        <span class="text-danger" ng-show="myForm.prefix.$touched && myForm.prefix.$invalid">Please enter prefix</span>
													
                                                </div>
                                            </div>
                                        </div>
										<div class="col-xs-12 col-sm-6">
                                            <div class="form-block type-2 clearfix">
                                                <div class="form-label color-dark-2">Phone Number</div>
                                                <div class="input-style-1 b-50 brd-0 type-2 color-3">
													
												    <input type="text" placeholder="Enter your phone number" ng-model="mobile" maxlength="10" id="userMobile" onkeypress="return isNumber(event);" style="float:right ! important" value="<%= Session["Mobile"] %>"/>
												       <span class="text-danger" ng-show="myForm.mobile.$touched && myForm.mobile.$invalid">Please enter name</span>
													
                                                </div>
                                            </div>
                                        </div>


                                        <div class="col-xs-12">
                                            <div class="confirm-terms">
                                                <div class="input-entry color-3">
                                                    <input class="checkbox-form" id="text-1" type="checkbox" name="checkbox" value="climat control" />
                                                    <label class="clearfix" for="text-1">
                                                        <span class="sp-check"><i class="fa fa-check" id="checkbox"></i></span>
                                                        <span class="checkbox-text">I want to receive promotional offers in the future</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>

                    <div class="col-xs-12 hidden-xs">
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
                <div class="col-xs-12 col-md-4">
                    <div class="col-xs-12">
                        <div class="right-sidebar">
                            <div class="popular-tours bg-grey-2">
                                <h4 class="color-dark-2">Ticket Detials</h4>
                                <p>Event Name :  <span id="eventName" >{{event_name}}</span></p>
                                <p>No of tickets : <span id="totalTicketQuantity" >{{totalTicketQuan}}</span></p>
                                <p>Event Date : <span id="eventDate"></span><span id="eventTime" >{{event_time}}</span></p>

                                <p>Location of the event : <span id="eventVenue" >{{event_venue}}</span></p>
                                <p>Ticket Amount : <span id="ticketAmount" >{{ticket_amount}}</span></p>
                                <p>Service Charge  : <span id="serviceChargeDisplay" >{{service_charge}}</span></p>
                                <p>Amount Payable: <span id="totalAmount" >{{tot_amt}}</span></p>
                              
                                <div id="couponText" style="display: none; border-radius: 50px; height: 40px; float: left; margin: 0px; width: 100%; padding: 15px 15px; font-size: 15px; background-color: rgb(3, 197, 163); color: white">
                                    Coupon Reedemed<span id="couponReedemed"></span>
                                    <p style="margin-top: -38px; text-align: right; cursor: pointer" id="couponCancel">x</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12">
                        <div class="right-sidebar">
                            <div class="popular-tours bg-grey-2">
                              <!-- coupon code--->

                                <p>
                                    <button class="btn btn-1 btn-top-fill1" type="button" id="payNowBtn" ng-click="payNow(name, email, prefix, mobile)">Pay now</button>
                                </p>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>


        <img class="footer-pattern img-responsive" src="img/footer-pattern-01.png" alt="">
    </section>

    <input type="hidden" id="ticketsStr" value="" ng-model="ticketsStr" />
    <input type="hidden" id="eventId" value="<%= eventId %>" ng-model="eventId" />
    <input type="hidden" id="coupons" value="" />
    <input type="hidden" id="bookingDate" value="<%= bookingDate %>" ng-model="bookingDate" />
    <input type="hidden" id="serviceCharge" value="" ng-model="serviceCharge" />
    <input type="hidden" id="totalPayableAmount" value="" ng-model="totalPayableAmount" />
    <input type="hidden" id="quantity" value="" />
    <input type="hidden" id="userId" value="<%= Session["UserId"] %>" ng-model="userId" />
    <input type="hidden" id="remainingamount" value="0" ng-model="remainingamount" />
    <input type="hidden" value="<%=isMobileBrowser %>" id="isMobileBrowser" />


    <div id="ageconfirm" class="modal fade" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="color: white; background-color: rgb(206, 0, 10); text-align: center; height: 40px;">
                    <h4 class="modal-title" style="line-height: 10px; font-weight: 600; color: #fff;">Note</h4>
                </div>
                <div class="modal-body" style="padding: 5px 15px;">
                    <p style="font-size: 14px; margin-bottom: 0px;">
                        <span id="age_restrict"></span>
                        <br>
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-success btn-sm" id="delete">Accept</button>
                </div>
            </div>
        </div>
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-animate.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-1.3.2.js"></script>
    <script type="text/javascript">
        var id = "", localName = "", localEmail = "", localPrefix = "",
            localTicketsStr = "", localMobile = "", localTotalAmount = 0,
            localServiceCharge = 0, paymentGatewayId = 0, source = 0,
            couponCodes = "", userId = 0, localBookingDate = "", isMobileBrowser = 0;
        var optionSelected = "", localEventId = 0;
        localEventId = "<%= eventId %>";
        var bDate = "<%= bookingDate %>";
        var angularApp = angular.module("myApp", []);
        angularApp.controller("eventBooking", function ($scope, $http) {

            localBookingDate = new Date(bDate);
            localBookingDate = localBookingDate.getDate() + "-" + localBookingDate.getMonth() + "-" + localBookingDate.getFullYear();
            $scope.bookingDate = localBookingDate;

            $http({
                url: "/HandlersWeb/Events.ashx?type=3&eventId=" + localEventId + "",
                dataType: 'json',
                method: 'POST',
                headers: {
                    "Content-Type": "application/json"
                }
            }).success(function (response) {
                $scope.EventTickets = response.EventTicketDetails;
                $scope.event_name = response.EventInfo[0].Title; //totalTicketQuan
                $scope.event_time = response.EventInfo[0].StartDate + " " + response.EventInfo[0].StartTime;
                $scope.event_venue = response.EventInfo[0].Venue;

            })
            .error(function (res) {
                alert("Error in database");
            });

            $scope.DropDownChnaged = function (id, price, currency, serviceCharge, ticketCategory, optionSelected) {
                console.log(id);
                $scope.bindSelectedValue = currency + " " + parseFloat(parseFloat(price) + parseFloat(serviceCharge)) * optionSelected;
                $scope.totalTicketQuan = optionSelected;
                $scope.ticket_amount = currency + " " + price;
                $scope.service_charge = serviceCharge;
                $scope.tot_amt = currency + " " + parseFloat(parseFloat(price) + parseFloat(serviceCharge)) * optionSelected;

                /*----Storing values in hidden fields-----*/
                $scope.serviceCharge = serviceCharge;
                $scope.ticketsStr = id + "-" + optionSelected;
                $scope.totalPayableAmount = parseFloat(price) * optionSelected;
            };

            $scope.payNow = function (uname, uemail, uprefix, umobile) {
                $http({
                    url: "/HandlersWeb/EventPayment.ashx",
                    method: "POST",
                    dataType: "json",
                    params: {
                        type: 1, coupons: "", totalAmount: $scope.totalPayableAmount, buyerEmail: uemail, buyerName: uname, buyerMobile: umobile,
                        tickets: $scope.ticketsStr, eventId: localEventId, paymentGatewayId: paymentGatewayId, buyerId: userId,
                        serviceCharge: $scope.serviceCharge, source: source, mobileCode: uprefix, bookingDate: localBookingDate, transactionId: 0
                    },
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).success(function (response) {
                    if (response.Success == "True") {
                        var frmcon = "";
                        var bookingid = response.Events[0].BookingId;
                        currency = "";
                        currency = $("#hdnCurrency").val();
                        frmcon = "<form id='dynform' method='post' action='" + string_url + "' ng-submit='submit()'>";
                        frmcon = frmcon + "<input type='hidden' name='orderid'  value='" + bookingid + "'/>";
                        frmcon = frmcon + "<input type='hidden' name='currency'  value='" + currency + "'/>";
                        frmcon = frmcon + "</form>";
                        $("body").html(frmcon);
                        $('#dynform').submit();
                    }
                })
            .error(function (res) {
                alert("Error in database");
            });
            }

            function getMonthName(index) {
                var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
                return monthNames[index];
            }

        });
    </script>
</body>

</html>
