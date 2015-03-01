
ArrayList <Element>elements;
int nbeElements;
PGraphics linesLayer,circlesLayer;
int seeElements=0;
 
void setup() {
  size(800, 800);
  frameRate(200);
  colorMode(HSB);
  nbeElements=130;
  linesLayer=createGraphics(width, height);
  linesLayer.beginDraw();
  linesLayer.background(0, 0);
  linesLayer.colorMode(HSB);
  linesLayer.endDraw();
  circlesLayer=createGraphics(width, height);
  circlesLayer.beginDraw();
  circlesLayer.background(0, 0);
  circlesLayer.colorMode(HSB);
  circlesLayer.endDraw();
 
  elements= new ArrayList<Element>();
  ellipseMode(CENTER);
  background(0);
  for (int i=0; i<nbeElements; i++) {
    elements.add(new Element(i));
  }
}
void draw() {
    background(0);

  for (int i=0; i<nbeElements; i++) {
    elements.get(i).run();
  }
  image(linesLayer, 0, 0);

  if (seeElements>=1){
    
    image(circlesLayer,0,0);
    circlesLayer.beginDraw();
    circlesLayer.background(0, 0);
    circlesLayer.endDraw();
  }
}
void mouseReleased() {
  seeElements++;
  seeElements=seeElements%3;
  //if(seeElements==0)background(0);
  //else image(linesLayer,0,0);
}
 
class Element {
  PVector pos;
  PVector speed;
  float maxspeed;
  int index;
  float mindia, maxdia, dia, col;
 
  Element(int index) {
    this.index=index;
    mindia=30;
    maxdia=80;
    dia=random(mindia, maxdia);
    pos=new PVector(dia/2+random(width-dia), dia/2+random(height-dia));
    maxspeed=3;
    speed=new PVector(random(-maxspeed, maxspeed), random(-maxspeed, maxspeed));  
    if (index%2==0)col=color(255, 255, 255, 30);
    else col=color(200, 255, 255, 30);
  }
  void testBoundary() {
    if (pos.x>=width-dia/2||pos.x<=dia/2)speed.x=-speed.x;
    if (pos.y>=height-dia/2||pos.y<=dia/2)speed.y=-speed.y;
  }
  void testCollision() {
    linesLayer.beginDraw(); 
    linesLayer.strokeWeight(.1);
    for (int i=0; i<nbeElements; i++) {
      Element myElement=elements.get(i);
      if (i!=index) {
        float dst=dist(myElement.pos.x, myElement.pos.y, pos.x, pos.y);
        if (dst<dia/2+myElement.dia/2) {   
          linesLayer.stroke(color(map(dst, 0, dia/2+myElement.dia/2, 10, 1000)%255, 180, 255, 25));
          linesLayer.line(myElement.pos.x, myElement.pos.y, pos.x, pos.y);
          if (seeElements>=1) {
            circlesLayer.beginDraw();
            circlesLayer.stroke(color(map(dst, 0, dia/2+myElement.dia/2, 10, 1000)%255, 180, 255, 125));
            circlesLayer.line(myElement.pos.x, myElement.pos.y, pos.x, pos.y);
            circlesLayer.endDraw();
          }
        }
      }
    }
    linesLayer.endDraw();
  }
  void run() {
    testBoundary();
    if (seeElements==2)display();
    testCollision();
    pos.add(speed);
  }
 
  void display() {
    circlesLayer.beginDraw();
    circlesLayer.fill(0,255,255,15);
    circlesLayer.stroke(150, 255, 255,186);
    circlesLayer.strokeWeight(1);
    circlesLayer.ellipse(pos.x, pos.y, dia, dia);
    circlesLayer.endDraw();
  }
}


