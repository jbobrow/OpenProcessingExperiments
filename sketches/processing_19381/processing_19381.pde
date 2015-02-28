
float angle = 0.0;
float x = -80.0;
float y = 30;
float c = 10.0;
void setup () {
  size(250, 250);
  background (0);
  smooth();
  noStroke();
    fill(250);
}
 // background circles
void draw () {
  c = c + 35;
  noFill();
  strokeWeight(10);
  stroke(255, 80);
  ellipse (125, 125, c, c);
  if ( c > 300) {
    c = 2;
  }
  // smaller circles with white streaks, circle the center (rotate)
  x = x + 0.3;
 if (x > - 40) {
    x = - 150;
 }
 y = y - 0.053; // reset value
if (y < 1) {
   y = 1;
}
  frameRate(30);
  fill(0, 12);
rect (0, 0, 250, 250);
fill(255);
angle = angle + 0.02;
translate (150, 100);
rotate (angle);


ellipse(x, -40, y, y);
ellipse(x - 40, 20, y, y);
ellipse(x - 80, 80, y, y);


}



