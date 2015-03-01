
int nbelements=500;
float len=100;
Element [] elements=new Element[nbelements];

void setup() {
  size(1200, 800);
  frameRate(1);
  smooth(8);
  ellipseMode(CENTER);
  fill(255);
  //stroke(0);
  strokeWeight(.4);
  
}
void draw(){
  dessine();
}
void dessine() {
  background(255);
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
  float rot=random(.1);
  PVector loc;
  int amp=int(random(5,50));
  ArrayList<PVector> points = new ArrayList<PVector>();
  Element(int index, float x, float y) {
    this.index=index;
    loc=new PVector(x, y,random(150,180));
    points.add(new PVector(0,0,random(150,180)));
    while(random(1)<.8){
      points.add(new PVector(points.get(points.size()-1).x+random(-amp,amp),points.get(points.size()-1).y+random(-amp,amp),points.get(points.size()-1).z+random(-amp,amp)));
    }
  }
  void mutate(){
    for (PVector p :points){
      p.x*=random(.8,1.2);
      p.y*=random(.8,1.2);
    }
  }
  void run() {
    display();
  }
  void display() {
    translate(loc.x,loc.y);
    for(int i=0;i<points.size()-1;i++){
      stroke(0,points.get(i).z);
      line(points.get(i).x,points.get(i).y,points.get(i+1).x,points.get(i+1).y);
    }
    while(random(1)<.95){
      mutate();
    translate(random(-amp,amp),random(-amp,amp));
    rotate(rot);
    for(int i=0;i<points.size()-1;i++){
      stroke(0,points.get(i).z);
      line(points.get(i).x,points.get(i).y,points.get(i+1).x,points.get(i+1).y);
    }
    }
  }
}



