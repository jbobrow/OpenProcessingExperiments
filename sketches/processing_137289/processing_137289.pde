
XML rss = loadXML(
"http://open.live.bbc.co.uk/"+
"weather/feeds/en/2641673/"+
"observations.rss");
XML weather = rss.getChild("channel/item/description");
String description = weather.getContent();
description = description.replace("mb,","mb");
String features[] = trim(split(description,','));
StringDict data = new StringDict();
for(String d : features){
 String kv[] = trim(split(d,':'));
data.set(kv[0], kv[1]);
}

String T = data.get("Temperature");
println(int(T.substring(0, T.indexOf("°C"))));



