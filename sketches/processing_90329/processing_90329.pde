
import processing.opengl.*;
import rita.*;

PImage wall;
RiGrammar rg;
RiText rt;

void setup()
{
  size(860,650); 

  RiText.setDefaultFont("Chalkboard-20.vlw");
  RiText.setDefaultColor(255,255,255);
  rg = new RiGrammar(this, "classgrammar.g");
    rt = new RiText(this, rg.expand());

  wall = loadImage("memex.jpg");
  // photo credit: "the red brick wall" (flickr.com/people/raveneye)
  image(wall, 0, 0);
  
}

void draw() {
  tint(100);
image(wall, 0, 0);

}

void mouseClicked() { 
  RiText.deleteAll();
  RiText[] lines = RiText.createLines(this, rg.expand(), 50, 170, 70);
 
}


