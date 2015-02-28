
// ordering game
ArrayList<Trunk> trunks = new ArrayList<Trunk>();
int numTrunks = 7;
float trunkWidth = 30.0;
float gapWidth = 10.0;
PVector start = new PVector();
boolean flag = false;

PImage bg;

// setup
void setup() {
  size(440,440);
  smooth();
  start = new PVector(220-(trunkWidth+gapWidth)*numTrunks/2 + trunkWidth,300);
  bg = loadImage("orderingbg.png");
  for(int i = 1; i <= numTrunks; i++) {
    Trunk t = new Trunk(new PVector(random(width),0));
    t.dim.y = i*trunkWidth/2;
    trunks.add(t);
  }
}


// do
void draw() {
  background(0);
  image(bg,0,0);
  for(Trunk t : trunks) {
    t.update();
    t.draw();
  }
}


// drag object class *******************
class Trunk {
  PVector pos;
  PVector targetpos;
  PVector dim;
  PVector offset = new PVector();
  boolean dragged = false;
  
  
  Trunk(PVector p) {
    pos = p.get();
    pos.y = start.y;
    targetpos = pos.get();
    dim = new PVector(trunkWidth,trunkWidth);
  }
  
  void update() {
    if(dragged) {
      pos.x = mouseX + offset.x;
      targetpos.x = pos.x;
      if(!mousePressed) {flag = false; dragged = false;}
    } else {
      if(mousePressed && !flag) {
        if(abs(mouseX - pos.x) < dim.x/2) {
          if(abs(mouseY - pos.y) < dim.y/2) {
            dragged = true;
            flag = true;
            offset = PVector.sub(pos, new PVector(mouseX,mouseY));
          }
        }
      }
    }
    // find all the trunks to the left
    int count = 0;
    for(Trunk tr : trunks) {
      if(tr.pos.x < pos.x) count++;
    }
    targetpos.x = start.x + (trunkWidth+gapWidth)*count-gapWidth;
    // ease
    pos.x += 0.3*(targetpos.x - pos.x);
    pos.y += 0.3*(targetpos.y - pos.y);
    // pos y
    pos.y = start.y - dim.y/2;
  }
  
  void draw() {
    float fac = 1.0;
    if(dragged) fac = 1.2;
    pushStyle();
    rectMode(CENTER);
    fill(131,108,64);
    stroke(0);
    strokeWeight(2.0);
    rect(pos.x, pos.y, dim.x*fac, dim.y*fac); 
    popStyle();
  }
  
};


