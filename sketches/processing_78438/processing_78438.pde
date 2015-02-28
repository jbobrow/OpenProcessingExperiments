
String temperature;
String windspeed;
String winddirection;
String humidity;
String pressurereading;
String pressurechange;
String visibility;

void setup()
{
  XML xml = loadXML("http://open.live.bbc.co.uk/weather/feeds/en/2641673/observations.rss");
  xml = weatherXML(xml);
  // get the weather details
  XML weather = xml.getChild("channel/item/weather");

  temperature     = weather.getChild("temperature").getContent();
  windspeed       = weather.getChild("wind/speed").getContent();
  winddirection   = weather.getChild("wind/direction").getContent();
  humidity        = weather.getChild("humidity").getContent();
  pressurereading = weather.getChild("pressure/reading").getContent();
  pressurechange  = weather.getChild("pressure/change").getContent();
  visibility      = weather.getChild("visibility").getContent();
}
void draw()
{
}

XML weatherXML(XML xml)
{
  XML item = xml.getChild("channel/item");
  String obsdata = item.getChild("description").getContent();
  XML weather = new XML("weather");
  XML t ;
  String d[];

  t = new XML("temperature");
  d = match(obsdata, "Temperature: ([0-9]*)°C");
  t.setContent(d[1]);
  weather.addChild(t);

  t = new XML("wind");
  d = match(obsdata, "Wind Direction: ([\\w ]*), Wind Speed: ([0-9]*)mph");
  t.addChild(new XML("direction"));
  t.getChild("direction").setContent(d[1]);
  t.addChild(new XML("speed"));
  t.getChild("speed").setContent(d[2]);
  weather.addChild(t);

  t = new XML("humidity");
  d = match(obsdata, "Humidity: ([0-9]*)%");
  t.setContent(d[1]);
  weather.addChild(t);

  t = new XML("pressure");
  d = match(obsdata, "Pressure: ([0-9]*)mb, ([\\w]*),");
  t.addChild(new XML("reading"));
  t.getChild("reading").setContent(d[1]);
  t.addChild(new XML("change"));
  t.getChild("change").setContent(d[2]);
  weather.addChild(t);

  t = new XML("visibility");
  d = match(obsdata, "Visibility: ([\\w ]*)");
  t.setContent(d[1]);
  weather.addChild(t);


  item.addChild(weather);
  return xml;
}



