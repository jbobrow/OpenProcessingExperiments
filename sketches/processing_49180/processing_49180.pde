
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/49180*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
World world;


void setup() {
  size(640, 640);
  smooth();
  frameRate(20);

  world = new World();  
}

void draw() {

  colorMode(HSB,255);
  background(255);
  
  if (mousePressed) {
    Ball b = new Ball();
    b.x = mouseX;
    b.y = mouseY-120;
    world.add(b);
  } 
  else {
    strokeWeight(3);
    stroke(255);
    fill(random(255),255,255);

    textSize(22);
    
    text("s", mouseX-35, mouseY-130);
    text("h", mouseX-28, mouseY-148);
    text("o", mouseX-15, mouseY-160);
    text("h", mouseX, mouseY-160);
    text("e", mouseX+15, mouseY-148);
    text("i", mouseX+27, mouseY-128);
    
    text("s", mouseX-35, mouseY-109);
    text("h", mouseX-24, mouseY-92);
    text("i", mouseX-8, mouseY-80);
    text("r", mouseX, mouseY-80);
    text("a", mouseX+13, mouseY-92);
    text("i", mouseX+27, mouseY-104);
     
  }

  
   world.update();
  
}
class Ball extends Sprite {
  
    color c;
 
  
  void setup() {
    colorMode(HSB,255);
    c = color(random(255),255,255);
    vx = (mouseX-pmouseX)*0.52;
    vy = (mouseY-pmouseY)*0.52;
    ay = -0.2;
    frameRate(30);

  }
  
  void draw() {


    if (x+40>width) {
      vx = -vx;
    }
    if (-x+685>width) {
      vx = -vx;
    } 

    
    strokeWeight(3);
    stroke(255);
    fill(c);

    textSize(22);
    
    text("s", -35, -10);
    text("h", -28, -28);
    text("o", -15, -40);
    text("h", 0, -40);
    text("e", 15, -28);
    text("i", 27, -8);
    
    text("s", -35, 11);
    text("h", -24, 28);
    text("i", -8, 40);
    text("r", -1, 40);
    text("a", 13, 28);
    text("i", 27, 16);
    
  
  }
  
  
}
class Box extends Sprite {

  color c;
    
  float tx;
  float ty;
  
  void setup() {
    colorMode(HSB,255);
    c = color(random(255),255,255);
  }
  
  void draw() {
    tx = mouseX;
    ty = mouseY;
    
    vx = (tx-x)*100;
    vy = (ty-y)*100;
        
    strokeWeight(2);
    stroke(0);
    fill(c);

    rectMode(CENTER);
    rect(0, 0, 30, 30);    
  }
  
}
class Sprite {
  
  boolean visible = true;
  
  float x = 0.0;
  float y = 0.0;
  
  float vx = 0.0;
  float vy = 0.0;
  
  float ax = 0.0;
  float ay = 0.0;
  
  float px = 0.0;
  float py = 0.0;
  
  
  float tx = 0.0;
  float ty = 0.0;
  
  float scaleX = 1.0;
  float scaleY = 1.0;
  
  float rotation = 0;
  
  ArrayList children;
  Sprite parent;
  
  Sprite() {
    children = new ArrayList();
    parent = null;
    setup();
  }
  
  void setup() {
  }
  
  void draw() {
  }
  
  void add(Sprite s) {
    children.add(s);
    s.parent = this;
  }
  
  void remove(Sprite s) {
    for (int i=0; i<children.size(); i++) {
      if (s == (Sprite) children.get(i)) {
        children.remove(i);
        s.parent = null;
      }
    }
  }
  
  Sprite get(int i) {
    return (Sprite) children.get(i);
  }
  
  void update() {
    vx += ax;
    vy += ay;
    x += vx;
    y += vy;
    if (visible) {
      pushMatrix();
      translate(x, y);
      rotate(radians(rotation));
      scale(scaleX, scaleY);
      draw();
      for (int i=0; i<children.size(); i++) {
        Sprite s = (Sprite) children.get(i);
        s.update();
      }
      popMatrix();
    }
    px = x;
    py = y;
  }
  
}


class World extends Sprite {
    void draw() {
    }
}




