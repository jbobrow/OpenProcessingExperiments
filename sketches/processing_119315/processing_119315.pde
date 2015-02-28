
int angl;

int index=0;
int x=600;
int y=250;

int rr=50;
float n;
int h_hu=0;

void setup() {
   size(1300, 566, P2D);
  colorMode(HSB, 8800);
  background(0);
  strokeJoin(BEVEL);
  strokeWeight(1);
  frameRate(60);
  noFill();
 // noCursor();
 smooth();
}

void draw() {
 strokeWeight(20-mouseY/30);
  h_hu+=2.2;
  if (h_hu>8800) {
    h_hu=0;
  }

   stroke(h_hu,8800,8800,8800);
  if (frameCount % 8000==0) {
    background(0);
  }
  beginShape();

  vertex(x, y);
  n=random(-1, 1);
  if (n>0) {
    angl+=60;
  }
  if (n<0) {
    angl-=60;
  }

  rr=int(random(5, 20+mouseX/20));
  x=x-int(rr*cos(radians(angl)));
  y=y+int(rr*sin(radians(angl)));
  vertex(x, y);

  endShape();

  if (x<0) {
    x+=width;
  }
  if (x>width) {
    x-=width;
  }
  if (y>height-100) {
    y-=height;
  }
  if (y<0) {
    y+=height;
  }
}



void mousePressed(){
noLoop();
}
