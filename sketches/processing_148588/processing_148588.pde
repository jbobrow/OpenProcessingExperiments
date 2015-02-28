
StringDict getWeather()
{
  StringDict w = new StringDict();
  XML data = loadXML("http://open.live.bbc.co.uk/"+"weather/feeds/en/2641673/observations.rss");
  XML weather = data.getChild("channel/item/description");
  String description = weather.getContent();
  description=description.replace("mb,", "mb;");
  String v[] = trim(split(description, ','));
  for(String s:v)
  {
    String e[] = trim(split(s, ':'));
    w.set(e[0], e[1]);
  }
  return w;
}
void setup()
{
  StringDict current = getWeather();
  String temperature = current.get("Temperature");
  int T = int(temperature.substring(0, temperature.indexOf("°C")));
  println(T);
}


