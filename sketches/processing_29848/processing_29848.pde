
int dovs;

void setup() {
  size(300,300);
  dovs=7;
}

void draw() {
  background(202);
  translate(width*.5,height*.5);
  color[] colors = new color[2];
  colors[0] = color(255);
  colors[1] = color(255,0,0);
  float a=PI;
  for (int i=0;i<dovs;i++) {
    fill(colors[i%colors.length]);
    dovela(0,0,a,a+PI/dovs,width*.2,width*.4);
    a+=PI/dovs;
  }
}

void dovela(float x, float y, float alfa, float beta, float r1, float r2) {
  pushMatrix();
  translate(x,y);
  beginShape();
  vertex(x+r1*cos(alfa), y+r1*sin(alfa));
  vertex(x+r2*cos(alfa), y+r2*sin(alfa));
  vertex(x+r2*cos(beta), y+r2*sin(beta));
  vertex(x+r1*cos(beta), y+r1*sin(beta));
  endShape(CLOSE);
  popMatrix();
}

void mouseClicked() {
  if (dovs<23) dovs+=2;
  else dovs=5;
}               
