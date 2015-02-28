
//Experiment in writing xml file to a sketch
//Based on example in Processing reference
//Seems to fix problem with getString and getInt functions

XMLElement xml;
PFont font;
String xContent;
int numSites;
int y = 10;
int id;
String url;
String site;

void setup() {
  size(500, 300);
  font = loadFont("CenturyGothic-20.vlw");
  textFont(font);
  background (0);
 
 xml = new XMLElement(this, "sites.xml");
 numSites = xml.getChildCount();
 for (int i = 0; i < numSites; i++) {
 XMLElement kid = xml.getChild(i);
 id = kid.getIntAttribute("id"); 
 url = kid.getStringAttribute("url"); 
 site = kid.getContent();
 xContent =(id + " : " + url + " : " + site);    
 y+=40;
 textSize(20);
 fill(255);
 text(xContent, 40, y);
 }
 }




