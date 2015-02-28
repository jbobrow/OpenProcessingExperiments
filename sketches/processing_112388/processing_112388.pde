
final int elementsN = 100;
Element[] elements;

float volume;
PVector center;
float gasAmount = 10000;
float gasFlowSpeed = 1;
float pressure;


void setup() {
  size(600,600);
  elements = new Element[elementsN];
  for(int i=0; i<elementsN; i++) {
    float r = width/40;
    float a = i*TWO_PI/elementsN;
    elements[i] = new Element(width/4-r*cos(a), height/2+r*sin(a));
  }
  center = new PVector(0,0,0);
  
  updateCenter();
  
  for(int i=0; i<elementsN-1; i++) {
    elements[i].next = elements[i+1];
  }
  for(int i=1; i<elementsN; i++) {
    elements[i].prev = elements[i-1];
  }
  frameRate(60);
}

void draw() {
  background(0);
  
  fill(255);
  stroke(255);
  textSize(0.03*width);
  textAlign(LEFT, TOP);
  text("FPS: "+(int)frameRate, 10,0);
  text("Gas volume: ", width/2,0);
  text((int)volume+" px^2", 3*width/4,0);
  text("Gas amount: ", width/2,0.04*width);
  text((int)gasAmount+" j", 3*width/4,0.04*width);
  text("pressure: ", width/2,0.08*width);
  text(pressure, 3*width/4,0.08*width);
  
  updateCenter();
  volume   = getArea();
  pressure = gasAmount/volume;
  
  for(int i=1; i<elementsN-1; i++) {
    elements[i].update();
  }
  for(int i=0; i<elementsN; i++) {
    elements[i].draw();
    if(keyPressed) elements[i].vectorDraw();
  }
  
  fill(50,50,255, 50);
  beginShape();
  for(int i=0; i<elementsN; i++) {
    vertex(elements[i].x, elements[i].y);
  }
  endShape(CLOSE);
  
  //show the center
  ellipseMode(CENTER);
  fill(255,255,0);
  noStroke();
  ellipse(center.x, center.y, 2, 2);
  
  //show straw
  
  stroke(255);
  line(0, elements[0].y, elements[0].x, elements[0].y);
  line(0, elements[elementsN-1].y, elements[elementsN-1].x, elements[elementsN-1].y);
  
  if(mousePressed) {
    gasAmount += gasFlowSpeed*gasAmount/frameRate;
  }
  
  if(gasAmount>1000) {
    gasAmount -= 0.02*gasFlowSpeed*gasAmount/frameRate;
  }
  
}

float getArea() {
  float area = 0;

  PVector a = new PVector(0, 0, 0);
  PVector b = new PVector(0, 0, 0);
  PVector c = new PVector(0, 0, 0);
  for (int i=0; i<elementsN-1; i++) {
    /*
    Thanks for explanation here:
     http://www.mathopenref.com/coordtrianglearea.html
     
     .              |   Ax(By-Cy) + Bx(Cy-Ay) + Cx(Ay-By)   |
     .   area   =   |  -----------------------------------  |
     .              |                   2                   |
     
     */
    a.set( elements[i].x, elements[i].y);
    b.set( elements[i].next.x, elements[i].next.y);
    c.set( center.x, center.y);

    area += abs( ( a.x*(b.y-c.y) + b.x*(c.y-a.y) + c.x*(a.y-b.y)  )/2  );
  }
  return area;
}

void updateCenter() {
  center.set(0, 0, 0);
  for (int i=0; i<elementsN; i++) {
    center.x+=elements[i].x;
    center.y+=elements[i].y;
  }
  center.x/=elementsN;
  center.y/=elementsN;
}

class Element {
  float x;
  float y;
  float m;
  float k;
  
  float comp;
  
  PVector f;
  PVector fPress;
  PVector v;
  Element prev;
  Element next;
  
  Element(float x, float y) {
    this.x      = x;
    this.y      = y;
    this.f      = new PVector(0,0,0);
    this.fPress = new PVector(0,0,0);
    this.v      = new PVector(0,0,0);
    this.k      = 3;
    this.m      = 30;
    this.comp   = 0.1;
  }
  
  void draw() {
    fill(200);
    if(prev==null) fill(0,255,0);
    if(next==null) fill(255,0,0);
    noStroke();
    ellipseMode(CENTER);
//    ellipse(x,y,2,2);
    stroke(255);
    if(prev != null) {
      line(prev.x, prev.y, x, y);
    }
  }
  
  void vectorDraw() {
    stroke(0,0,255);
    line(x, y, x+5*f.x, y+5*f.y);
    stroke(0,255,0);
    line(x, y, x+comp*5*fPress.x, y+comp*5*fPress.y);
  }
  
  void update() {
    f.set(0,0,0);
    if(prev != null) {
      f.x += k*(prev.x-x);
      f.y += k*(prev.y-y);
    }
    if(next != null) {
      f.x += k*(next.x-x);
      f.y += k*(next.y-y);
    }
    
    //this sets the pressure vector in apropriate direction
    fPress.x = (x - center.x);
    fPress.y = (y - center.y);
    
    //and this resets and sets its value based on pressure
    fPress.normalize();
    fPress.mult(pressure);
    
    v.x += (f.x+comp*fPress.x)/m;
    v.y += (f.y+comp*fPress.y)/m;
    
    v.mult(0.9 );
    
    x += v.x;
    y += v.y;
  }
}


