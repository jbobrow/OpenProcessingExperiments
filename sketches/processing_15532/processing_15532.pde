
PFont font;

float gravity = 0.1;
float friction = 0.97;

Nauseated nauseous;

void setup() {
  size(500,400);
  
  font = loadFont("font3.vlw");
  textFont(font);
  
  XMLElement drossXML = new XMLElement(this, "http://www.dailymail.co.uk/tvshowbiz/index.rss");
  XMLElement[] dross = drossXML.getChildren("channel/item/title");
  
  String vomit = "";
  for (int i=0; i < dross.length; i++) {
    vomit += (" " + dross[i].getContent());
  }
  String[] chunks = split(vomit, ' ');
  
  for(int i=0; i< chunks.length; i++) {
       int delay = (int) random(100,500) * i;
       new Word(chunks[i], delay);
  }
  
  nauseous = new Nauseated();
  
  smooth();
  noStroke();
  background(#eeeeee);
  fill(0);
}



void draw() {
  background(#eeeeee);
//  fill(#eeeeee, 15);
//  rect(0,0,width,height);
//  fill(0);

}


// - - - - - - 
public class Nauseated {
  PImage theUnwell;
  int imgX;
  
  Nauseated() {
    theUnwell = loadImage("head.gif");
    imgX = width-theUnwell.width;
    registerDraw(this);
  }
  
  void draw() {
    image(theUnwell, imgX,0);
  }

}

