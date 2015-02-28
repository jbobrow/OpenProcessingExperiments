
float x, y;

void setup() {
  size(400, 600);
  background(255);
  rectMode(CENTER);
  x = width/2;
  y = height/2;
  noFill();
  strokeWeight(2);
  stroke(0, 50);
  for (int i = 0; i< 10; i++) {
    rect(x + random(-4, 4), y + random(-4, 4), .8*width, .8*height);
  }
  for (int i = int(.1*height); i < int(.9*height); i += 2) {
    strokeWeight(2);
    stroke(0, random(20, 225));
    line(.1*width+ random(-6, 6), i+random(-4, 4), .9*width + random(-6, 6), i+ random(-4, 4));
  }
}
