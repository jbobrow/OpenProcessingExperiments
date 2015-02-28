
/** Night Sky
* By Mandy Trexel
* Created Sept. 15, 2010
* cos(x)*r = x
* sin(x)*r = y
*/

void setup() {
 size (800, 600); 
 background(0);
 
 noStroke();
 ellipse(600, 200, 150, 220);
 fill(0);
 ellipse(626, 200, 105, 175);
 
 noFill();
 for (int i=0; i< 600; i++) {
   color fc = color(int(random(0, 100)), 225, 255, 70);
   /* void polyStar(float x, float y, int pts, float outerRad, float innerRad, 
  color fillCol, color strokeCol, float strokeWt, float theta) */
   polyStar(random (width), random(height), int(random(8, 16)),
   10, -5, fc, PI/4.0);
 endShape(CLOSE);
 }
 
}

