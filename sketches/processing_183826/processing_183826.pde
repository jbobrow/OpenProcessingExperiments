
int nbelements=200;
float hu,sat,bril,alp;
Element [] elements=new Element[nbelements];

void setup() {
  size(1200, 800);
  frameRate(1);
  smooth(8);
  ellipseMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  //noFill();
  strokeWeight(.5);
  
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
    hu=random(360);//random(320,400)%360;
    sat=random(50,250);
    bril=random(50,100);
    alp=random(10);
    fill(hu,sat,bril,alp);
    pushMatrix();
    elements[i].run();
    popMatrix();
  }
}
class Element {
  int index;
  float x,y;
  float rot=random(.1);
  float ecart=random(.2);
  int nbePoints=int(random(1,6));
  int amp=int(random(10,150));
  ArrayList<PVector> points = new ArrayList<PVector>();
  Element(int index, float x, float y) {
    this.index=index;
    this.x=x;
    this.y=y;
    points.add(new PVector(0,0,random(50,170)));
    PVector point;
    for(int i=0;i<4*nbePoints;i++){
      point=points.get(i);
      points.add(new PVector(point.x+random(-amp,amp),point.y+random(-amp,amp),point.z+random(-amp,amp)));
    }
  }
  void mutate(){
    for (PVector p :points){
      p.x*=random(.9,1.1);
      p.y*=random(.9,1.1);
      p.z*=random(.9,1.1);
    }
  }
  void run() {
    display();
  }
  void display() {
    translate(x,y);
    for(int i=0;i<points.size()-3;i+=3){
      stroke(hu,sat/8,bril/8,points.get(i).z);
      //stroke(0,points.get(i).z);
      bezier(points.get(i).x,points.get(i).y,points.get(i+1).x,points.get(i+1).y,points.get(i+2).x,points.get(i+2).y,points.get(i+3).x,points.get(i+3).y);
    }
    while(random(1)<.99){
    if(random(1)>.5)  mutate();
    translate(random(-amp*ecart,amp*ecart),random(-amp*ecart,amp*ecart));
    if(random(1)>.5)rotate(rot);
    for(int i=0;i<points.size()-3;i+=3){
       stroke(hu,sat/8,bril/8,points.get(i).z);
       //stroke(0,points.get(i).z);
      bezier(points.get(i).x,points.get(i).y,points.get(i+1).x,points.get(i+1).y,points.get(i+2).x,points.get(i+2).y,points.get(i+3).x,points.get(i+3).y);
    }
    }
  }
}



