
int nbelements=50;
float k=.0003;
boolean onedragged=false;
Element [] elements=new Element[nbelements];

void setup() {
  size(600, 600);
  frameRate(200);
  background(0);
  smooth(8);
  ellipseMode(CENTER);
  imageMode(CENTER);
  fill(255, 200);
  stroke(255);
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
  float col;
  boolean dragged=false;
  PVector speed, speedpred, speednext;
  PVector movespeed=new PVector(0, 0);
  Element next, pred;

  Element(int index, float x, float y, float m) {
    this.index=index;
    this.m=m;
    loc=new PVector(x, y);
    col=color(128+random(128),128+random(128),128+random(128));
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
    boolean touch=false;
    PVector temploc=loc.get();
    float colspeed;
    temploc.sub(speed);
    for (Element e : elements) {
      while (e!=this && dist(temploc.x, temploc.y, e.loc.x, e.loc.y)<(m+e.m)/2) {
        touch=true;
        colspeed=new PVector(e.loc.x-loc.x, e.loc.y-loc.y);
        colspeed.limit(.1);
        e.loc.add(colspeed);
      }
    }
    if (!dragged ) {
      
      loc.sub(speed);
    }
  }
  void display() {
    fill(col,200);
        ellipse(loc.x, loc.y, m, m);
    line(loc.x, loc.y, elements[(index-1+nbelements)%nbelements].loc.x, elements[(index-1+nbelements)%nbelements].loc.y);
  }
}

