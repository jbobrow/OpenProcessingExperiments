
String url = "http://weather.yahooapis.com/forecastrss?w=2442047&u=f";
size(300,80);

XMLElement report = new XMLElement(this, url);
String l = report.getChild("channel/yweather:location").getString("city");
int w = report.getChild("channel/yweather:wind").getInt("speed");
int dir = report.getChild("channel/yweather:wind").getInt("direction");

XMLElement kid = report.getChild("channel/item");
int t = kid.getChild("yweather:condition").getInt("temp");
String d = kid.getChild("yweather:condition").getString("text");


colorMode(HSB, 360, 100,100);
background( map(hour(), 0,24, 0,250), 90,90); //fill the background based on time of day
fill(0);
text(t + "°F in "+ l +" today: " + d,    20,20); //print the weather data
text("Wind is " + w + "mph",             20,50);

