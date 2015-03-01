
int num = 50;
float theta, yStart;

void setup() {
  size(500, 500);
  noFill();
  strokeCap(SQUARE);
}

void draw() {
  background(#202020);
  translate(width/2, height/2);
  strokeWeight(2);
  stroke(#FFFF00, 200);
  for (int i=0; i<num; i++) {
    fill(#FFFF00, 60);
    pushMatrix();
    float offSet = TWO_PI/num*i;
    rotate(offSet);
    float sz = map(sin(theta+offSet*(num/10)), -1, 1, 50, 250);
    float x = map(sin(theta),-1,1,0,250);
    float start = theta;
    float end = start + PI;
    yStart = width*.1;
    arc(x, yStart, sz, sz, start, end);
    popMatrix();
  }    
  theta += 0.0523;
}

