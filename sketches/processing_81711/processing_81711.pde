
//today should be 0
float temperature = 0;
String weatherCondition = "";
String windDirection = "";
String windSpeed = "";
float waveHeightMorning = 0;
float waveHeightAfternoon = 0;
String sunRise = "";
String sunSet = "";
String moonRise = "";
String moonSet = "";
String tdat = "";
String gust ="";
float humidity = 0;
float cloud = 0;
float pressure =0;
String weatherImageUrl = "";

//tomorrow
float temperature2 = 0;
String weatherCondition2 = "";
String windDirection2 = "";
String windSpeed2 = "";
float waveHeightMorning2 = 0;
float waveHeightAfternoon2 = 0;
String sunRise2 = "";
String sunSet2 = "";
String moonRise2 = "";
String moonSet2 = "";
String tdat2 = "";
String gust2 ="";
float humidity2 = 0;
float cloud2 = 0;
float pressure2 =0;
String weatherImageUrl2 = "";

//the day after tomorrow
float temperature3 = 0;
String weatherCondition3 = "";
String windDirection3 = "";
String windSpeed3 = "";
float waveHeightMorning3 = 0;
float waveHeightAfternoon3 = 0;
String sunRise3 = "";
String sunSet3 = "";
String moonRise3 = "";
String moonSet3 = "";
String tdat3 = "";
String gust3 ="";
float humidity3 = 0;
float cloud3 = 0;
float pressure3 =0;
String weatherImageUrl3 = "";

boolean getDToday = true;
boolean getDTomorrow = false;
boolean getDTheDayAfterTomorrow = false;

boolean dataValues = false;
boolean dataValues2 = false;
boolean dataValues3 = false;

//weather icons
PImage lot_of_cloud_some_sun;
PImage cloudy;
PImage cold_cloudy;
PImage cold;
PImage night;
PImage Partially_cloudy;
PImage partially_sunny;
PImage rain_at_night;
PImage rain_cloud_and_sun;
PImage rain;
PImage really_cloudy;
PImage really_snowy;
PImage really_hot;
PImage snow_and_cloud;
PImage snow_and_sun;
PImage snow;
PImage sunny;
PImage thunder_rain_sun;
PImage thunder_and_rain;
PImage windy;

//wind direction icons
PImage north;
PImage south;
PImage east;
PImage west;
PImage north_northeast;
PImage north_northwest;
PImage south_southeast;
PImage south_southwest;
PImage northwest_west;
PImage northeast_east;
PImage southeast_east;
PImage southwest_west;
PImage northeast;
PImage southeast;
PImage northwest;
PImage southwest;

//moon / sunset images
PImage moonrise;
PImage moonset;
PImage sunset;
PImage sunrise;

//warnings
PImage safe_sailing;
PImage warning_sailing;

//background
PImage app_background;

//bargraph animantion
int timerh=0;
float gh = 0.5;
float ih = 0;

int timerc =0;
float gc =0;
float ic =0;

int timerp = 0;
float gp = 0;
float ip= 0;

int timerwhm =0;
float gwhm =0;
float iwhm =0;

int timerwha =0;
float gwha =0;
float iwha =0;
//tommorrow animations
int timerh2=0;
float gh2 = 0.5;
float ih2 = 0;

int timerc2 =0;
float gc2 =0;
float ic2 =0;

int timerp2 = 0;
float gp2 = 0;
float ip2= 0;

int timerwhm2 =0;
float gwhm2 =0;
float iwhm2 =0;

int timerwha2 =0;
float gwha2 =0;
float iwha2 =0;

//TDAT animations
int timerh3=0;
float gh3 = 0.5;
float ih3 = 0;

int timerc3 =0;
float gc3 =0;
float ic3 =0;

int timerp3 = 0;
float gp3 = 0;
float ip3= 0;

int timerwhm3 =0;
float gwhm3 =0;
float iwhm3 =0;

int timerwha3 =0;
float gwha3 =0;
float iwha3 =0;

void setup() {
  size(800, 450);
  smooth();
  fill(0);

  //load weather images
  lot_of_cloud_some_sun = loadImage("a lot of cloud some sun.png");
  cloudy = loadImage("cloudy.png");
  cold_cloudy = loadImage("Cold cloudy.png");
  cold = loadImage("cold.png");
  night = loadImage("night.png");
  Partially_cloudy = loadImage("Partially cloudy.png");
  partially_sunny = loadImage("partially sunny.png");
  rain_at_night = loadImage("rain at night.png");
  rain_cloud_and_sun = loadImage("rain cloudd and sun.png");
  rain = loadImage("rain.png");
  really_cloudy = loadImage("really cloudy.png");
  really_snowy = loadImage("really snowwy.png");
  really_hot = loadImage("rele hot.png");
  snow_and_cloud = loadImage("snow and cloud.png");
  snow_and_sun = loadImage("snow and sun.png");
  snow = loadImage("snow.png");
  sunny = loadImage("sunny.png");
  thunder_rain_sun = loadImage("Thumder strom rain and bit of sun.png");
  thunder_and_rain = loadImage("thunder and rain.png");
  windy = loadImage("windy.png");

  //load wind direction images
  north = loadImage("north.png");
  south = loadImage("south.png");
  east = loadImage("east.png");
  west = loadImage("west.png");
  north_northeast = loadImage("north northeast.png");
  north_northwest = loadImage("north northwest.png");
  south_southeast = loadImage("south southeast.png");
  south_southwest = loadImage("south southwest.png");
  northwest_west = loadImage("northeast east.png");
  northeast_east = loadImage("northwest west.png");
  southeast_east = loadImage("southwest west.png");
  southwest_west = loadImage("southeast east.png");
  northeast = loadImage("north east.png");
  southeast = loadImage("south east.png");
  northwest = loadImage("north west.png");
  southwest = loadImage("south west.png");

  //sun / moon images
  sunset = loadImage("sunrise.png");
  sunrise = loadImage("sunset.png");
  moonset = loadImage("moonset.png");
  moonrise = loadImage("moonrise.png");

  //warning
  safe_sailing = loadImage("safe sailing.png");
  warning_sailing = loadImage("warning sailing.png");

  //app background
  app_background = loadImage("sailing app background.png");

  image(app_background, 0, 0, 800, 450);

  //PFont fontA;
  //fontA = loadFont("AgencyFB-Reg-48.vlw");
  //textFont(fontA, 15);

  getDataToday ();
  getDataTomorrow ();
  getDataTheDayAfterTomorrow ();
}

void draw() {

  if (dataValues == true) {
    fill(255);
    rect(36, 144, 82, 22);
    fill(0);
    text("Data Values", 50, 160);
    fill(255);
    text(" " + pressure, 457, 254);
    text(" " + humidity, 537, 254);
    text(" " + cloud, 586, 254);
    text(" " + waveHeightMorning, 680, 254);
    text(" " + waveHeightAfternoon, 730, 254);
    dataValues2=false;
    dataValues3=false;
  }

  if (dataValues2 == true) {
    fill(255);
    rect(36, 144, 82, 22);
    fill(0);
    text("Data Values", 50, 160);
    fill(255);
    text(" " + pressure2, 457, 254);
    text(" " + humidity2, 537, 254);
    text(" " + cloud2, 586, 254);
    text(" " + waveHeightMorning2, 680, 254);
    text(" " + waveHeightAfternoon2, 730, 254);
    dataValues=false;
    dataValues3=false;
  }

  if (dataValues3 == true) {
    fill(255);
    rect(36, 144, 82, 22);
    fill(0);
    text("Data Values", 50, 160);
    fill(255);
    text(" " + pressure3, 457, 254);
    text(" " + humidity3, 537, 254);
    text(" " + cloud3, 586, 254);
    text(" " + waveHeightMorning3, 680, 254);
    text(" " + waveHeightAfternoon3, 730, 254);
    dataValues = false;
    dataValues2 = false;
  }  

  if (getDToday ==true) {
    drawDataToday ();
    getDTomorrow =false;
    getDTheDayAfterTomorrow =false;
  }

  if (getDTomorrow ==true) {
    drawDataTomorrow();
    getDToday =false;
    getDTheDayAfterTomorrow =false;
  }

  if (getDTheDayAfterTomorrow ==true) {
    drawDataTheDayAfterTomorrow();
    getDToday =false;
    getDTomorrow =false;
  }
}

void getDataToday() {

  String UVPSite = "";
  String [] UVPSiteArray = loadStrings("http://www.worldweatheronline.com/dundee-weather/dundee-city/gb.aspx?day=0");

  String weatherSite = "";
  String [] weatherSiteArray = loadStrings("http://www.timeanddate.com/worldclock/city.html?n=1340");

  String weatherImageSite ="";
  String [] weatherImageSiteArray = loadStrings("http://www.timeanddate.com/weather/uk/dundee");

  String tdatSite = "";
  String [] tdatSiteArray = loadStrings("http://www.worldweatheronline.com/dundee-weather/dundee-city/gb.aspx?day=0");

  String sunRiseSite = "";
  String [] sunRiseArray = loadStrings("http://www.timeanddate.com/worldclock/astronomy.html?n=1340");

  String moonRiseSite = "";
  String [] moonRiseArray = loadStrings("http://www.timeanddate.com/worldclock/astronomy.html?obj=moon&n=1340");

  String waveSite ="";
  String [] waveSiteArray = loadStrings("http://swell.willyweather.com.au/nt/darwin/dundee-beach.html");

  String weatherConditionsSite = "";
  String [] weatherConditionsSiteArray = loadStrings("http://www.timeanddate.com/weather/uk/dundee");

  String windSite ="";
  String [] windSiteArray = loadStrings("http://www.timeanddate.com/weather/uk/dundee");

  //Pressure, UV, Visibility
  for (int i = 0; i <UVPSiteArray.length; i++) {
    UVPSite += UVPSiteArray[i];
  }

  //Temperature, Wind speed / direction
  for (int i = 0; i <weatherSiteArray.length; i++) {
    weatherSite += weatherSiteArray[i];
  }

  //tdat menu
  for (int i =0; i <tdatSiteArray.length; i++) {
    tdatSite += tdatSiteArray[i];
  }

  //temperature
  for (int i = 0; i <weatherConditionsSiteArray.length; i++) {
    weatherConditionsSite += weatherConditionsSiteArray[i];
  }

  //Weather image
  for (int i=0; i<weatherImageSiteArray.length;i++) {
    weatherImageSite += weatherImageSiteArray[i];
  }

  //wind information
  for (int i = 0; i <windSiteArray.length; i++) {
    windSite += windSiteArray[i];
  }

  // Sun Information
  for (int i = 0;i <sunRiseArray.length; i++) {
    sunRiseSite += sunRiseArray[i];
  }

  //moon information
  for (int i = 0;i <moonRiseArray.length; i++) {
    moonRiseSite += moonRiseArray[i];
  }

  //Wave Height
  for (int i = 0; i <waveSiteArray.length;i++) {
    waveSite += waveSiteArray[i];
  }

  //weatherImage
  String [] bitwi = split(weatherImageSite, "</td><td class=\"tc sep\"><img class=mp src=\"");
  println(bitwi.length);

  String [] nextBitwi = split(bitwi[1], "\" width=30 height=30");
  println(trim(nextBitwi[0]));

  //gust
  String [] bitg = split(UVPSite, "><br />");
  println(bitg.length);

  String [] nextBitg = split(bitg[60], "</div><div class=\"observationCellSmall\"");
  println(trim(nextBitg[0]));

  //humidity
  String [] bith = split(UVPSite, "><br />");
  println(bith.length);

  String [] nextBith = split(bith[61], "%</div>");
  println(trim(nextBith[0]));

  //cloud
  String [] bitv = split(UVPSite, "><br />");
  println(bitv.length);

  String [] nextBitv = split(bitv[59], "%</div>");
  println(trim(nextBitv[0]));

  //Pressure
  String [] bitp = split(UVPSite, "><br />");
  println(bitp.length);

  String [] nextBitp = split(bitp[62], " mb</div></div><div class=\"observationRow\"><div class=\"observationCellSmall\"");
  println(trim(nextBitp[0]));

  //Temperature Today
  String [] bitt = split(weatherSite, "Temperature:</td><td>");
  println(bitt.length);

  String [] nextBitt = split(bitt[1], "&nbsp;");
  println(trim(nextBitt[0]));

  //tdat
  String [] bittdat = split(tdatSite, "<br />");
  println(bittdat.length);

  String [] nextBittdat = split(bittdat[12], "</div>");
  println(trim(nextBittdat[0]));

  //Weather Conditions Today
  String [] bitwc = split(weatherSite, "td><td colspan=3>");
  println(bitwc.length);

  String [] nextBitwc = split(bitwc[1], ".</td></tr>");
  println(trim(nextBitwc[0]));

  //Wind Direction Today
  String [] bitwd = split(windSite, "width=14 height=14 alt=\"Direction ");
  println(bitwd.length);

  String [] nextBitwd = split(bitwd[1], "\" title=");
  println(trim(nextBitwd[0]));

  //Wind Speed Today
  String [] bitws = split(windSite, "Wind Speed:</td><td class=\"tc sep\">");
  println(bitws.length);

  String [] nextBitws = split(bitws[1], "</td>");
  println(trim(nextBitws[0]));

  //Wave Height morning Today
  String [] bitwhm = split(waveSite, "<td class=\"height\">");
  println(bitwhm.length);

  String [] nextBitwhm = split(bitwhm[1], "m</td>");
  println(trim(nextBitwhm[0]));

  //Wave Height Afternoon Today
  String [] bitwha = split(waveSite, "<td class=\"height\">");
  println(bitwha.length);

  String [] nextBitwha = split(bitwha[2], "m</td>");
  println(trim(nextBitwha[0]));

  //Sunrise Today
  String [] bitsr = split(sunRiseSite, "<td>");
  println(bitsr.length);

  String [] nextBitsr = split(bitsr[2], "</td>");
  println(trim(nextBitsr[0]));

  //Sunset Today
  String [] bitss = split(sunRiseSite, "<td>");
  println(bitwha.length);

  String [] nextBitss = split(bitss[3], "</td>");
  println(trim(nextBitss[0]));

  //Moon Rise Today
  String [] bitmr = split(moonRiseSite, "<td>-<br>");
  println(bitwha.length);

  String [] nextBitmr = split(bitmr[1], "</td>");
  println(trim(nextBitmr[0]));

  //Moonset Today
  String [] bitms = split(moonRiseSite, "<td>");
  println(bitms.length);

  String [] nextBitms = split(bitms[3], "<br>-</td>");
  println(trim(nextBitms[0]));

  //today
  temperature = float(trim(nextBitt[0]));
  weatherCondition = nextBitwc[0];
  windDirection = nextBitwd[0];
  windSpeed = nextBitws[0];
  waveHeightMorning = float(trim(nextBitwhm[0]));
  waveHeightAfternoon = float(trim(nextBitwha[0]));
  sunRise = nextBitsr[0];
  sunSet = nextBitss[0];
  moonRise = nextBitmr[0];
  moonSet = nextBitms[0];
  tdat = nextBittdat[0];
  gust = nextBitg[0];
  pressure = float(trim(nextBitp[0]));
  cloud = float(trim(nextBitv[0]));
  humidity = float(trim(nextBith[0]));
  weatherImageUrl = nextBitwi[0];
}

void getDataTomorrow() {

  String UVPSite = "";
  String [] UVPSiteArray = loadStrings("http://www.worldweatheronline.com/dundee-weather/dundee-city/gb.aspx?day=1");

  String weatherSite = "";
  String [] weatherSiteArray = loadStrings("http://www.timeanddate.com/worldclock/city.html?n=1340");

  String weatherImageSite ="";
  String [] weatherImageSiteArray = loadStrings("http://www.timeanddate.com/weather/uk/dundee");

  String tdatSite = "";
  String [] tdatSiteArray = loadStrings("http://www.worldweatheronline.com/dundee-weather/dundee-city/gb.aspx?day=0");

  String sunRiseSite = "";
  String [] sunRiseArray = loadStrings("http://www.timeanddate.com/worldclock/astronomy.html?n=1340");

  String moonRiseSite = "";
  String [] moonRiseArray = loadStrings("http://www.timeanddate.com/worldclock/astronomy.html?obj=moon&n=1340");

  String waveSite ="";
  String [] waveSiteArray = loadStrings("http://swell.willyweather.com.au/nt/darwin/dundee-beach.html");

  String weatherConditionsSite = "";
  String [] weatherConditionsSiteArray = loadStrings("http://www.timeanddate.com/weather/uk/dundee");

  String windSite ="";
  String [] windSiteArray = loadStrings("http://www.timeanddate.com/weather/uk/dundee");

  //Pressure, UV, Visibility
  for (int i = 0; i <UVPSiteArray.length; i++) {
    UVPSite += UVPSiteArray[i];
  }

  //Temperature, Wind speed / direction
  for (int i = 0; i <weatherSiteArray.length; i++) {
    weatherSite += weatherSiteArray[i];
  }

  //tdat menu
  for (int i =0; i <tdatSiteArray.length; i++) {
    tdatSite += tdatSiteArray[i];
  }

  //weather conditions
  for (int i = 0; i <weatherConditionsSiteArray.length; i++) {
    weatherConditionsSite += weatherConditionsSiteArray[i];
  }

  //Weather image
  for (int i=0; i<weatherImageSiteArray.length;i++) {
    weatherImageSite += weatherImageSiteArray[i];
  }

  //wind information
  for (int i = 0; i <windSiteArray.length; i++) {
    windSite += windSiteArray[i];
  }

  // Sun Information
  for (int i = 0;i <sunRiseArray.length; i++) {
    sunRiseSite += sunRiseArray[i];
  }

  //moon information
  for (int i = 0;i <moonRiseArray.length; i++) {
    moonRiseSite += moonRiseArray[i];
  }

  //Wave Height
  for (int i = 0; i <waveSiteArray.length;i++) {
    waveSite += waveSiteArray[i];
  }

  //weatherImage
  String [] bitwi2 = split(weatherImageSite, "</td><td class=\"tc sep\"><img class=mp src=\"");
  println(bitwi2.length);

  String [] nextBitwi2 = split(bitwi2[3], "\" width=30 height=30");
  println(trim(nextBitwi2[0]));

  //gust
  String [] bitg2 = split(UVPSite, "><br />");
  println(bitg2.length);

  String [] nextBitg2 = split(bitg2[60], "</div><div class=\"observationCellSmall\"");
  println(trim(nextBitg2[0]));

  //humidity
  String [] bith2 = split(UVPSite, "><br />");
  println(bith2.length);

  String [] nextBith2 = split(bith2[61], "%</div>");
  println(trim(nextBith2[0]));

  //cloud
  String [] bitv2 = split(UVPSite, "><br />");
  println(bitv2.length);

  String [] nextBitv2 = split(bitv2[59], "%</div>");
  println(trim(nextBitv2[0]));

  //Pressure
  String [] bitp2 = split(UVPSite, "><br />");
  println(bitp2.length);

  String [] nextBitp2 = split(bitp2[62], " mb</div></div><div class=\"observationRow\"><div class=\"observationCellSmall\"");
  println(trim(nextBitp2[0]));

  //Temperature Tomorrow
  String [] bitt2 = split(weatherSite, "Forecasted high temperature of ");
  println(bitt2.length);

  String [] nextBitt2 = split(bitt2[1], "&nbsp;°F");
  println(trim(nextBitt2[0]));

  //tdat Tomorrow
  String [] bittdat2 = split(tdatSite, "<br />");
  println(bittdat2.length);

  String [] nextBittdat2 = split(bittdat2[12], "</div>");
  println(trim(nextBittdat2[0]));

  //Weather Conditions Tomorrow
  String [] bitwc2 = split(weatherConditionsSite, "width=30 height=30 alt=\"");
  println(bitwc2.length);

  String [] nextBitwc2 = split(bitwc2[4], ".\" title=\"");
  println(trim(nextBitwc2[0]));

  //Wind Direction Tomorrow
  String [] bitwd2 = split(windSite, "width=14 height=14 alt=\"Direction ");
  println(bitwd2.length);

  String [] nextBitwd2 = split(bitwd2[4], "\" title=");
  println(trim(nextBitwd2[0]));

  //Wind Speed Tomorrow
  String [] bitws2 = split(windSite, "<td class=\"tc sep\">");
  println(bitws2.length);

  String [] nextBitws2 = split(bitws2[35], "</td>");
  println(trim(nextBitws2[0]));

  //Wave Height morning Tomorrow
  String [] bitwhm2 = split(waveSite, "<td class=\"height\">");
  println(bitwhm2.length);

  String [] nextBitwhm2 = split(bitwhm2[3], "m</td>");
  println(trim(nextBitwhm2[0]));

  //Wave Height Afternoon Tomorrow
  String [] bitwha2 = split(waveSite, "<td class=\"height\">");
  println(bitwha2.length);

  String [] nextBitwha2 = split(bitwha2[4], "m</td>");
  println(trim(nextBitwha2[0]));

  //Sunrise Tomorrow
  String [] bitsr2 = split(sunRiseSite, "<td>");
  println(bitsr2.length);

  String [] nextBitsr2 = split(bitsr2[10], "</td>");
  println(trim(nextBitsr2[0]));

  //Sunset Tomorrow
  String [] bitss2 = split(sunRiseSite, "<td>");
  println(bitwha2.length);

  String [] nextBitss2 = split(bitss2[11], "</td>");
  println(trim(nextBitss2[0]));

  //Moon Rise Tomorrow
  String [] bitmr2 = split(moonRiseSite, "<td>-<br>");
  println(bitwha2.length);

  String [] nextBitmr2 = split(bitmr2[1], "</td>");
  println(trim(nextBitmr2[0]));

  //Moonset Tomorrow
  String [] bitms2 = split(moonRiseSite, "<td>");
  println(bitms2.length);

  String [] nextBitms2 = split(bitms2[11], "<br>-</td>");
  println(trim(nextBitms2[0]));

  //tomorrow
  temperature2 = float(trim(nextBitt2[0]));
  weatherCondition2 = nextBitwc2[0];
  windDirection2 = nextBitwd2[0];
  windSpeed2 = nextBitws2[0];
  waveHeightMorning2 = float(trim(nextBitwhm2[0]));
  waveHeightAfternoon2 = float(trim(nextBitwha2[0]));
  sunRise2 = nextBitsr2[0];
  sunSet2 = nextBitss2[0];
  moonRise2 = nextBitmr2[0];
  moonSet2 = nextBitms2[0];
  tdat2 = nextBittdat2[0];
  gust2 = nextBitg2[0];
  pressure2 = float(trim(nextBitp2[0]));
  cloud2 = float(trim(nextBitv2[0]));
  humidity2 = float(trim(nextBith2[0]));
  weatherImageUrl2 = nextBitwi2[0];
}

void getDataTheDayAfterTomorrow() {

  String UVPSite = "";
  String [] UVPSiteArray = loadStrings("http://www.worldweatheronline.com/dundee-weather/dundee-city/gb.aspx?day=2");

  String weatherSite = "";
  String [] weatherSiteArray = loadStrings("http://www.timeanddate.com/worldclock/city.html?n=1340");

  String weatherImageSite ="";
  String [] weatherImageSiteArray = loadStrings("http://www.timeanddate.com/weather/uk/dundee");

  String tdatSite = "";
  String [] tdatSiteArray = loadStrings("http://www.worldweatheronline.com/dundee-weather/dundee-city/gb.aspx?day=0");

  String sunRiseSite = "";
  String [] sunRiseArray = loadStrings("http://www.timeanddate.com/worldclock/astronomy.html?n=1340");

  String moonRiseSite = "";
  String [] moonRiseArray = loadStrings("http://www.timeanddate.com/worldclock/astronomy.html?obj=moon&n=1340");

  String waveSite ="";
  String [] waveSiteArray = loadStrings("http://swell.willyweather.com.au/nt/darwin/dundee-beach.html");

  String weatherConditionsSite = "";
  String [] weatherConditionsSiteArray = loadStrings("http://www.timeanddate.com/weather/uk/dundee");

  String windSite ="";
  String [] windSiteArray = loadStrings("http://www.timeanddate.com/weather/uk/dundee");

  //Pressure, UV, Visibility
  for (int i = 0; i <UVPSiteArray.length; i++) {
    UVPSite += UVPSiteArray[i];
  }

  //Temperature, Wind speed / direction
  for (int i = 0; i <weatherSiteArray.length; i++) {
    weatherSite += weatherSiteArray[i];
  }

  //tdat menu
  for (int i =0; i <tdatSiteArray.length; i++) {
    tdatSite += tdatSiteArray[i];
  }

  //weather conditions
  for (int i = 0; i <weatherConditionsSiteArray.length; i++) {
    weatherConditionsSite += weatherConditionsSiteArray[i];
  }

  //Weather image
  for (int i=0; i<weatherImageSiteArray.length;i++) {
    weatherImageSite += weatherImageSiteArray[i];
  }

  //wind information
  for (int i = 0; i <windSiteArray.length; i++) {
    windSite += windSiteArray[i];
  }

  // Sun Information
  for (int i = 0;i <sunRiseArray.length; i++) {
    sunRiseSite += sunRiseArray[i];
  }

  //moon information
  for (int i = 0;i <moonRiseArray.length; i++) {
    moonRiseSite += moonRiseArray[i];
  }

  //Wave Height
  for (int i = 0; i <waveSiteArray.length;i++) {
    waveSite += waveSiteArray[i];
  }

  //weatherImage
  String [] bitwi3 = split(weatherImageSite, "</td><td class=\"tc sep\"><img class=mp src=\"");
  println(bitwi3.length);

  String [] nextBitwi3 = split(bitwi3[7], "\" width=30 height=30");
  println(trim(nextBitwi3[0]));

  //gust
  String [] bitg3 = split(UVPSite, "><br />");
  println(bitg3.length);

  String [] nextBitg3 = split(bitg3[60], "</div><div class=\"observationCellSmall\"");
  println(trim(nextBitg3[0]));

  //humidity
  String [] bith3 = split(UVPSite, "><br />");
  println(bith3.length);

  String [] nextBith3 = split(bith3[61], "%</div>");
  println(trim(nextBith3[0]));

  //cloud
  String [] bitv3 = split(UVPSite, "><br />");
  println(bitv3.length);

  String [] nextBitv3 = split(bitv3[59], "%</div>");
  println(trim(nextBitv3[0]));

  //Pressure
  String [] bitp3 = split(UVPSite, "><br />");
  println(bitp3.length);

  String [] nextBitp3 = split(bitp3[62], " mb</div></div><div class=\"observationRow\"><div class=\"observationCellSmall\"");
  println(trim(nextBitp3[0]));

  //Temperature Day after Tomorrow
  String [] bitt3 = split(weatherSite, "Forecasted high temperature of ");
  println(bitt3.length);

  String [] nextBitt3 = split(bitt3[2], "&nbsp;°F");
  println(trim(nextBitt3[0]));

  //tdat The day after tomorrow
  String [] bittdat3 = split(tdatSite, "<br />");
  println(bittdat3.length);

  String [] nextBittdat3 = split(bittdat3[12], "</div>");
  println(trim(nextBittdat3[0]));

  //Weather Conditions day after tomorrow
  String [] bitwc3 = split(weatherConditionsSite, "width=30 height=30 alt=\"");
  println(bitwc3.length);

  String [] nextBitwc3 = split(bitwc3[8], ".\" title=\"");
  println(trim(nextBitwc3[0]));

  //Wind Direction the day after tomorrow
  String [] bitwd3 = split(windSite, "width=14 height=14 alt=\"Direction ");
  println(bitwd3.length);

  String [] nextBitwd3 = split(bitwd3[8], "\" title=");
  println(trim(nextBitwd3[0]));

  //Wind Speed The Day After Tomorrow
  String [] bitws3 = split(windSite, "<td class=\"tc sep\">");
  println(bitws3.length);

  String [] nextBitws3 = split(bitws3[35], "</td>");
  println(trim(nextBitws3[0]));

  //Wave Height morning The Day After Tomorrow
  String [] bitwhm3 = split(waveSite, "<td class=\"height\">");
  println(bitwhm3.length);

  String [] nextBitwhm3 = split(bitwhm3[5], "m</td>");
  println(trim(nextBitwhm3[0]));

  //Wave Height Afternoon The Day After Tomorrow
  String [] bitwha3 = split(waveSite, "<td class=\"height\">");
  println(bitwha3.length);

  String [] nextBitwha3 = split(bitwha3[6], "m</td>");
  println(trim(nextBitwha3[0]));

  //Sunrise The Day After Tomorrow
  String [] bitsr3 = split(sunRiseSite, "<td>");
  println(bitsr3.length);

  String [] nextBitsr3 = split(bitsr3[18], "</td>");
  println(trim(nextBitsr3[0]));

  //Sunset Thw Day After Tomorrow
  String [] bitss3 = split(sunRiseSite, "<td>");
  println(bitwha3.length);

  String [] nextBitss3 = split(bitss3[19], "</td>");
  println(trim(nextBitss3[0]));

  //Moon Rise The Day After Tomorrow
  String [] bitmr3 = split(moonRiseSite, "<td>-<br>");
  println(bitwha3.length);

  String [] nextBitmr3 = split(bitmr3[2], "</td>");
  println(trim(nextBitmr3[0]));

  //Moonset The Day After Tomorrow
  String [] bitms3 = split(moonRiseSite, "<td>");
  println(bitms3.length);

  String [] nextBitms3 = split(bitms3[19], "<br>-</td>");
  println(trim(nextBitms3[0]));

  //the day after tomorrow
  temperature3 = float(trim(nextBitt3[0]));
  weatherCondition3 = nextBitwc3[0];
  windDirection3 = nextBitwd3[0];
  windSpeed3 = nextBitws3[0];
  waveHeightMorning3 = float(trim(nextBitwhm3[0]));
  waveHeightAfternoon3 = float(trim(nextBitwha3[0]));
  sunRise3 = nextBitsr3[0];
  sunSet3 = nextBitss3[0];
  moonRise3 = nextBitmr3[0];
  moonSet3 = nextBitms3[0];
  tdat3 = nextBittdat3[0];
  gust3 = nextBitg3[0];
  pressure3 = float(trim(nextBitp3[0]));
  cloud3 = float(trim(nextBitv3[0]));
  humidity3 = float(trim(nextBith3[0]));
  weatherImageUrl3 = nextBitwi3[0];
}

void drawDataToday() {

  //image(app_background, 0, 0, 800, 450);

  fill(255);

  text("Prsr", 468, 198);
  text("mb", 471, 218);
  text("Hmdy", 540, 198);
  text("%", 550, 218);
  text("cldc", 595, 198);
  text("%", 600, 218);
  fill(0);
  rect(473, 178, 10, -100);
  rect(550, 178, 10, -100);
  rect(600, 178, 10, -100); 
  stroke(150);
  noFill();
  rect(473, 178, 10, -100);
  rect(550, 178, 10, -100);
  rect(600, 178, 10, -100);
  fill(255);
  //cloudy / humidity bar
  text("0", 529, 183);
  text("100", 516, 83);
  line(538, 178, 546, 178);
  line(538, 158, 546, 158);
  line(538, 138, 546, 138);
  line(538, 118, 546, 118);
  line(538, 98, 546, 98);
  line(538, 78, 546, 78);
  //pressure bar
  text("0", 452, 183);
  text("10000", 425, 83);
  line(461, 178, 469, 178);
  line(461, 158, 469, 158);
  line(461, 138, 469, 138);
  line(461, 118, 469, 118);
  line(461, 98, 469, 98);
  line(461, 78, 469, 78);

  fill(255);

  text("Days:", 50, 80);
  text("Today", 50, 100);
  text("Tomorrow", 50, 120);
  text(tdat, 50, 140);
  stroke(150);
  noFill();
  rect(36, 87, 82, 17);

  fill(255);
  text("General Weather:", 190, 80);
  text("F", 287, 125);
  text(" " + temperature, 260, 125);
  text(weatherCondition, 190, 170);

  text("Wind Direction / Speed:", 190, 202);
  text(windDirection, 248, 220);
  text(windSpeed, 248, 240);
  text(gust, 248, 260);
  stroke(150);

  fill(255);
  text("Wave Height", 682, 198);
  text("AM", 682, 218);
  text("m", 710, 218);
  text("PM", 732, 218);
  stroke(150);
  fill(0);
  rect(685, 178, 10, -100);
  rect(735, 178, 10, -100);
  noFill();
  rect(685, 178, 10, -100);
  rect(735, 178, 10, -100);
  fill(255);
  //wave height bar-lines
  text("0", 664, 183);
  text("1", 664, 83);
  line(673, 178, 681, 178);
  line(673, 158, 681, 158);
  line(673, 138, 681, 138);
  line(673, 118, 681, 118);
  line(673, 98, 681, 98);
  line(673, 78, 681, 78);

  //graph information displays
  noFill();
  stroke(150);
  rect(458, 239, 40, 17);
  rect(537, 239, 35, 17);
  rect(587, 239, 35, 17);
  rect(680, 239, 20, 17);
  rect(730, 239, 20, 17);

if(dataValues==false){
  fill(255);
  text("Data Values", 50, 160);
}

  fill(255);
  text("Sunrise:", 433, 331);
  text(sunRise, 478, 331);
  text("Sunset:", 553, 331);
  text(sunSet, 595, 331);

  text("Moonrise:", 427, 397);
  text(moonRise, 480, 397);
  text("Moonset:", 549, 397);
  text(moonSet, 599, 397);

//pressure animation
timerp++;
  if (timerp>200 && ip>pressure/100) {
    gp=0;
    timerp=0;
  }
  if (ip>100) {
    gp = -1;
  }
  if (ip <1) {
    gp =1;
  }
  ip +=gp;
  fill(255);
  rect(473,178, 10, -ip);
  
  //humidty bar animation
  timerh++;
  if (timerh>200 && ih==humidity) {
    gh=0;
    timerh=0;
  }
  if (ih>100) {
    gh = -1;
  }
  if (ih <1) {
    gh =1;
  }
  ih +=gh;
  fill(255);
  rect(550, 178, 10, -ih);

//cloud bar animation
timerc++;
  if (timerc>200 && ic==cloud) {
    gc=0;
    timerc=0;
  }
  if (ic>100) {
    gc = -1;
  }
  if (ic <1 && ic<=0) {
    gc =1;
  }
  ic +=gc;
  fill(255);
  rect(600, 178, 10, -ic);
  
  //wave height morning animation
  timerwhm++;
  if (timerwhm>200 && iwhm>waveHeightMorning*100) {
    gwhm=0;
    timerwhm=0;
  }
  if (iwhm>100) {
    gwhm = -1;
  }
  if (iwhm <1) {
    gwhm =1;
  }
  iwhm +=gwhm;
  fill(255);
  rect(685, 178, 10, -iwhm);
  
  //wave height afternoon animation
  timerwha++;
  if (timerwha>200 && iwha>waveHeightAfternoon*100) {
    gwha=0;
    timerwha=0;
  }
  if (iwha>100) {
    gwha = -1;
  }
  if (iwha <1) {
    gwha =1;
  }
  iwha +=gwha;
  fill(255);
  rect(735, 178, 10, -iwha);

  //suitable clothes
  fill(255);
  text("Suitable Clothes:", 190, 292);

  //cold clothes
  if (temperature<51 && temperature>31) {
    text("Nylon/Wool Trousers", 193, 307);
    text("Wool Fleece", 193, 322);
    text("Heavyweight Synthetic Jacket", 193, 337);
    text("Two Pairs Wool Socks", 193, 352);
    text("Wool/Nylon Hat/Gloves", 193, 367);
    text("Heavyduty Boots", 193, 382);
    text("Scalf", 193, 397);
  }

  //mild clothes
  if (temperature<71 && temperature>50) {
    text("Jeans", 193, 307);
    text("Cotton Padded Jacket", 193, 322);
    text("Wool Cardigan", 193, 337);
    text("Acrylic Top", 193, 352);
    text("Puff Jacket", 193, 366);
    text("Synthtic Underwear", 193, 382);
    text("Trainers", 193, 397);
  }

  //hot clothes
  if (temperature<105 && temperature>70) {
    text("Cotton T-Shirt", 193, 300);
    text("Cotton Shorts", 193, 315);
    text("Sandals", 193, 330);
    text("Cotton/lightweight Trousers", 193, 345);
    text("Lightweight Wind Shirt", 193, 360);
    text("Swim Suit", 193, 375);
    text("Vest", 193, 390);
  }

  //weather images
  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/1.png")) {
    image(sunny, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/2.png")) {
    image(Partially_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/3.png")) {
    image(partially_sunny, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/4.png")) {
    image(Partially_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/5.png")) {
    image(Partially_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/6.png")) {
    image(lot_of_cloud_some_sun, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/7.png")) {
    image(cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/8.png")) {
    image(cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/9.png")) {
    image(really_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/10.png")) {
    image(cold_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/11.png")) {
    image(cold_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/12.png")) {
    image(lot_of_cloud_some_sun, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/13.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/14.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/15.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/16.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/17.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/18.png")) {
    image(rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/19.png")) {
    image(rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/20.png")) {
    image(rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/21.png")) {
    image(thunder_rain_sun, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/22.png")) {
    image(thunder_and_rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/23.png")) {
    image(thunder_and_rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/24.png")) {
    image(thunder_and_rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/25.png")) {
    image(windy, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/26.png")) {
    image(windy, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/27.png")) {
    image(snow, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/28.png")) {
    image(snow_and_cloud, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/29.png")) {
    image(snow, 190, 85, 70, 70);
  }
  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/30.png")) {
    image(really_snowy, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/31.png")) {
    image(really_snowy, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/32.png")) {
    image(rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/33.png")) {
    image(rain_cloud_and_sun, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/34.png")) {
    image(rain_at_night, 190, 85, 70, 70);
  }

  if (weatherImageUrl.equals("http://c.tadst.com/gfx/w/35.png")) {
    image(rain_at_night, 190, 85, 70, 70);
  }

  // wind direction
  if (windDirection.equals("North")) {
    image(north, 190, 210, 50, 50);
  }

  if (windDirection.equals("South")) {
    image(south, 190, 210, 50, 50);
  }

  if (windDirection.equals("East")) {
    image(east, 190, 210, 50, 50);
  }

  if (windDirection.equals("West")) {
    image(west, 190, 210, 50, 50);
  } 

  if (windDirection.equals("North-northeast")) {
    image(north_northeast, 190, 210, 50, 50);
  } 

  if (windDirection.equals("North-northwest")) {
    image(north_northwest, 190, 210, 50, 50);
  } 

  if (windDirection.equals("South-southeast")) {
    image(south_southeast, 190, 210, 50, 50);
  } 

  if (windDirection.equals("South-southwest")) {
    image(south_southwest, 190, 210, 50, 50);
  } 

  if (windDirection.equals("East-northeast")) {
    image(northwest_west, 190, 210, 50, 50);
  }

  if (windDirection.equals("West-northwest")) {
    image(northeast_east, 190, 210, 50, 50);
  }

  if (windDirection.equals("West-southwest")) {
    image(southeast_east, 190, 210, 50, 50);
  }

  if (windDirection.equals("East-southeast")) {
    image(southwest_west, 190, 210, 50, 50);
  }

  if (windDirection.equals("Northeast")) {
    image(northeast, 190, 210, 50, 50);
  }

  if (windDirection.equals("Southeast")) {
    image(southeast, 190, 210, 50, 50);
  }

  if (windDirection.equals("Northwest")) {
    image(northwest, 190, 210, 50, 50);
  }

  if (windDirection.equals("Southwest")) {
    image(southwest, 190, 210, 50, 50);
  }

  image(sunset, 435, 273, 80, 60);
  image(sunrise, 555, 273, 80, 60);
  image(moonset, 435, 338, 80, 60);
  image(moonrise, 555, 338, 80, 60);

  //sailing warning & allowance
  image(safe_sailing, 673, 271, 90, 132);

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/20.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/21.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/22.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/23.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/24.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/30.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/31.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/32.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }
}

void drawDataTomorrow() {
  
  //image(app_background,0,0,800,450);

  fill(255);

  text("Prsr", 468, 198);
  text("mb", 471, 218);
  text("Hmdy", 540, 198);
  text("%", 550, 218);
  text("cldc", 595, 198);
  text("%", 600, 218);
  fill(0);
  rect(473, 178, 10, -100);
  rect(550, 178, 10, -100);
  rect(600, 178, 10, -100); 
  stroke(150);
  noFill();
  rect(473, 178, 10, -100);
  rect(550, 178, 10, -100);
  rect(600, 178, 10, -100);
  fill(255);
  //cloudy / humidity bar
  text("0", 529, 183);
  text("100", 516, 83);
  line(538, 178, 546, 178);
  line(538, 158, 546, 158);
  line(538, 138, 546, 138);
  line(538, 118, 546, 118);
  line(538, 98, 546, 98);
  line(538, 78, 546, 78);
  //pressure bar
  text("0", 452, 183);
  text("10000", 425, 83);
  line(461, 178, 469, 178);
  line(461, 158, 469, 158);
  line(461, 138, 469, 138);
  line(461, 118, 469, 118);
  line(461, 98, 469, 98);
  line(461, 78, 469, 78);

  fill(255);

  text("Days:", 50, 80);
  text("Today", 50, 100);
  text("Tomorrow", 50, 120);
  text(tdat2, 50, 140);
  stroke(150);
  noFill();
  rect(36, 107, 82, 17);

  fill(255);
  text("General Weather:", 190, 80);
  text("F", 287, 125);
  text(" " + temperature2, 260, 125);
  text(weatherCondition2, 190, 170);

  text("Wind Direction / Speed:", 190, 202);
  text(windDirection2, 248, 220);
  text(windSpeed2, 248, 240);
  text(gust2, 248, 260);
  stroke(150);

  fill(255);
  text("Wave Height", 682, 198);
  text("AM", 682, 218);
  text("m", 710, 218);
  text("PM", 732, 218);
  stroke(150);
  fill(0);
  rect(685, 178, 10, -100);
  rect(735, 178, 10, -100);
  noFill();
  rect(685, 178, 10, -100);
  rect(735, 178, 10, -100);
  fill(255);
  //wave height bar-lines
  text("0", 664, 183);
  text("1", 664, 83);
  line(673, 178, 681, 178);
  line(673, 158, 681, 158);
  line(673, 138, 681, 138);
  line(673, 118, 681, 118);
  line(673, 98, 681, 98);
  line(673, 78, 681, 78);

  //graph information displays
  noFill();
  stroke(150);
  rect(458, 239, 40, 17);
  rect(537, 239, 35, 17);
  rect(587, 239, 35, 17);
  rect(680, 239, 20, 17);
  rect(730, 239, 20, 17);

  if(dataValues2==false){
  fill(255);
  text("Data Values", 50, 160);
}

  fill(255);
  text("Sunrise:", 433, 331);
  text(sunRise2, 478, 331);
  text("Sunset:", 553, 331);
  text(sunSet2, 595, 331);

  text("Moonrise:", 427, 397);
  text(moonRise2, 480, 397);
  text("Moonset:", 549, 397);
  text(moonSet2, 599, 397);
  
  //pressure animation
timerp2++;
  if (timerp2>200 && ip2>pressure2/100) {
    gp2=0;
    timerp2=0;
  }
  if (ip2>100) {
    gp2 = -1;
  }
  if (ip2 <1) {
    gp2 =1;
  }
  ip2 +=gp2;
  fill(255);
  rect(473, 178, 10, -ip2);
  
  //humidty bar animation
  timerh2++;
  if (timerh2>200 && ih2==humidity2) {
    gh2=0;
    timerh2=0;
  }
  if (ih2>100) {
    gh2 = -1;
  }
  if (ih2 <1) {
    gh2 =1;
  }
  ih2 +=gh2;
  fill(255);
  rect(550, 178, 10, -ih2);

//cloud bar animation
timerc2++;
  if (timerc2>200 && ic2==cloud2) {
    gc2=0;
    timerc2=0;
  }
  if (ic2>100) {
    gc2 = -1;
  }
  if (ic2 <1 && ic2<=0) {
    gc2 =1;
  }
  ic2 +=gc2;
  fill(255);
  rect(600, 178, 10, -ic2);
  
  //wave height morning animation
  timerwhm2++;
  if (timerwhm2>200 && iwhm2>waveHeightMorning2*100) {
    gwhm2=0;
    timerwhm2=0;
  }
  if (iwhm2>100) {
    gwhm2 = -1;
  }
  if (iwhm2 <1) {
    gwhm2 =1;
  }
  iwhm2 +=gwhm2;
  fill(255);
  rect(685, 178, 10, -iwhm2);
  
  //wave height afternoon animation
  timerwha2++;
  if (timerwha2>200 && iwha2>waveHeightAfternoon2*100) {
    gwha2=0;
    timerwha2=0;
  }
  if (iwha2>100) {
    gwha2 = -1;
  }
  if (iwha2 <1) {
    gwha2 =1;
  }
  iwha2 +=gwha2;
  fill(255);
  rect(735, 178, 10, -iwha2);

  fill(255);
  text("Suitable Clothes:", 190, 292);

  //cold clothes
  if (temperature2<51 && temperature2>31) {
    text("Nylon/Wool Trousers", 193, 307);
    text("Wool Fleece", 193, 322);
    text("Heavyweight Synthetic Jacket", 193, 337);
    text("Two Pairs Wool Socks", 193, 352);
    text("Wool/Nylon Hat/Gloves", 193, 367);
    text("Heavyduty Boots", 193, 382);
    text("Scalf", 193, 397);
  }

  //mild clothes
  if (temperature2<71 && temperature2>50) {
    text("Jeans", 193, 307);
    text("Cotton Padded Jacket", 193, 322);
    text("Wool Cardigan", 193, 337);
    text("Acrylic Top", 193, 352);
    text("Puff Jacket", 193, 366);
    text("Synthtic Underwear", 193, 382);
    text("Trainers", 193, 397);
  }

  //hot clothes
  if (temperature2<105 && temperature2>70) {
    text("Cotton T-Shirt", 193, 300);
    text("Cotton Shorts", 193, 315);
    text("Sandals", 193, 330);
    text("Cotton/lightweight Trousers", 193, 345);
    text("Lightweight Wind Shirt", 193, 360);
    text("Swim Suit", 193, 375);
    text("Vest", 193, 390);
  }

  //weather images
  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/1.png")) {
    image(sunny, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/2.png")) {
    image(Partially_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/3.png")) {
    image(partially_sunny, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/4.png")) {
    image(Partially_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/5.png")) {
    image(Partially_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/6.png")) {
    image(lot_of_cloud_some_sun, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/7.png")) {
    image(cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/8.png")) {
    image(cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/9.png")) {
    image(really_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/10.png")) {
    image(cold_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/11.png")) {
    image(cold_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/12.png")) {
    image(lot_of_cloud_some_sun, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/13.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/14.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/15.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/16.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/17.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/18.png")) {
    image(rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/19.png")) {
    image(rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/20.png")) {
    image(rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/21.png")) {
    image(thunder_rain_sun, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/22.png")) {
    image(thunder_and_rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/23.png")) {
    image(thunder_and_rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/24.png")) {
    image(thunder_and_rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/25.png")) {
    image(windy, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/26.png")) {
    image(windy, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/27.png")) {
    image(snow, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/28.png")) {
    image(snow_and_cloud, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/29.png")) {
    image(snow, 190, 85, 70, 70);
  }
  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/30.png")) {
    image(really_snowy, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/31.png")) {
    image(really_snowy, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/32.png")) {
    image(rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/33.png")) {
    image(rain_cloud_and_sun, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/34.png")) {
    image(rain_at_night, 190, 85, 70, 70);
  }

  if (weatherImageUrl2.equals("http://c.tadst.com/gfx/w/35.png")) {
    image(rain_at_night, 190, 85, 70, 70);
  }

  // wind direction
  if (windDirection2.equals("North")) {
    image(north, 190, 210, 50, 50);
  }

  if (windDirection2.equals("South")) {
    image(south, 190, 210, 50, 50);
  }

  if (windDirection2.equals("East")) {
    image(east, 190, 210, 50, 50);
  }

  if (windDirection2.equals("West")) {
    image(west, 190, 210, 50, 50);
  } 

  if (windDirection2.equals("North-northeast")) {
    image(north_northeast, 190, 210, 50, 50);
  } 

  if (windDirection2.equals("North-northwest")) {
    image(north_northwest, 190, 210, 50, 50);
  } 

  if (windDirection2.equals("South-southeast")) {
    image(south_southeast, 190, 210, 50, 50);
  } 

  if (windDirection2.equals("South-southwest")) {
    image(south_southwest, 190, 210, 50, 50);
  } 

  if (windDirection2.equals("East-northeast")) {
    image(northwest_west, 190, 210, 50, 50);
  }

  if (windDirection2.equals("West-northwest")) {
    image(northeast_east, 190, 210, 50, 50);
  }

  if (windDirection2.equals("West-southwest")) {
    image(southeast_east, 190, 210, 50, 50);
  }

  if (windDirection2.equals("East-southeast")) {
    image(southwest_west, 190, 210, 50, 50);
  }

  if (windDirection2.equals("Northeast")) {
    image(northeast, 190, 210, 50, 50);
  }

  if (windDirection2.equals("Southeast")) {
    image(southeast, 190, 210, 50, 50);
  }

  if (windDirection2.equals("Northwest")) {
    image(northwest, 190, 210, 50, 50);
  }

  if (windDirection2.equals("Southwest")) {
    image(southwest, 190, 210, 50, 50);
  }

  image(sunset, 435, 273, 80, 60);
  image(sunrise, 555, 273, 80, 60);
  image(moonset, 435, 338, 80, 60);
  image(moonrise, 555, 338, 80, 60);
  
  //sailing warning & allowance
  image(safe_sailing, 673, 271, 90, 132);

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/20.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/21.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/22.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/23.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/24.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/30.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/31.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/32.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }
}

void drawDataTheDayAfterTomorrow() {

  //image(app_background,0,0,800,450);
  
  fill(255);

  text("Prsr", 468, 198);
  text("mb", 471, 218);
  text("Hmdy", 540, 198);
  text("%", 550, 218);
  text("cldc", 595, 198);
  text("%", 600, 218);
  fill(0);
  rect(473, 178, 10, -100);
  rect(550, 178, 10, -100);
  rect(600, 178, 10, -100); 
  stroke(150);
  noFill();
  rect(473, 178, 10, -100);
  rect(550, 178, 10, -100);
  rect(600, 178, 10, -100);
  fill(255);
  //cloudy / humidity bar
  text("0", 529, 183);
  text("100", 516, 83);
  line(538, 178, 546, 178);
  line(538, 158, 546, 158);
  line(538, 138, 546, 138);
  line(538, 118, 546, 118);
  line(538, 98, 546, 98);
  line(538, 78, 546, 78);
  //pressure bar
  text("0", 452, 183);
  text("10000", 425, 83);
  line(461, 178, 469, 178);
  line(461, 158, 469, 158);
  line(461, 138, 469, 138);
  line(461, 118, 469, 118);
  line(461, 98, 469, 98);
  line(461, 78, 469, 78);

  fill(255);

  text("Days:", 50, 80);
  text("Today", 50, 100);
  text("Tomorrow", 50, 120);
  text(tdat3, 50, 140);
  stroke(150);
  noFill();
  rect(36, 127, 82, 17);

  fill(255);
  text("General Weather:", 190, 80);
  text("F", 287, 125);
  text(" " + temperature3, 260, 125);
  text(weatherCondition3, 190, 170);

  text("Wind Direction / Speed:", 190, 202);
  text(windDirection3, 248, 220);
  text(windSpeed3, 248, 240);
  text(gust3, 248, 260);
  stroke(150);

  fill(255);
  text("Wave Height", 682, 198);
  text("AM", 682, 218);
  text("m", 710, 218);
  text("PM", 732, 218);
  stroke(150);
  fill(0);
  rect(685, 178, 10, -100);
  rect(735, 178, 10, -100);
  noFill();
  rect(685, 178, 10, -100);
  rect(735, 178, 10, -100);
  fill(255);
  //wave height bar-lines
  text("0", 664, 183);
  text("1", 664, 83);
  line(673, 178, 681, 178);
  line(673, 158, 681, 158);
  line(673, 138, 681, 138);
  line(673, 118, 681, 118);
  line(673, 98, 681, 98);
  line(673, 78, 681, 78);

  //graph information displays
  noFill();
  stroke(150);
  rect(458, 239, 40, 17);
  rect(537, 239, 35, 17);
  rect(587, 239, 35, 17);
  rect(680, 239, 20, 17);
  rect(730, 239, 20, 17);

  if(dataValues3==false){
  fill(255);
  text("Data Values", 50, 160);
}

  fill(255);
  text("Sunrise:", 433, 331);
  text(sunRise3, 478, 331);
  text("Sunset:", 553, 331);
  text(sunSet3, 595, 331);

  text("Moonrise:", 427, 397);
  text(moonRise3, 480, 397);
  text("Moonset:", 549, 397);
  text(moonSet3, 599, 397);
  
  //pressure animation
timerp3++;
  if (timerp3>200 && ip3>pressure3/100) {
    gp3=0;
    timerp3=0;
  }
  if (ip3>100) {
    gp3 = -1;
  }
  if (ip3 <1) {
    gp3 =1;
  }
  ip3 +=gp3;
  fill(255);
  rect(473, 178, 10, -ip3);
  
  //humidty bar animation
  timerh3++;
  if (timerh3>200 && ih3==humidity3) {
    gh3=0;
    timerh3=0;
  }
  if (ih3>100) {
    gh3 = -1;
  }
  if (ih3 <1) {
    gh3 =1;
  }
  ih3 +=gh3;
  fill(255);
  rect(550, 178, 10, -ih3);

//cloud bar animation
timerc3++;
  if (timerc3>200 && ic3==cloud3) {
    gc3=0;
    timerc3=0;
  }
  if (ic3>100) {
    gc3 = -1;
  }
  if (ic3 <1 && ic3<=0) {
    gc3 =1;
  }
  ic3 +=gc3;
  fill(255);
  rect(600, 178, 10, -ic3);
  
  //wave height morning animation
  timerwhm3++;
  if (timerwhm3>200 && iwhm3>waveHeightMorning3*100) {
    gwhm3=0;
    timerwhm3=0;
  }
  if (iwhm3>100) {
    gwhm3 = -1;
  }
  if (iwhm3 <1) {
    gwhm3 =1;
  }
  iwhm3 +=gwhm3;
  fill(255);
  rect(685, 178, 10, -iwhm3);
  
  //wave height afternoon animation
  timerwha3++;
  if (timerwha3>200 && iwha3>waveHeightAfternoon3*100) {
    gwha3=0;
    timerwha3=0;
  }
  if (iwha3>100) {
    gwha3 = -1;
  }
  if (iwha3 <1) {
    gwha3 =1;
  }
  iwha3 +=gwha3;
  fill(255);
  rect(735, 178, 10, -iwha3);

  fill(255);
  text("Suitable Clothes:", 190, 292);

  //cold clothes
  if (temperature3<51 && temperature3>31) {
    text("Nylon/Wool Trousers", 193, 307);
    text("Wool Fleece", 193, 322);
    text("Heavyweight Synthetic Jacket", 193, 337);
    text("Two Pairs Wool Socks", 193, 352);
    text("Wool/Nylon Hat/Gloves", 193, 367);
    text("Heavyduty Boots", 193, 382);
    text("Scalf", 193, 397);
  }

  //mild clothes
  if (temperature3<71 && temperature3>50) {
    text("Jeans", 193, 307);
    text("Cotton Padded Jacket", 193, 322);
    text("Wool Cardigan", 193, 337);
    text("Acrylic Top", 193, 352);
    text("Puff Jacket", 193, 366);
    text("Synthtic Underwear", 193, 382);
    text("Trainers", 193, 397);
  }

  //hot clothes
  if (temperature3<105 && temperature3>70) {
    text("Cotton T-Shirt", 193, 300);
    text("Cotton Shorts", 193, 315);
    text("Sandals", 193, 330);
    text("Cotton/lightweight Trousers", 193, 345);
    text("Lightweight Wind Shirt", 193, 360);
    text("Swim Suit", 193, 375);
    text("Vest", 193, 390);
  }

  //weather images
  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/1.png")) {
    image(sunny, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/2.png")) {
    image(Partially_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/3.png")) {
    image(partially_sunny, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/4.png")) {
    image(Partially_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/5.png")) {
    image(Partially_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/6.png")) {
    image(lot_of_cloud_some_sun, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/7.png")) {
    image(cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/8.png")) {
    image(cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/9.png")) {
    image(really_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/10.png")) {
    image(cold_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/11.png")) {
    image(cold_cloudy, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/12.png")) {
    image(lot_of_cloud_some_sun, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/13.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/14.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/15.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/16.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/17.png")) {
    image(night, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/18.png")) {
    image(rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/19.png")) {
    image(rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/20.png")) {
    image(rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/21.png")) {
    image(thunder_rain_sun, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/22.png")) {
    image(thunder_and_rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/23.png")) {
    image(thunder_and_rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/24.png")) {
    image(thunder_and_rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/25.png")) {
    image(windy, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/26.png")) {
    image(windy, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/27.png")) {
    image(snow, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/28.png")) {
    image(snow_and_cloud, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/29.png")) {
    image(snow, 190, 85, 70, 70);
  }
  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/30.png")) {
    image(really_snowy, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/31.png")) {
    image(really_snowy, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/32.png")) {
    image(rain, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/33.png")) {
    image(rain_cloud_and_sun, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/34.png")) {
    image(rain_at_night, 190, 85, 70, 70);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/35.png")) {
    image(rain_at_night, 190, 85, 70, 70);
  }

  // wind direction
  if (windDirection3.equals("North")) {
    image(north, 190, 210, 50, 50);
  }

  if (windDirection3.equals("South")) {
    image(south, 190, 210, 50, 50);
  }

  if (windDirection3.equals("East")) {
    image(east, 190, 210, 50, 50);
  }

  if (windDirection3.equals("West")) {
    image(west, 190, 210, 50, 50);
  } 

  if (windDirection3.equals("North-northeast")) {
    image(north_northeast, 190, 210, 50, 50);
  } 

  if (windDirection3.equals("North-northwest")) {
    image(north_northwest, 190, 210, 50, 50);
  } 

  if (windDirection3.equals("South-southeast")) {
    image(south_southeast, 190, 210, 50, 50);
  } 

  if (windDirection3.equals("South-southwest")) {
    image(south_southwest, 190, 210, 50, 50);
  } 

  if (windDirection3.equals("East-northeast")) {
    image(northwest_west, 190, 210, 50, 50);
  }

  if (windDirection3.equals("West-northwest")) {
    image(northeast_east, 190, 210, 50, 50);
  }

  if (windDirection3.equals("West-southwest")) {
    image(southeast_east, 190, 210, 50, 50);
  }

  if (windDirection3.equals("East-southeast")) {
    image(southwest_west, 190, 210, 50, 50);
  }

  if (windDirection3.equals("Northeast")) {
    image(northeast, 190, 210, 50, 50);
  }

  if (windDirection3.equals("Southeast")) {
    image(southeast, 190, 210, 50, 50);
  }

  if (windDirection3.equals("Northwest")) {
    image(northwest, 190, 210, 50, 50);
  }

  if (windDirection3.equals("Southwest")) {
    image(southwest, 190, 210, 50, 50);
  }

  image(sunset, 435, 273, 80, 60);
  image(sunrise, 555, 273, 80, 60);
  image(moonset, 435, 338, 80, 60);
  image(moonrise, 555, 338, 80, 60);

  //sailing warning & allowance
  image(safe_sailing, 673, 271, 90, 132);

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/20.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/21.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/22.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/23.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/24.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/30.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/31.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }

  if (weatherImageUrl3.equals("http://c.tadst.com/gfx/w/32.png")) {
    image(warning_sailing, 673, 271, 90, 132);
  }
}

void mouseClicked() {

  if (mouseX>36 && mouseX<36+82 && mouseY>87 && mouseY<87+17) {
    if (dataValues2==true) {
      dataValues2=false;
      dataValues=true;
    }
    if (dataValues3==true) {
      dataValues3=false;
      dataValues=true;
    }
    println("button 1");
    image(app_background, 0, 0, 800, 450);
    getDToday =true;
    drawDataToday();
    getDTomorrow =false;
    getDTheDayAfterTomorrow =false;
  }

  if (mouseX>36 && mouseX<36+82 && mouseY>107 && mouseY<107+17) {
    if (dataValues==true) {
      dataValues=false;
      dataValues2=true;
    }
    if (dataValues3==true) {
      dataValues3=false;
      dataValues2=true;
    }
    println("button 2");
    image(app_background, 0, 0, 800, 450);
    getDTomorrow =true;
    drawDataTomorrow();
    getDTheDayAfterTomorrow =false;
    getDToday=false;
  }

  if (mouseX>36 && mouseX<36+82 && mouseY>127 && mouseY<127+17) {
    if (dataValues==true) {
      dataValues=false;
      dataValues3=true;
    }
    if (dataValues2==true) {
      dataValues2=false;
      dataValues3=true;
    }
    println("button 3");
    image(app_background, 0, 0, 800, 450);
    getDTheDayAfterTomorrow =true;
    drawDataTheDayAfterTomorrow();
    getDToday=false;
    getDTomorrow=false;
  }

  if (mouseX>36 && mouseX<36+82 && mouseY>144 && mouseY<144+22) {
    if (getDToday==true && dataValues==false) {
      dataValues=true;
    }
    else {
      dataValues=false;
      image(app_background, 0, 0, 800, 450);
    }
  }

  if (mouseX>36 && mouseX<36+82 && mouseY>144 && mouseY<144+22) {
    if (getDTomorrow==true && dataValues2==false) {
      dataValues2=true;
    }
    else {
      dataValues2=false;
      image(app_background, 0, 0, 800, 450);
    }
  }

  if (mouseX>36 && mouseX<36+82 && mouseY>144 && mouseY<144+22) {
    if (getDTheDayAfterTomorrow==true && dataValues3==false) {
      dataValues3=true;
    }
    else {
      dataValues3=false;
      image(app_background, 0, 0, 800, 450);
    }
  }
}


