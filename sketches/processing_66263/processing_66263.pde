
float phi=1.6180339887498948482045868343656381177203091798057628;
float golden_angle=TWO_PI/phi;
float da=TWO_PI/360;
int t;

void setup() {
  size(512, 512);
  smooth();
  draw_figure();
}

void draw() {
}

void draw_figure() {
  float a=0;
  float x0=width/2;
  float x1, x2;
  float y0=height/2;
  float y1, y2;
  float r=height*2/3;
  background(255, 255, 192);
  stroke(0);
  //fill(255);
  while(r>32) {
    x1=x0+r*cos(a+da);
    y1=y0+r*sin(a+da);
    x2=x0+r*cos(a-da);
    y2=y0+r*sin(a-da);
    fill(0, r/2, r/2, t);
    beginShape();
    vertex(x0, y0);
    bezierVertex(x1, y1, x2, y2, x0, y0);
    endShape();
    r/=1.01;
    a+=golden_angle;
  }
}

void mouseMoved() {
  //da=abs(mouseX-width/2)/8*TWO_PI/360;
  da=mouseX/10*TWO_PI/360;
  t=int(mouseY*255/(height-1));
  draw_figure();
}

void mousePressed() {
  draw_figure();
}

void keyPressed() {
  draw_figure();
}
