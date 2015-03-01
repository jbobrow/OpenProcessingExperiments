
float xl = 3;
float yl = 1;

float xo = -5;
float yo = -20;

float xv = -50;
float yv = -50;

float xe = 0;
float ye = 0;

int h = 0;

void setup() {
  size(500, 500);
  colorMode(HSB);
  background(255);
  strokeWeight(5);
}

void draw() {
  translate(width/2, height/2);
  scale(1, -1);
  h = (h < 255) ? h + 1 : 0;
  stroke(h, 255, 255);
  l();
  o();
  v();
  e();
  
}

void l(){
  pushMatrix();
  translate(-220, 0);
  xl = (xl < 100) ? xl+0.25 : 3;
  yl=(1/xl)*300;
  point(xl,yl);
  popMatrix();
}

void o(){
  pushMatrix();
  translate(-25, 0);
  int zm = 20; //zoom
  xo = (xo < 5) ? xo+0.05 : -5;
  yo=sqrt(9-sq(xo))*zm;
  point(xo*zm,yo);
  popMatrix();
}

void v(){
  pushMatrix();
  translate(90, 0);
  xv = (xv < 50) ? xv+1 : -50;
  yv = abs(-2*xv);
  point(xv, yv);
  popMatrix();
}

void e(){
  pushMatrix();
  translate(218, -14);
  int zm = 20;
  ye = (ye < 6.25) ? ye+0.05 : 0;
  xe = -3*abs(sin(ye))*zm;
  point(xe, ye*zm);
  popMatrix();
}
