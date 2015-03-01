
int circles = 20;
int steps = 120;
float theta,r;

void setup() {
  size(500, 500);
}


void draw() {
  background(255);
  translate(width/2, height/2);
  pushMatrix();
  rotate(r);
  for (int i=0; i<circles; i++) {
    pushMatrix();
    float offSet = TWO_PI/circles*i; 
    rotate(offSet);
    float sz = map(sin(theta+offSet), -1, 1, 5, 40);
    ellipse(150, 0, sz, sz);
    popMatrix();
  }
  popMatrix();
  theta += (TWO_PI/steps);
  r = theta/circles;
  //if (frameCount%2==0 && r<(TWO_PI/circles+radians(.5))) saveFrame("image-###.gif");
}

