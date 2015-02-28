
//http://search.twitter.com/search.json?q=blue%20angels&rpp=5&include_entities=true&result_type=mixed
PFont font;
PFont font2;
String element1;
String element2;
String searchTerm = "lotto";
String url = "http://search.twitter.com/search.atom?q=" + searchTerm + "&rpp=1";


int numTweets = 1;


XMLElement xml;

void setup()
{
  noStroke();
  smooth();
  size(700, 500);
  background(0);
  frameRate(.5);

  font = loadFont("DIN-Bold-12.vlw");
  font2 = loadFont("DINN48.vlw");
}

void draw()
{

  float x, y;
  x = random(10, width-220);
  y = random(25, height-125);
  fill(0, 100);
  rect(0, 0, width, height);
  feed(x, y);
  textFont(font2);
  fill(0,255,255);
  text("#" + searchTerm, width/2-70, 75);
}

void feed(float x, float y)
{
  pushMatrix();
  translate(x, y);
  xml = new XMLElement(this, url);
  if (xml != null)
  {
    XMLElement tweet = xml.getChild("entry/title");
    XMLElement name = xml.getChild("entry/author/name");

    element1 = name.getContent();
    element2 = tweet.getContent();

    pushMatrix();
    translate(20, 20);
    fill(random(0, 100), random(0, 100), random(0, 200));
    rect(0, 0, 240, 100);
    textFont(font);
    fill(250, 100, 0);
    text(element1, 10, 20);
    fill(255);
    text(element2, 10, 30, 220, 110);
    popMatrix();
    popMatrix();
  }
}


