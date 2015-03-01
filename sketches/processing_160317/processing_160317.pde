
int num=100;
float theta;

void setup() {
  size(500, 500);
  rectMode(CENTER);
}

void draw() {
  background(240);
  stroke(240,150);
  fill(20);
  //noFill();
  float x=200, y=-150;
  float r=PI/8;
  float incrY=height/num;
  for (int i=0; i<num; i++) {
    float offSet=TWO_PI/num*i;
    float sz = 60+i*5;
    pushMatrix();
    rotate(r+i*radians(2));
    x += 4;
    y += incrY/5;
    translate(x, y);  
    float sz2 = sz*map(sin(theta+offSet*2), -1, 1, 1, 2);  
    rect(0, 0, sz2, sz2);
    popMatrix();
  }
  theta += .0523/2;
  
}

