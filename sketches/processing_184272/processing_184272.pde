
int nbelements=30;
Element [] elements=new Element[nbelements];

void setup() {
  size(1200, 800);
  frameRate(1);
  smooth(8);
  ellipseMode(CENTER);
  colorMode(HSB, 360, 100, 100);
}
void draw() {
  dessine();
}
void dessine() {
  background(0,0,255);
  for (int i=0; i<nbelements; i++) {
    elements[i]=(new Element(i, random(width), random(height)));
  }
  for (int i=0; i<nbelements; i++) {
    pushMatrix();
    elements[i].run();
    popMatrix();
  }
}
class Element {
  int index;
  float x, y;
  float rot=random(-.2,.2);
  float ecart=random(.2);
  float strokew=random(3);
  int nbePoints=int(random(1, 16));
  int amp=int(random(20, 100));
  float hu=random(360);//random(50);//random(320,400)%360;//
  float sat=random(0, 250);
  float bril=random(0, 250);
  float alp=random(60);//255;//
  PVector point;
  ArrayList<PVector> points = new ArrayList<PVector>();
  Element(int index, float x, float y) {
    this.index=index;
    this.x=x;
    this.y=y;
    points.add(new PVector(0, 0, random(50, 170)));    
    for (int i=1; i<=3*nbePoints; i++) {     
      if (i%3==1 && i!=1) {
        point=points.get(i-2);
        points.add(new PVector(2*points.get(i-1).x-point.x, 2*points.get(i-1).y-point.y, point.z+random(-amp*ecart, amp*ecart)));
      } else {
        point=points.get(i-1);
        points.add(new PVector(point.x+random(-amp, amp), point.y+random(-amp, amp), point.z+random(-amp*ecart, amp*ecart)));
      }
    }
  }
  void mutate() {
    for (PVector p : points) {
      p.x*=random(.9, 1.1);
      p.y*=random(.9, 1.1);
      p.z*=random(.9, 1.1);
    }
  }
  void run() {
    fill(hu, sat, bril, alp);
    strokeWeight(strokew);
    display();
  }
  void display() {
    translate(x, y);
    for (int i=0; i<points.size ()-3; i+=3) { 
      stroke(hu, sat/8, bril/8, points.get(i).z);     
      bezier(points.get(i).x, points.get(i).y, points.get(i+1).x, points.get(i+1).y, points.get(i+2).x, points.get(i+2).y, points.get(i+3).x, points.get(i+3).y);
    }
    while (random (1)<.97) {
      //if (random(1)>.5)  mutate();
      translate(random(-amp*ecart, amp*ecart), random(-amp*ecart, amp*ecart));
      if (random(1)>.4) {
        scale(.97);
      }
      if (random(1)>.4) {;
        rotate(rot);
      }
      for (int i=0; i<points.size ()-3; i+=3) {
        stroke(hu, sat/8, bril/8, points.get(i).z);
        bezier(points.get(i).x, points.get(i).y, points.get(i+1).x, points.get(i+1).y, points.get(i+2).x, points.get(i+2).y, points.get(i+3).x, points.get(i+3).y);
      }
    }
  }
}



