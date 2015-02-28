
XMLElement xml;


void setup() {
String feed = ("http://weather.yahooapis.com/forecastrss?w=24493874&u=c"); //Get the feed
    xml = new XMLElement(this,feed); //Stick the feed into a variable
    XMLElement yweather = xml.getChild("channel/item/yweather:forecast"); //get the forecast part of the feed
    String weatherGot = yweather.getString("text"); //this returns "Showers/Wind"
    String dateGot = yweather.getString("date"); //this returns "26 Nov 2011"
    String dayGot = yweather.getString("day"); //this returns "Mon"
    String highGot = yweather.getString("high"); // this returns "10"
    String lowGot = yweather.getString("low"); //this reurns "4"

    weatherSpeech = weatherGot + " with a high of " + highGot + " degrees celcius, and a low of " + lowGot + " degrees celcius";
    println(weatherSpeech);
}
