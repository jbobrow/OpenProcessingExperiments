
/* 
Jenny Hsu
Benjamin Bacon
Creative Computing Section B
26 February 2014

The Processing State of Mind... 
*/

void setup() {
  size(400, 400);
  noStroke();
  smooth();
}

void draw() {
  background (random(0, 255), random(0, 100));

  PImage dazed = loadImage ("dazed.png");
  image (dazed, 0, -80);

  PImage confused = loadImage ("confused.png");
  image (confused, 15, 90);

  PImage and = loadImage ("and.png");
  image (and, -110, 12);

// might I add "neurosis" next...

  fill (random(0, 255));
  rect(0, height-mouseY, 400, 300); //if you want to hide the words partially
}



