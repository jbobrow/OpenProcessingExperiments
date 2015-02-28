
// bridge building
Bridge test;
PVector gappos, gapdim;
int gapunits = 10;
int gapfullunits = 0;
float unitsize = 20.0;

boolean flag = false;

ArrayList<Bridge> bridges;

PImage bg;


// start
void setup() {
  size(440,440);
  smooth();
  gappos = new PVector(width/2, height/2-70);
  gapdim = new PVector(unitsize*gapunits, unitsize);
  
  bg = loadImage("bridgebg.png");
  
  bridges = new ArrayList<Bridge>();
  Bridge test = new Bridge(4,new PVector(100,350+random(60)));
  bridges.add(test);
  test = new Bridge(3,new PVector(200,350+random(60)));
  bridges.add(test);
  test = new Bridge(7,new PVector(300,350+random(60)));
  bridges.add(test);
}

// update
void draw() {
  background(0);
  image(bg,0,0);
  // draw bridge (not drawbridge)
  pushStyle();
  rectMode(CENTER);
  noFill();
  stroke(0,100);
  strokeWeight(2);
  rect(gappos.x, gappos.y, gapdim.x, gapdim.y);
  for(float x = gappos.x - gapdim.x/2; x < gappos.x + gapdim.x/2; x+= unitsize) {
    line(x,gappos.y-unitsize/2, x, gappos.y+unitsize/2);
  }
  popStyle();
  // bridge pieces
  for(Bridge b : bridges) {
    b.update();
    b.draw();
  }

}


// drag object class *******************
class Draggable {
  PVector pos;
  PVector dim;
  PVector offset = new PVector();
  boolean dragged = false;
  
  
  Draggable() {
    pos = new PVector();
    dim = new PVector(unitsize,unitsize);
  }
  
  void update() {
    if(dragged) {
      pos = PVector.add(new PVector(mouseX, mouseY), offset);
      if(!mousePressed) dragged = false;
    } else {
      if(mousePressed) {
        if(abs(mouseX - pos.x) < dim.x/2) {
          if(abs(mouseY - pos.y) < dim.y/2) {
            dragged = true;
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
    rect(pos.x, pos.y, dim.x*fac, dim.y*fac);
    popStyle();
  }
  
};

// bridge class 8*8*****************
class Bridge extends Draggable {
  int units;
  PVector targetpos = new PVector();
  PVector originpos = new PVector();
  boolean bridgepiece = false;
  
  Bridge(int u, PVector p) {
    units = u;
    pos = p.get();
    targetpos = p.get();
    originpos = p.get();
    dim.x = unitsize * units;
    dim.y = unitsize;
  }
  
  void update() {
    if(dragged) {
      pos = PVector.add(new PVector(mouseX, mouseY), offset);
      targetpos = pos.get();
      if(!mousePressed) {flag=false; dragged = false;}
    } else {
      if(mousePressed && !flag) {
        if(abs(mouseX - pos.x) < dim.x/2) {
          if(abs(mouseY - pos.y) < dim.y/2) {
            if(!dragged && bridgepiece) gapfullunits -= units;
            dragged = true;
            bridgepiece = false;
            flag = true;
            offset = PVector.sub(pos, new PVector(mouseX,mouseY));
          }
        }
      }
      if(!dragged && !bridgepiece) {
        targetpos = originpos.get();
      }
    }
    // fall in
    if(!dragged && !bridgepiece) {
      float w = (dim.x + gapdim.x)/2;
      float h = (dim.y + gapdim.y)/2;
      if(targetpos.x != originpos.x && targetpos.y != originpos.y) {
        if(abs(pos.x - gappos.x) < w && abs(pos.y - gappos.y) < h) {
          if(gapunits - gapfullunits >= units) {
            targetpos.x = gappos.x - gapdim.x/2 + dim.x/2 + gapfullunits*unitsize;
            targetpos.y = gappos.y;
            gapfullunits += units;
            bridgepiece = true;
          } else {
          }
        }
      }
    }
    // update bridge pieces
    if(bridgepiece && !dragged) {
//      if(pos.x - dim.x/2 >= gappos.x - gapdim.x/2 + gapfullunits * unitsize) {
//        targetpos.x = gappos.x - gapdim.x/2 + dim.x/2 + gapfullunits*unitsize;
//        targetpos.y = gappos.y;
//      }
      float testx = targetpos.x - dim.x/2 - unitsize/2;
      boolean dontdoit = false;
      for(Bridge bp : bridges) {
        if(bp.bridgepiece) {
          if(abs(testx - bp.pos.x) < bp.dim.x/2) {
            dontdoit = true;
          }
        }
      }
      if(!dontdoit) {
        targetpos.x -= unitsize;
      }
      if(targetpos.x < gappos.x - gapdim.x/2 + dim.x/2) {
        targetpos.x = gappos.x - gapdim.x/2 + dim.x/2;
      }
    }
    // ease
    pos.x = pos.x + 0.1*(targetpos.x - pos.x);
    pos.y = pos.y + 0.1*(targetpos.y - pos.y);
  }
  
  void draw() {
    super.draw();
    float fac = 1.0;
    if(dragged) fac = 1.2;
    for(float x = pos.x - dim.x/2*fac; x < pos.x + dim.x/2*fac; x+= unitsize*fac) {
      line(x,pos.y-unitsize/2*fac, x, pos.y+unitsize/2*fac);
    }
  }
  
 
};


