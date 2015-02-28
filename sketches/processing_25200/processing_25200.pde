
import processing.pdf.*;

void setup() {
  size(500, 500);
  noLoop();
  background(255,112,3,50);
  smooth();
  noStroke();
 

}


void draw() {
  //draw something here
  fill(119,126,245,80);
  int ellipseCount = 60;
  int i = 1;
  while(i < ellipseCount +1) {
    float s = random(10, 150);
    ellipse(random(width), random(height), s, s);
    i += 1;
   
  
  }
}


                
                
