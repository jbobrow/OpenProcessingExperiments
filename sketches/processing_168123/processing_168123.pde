
float[] x = new float[500];
float[] y = new float[500];
float segLength = 0;
int quantosSegmentos=500;
float dureza=1.2; //dureza da mola que liga os pontos 
void setup() {
  size(1000, 500);
  //size(displayWidth, displayHeight);
  strokeWeight(.25);
  stroke(255,0,0, 100);
  background(255);
  fill(0);
  text("click and drag to draw", 20, 470);
  text("'c' to clean up the screen", 20, 490);
}

void draw() {
  //background(0);
  //fill(0, random(10));
  //rect(0,0,width,height);
  if (mousePressed) {
    dragSegment(0, mouseX, mouseY);
    for (int i=0; i<quantosSegmentos-1; i++) {
      dragSegment(i+1, x[i], y[i]);
    }
  }
  else{
     for (int i=0; i<quantosSegmentos-1; i++) {
      x[i] = mouseX;
      y[i] = mouseY;
    }
  }
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float tx;
  float ty;
  float angle = atan2(dy, dx);  
  tx = (xin-cos(angle) * segLength);
  ty =(yin - sin(angle) * segLength);
  x[i]+=(tx-x[i])/dureza;
  y[i]+=(ty-y[i])/dureza;
  if (i>0) segment(x[i-1], y[i-1], x[i], y[i]);
}

void segment(float x, float y, float x1, float y1) {

  line(x, y, x1, y1);
}

void keyPressed() {
  if (key=='c') background(255);
}
