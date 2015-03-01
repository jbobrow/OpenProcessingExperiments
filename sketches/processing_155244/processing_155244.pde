
int nbelements=50;
float k=.0003;
boolean onedragged=false;
Element [] elements=new Element[nbelements];

void setup() {
  size(600, 600);
  background(0);
  smooth(8);
  ellipseMode(CENTER);
  fill(255, 200);
  stroke(128);
  strokeWeight(.5);
  for (int i=0; i<nbelements; i++) {
    elements[i]=(new Element(i, width/2+150*sin(i*TWO_PI/nbelements), height/2+150*cos(i*TWO_PI/nbelements), 5+random(20)));
    //elements[i].display();
  }
}
void draw() {
  background(0);
  for (int i=0; i<nbelements; i++) {
    elements[i].run();
  }
}
void mousePressed() {

  for (Element e : elements) {
    if (2*dist(mouseX, mouseY, e.loc.x, e.loc.y)<e.m) {

      e.dragged=true;
      onedragged=true;
      break;
    }
  }
}
void mouseReleased() {
  for (Element e : elements) {
    //if(e.dragged)e.movespeed=new PVector(e.m,e.m);
    e.dragged=false;
  }
}
class Element {
  int index;
  float m, distpred, distnext;
  PVector loc;
  boolean dragged=false;
  PVector speed, speedpred, speednext;
  PVector movespeed=new PVector(0, 0);
  Element next, pred;

  Element(int index, float x, float y, float m) {
    this.index=index;
    this.m=m;
    loc=new PVector(x, y);
    speed=speedpred=speednext=new PVector(0, 0);
  }
  void run() {
    move();
    display();
  }
  void move() {

    if (dragged) {
      loc.x=mouseX;
      loc.y=mouseY;
    }
    Element next=elements[(index+1)%nbelements];
    distnext=dist(next.loc.x, next.loc.y, loc.x, loc.y)-(m+next.m)/2;
    speednext=new PVector(loc.x-next.loc.x, loc.y-next.loc.y);    
    Element pred=elements[(index-1+nbelements)%nbelements];
    distpred=dist(pred.loc.x, pred.loc.y, loc.x, loc.y)-(m+pred.m)/2;
    speedpred=new PVector(loc.x-pred.loc.x, loc.y-pred.loc.y);
    //k=max(0.00001, 0.000002*distnext);
    speednext.mult(distnext*(next.m+m)*k);
    //k=max(0.00001, 0.000002*distpred);
    speedpred.mult(distpred*(pred.m+m)*k);
    speed=PVector.add(speedpred, speednext);
    //speed.normalize();
    speed.limit(15);
    //speed.add(movespeed);
    if (!dragged)loc.sub(speed);
  }
  void display() {
    ellipse(loc.x, loc.y, m, m);
    line(loc.x, loc.y, elements[(index-1+nbelements)%nbelements].loc.x, elements[(index-1+nbelements)%nbelements].loc.y);
  }
}

