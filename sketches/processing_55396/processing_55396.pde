
import processing.opengl.*;

int h;
int w;
int thickness;

int x;
int y; 


void setup () {
  size (500,500);
  
  h = 20;
  w = 100;
  
  x = 0;
  y = 120;
  
  
}

void draw (){
  background (255);
  stroke(0xFF70E320);
  strokeWeight(100);
  x = (int) random (500);
  y = (int) random (500);
    line (x, y, x+w, y);
  line (x, y+h, x+w, y+h);
  line (x, y, x, y+h);
  line (x+w, y, x+w, y+h);
  
 
  
}

