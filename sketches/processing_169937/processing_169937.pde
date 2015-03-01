
@pjs preload="http://s24.postimg.org/ss97v9qn5/raccoon.png, http://s18.postimg.org/khc748e8l/hammer.png";
ArrayList parts;

PImage raccoon, mouseCursor;
PFont f;
int counter = 0;
int energyLevel = 100;
 
void setup() {
  size(800, 800);
  f = createFont("Arial",20,true);
  raccoon = loadImage("http://s24.postimg.org/ss97v9qn5/raccoon.png");
  mouseCursor = loadImage("http://s18.postimg.org/khc748e8l/hammer.png");
  parts = new ArrayList();
 
  cursor(mouseCursor, 0, 0);
  
  createBg();

}
 
void draw() {
  String s = "Energy: " + energyLevel;
  fill(255);
  textFont(f);
  text(s,10,height/2);
   
  if (counter%40 == 0) {
    createBg();
    PartialTri p = new PartialTri();
    p.display();
    if (hit(p)) {
      energyLevel--;
    }
  }
  if (energyLevel < 1) {
    background(0);
    String s2 = "Silly Raccoon is gone";
    fill(255);
    textFont(f);
    text(s2,10,height/2);
  }
   
  counter+=random(0, 5);
  if (counter > 1000) {
    counter = 0;
  }
  
  parts.add(new Drops());
  for (int i = 0; i < parts.size();) {
    Drops p = (Drops) parts.get(i);
    if (p.dead == true) {
      parts.remove(i);
    } else {
      p.startDrop();
      p.flowDown();
      i++;  
    }
  }
}
 
boolean hit(PartialTri p) {
  if (mouseX >= p.transX-100 && mouseX <= p.transX+105) {
    if (mouseY >= p.transX-100 && mouseY <= p.transY+120) {
      counter-=10;
      return true;
    }
  }
  return false;
}
void createBg() {
  background(0);
  fill(255, 30);
  for(int j = 0; j < 1000; j+=100) {
    for(int i = 0; i < 1000; i+=100) {
       triangle (i, j, i,  j+100, 100 + i, j);
    }
  }
}
 
class PartialTri {
  int transX, transY;
   
  PartialTri(){
    transX = (int) random(0, width);
    transY = (int) random(0, height);
     
  }
   
  void display() {
    pushMatrix();
    translate(transX, transY);
    fill(255, 50);
    int i = 0; int j = 0;
    image(raccoon, 0, 0);
 
    popMatrix();
  }
   
}

class Drops {
  float flowspeed = 0;
  float resistance = .01;
  float age = 1;
  boolean dead = false;
  float x, y;
  int angleDropping = 0;
  float dropsOp = random(10, 50);
  
  public Drops() {
    fill(46, 124, 137, dropsOp );
    this.x = random(0, width);
    this.y = random(0, 10);
    this.angleDropping = (int)random(-3, 3);
  }
  
  void startDrop() {
    pushMatrix();
    rotate(radians(this.angleDropping));
    translate(this.x, this.y);
    ellipse(0, 0, random(1,3), 50);
    popMatrix();
  }
  
  void flowDown() {
    this.y ++;
    if (y > height) {
      dead = true;
    }
  }
}
