
/**
A simple program created for Adam's girlfriend that allows her to
view the current temperature in Dundee and a few surrounding cities
as well as the other bits of information like the sunrise and sunset
times.

[DOES NOT WORK AS A JAVSCRIPT FILE OR ON ANY WEB PAGE; MUST BE RUN
AS A WINDOWS APPLICATION]
*/

XML dundee = loadXML("http://weather.yahooapis.com/forecastrss?w=18637&u=c");
XML edinburgh = loadXML("http://weather.yahooapis.com/forecastrss?w=19344&u=c");
XML glasgow = loadXML("http://weather.yahooapis.com/forecastrss?w=21125&u=c");
XML aberdeen = loadXML("http://weather.yahooapis.com/forecastrss?w=10243&u=c");
XML inverness = loadXML("http://weather.yahooapis.com/forecastrss?w=24502&u=c");

/*XMLElement dundee = loadXML("http://weather.yahooapis.com/forecastrss?w=18637&u=c");
XMLElement edinburgh = loadXML("http://weather.yahooapis.com/forecastrss?w=19344&u=c");
XMLElement glasgow = loadXML("http://weather.yahooapis.com/forecastrss?w=21125&u=c");
XMLElement aberdeen = loadXML("http://weather.yahooapis.com/forecastrss?w=10243&u=c");
XMLElement inverness = loadXML("http://weather.yahooapis.com/forecastrss?w=24502&u=c");*/

int selectedCity = 0;

XML[] cityRoot = {dundee, edinburgh, glasgow, aberdeen, inverness};
XML locationInfo = cityRoot[selectedCity].getChild("channel/yweather:location");
XML currentWeather = cityRoot[selectedCity].getChild("channel/item/yweather:condition");
XML[] forecast = cityRoot[selectedCity].getChildren("channel/item/yweather:forecast");
XML astronomy = cityRoot[selectedCity].getChild("channel/yweather:astronomy");

/**XMLElement[] cityRoot = {dundee, edinburgh, glasgow, aberdeen, inverness};
XMLElement locationInfo = cityRoot[selectedCity].getChild("channel/yweather:location");
XMLElement currentWeather = cityRoot[selectedCity].getChild("channel/item/yweather:condition");
XMLElement[] forecast = cityRoot[selectedCity].getChildren("channel/item/yweather:forecast");*/

int currentTemp = currentWeather.getInt("temp");
String city = locationInfo.getString("city");

//int currentTemp = currentWeather.getInt("temp");
//String city = locationInfo.getStringAttribute("city");

PFont font;
PFont font2;
PFont font3;
PFont font4;
PFont font5;

color blueSky = color(141, 223, 247);
color cloud = color(209, 244, 255);
color darkCloud = color(114, 146, 156);

int h;
int m;
int s;

boolean overLeftArea;
boolean overRightArea;

float fadeTarget = 30;

void setup()
{
  size(500, 250);
  background(151);
  noStroke();
  font = loadFont("AlexandriaFLF-90.vlw");
  font2 = loadFont("RawengulkLight-70.vlw");
  font3 = loadFont("RawengulkRegular-90.vlw");
  font4 = loadFont("SegoeUI-90.vlw");
  font5 = loadFont("SegoeUI-Light-90.vlw");
}

void draw()
{
  fill(blueSky);
  rect(0, 0, width, height);  //BACKGROUND

  //Temperature and City
  fill(255);
  textFont(font, 70);
  text(currentTemp+"°", 15, 100);
  textFont(font5, 40);
  text(city, 15, 40);

  //Update Time
  fill(darkCloud);
  textFont(font4, 13);
  text("Last Updated:", 70, 75);
  text(cityRoot[selectedCity].getChild("channel/item/pubDate").getContent(), 70, 90);

  //CLOCK
  s = second();
  m = minute();
  h = hour();
  fill(0);
  textFont(font5, 20);
  if (m<10 && s<10)
  {
    text(h+":"+"0"+m+":"+"0"+s, width-80, 30);
  }
  else if (m<10)
  {
    text(h+":"+"0"+m+":"+s, width-80, 30);
  }
  else if (s<10)
  {
    text(h+":"+m+":"+"0"+s, width-80, 30);
  }
  else
  {
    text(h+":"+m+":"+s, width-80, 30);
  }
  stroke(0);
  line(width-12,32,width-80,32);
  noStroke();

  //Forecast ribbon
  fill(cloud);
  rect(0, height-(height*(0.4)), width, (height*0.3));

  //5-Day Forecast
  for (int i=0;i<forecast.length;i++)
  {
    int lowTemp = forecast[i].getInt("low");
    int highTemp = forecast[i].getInt("high");
    textFont(font5, 18);
    fill(darkCloud);
    if (lowTemp<0)
    {
      text(lowTemp, width-(width*(0.945-(i*0.2))), height-(height*0.23));
    }
    else
    {
      text(lowTemp, width-(width*(0.93-(i*0.2))), height-(height*0.23));
    }
    text(highTemp, width-(width*(0.93-(i*0.2))), height-(height*0.29));
    textFont(font5, 20);
    fill(0);
    text(forecast[i].getString("day"), width-(width*(0.95-(i*0.2))), height-(height*0.15));
  }/**///
  
  //Sunrise and Sunset
  textFont(font5,13);
  text("Sunrise: "+astronomy.getString("sunrise"),(width-(width*0.2)),(height*0.19));
  text("Sunset: "+astronomy.getString("sunset"),(width-(width*0.2)),(height*0.24));
  
  update();

  //If over left or right switch
  if (overLeftArea)
  {
    fill(#474747, 30); 
    rect(0, 0, width*0.1, height);
  }
  else if (overRightArea)
  {
    fill(#474747, 30); 
    rect(width*0.9, 0, width*0.1, height);
  }
}

void update()
{
  if (overLeftNavArea())
  {
    overLeftArea = true; 
    overRightArea = false;
  }
  else if (overRightNavArea())
  {
    overLeftArea = false; 
    overRightArea = true;
  }
  else
  {
    overLeftArea = overRightArea = false;
  }
}

void updateWeather()
{
  locationInfo = cityRoot[selectedCity].getChild("channel/yweather:location");
  currentWeather = cityRoot[selectedCity].getChild("channel/item/yweather:condition");
  forecast = cityRoot[selectedCity].getChildren("channel/item/yweather:forecast");
  astronomy = cityRoot[selectedCity].getChild("channel/yweather:astronomy");

  currentTemp = currentWeather.getInt("temp");
  city = locationInfo.getString("city");
}/**/

void mousePressed()
{
  if (overLeftArea)
  {
    selectedCity--;
    if(selectedCity<0){selectedCity=cityRoot.length-1;}
    updateWeather();
  }
  else if (overRightArea)
  {
    selectedCity++;
    if(selectedCity==cityRoot.length){selectedCity=0;}
    updateWeather();
  }/**/
}

boolean overLeftNavArea()
{
  if (mouseX >= 0 && mouseX <= width*0.1
    && mouseY >= 0 && mouseY <= height)
  {
    return true;
  }
  else
  {
    return false;
  }
}

boolean overRightNavArea()
{
  if (mouseX >= width*0.9 && mouseX <= width
    && mouseY >= 0 && mouseY <= height)
  {
    return true;
  }
  else
  {
    return false;
  }
}


