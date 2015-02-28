
XML feed = loadXML("http://open.live.bbc.co.uk/weather/feeds/en/2641673/observations.rss");
String obs = feed.getChild("channel/item/description").getContent();
String when = feed.getChild("channel/item/pubDate").getContent();
String[] da= match(obs, "Temperature: ([\\d]*)°C \\([\\d]*°F\\), Wind Direction: ([\\w ]*), Wind Speed: ([\\d]*)mph, Humidity: ([\\d]*)%, Pressure: ([\\d]*mb, [\\w ]*), Visibility: ([\\w]*)");

print("<"+da.length+">");
for(String m : da) print(":"+m);println();

println(feed.getChild("channel/item/title").getContent());



