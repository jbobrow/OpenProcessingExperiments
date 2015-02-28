

 
import de.looksgood.ani.*;

float x = 256;
float y = 256;

PFont font;

void setup() {
  size(500,500);
  smooth();
  noStroke();


font = loadFont("DINPro-Bold-48.vlw");
 
  Ani.init(this);
}

void draw() {
  background(255);
  textFont(font, 48);
  textAlign(CENTER, BASELINE);
  fill(0);
  text("CAUTIOUS",x,y);
}

void mouseReleased() {
   
    Ani.to(this, 0.5, 1, "x", mouseX);
    Ani.to(this, 0.5, 1, "y", mouseY);
}


