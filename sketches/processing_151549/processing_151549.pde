
Element [] elements;
int nbeElements;
void setup(){
  size(800,800);
  nbeElements=50;
  elements= new Element[nbeElements];
  ellipseMode(CENTER);
  background(0);
  for(int i=0;i<nbeElements;i++){
    elements[i]=new Element(i);    
  }
}
void draw(){
  //background(0);
  for(int i=0;i<nbeElements;i++){
    elements[i].run();    
  }
}
class Element {
  PVector pos;
  PVector speed;
  float maxspeed;
  int index;
  float mindia,maxdia,dia,col;

  Element(int index) {
    this.index=index;
    mindia=30;
    maxdia=120;
    dia=random(mindia, maxdia);
    pos=new PVector(dia/2+random(width-dia),dia/2+random(height-dia));
    maxspeed=1;
    speed=new PVector(random(-maxspeed,maxspeed), random(-maxspeed, maxspeed));   
    if(index%2==0)col=color(255,0,0,20);
   else col=color(255,25); 
  }
  void testBoundary() {
    if (pos.x>=width-dia/2||pos.x<=dia/2)speed.x=-speed.x;
    if (pos.y>=height-dia/2||pos.y<=dia/2)speed.y=-speed.y;
  }
  void testCollision() {
    stroke(col);
    strokeWeight(.1);
    for(int i=0;i<nbeElements;i++){
      Element myElement=elements[i];
      if(i!=index){
        if(dist(myElement.pos.x,myElement.pos.y,pos.x,pos.y)<dia/2+myElement.dia/2){        
          line(myElement.pos.x,myElement.pos.y,pos.x,pos.y);
        }
      }
    }
  }
  void run() {
    testBoundary();
    testCollision();
    pos.add(speed);
    display();
  }

  void display() {
    noFill();
    stroke(0,128,0, 5);
    strokeWeight(.1);
    ellipse(pos.x, pos.y, dia, dia);
  }
}



