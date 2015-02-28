
size(640, 400);

String[] page = loadStrings("http://magicseaweed.com/St-Andrews-East-Surf-Report/38/");
String wholepage = "";
String[] bit, newBit;

for (int i=0; i<page.length; i++) {
  wholepage += page[i];
}

bit = split(wholepage, "<div class=\"msw-base-page-header page-header\"> <h2>");
newBit = split(bit[1], "</h2>");
String header = newBit[0];

bit = split(wholepage, "<i id=\"msw-js-map-swell\" class=\"msw-smap-swell\"></i> </div> <div class=\"msw-fct-ccd msw-sr-details span3\"> <h3> <span>   ");
newBit = split(bit[1], "<small>");
String waveHeight = newBit[0];

bit = split(wholepage, "<p class=\"msw-fct-ccw msw-sr-w\"><strong>");
newBit = split(bit[1], "<small>");
String windSpeed = newBit[0];

bit = split(wholepage, "<td class=\"msw-fc-wa\">  <span class=\"msw-sa-300 msw-saw-300 msw-js-tooltip\" title=\"");
newBit = split(bit[1], "&deg;");
String windType = newBit[0];

bit = split(wholepage, "<dt>Primary Swell</dt> <dd>");
newBit = split(bit[1], "<small>");
String primarySwell = newBit[0];

bit = split(wholepage, "<dt>Secondary Swell</dt> <dd>");
newBit = split(bit[1], "<small>");
String secondarySwell = newBit[0];

bit = split(wholepage, "<strong>Air</strong> ");
newBit = split(bit[1], "<small>");
String airTemp = newBit[0];

bit = split(wholepage, "<strong>Sea</strong> ");
newBit = split(bit[1], "<small>");
String seaTemp = newBit[0];

bit = split(wholepage, "<p class=\"msw-fct-ccwea\">");
newBit = split(bit[1], "</span>");
bit = split(newBit[0], ">");
String weather = bit[1];

PImage img;
if (weather.equals("Sunny"))
{
  img = loadImage("sunny.jpg");
  background(img);
}
else if (weather.equals("Fair"))
{
  img = loadImage("fair.jpg");
  background(img);
}
else if (weather.equals("Cloudy")||weather.equals("Overcast"))
{
  img = loadImage("cloudy.jpg");
  background(img);
}

else if (weather.equals("Mostly Clear")||weather.equals("Clear"))
{
    img = loadImage("clear.jpg");
  background(img);
}
else if (weather.equals("Snow"))
{
  img = loadImage("snow.jpg");
  background(img);
}
else if (weather.equals("Brief Showers")||weather.equals("Heavy Rain")||weather.equals("Drizzle"))
{
  img = loadImage("rain.jpg");
  background(img);
}
else 
{
  img = loadImage("sunny.jpg");
  background(img);
}

bit = split(wholepage, "<div class=\"msw-tide-con\"> <table class=\"msw-tide-table table table-condensed table-striped\">");
newBit = split(bit[1], "<td>");

bit = split(newBit[2], "</td>");
String tideHigh = bit[0];

bit = split(newBit[3], "</td>");
String tideHighMeters = bit[0];

bit = split(newBit[5], "</td>");
String tideLow = bit[0];

bit = split(newBit[6], "</td>"); 
String tideLowMeters = bit[0];

bit = split(newBit[8], "</td>");
String tideHigh2 = bit[0];

bit = split(newBit[9], "</td>");
String tideHigh2Meters = bit[0];

bit = split(newBit[11], "</td>");
String tideLow2 = bit[0];

bit = split(newBit[12], "</td>"); 
String tideLow2Meters = bit[0];

bit = split(newBit[14], "</td>");
String firstLight = bit[0];

bit = split(newBit[16], "</td>");
String sunrise = bit[0];

bit = split(newBit[18], "</td>");
String sunset = bit[0];

bit = split(newBit[20], "</td>");
String lastLight = bit[0];

PFont font = loadFont("CalifornianFB-Bold-48.vlw");
fill(0);
textFont(font, 32);
text(header, 42, 28);
fill(255);
text(header, 40, 30);

textFont(font, 20);
fill(0);
text("Wave height: " + waveHeight + "ft", 11, 69);
text("Wind: " + windSpeed + "mph", 11, 99);
text(windType + "°", 11, 129);
text("Primary swell: " + primarySwell + "ft", 11, 159);
text("Secondary swell: " + secondarySwell + "ft", 11, 189);
text("Air temp: " + airTemp + "°C", 11, 219);
text("Sea temp: " + seaTemp + "°C", 11, 249);
text("Weather: " + weather, 11, 279);

text("High tide: " + tideHigh + " " + tideHighMeters, 401, 69);
text("Low tide: " + tideLow + " " + tideLowMeters, 401, 99);
text("High tide: " + tideHigh2 + " " + tideHigh2Meters, 401, 129);
text("Low tide: " + tideLow2 + " " + tideLow2Meters, 401, 159);
text("First light: " + firstLight, 401, 189);
text("Sunrise: " + sunrise, 401, 219);
text("Sunset: " + sunset, 401, 249);
text("Last light: " + lastLight, 401, 279);

fill(255);
text("Wave height: " + waveHeight + "ft", 10, 70);
text("Wind: " + windSpeed + "mph", 10, 100);
text(windType + "°", 10, 130);
text("Primary swell: " + primarySwell + "ft", 10, 160);
text("Secondary swell: " + secondarySwell + "ft", 10, 190);
text("Air temp: " + airTemp + "°C", 10, 220);
text("Sea temp: " + seaTemp + "°C", 10, 250);
text("Weather: " + weather, 10, 280);

text("High tide: " + tideHigh + " " + tideHighMeters, 400, 70);
text("Low tide: " + tideLow + " " + tideLowMeters, 400, 100);
text("High tide: " + tideHigh2 + " " + tideHigh2Meters, 400, 130);
text("Low tide: " + tideLow2 + " " + tideLow2Meters, 400, 160);
text("First light: " + firstLight, 400, 190);
text("Sunrise: " + sunrise, 400, 220);
text("Sunset: " + sunset, 400, 250);
text("Last light: " + lastLight, 400, 280);

