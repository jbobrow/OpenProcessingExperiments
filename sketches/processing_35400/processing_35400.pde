
// this is a practice

void setup () {

  size (500, 500);
  frameRate (10);
  
  smooth ();
  background (255, 10,10,50);
  line (0, 0, 500, 500);
  fill (0,255,0,100);
  ellipse (250,250,100,200);

}

void draw () {
  int d= 50;
  noStroke();
  fill (random (100), random (10), random (255), 100);
  ellipse (random (200), random (200),random(d), d);
}

