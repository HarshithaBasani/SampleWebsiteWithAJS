var index = 1;
var scroling = true, pagecount = 0, isloadmore = false;
$(document).ready(function () {
    getTodaysTopEvents();
    GetEvents(1)

});
$(".fa-angle-double-up").click(function () {
    $('html, body').animate({
        scrollTop: $('.header-text').position().top
    }, 'slow');

});
$('#eventsList').delegate('.loadmore', 'click', function () {
    $(this).remove();
    GetEvents(index);
    isloadmore = true
})

$("#hotEvents").delegate('#hotEventsBookNow', 'click', function () {
    var url = $(this).attr("url");
    window.location.href = "/" + url;
})
function GetEvents(pageIndex) {
    $.ajax({
        url: "Handlers/Events.ashx",
        type: "post",
        dataType: "Json",
        data: { type: 1, index: pageIndex },
        success: function (result) {
            if (result.Success == "True") {
                var eventsHtml = "", eventDescription = "", location = "", title = "";
                if (result.Events.length > 0) {
                    for (var i = 0; i < result.Events.length; i++) {
                        var premiumId = result.Events[i].Rno;
                        if (!(premiumId == 4 && pageIndex == 1)) {
                            eventsHtml += "<div class='col-lg-4 col-md-6 col-sm-6 col-xs-12'><div class='blog-item'><div class='image'>";
                            if (result.Events[i].Poster != "") {
                                eventsHtml += "<a href='" + result.Events[i].EventUrl + "'><img src='" + result.Events[i].Poster + "' alt='Blog image' class='img-responsive'></a></div>";
                            }
                            else {
                                eventsHtml += "<a href='" + result.Events[i].EventUrl + "'><img src='img/home_blog_04.jpg' alt='Blog image' class='img-responsive'></a></div>";
                            }
                            if (result.Events[i].Description.length > 35) {
                                eventDescription = result.Events[i].Description.substr(0, 35) + '...';
                            }
                            else {
                                eventDescription = result.Events[i].Description;
                            }
                            if (result.Events[i].Location.length > 15) {
                                location = result.Events[i].Location.substr(0, 15) + '...';
                            } else {
                                location = result.Events[i].Location;
                            }
                            if (result.Events[i].Titile.length > 18) {
                                title = result.Events[i].Titile.substr(0, 18) + '...';
                            } else {
                                title = result.Events[i].Titile;
                            }
                            eventsHtml += "<div class='blog-content'><div><ul class='post-meta'>";
                            eventsHtml += "<li><a href='javascript:void(0)' style='cursor:default'><span>" + result.Events[i].StartDate.substr(0, 2) + "</span>" + result.Events[i].StartDate.substr(2, result.Events[i].StartDate.length - 2) + "</a></li>";
                            eventsHtml += "<li><span><i class='fa fa-map-marker' aria-hidden='true'></i></span><a href='" + result.Events[i].EventUrl + "'> " + location + " </a></li></ul>";
                            eventsHtml += "<div class='content'> <h4><a href='" + result.Events[i].EventUrl + "'>" + title + "</a></h4>";
                            eventsHtml += "<p>" + eventDescription + "</p>";
                            eventsHtml += "<a href='" + result.Events[i].EventUrl + "' class='default-button' id='event_" + result.Events[i].Id + "'><i class='fa fa-ticket' aria-hidden='true'></i> Book Now</a></div>";
                            eventsHtml += "<ul class='post-meta post-meta-01'>";
                            eventsHtml += "<li><span><i class='fa fa-clock-o' aria-hidden='true'></i></span><a href='#'> " + result.Events[i].StartTime + " </a></li>";
                            eventsHtml += "<li><span></li>";
                            eventsHtml += "<li><span></li>";
                            eventsHtml += "</ul>";
                            eventsHtml += "</div></div></div></div>";
                            if (i == 1) {
                                var hotEvents = "", imgPath = "";
                                if (result.Events[1].Poster != "") {
                                    imgPath = result.Events[1].Poster;
                                    hotEvents += "<div class='intro-table intro-table-hover'  style='background-image: url(" + result.Events[1].Poster + ") !important; '>";
                                } else {
                                    imgPath = "img/home_blog_04.jpg";
                                    hotEvents += "<div class='intro-table intro-table-hover'  style='background-image: url(" + imgPath + ") !important;'>";
                                }

                                hotEvents += '	<h5 class="white heading hide-hover">Hot Event</h5>';
                                hotEvents += '	<div class="bottom">';
                                hotEvents += '		<h4 class="white heading small-heading no-margin regular" id="hotEventsBookNow" url="' + result.Events[1].EventUrl + '">Book your tickets now</h4>';
                                hotEvents += '	<a href="' + result.Events[1].EventUrl + '" class="btn btn-white-fill expand">Book Now</a></div></div>';
                            }
                        }
                        else {
                            if (result.Events[i].Titile.length > 18) {
                                title = result.Events[i].Titile.substr(0, 18) + '...';
                            } else {
                                title = result.Events[i].Titile;
                            }
                            var startDay = new Array();
                            startDay = result.Events[i].StartDate.split(" ");
                            var endDate = new Date(result.Events[i].EndTime);
                            var premiumDates = "";
                            if (endDate.getDate() - startDay[0] > 0)
                            { premiumDates = AppendZeroPrefix(startDay[0]) + " - " + AppendZeroPrefix(endDate.getDate()) + " " + getMonthName(endDate.getMonth()); }
                            else {
                                premiumDates = startDay[0] + " " + startDay[1];
                            }
                            $("#premiumTitle").text(title);
                            $("#premiumVenue").text(result.Events[i].EventUrl);
                            $("#premiumLocation").text(result.Events[i].Location);
                            $("#premiumDates").text(premiumDates);
                            $("#intro").css("background-image", 'url(' + result.Events[i].Poster + ')');

                        }
                    }



                    $("#hotEvents").html(hotEvents);

                    pagecount = Math.ceil((result.TotalCount / 3))
                    index = index + 1;
                    scroling = true;
                    if (pageIndex == 1) {
                        if (result.TotalCount > 3) {
                            eventsHtml += " <div class='col-md-12 col-sm-12 col-xs-12'><button class='btn btn-1 loadmore'>loadmore</button></div>";

                        }
                        $("#eventsList").html(eventsHtml);
                    } else {
                        $("#eventsList").append(eventsHtml);
                    }
                }
                else {
                    if (pageIndex == 0) {
                        $("#eventsList").html("<center style='font-size:15px;'>No Events are available</center>");
                    }

                }
            }
            else {
                ErrorNotifier(result.Message);
            }
        },
        error: function (error) {
            console.log(error)
        }
    });

}

function getTodaysTopEvents() {
    $.ajax({
        url: "Handlers/Events.ashx",
        type: "post",
        dataType: "Json",
        data: { type: 2 },
        success: function (result) {
            var topEventsHtml = "", hotEventsHtml = "", topClientsHtml = "", title = "";
            if (result.Success == "True") {
                if (result.TopEvents.length > 0) {
                    // topEventsHtml += "<div class='col-md-4'><div class='intro-table intro-table-first'><h5 class='white heading'>Today's Top Events</h5>";
                    // topEventsHtml += "<div class='owl-carousel owl-schedule bottom'><div class='item'>";
                    for (var i = 0; i < result.TopEvents.length; i++) {
                        if (result.TopEvents[i].Titile.length > 20)
                        { title = result.TopEvents[i].Titile.substring(0, 17) + '...'; }
                        else { title = result.TopEvents[i].Titile; }
                        topEventsHtml += "<div class='schedule-row row'><a href='" + result.TopEvents[i].EventUrl + "'><div class='col-xs-6'><h5 class='regular white' title='" + result.TopEvents[i].Titile + "'>" + title + "</h5></div>";
                        topEventsHtml += "<div class='col-xs-6 text-right'><h5 class='white' style='font-size: 15px;'>" + result.TopEvents[i].StartTime + " - " + result.TopEvents[i].EndTime + " </h5></div></a></div>"
                    }
                    topEventsHtml += "</div></div></div></div>";
                }
                else {
                    topEventsHtml += "No Top Events";
                }
                console.log(result.TopEvents[0].Poster);
                //  $("#hotEvents").css("background", "url(/http://localhost:12633/" + result.TopEvents[0].Poster + ")");
                $("#todaysTopEvents").html(topEventsHtml + hotEventsHtml);
            }
            else {
                ErrorNotifier(result.Message);
            }
        },
        error: function (result) {
            console.log("DataBase error");
        }
    });
}

function getMonthName(index) {
    var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
    return monthNames[index];
}

function AppendZeroPrefix(date) {
    if (date < 10 && $(date).length == 1) {
        return '0' + date
    }
    else {
        return date;
    }

}