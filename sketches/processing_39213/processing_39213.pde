
// Alex Nelson

void setup() {
  background(0);
  size(400, 400);
  smooth();
}

//setting up the variation and spacing 
void draw() {
  for (int a=15; a<height; a+=30) {
    for (int b=20; b<width; b+=35) {
      float r = random(0,2);
      if (r>1) {
        dot(a, b);
      } 
      else {
        circle(a, b);
      }
    }
  }
  noLoop();
}


//white and black circles outlined in white
void circle(int a, int b) {
  pushMatrix(); 
  translate(a, b);
  ellipseMode(CORNERS);
  ellipse(0, 0, 30, 30);
  fill(255,255,0);
  fill(0);
  stroke(255);
  popMatrix();
}

//small white ellipses
void dot(int a, int b) {
  pushMatrix();
  translate(a,b);
  fill(255);
  ellipseMode(CORNERS);
  ellipse(0, -8, -12, 0);
  popMatrix();
}

