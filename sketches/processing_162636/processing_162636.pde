
ArrayList bubbleList = new ArrayList<Bubble>();
ArrayList childList = new ArrayList<Child>();

void setup() {
  size(500, 500);
  frameRate(20);
}

void draw() {
  background(255,255,255,1);
  
  if(mousePressed) {
    Bubble b = new Bubble(mouseX + random(-20, 20), mouseY + random(-20, 20), random(30, 70),
                          random(100,255),random(100,255),random(100,255), random(50,100));  
    bubbleList.add(b);
  }
  
  for(int i=0 ; i<bubbleList.size() ; i++) {
    Bubble b = (Bubble)bubbleList.get(i);
    b.transmit();
  }
  
  
  while(bubbleList.size()/10 > childList.size() && frameCount%20==0) {
   Child c = new Child();
   childList.add(c); 
   break;
  }
  
  for(int i=0 ; i<childList.size() ; i++) {
    Child c = (Child)childList.get(i);
    c.drawChild();
  }
  
  
  for(int i=0 ; i<bubbleList.size() ; i++) {
    Bubble b = (Bubble)bubbleList.get(i);
    if(b.getRadius() <= 0) {
     bubbleList.remove(i); 
    }
  }
  
  while(bubbleList.size()/10 < childList.size() && !mousePressed && frameCount%20==0) {
    childList.remove(0); 
    break;
  }
  
}

class Child {
 PImage img;
 
 float x, y;
 
 Child() {
  img = loadImage("child.png");
  x = random(0, width-img.width);
 }
 
 void drawChild() {
   image(img, x, height-img.height);
 }
}

class Bubble {
  float radius;
  float x, y;
  float r, g, b, a;
  
  float getRadius() { return radius; }
  
  Bubble(float _x, float _y, float _radius, float _r, float _g, float _b, float _a) {
    radius = _radius;
    x = _x; y = _y;
    r = _r ; g = _g ; b = _b; a = _a;
  }
  
  void transmit() {
    if(frameCount%2 == 0){
      radius--;
      a--;
      y--;
    }
    
    stroke(0,0,0,0);
    fill(r,g,b,a);
    ellipse(x, y, radius, radius);
  }
}


