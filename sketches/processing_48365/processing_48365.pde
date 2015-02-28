
//Jennifer Lau


int xpos= 150;
int ypos=150;

XMLElement xml;
String APIKey = "t6jg2vebh3p7r3w8kybj5a5v";
//String url = "http://api.billboard.com/apisvc/chart/v1/list/spec?name=Billboard&type=Albums&api_key="+APIKey;
//String url2 = "http://api.billboard.com/apisvc/chart/v1/list?format=xml&id=396&sdate=2010-01-01&edate=2010-12-31&api_key="+APIKey;
String url3 = "pop100.xml";

void setup() {
  size(2700, 291);
  smooth ();
  xml = new XMLElement(this, url3);
  int entries = xml.getChildCount();
  noLoop();
}

void draw() {
  background(0);
  smooth ();
  xml = new XMLElement(this, url3);
  int entries = xml.getChildCount();
  noLoop();

  XMLElement[] artist = xml.getChildren("chartItem/artist");
  XMLElement[] song = xml.getChildren("chartItem/song");
  XMLElement[] weeksOn = xml.getChildren("chartItem/weeksOn");
  XMLElement[] peak = xml.getChildren("chartItem/peak");


  for (int i=0; i<entries; i++) {
    //  println(weeksOn[i].getContent());
    //int i=5;
    float wkscr = float(weeksOn[i].getContent());
    float peakcr = float(peak[i].getContent())*1.75;

    //println(artist[i].getContent());
    println(song[i].getContent());

    drawGraph(i, wkscr, peakcr);
  }
}

void drawGraph(int _i, float _wheight, float _pheight) {

  noFill();
  smooth();
  stroke( map(_wheight, 10, 5, 150, 100), 205, 255);
  strokeWeight(_i*5);
  ellipse(_i*300+xpos, _i+ypos, _wheight*10, _wheight*10);

  stroke( map(_pheight, 0, 5, 150, 0), 255, 255);
  strokeWeight(_i*2);
  ellipse(_i*300+xpos, _i+ypos, _pheight*2.5, _pheight*2.5);
}


