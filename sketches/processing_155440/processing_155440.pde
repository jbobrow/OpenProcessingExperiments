
boolean onedragged=false;
ArrayList <Wheel> wheels=new ArrayList <Wheel>();
int margin=30;
int rang=4;
void setup() {
  size(800, 800);
  background(0);
  smooth(8);
  ellipseMode(CENTER);
  fill(255, 200);
  stroke(128);
  strokeWeight(.5);
  noStroke();
  float rad=(width+4*margin)/(rang+1);
  for (int i=1; i<rang+1; i++) {
    for (int j=1; j<rang+1; j++) {
        wheels.add(new Wheel(1-2*int((rang*i+j)%2==0),i* rad-2*margin, j*rad-2*margin, rad*.35, 15));
    }
  }
}
void draw() {
  background(0, 0, 255);
  for (Wheel w : wheels) {
    w.display();
  }
}
class Wheel {
  Element [] elements;
  float centerx, centery, radius; 
  int nb, sens;
  Wheel(int sens, float centerx, float centery, float radius, int nb) {
    elements=new Element[nb];
    this.centerx=centerx;
    this.centery=centery;
    this.radius=radius;
    this.nb=nb;
    this.sens=sens;
    for (int i=0; i<nb; i++) {
      elements[i]=new Element(sens, radius/6, radius/2);
    }
  }
  void display() {
    for (int i=0; i<nb; i++) {
      pushMatrix();
      translate(centerx, centery);
      rotate(i*TWO_PI/nb);
      translate(0, radius);
      elements[i].display();
      popMatrix();
    }
  }
}
class Element {

  float w, h;
  float col0, col1, col2;
  int sens;

  Element(int sens, float w, float h) {
    this.w=w;
    this.h=h;
    this.sens=sens;
    col0=0;
    col1=color(240, 128,0);
    col2=255;
  }

  void display() {    
    fill(col0);
    ellipse(-sens*w/5, 0, w*1.2, h*1.2);
    fill(col2);
    ellipse(sens*w/5, 0, w*1.2, h*1.2);
    fill(col1);
    ellipse(0, 0, w, h);
  }
}



