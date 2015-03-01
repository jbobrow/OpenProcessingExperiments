
int circles = 12;
int steps = 120;
float theta, r;

void setup() {
  size(600, 600);
  smooth();
}


void draw() {
  background(255, 255, 255, 0);
  translate(width/2, height/2);
  pushMatrix();
  rotate(r);
  noStroke();
  for (int i=0; i<circles; i++) {
    pushMatrix();
    float offSet = TWO_PI/circles*i;
    rotate(offSet);


    float sz2 = map(sin(-theta+r+offSet), -1, 2, 150, 300);
    float x2 = 120;
    //stroke(255);
    fill(180, 240, 168, 99);
    ellipse(x2-20, 0, sz2*1.2, sz2*1.2);
    fill(106, 199, 44);
    arc(x2-30, -10, sz2*.5, sz2*.5, 0, PI+(QUARTER_PI/2), OPEN);
    //ellipse(x2-30, -10, sz2*.5, sz2*.5);
    popMatrix();
  }
  popMatrix();
  theta += (TWO_PI/steps);
  r = theta/circles;
  //if (r<(TWO_PI/circles)) saveFrame("image-###.gif");
}

