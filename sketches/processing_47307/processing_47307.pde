
import processing.pdf.*;


int x;
int y;

void setup() {
  
  size(800,800);
  background(0);
  colorMode(HSB);
  x = 100; 
  y = 0;

noCursor();
}
  void draw() {
    
    x = (x+2) % 250;
  y = (y+2) % 250;

    noStroke();
   smooth();
 
   fill(y,255,255,25);
   rect(mouseY, mouseX, 20, 20);
   fill(x,255,255,25);
   rect(mouseX, mouseY, 20, 20);
 
   if(mousePressed)
  
  background(y);
redraw();
 if(x == 25) {
    }
    }

