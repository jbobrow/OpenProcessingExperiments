
/**
 * Clock. 
 * 
 * The current time can be read with the second(), minute(), 
 * and hour() functions. In this example, sin() and cos() values
 * are used to set the position of the hands.
 */

void setup() {
  size(500, 500);
  stroke(255);
  smooth();
}
void draw() {
  background(0);
  fill(#FFFFFF);
  noStroke();
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  fill(#EBEBEB); //fill the next shape with white color 
  
     beginShape();//begin drawing the shape -- It's a big star 
    vertex(125, 0);
vertex(250, 75);
vertex(375, 0);
vertex(375, 150);
vertex(500, 250);
vertex(375, 300);
vertex(375, 450);
vertex(250, 375);
vertex(125, 450);
vertex(125, 300);
vertex(0, 250);
vertex(125, 150);
 
     endShape();//end of the shape
  stroke(#000000 );
  strokeWeight(4);
  line(250, 230, cos(s) * 100 + 220, sin(s) * 100 + 220);
  strokeWeight(6);
  line(250, 230, cos(m) * 80 + 220, sin(m) * 80 + 220);
  strokeWeight(10);
  line(250, 230, cos(h) * 40 + 220, sin(h) * 40 + 220);
{
  if (keyPressed == true) {
   stroke(#87CEFA);
  } else {
    stroke(#CD2626);
    strokeWeight(5);
  }
  point(30, 20);
point(48, 120);
point(80, 40);
point(300, 500);
point(230, 444);
point(450, 345);
point(400, 20);
}  
{
  if (keyPressed == true) {
   stroke(#CD2626);
  } else {
    stroke(#87CEFA);
  }
 point(450, 300);
point(100, 450);
point(240, 555);
point(100, 55);
point(23, 304);
}




  // Draw the minute ticks
  //strokeWeight(2);
  //for (int a = 0; a < 360; a+=6) {
    //float x = 100 + ( cos(radians(a)) * 72 );
    //float y = 100 + ( sin(radians(a)) * 72 );
    //point(x, y);
 // }
}

