
ArrayList <Element>elements;
int nbeElements;
PGraphics linesLayer,circlesLayer;
int seeElements=0;
 
void setup() {
  size(800, 800);
  frameRate(200);
  colorMode(HSB);
  nbeElements=30;
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
    maxdia=180;
    dia=random(mindia, maxdia);
    pos=new PVector(dia/2+random(width-dia), dia/2+random(height-dia));
    maxspeed=3;
    colorMode(HSB);
    col=color(random(255),255,255);
    speed=new PVector(random(-maxspeed, maxspeed), random(-maxspeed, maxspeed));  
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
          linesLayer.stroke(col,map(dst, 0, dia/2+myElement.dia/2, 10, 50));
          linesLayer.line(myElement.pos.x, myElement.pos.y, pos.x, pos.y);
          if (seeElements>=1) {
            circlesLayer.beginDraw();
            circlesLayer.stroke(col,map(dst, 0, dia/2+myElement.dia/2, 50, 100));
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
    testCollision();
    pos.add(speed);
    if (seeElements==2)display();
  }
 
  void display() {
    circlesLayer.beginDraw();
    circlesLayer.fill(col,50);
    circlesLayer.stroke(180, 255, 255, 136);
    circlesLayer.strokeWeight(1);
    circlesLayer.ellipse(pos.x, pos.y, dia, dia);
    circlesLayer.endDraw();
  }
}



