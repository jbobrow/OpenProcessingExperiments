
int circles = 20;
int steps = 120;
float theta,r;
 
void setup() {
  size(500, 500);
}
 
 
void draw() {
  background(#1D0B31);
  translate(width/2, height/2);
  pushMatrix();
  rotate(r);
  noStroke();
  for (int i=0; i<circles; i++) {
    pushMatrix();
    float offSet = TWO_PI/circles*i;
    rotate(offSet);
    float sz = map(sin(r+theta+offSet), -1, 1, 5, 50);
    float x = 180;
    //stroke(255);
    fill(#FFA100);
    ellipse(x, 0, sz, sz);
    fill(#1D0B31);
    ellipse(x, 0, sz*.5, sz*.5);

    float sz2 = map(sin(-theta+r+offSet), -1, 1, 5, 30);
    float x2 = 110;
    //stroke(255);
    fill(#FFA100);
    ellipse(x2, 0, sz2, sz2);
    fill(#1D0B31);
    ellipse(x2, 0, sz2*.5, sz2*.5);
    popMatrix();
  }
  popMatrix();
  theta += (TWO_PI/steps);
  r = theta/circles;
  //if (r<(TWO_PI/circles)) saveFrame("image-###.gif");
}

