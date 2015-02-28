
PFont f;
PImage img;
void setup() 
{

size(850, 650); 
f = loadFont("Calibri-Bold-48.vlw");
img = loadImage("clouds.jpg");
}

void draw()
{

frameRate(0);
background(0);
image (img, 0, 0);
textFont(f, 30);
fill(0, 0, 0);
text("Current Local Date and Time:", 50, 50);

String url = "http://weather.yahooapis.com/forecastrss?p=UKXX0045&u=c"; 
XMLElement rss = new XMLElement(this, url); 


XMLElement[] informationXMLElements = rss.getChildren("channel/item/pubDate");
for (int i = 0; i < informationXMLElements.length; i++) { 
String information = informationXMLElements[i].getContent(); 
text(information, 50, 80);
}
XMLElement[] titleXMLElements = rss.getChildren("channel/item/title");
for (int i = 0; i < titleXMLElements.length; i++) { 
String title = titleXMLElements[i].getContent(); 
text(title, 150, 275);

}

String[] page = loadStrings("http://weather.yahooapis.com/forecastrss?p=UKXX0045&u=c");

String[] bits = page[34].split(">");

bits = bits[0].split("<");
text(bits[0], 200, 350);

String[] page1 = loadStrings("http://weather.yahooapis.com/forecastrss?p=UKXX0045&u=c");

String[] bits1 = page1[35].split(">");

bits1 = bits1[0].split("<");
text(bits1[0], 200, 400);

}

