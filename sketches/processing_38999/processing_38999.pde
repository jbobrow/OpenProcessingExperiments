
void setup() {
  size(400, 400);
  smooth();
  noFill();
  background(0);
}


//This draws the arcs with a 50% chance of either red or white.
void draw() {
  for (int x=0; x<=width; x+=20) { 
    for (int y=0; y<=height; y+=80) {
      if (random(2)>1) { 
        stroke(255, 0, 0);
        arcs(x, y);
      }
      else {
        stroke(255);
        arcs(x, y);
      }
    }
  }
  noLoop();
}

//This draws the arcs.
void arcs(float x, float y) {
  pushMatrix();
  translate(x, y);
  arc(0, -20, 40, 40, -PI/2, PI/2);
  arc(0, 20, 40, 40, PI/2, (TWO_PI)-PI/2);
  popMatrix();
}


