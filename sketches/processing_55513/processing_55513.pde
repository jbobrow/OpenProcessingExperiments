
/* Amirreza Chabouk
   YSDN - Winter 2012
   Vibrate
*/
void setup() {
  size(250, 250);// Canvas size
  background(0);//background color
  smooth();// anti-aliasing
}

void draw() {
  background (0);
  stroke(255);
  fill(0);
  stroke(255);
  arc(125, 250, 110, 110, random(PI), random(TWO_PI));//Randomizing arc position
  arc(125, 250, 150, 150, random(PI), random(TWO_PI));
  arc(125, 250, 180, 180, random(PI), random(TWO_PI));
  arc(125, 250, 210, 210, random(PI), random(TWO_PI));

  arc(125, 250, 250, 250, random(PI), random(TWO_PI));
  arc(125, 250, 300, 300, random(PI), random(TWO_PI));
  noStroke();
  fill(random(255), 0, random(255));
  ellipse(125, 250, 100, 100);
  fill(10, 10, 225);
  ellipse(125, 250, 90, 90);
}


