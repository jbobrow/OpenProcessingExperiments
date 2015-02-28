
// Lesbian Horoscope for Leo
String horoscopeXml;
String horoscope;

PFont font;

void setup() {
 size(600,400);
 background(0);
 String url = "http://feeds.astrology.com/dailylesbianscope?format=xml";
 String[] lines = loadStrings(url);
 horoscopeXml = join(lines, "" );
 font = createFont("Georgia",14,true);

 int startLocation = horoscopeXml.indexOf("<title>Leo Horoscope for") + 25;
 int start2Location = horoscopeXml.indexOf("<description><![CDATA[<p>",startLocation) + 25;
 int endLocation = horoscopeXml.indexOf("</p>", start2Location);
 horoscope = horoscopeXml.substring(start2Location, endLocation);
}


void draw() {
 background(0);
 textFont(font, 14);
 text(horoscope, 15, 50,500,300);
}



