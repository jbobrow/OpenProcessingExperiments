
int num = 4;
int circles = 20;
int steps = 120;
float theta, r;

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  background(#322030);
  translate(width/2, height/2);
  pushMatrix();
  rotate(r);
  for (int i=0; i<num; i++) {
    int d=i%2==0?-1:1;
    createCircle(30+i*50, d, i);
  }
  popMatrix();
  theta += (TWO_PI/steps);
  r = theta/circles;
  //if (r<(TWO_PI/circles)) saveFrame("image-###.gif");
}

void createCircle(int x, int dir, int col) {
  for (int i=0; i<circles; i++) {
    pushMatrix();
    float offSet = TWO_PI/circles*i;
    rotate(offSet);
    float max = map(x, 0, width/2, 5, 60);
    float min=max/10    ;
    float sz = map(sin(r+theta*dir+offSet), -1, 1, min, max);
    float a = map(sin(r+theta*dir+offSet), -1, 1, 100, 255);
    fill(#FCFDEB, a);
    ellipse(x, 0, sz, sz);
    popMatrix();
  }
}

