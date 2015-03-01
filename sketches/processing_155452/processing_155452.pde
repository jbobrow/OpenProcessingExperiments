
float r;
int sz = 220;

void setup() {
  size(500, 500);
  rectMode(CENTER);
  noFill();
  strokeWeight(3);
}


void draw() {
  background(#7E0505);
  stroke(255);
  translate(width/2, height/2);
  for (int i=0; i<15; i++) {
    ellipse(0, 0, 80+20*i, 80+20*i);
  }
  pushMatrix();
  rotate(r);
  rect(0, 0, sz, sz);
  popMatrix();

  r += .01;
 // if (frameCount%2==0 && r<PI/2) saveFrame("img-###.gif");
}

