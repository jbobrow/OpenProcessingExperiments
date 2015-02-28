
// sorting game
ArrayList<Drag> objs = new ArrayList<Drag>();
ArrayList<PVector> zones = new ArrayList<PVector>();
boolean flag = false;
float unitsize = 20.0;
PImage bg;

// init
void setup() {
  size(440,440);
  smooth();
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(24);
  
  bg = loadImage("sortbg.png");
  
  for(int i = 0; i < 3; i++) {
    Drag o = new Drag(new PVector(random(20,width*0.7),random(20,300)),0);
    objs.add(o);
  }
  for(int i = 0; i < 3; i++) {
    Drag o = new Drag(new PVector(random(20,width*0.7),random(20,300)),1);
    objs.add(o);
  }
  for(int i = 0; i < 3; i++) {
    Drag o = new Drag(new PVector(random(20,width*0.7),random(20,300)),2);
    objs.add(o);
  }
  
  for(int i = 0; i < 3; i++) {
    PVector z = new PVector(50 + i*80, 380);
    zones.add(z);
  }
}

// update
void draw() {
  // bg
  background(100);
  image(bg,0,0);
  
  // update zones
  for(int j = 0; j < zones.size(); j++) {
    PVector z = zones.get(j);
    strokeWeight(2.0);
    fill(255);
    ellipse(z.x,z.y,40.0,40.0);
    fill(0);
    if(j==0) text("3",z.x,z.y);
    if(j==1) text("5",z.x,z.y);
    if(j==2) text("4",z.x,z.y);
    noFill();
//    ellipse(z.x,z.y,100.0,100.0);
  }
  
  // update drag objects
  for(Drag o : objs) {
    o.update();
    o.draw();
  }
  
  // sort zones
  for(int j = 0; j < zones.size(); j++) {
    PVector z = zones.get(j);
    for(int i = objs.size() - 1; i >= 0; i--) {
      Drag o = objs.get(i);
      if(z.dist(o.pos) < 40.0 && !flag) {
        if(o.type == j) {
          objs.remove(i);
        } else {
          o.targetpos = o.originpos.get();
        }
      }
    }
  }
  
}

// draggable object class
class Drag {
  PVector pos;
  PVector targetpos;
  PVector originpos;
  PVector dim;
  PVector offset = new PVector();
  boolean dragged = false;
  boolean active = true;
  PImage img;
  int type = 0;
  
  
  Drag(PVector p, int t) {
    pos = p.get();
    targetpos = pos.get();
    originpos = pos.get();
    dim = new PVector(unitsize,unitsize);
    type = t;
    img = loadImage(str(t)+str(floor(random(3))) + ".png");
  }
  
  void update() {
    // ease
    pos.x += 0.2*(targetpos.x - pos.x);
    pos.y += 0.2*(targetpos.y - pos.y);
    if(dragged) {
      pos = PVector.add(new PVector(mouseX, mouseY), offset);
      targetpos = pos.get();
      if(!mousePressed) {
        dragged = false;
//        targetpos = originpos.get();
        flag = false;
      }
    } else {
      if(mousePressed && !flag) {
        if(abs(mouseX - pos.x) < img.width/2) {
          if(abs(mouseY - pos.y) < img.height/2) {
            originpos = pos.get();
            dragged = true;
            flag = true;
            offset = PVector.sub(pos, new PVector(mouseX,mouseY));
          }
        }
      }
    }

  }
  
  void draw() {
    float fac = 1.0;
    if(dragged) fac = 1.2;
    pushStyle();
    rectMode(CENTER);
    fill(131,108,64);
    stroke(0);
    strokeWeight(2.0);
//    rect(pos.x, pos.y, dim.x*fac, dim.y*fac);
    image(img, pos.x - img.width/2, pos.y - img.height/2);
    popStyle();
  }
  
};


