
PImage img; 
PFont font;

int num=100;
FCurve[]fc=new FCurve[num];
 
void setup() {
  size(600, 600);
  img = loadImage ("leaves.jpg");
  smooth();
  for (int i=0; i<num; i++) {
    fc[i]=new FCurve(random(-125, 100), random(5, 30), random(560),
    random(-1, 1), random(200));
  }
  
  font = loadFont("FranklinGothic-Medium-30.vlw");
}
 
void draw() {
  background(255);
  image (img, 0, 0); 
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    fc[i].update();
    fc[i].display();
  }
  
  textFont (font); 

  fill (153, 204, 255);
  text ("#regrowth #nature #nofilter #walk", -220, -230);
}
 
class FCurve {
  float mY, CX, angle, anam, ff;
  FCurve(float nMY, float nCX, float nAngle, float nAnam, float nFf) {
    mY=nMY;
    CX=nCX;
    angle=nAngle;
    anam=nAnam;
    ff=nFf;
  }
 
  void update() {
    angle=angle+anam;
  }
 
  void display() {
    pushMatrix();
    rotate(radians(angle));
    fill(255, 204, ff);
    noStroke();
    bezier(0, 0, CX, mY-mY/2, CX, mY-mY/3, 0, mY);
    bezier(0, 0, -CX, mY-mY/2, -CX, mY-mY/3, 0, mY);
    popMatrix();
  }
}


