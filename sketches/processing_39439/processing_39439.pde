
  // this builds upon/i made minor changes to...
 
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
 
// Exercise 13-5: Using Example 13-5, draw a spiral path. Start in the center and move 
// outward. Note that this can be done by changing only one line of code and adding one line 
// of code!           
 
// A Polar coordinate, radius now starts at 0 to spiral outwards
float r = 0;
float theta = 0;
color start=color(0,0,0);
color finish;
float amt = 0.0;
int startX = 20; 
int stopX = 160; 
int startY = 30; int 
stopY = 80; float x = startX; 
float y = startY; 
float step = 0.005; 
float pct = 0.0;
 
 
 
void setup() {
  size(400,400);
  background(0);
  smooth();
}
void draw() {
 amt+=.005;
 if (amt >= 1) {
   amt = 0.0;
   start = finish;
   colorMode(HSB);
   finish = color(random(255),random(255), 150);
 if (pct < 1.0) {
   x = startX + ((stopX-startX) * pct);
   y = startY + ((stopY-startX) * pct);
   pct += step;
 }
 }
 
  // Polar to Cartesian conversion
  float x = r * cos(theta);
  float y = r * sin(theta);
 
  // Draw an ellipse at x,y
  noStroke();
  // Adjust for center of window
  ellipse(x+width/2, y+height/2, 5, 5);
  fill(lerpColor(start,finish,amt));
 
  // Increment the angle
  theta += 0.09;
  // Increment the radius
  r += 0.09;
}
