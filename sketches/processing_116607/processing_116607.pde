
// flight controller
ArrayList<Unit> units = new ArrayList<Unit>();
ArrayList<PVector> zones = new ArrayList<PVector>();
 
boolean flag= false;
 
PVector mpos = new PVector();
int gameState = 0;
 
int score = 0;
 
// init
void setup() {
   
  size(440,440);
  smooth();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(20);
   
  sss();
   
}
 
 
// update
void draw() {
 
rectMode(CORNER);
   
  // bg
  background(255);
   
  // mouse pos
  mpos.x = mouseX;
  mpos.y = mouseY;
   
  if(gameState == 0) {
     
    float f = 7.0;
   
    // zones
    for(PVector z : zones) {
      pushStyle();
      strokeWeight(3.0);
      color c = color(#FCAD00);
      if(z.z == 2) c = color(#4F00FC);
      if(z.z == 3) c = color(#00FCA2);
      fill(c);
      rect(z.x-15,z.y-15,30,30);
      if(z.z == 1) {
        line(z.x, z.y - f, z.x, z.y + f);
        line(z.x, z.y + f, z.x + f, z.y);
        line(z.x, z.y + f, z.x - f, z.y);
      }
      if(z.z == 2) {
        line(z.x - f, z.y, z.x + f, z.y);
        line(z.x - f, z.y, z.x, z.y + f);
        line(z.x - f, z.y, z.x, z.y - f);
      }
      if(z.z == 3) {
        line(z.x - f, z.y, z.x + f, z.y);
        line(z.x + f, z.y, z.x, z.y + f);
        line(z.x + f, z.y, z.x, z.y - f);
      }
      popStyle();
    }
     
    // units
    for( int i = units.size()-1; i >= 0; i--) {
      Unit u = units.get(i);
      u.update();
      u.draw();
      // delete
      for(PVector z : zones) {
        if(u.pos.dist(new PVector(z.x,z.y)) < 20 && int(z.z)==u.type) {
          boolean doit = false;
          if(u.type == 1 && u.vel.y > 0.3) doit = true;
          if(u.type == 2 && u.vel.x < - 0.3) doit = true;
          if(u.type == 3 && u.vel.x > 0.3) doit = true;
          if(doit) {
            units.remove(i);
            score++;
          }
        }
      }
    }
     
    fill(0);
    stroke(0);
    text("Score: " + str(score), width/2, 20);
   
  } else {
    fill(0);
    stroke(0);
    text("GAME OVER", width/2, 20);
    text("Score: " + str(score), width/2, 40);
    if(!mousePressed) flag = false;
    if(mousePressed && !flag) {gameState = 0; sss();}
  }
   
   
   
}
 
 
// init
void sss() {
  score = 0;
  float interval = 100;
  units = new ArrayList<Unit>();
  for(int i = 0; i < 100; i++) {
    Unit u = new Unit();
    u.pos = new PVector(random(width), random(height));
    u.pos = new PVector(width/2, height/2);
    PVector d = new PVector(-1+random(2), -1+random(2));
    d.normalize();
    d.mult(width/2 + i * interval);
    u.pos.add(d);
    d.normalize();
    d.mult(-0.3);
    u.vel = d.get();
    u.type = 1;
    if(random(1) < 0.3) u.type = 2;
    if(random(1) < 0.3) u.type = 3;
    units.add(u);
    interval = max(50, interval - 1);
  }
   
  zones = new ArrayList<PVector>();
  for(int i = 0; i < 3; i++) {
    PVector z = new PVector((i+1)*width/4, (i+1)*width/4, i+1);
    zones.add(z);
  }
}
 
 
// unit object
class Unit {
   
  float r = 10.0;
  PVector pos = new PVector();
  PVector vel = new PVector();
  boolean dragged = false;
  boolean init = false;
  int type = 0;
  ArrayList<PVector> path = new ArrayList<PVector>();
   
  Unit() {
  }
   
  void update() {
    // start drag
    if(mousePressed && mpos.dist(pos) < r && !flag) {
      flag = true;
      dragged = true;
      path = new ArrayList<PVector>();
    }
    if(path.size() > 0) {
      if(mousePressed && mpos.dist(path.get(path.size()-1)) < r && !flag) {
        flag = true;
        dragged = true;
      }
    }
    // undrag
    if(!mousePressed) {
      flag = false;
      dragged = false;
    }
    // drag
    if(dragged) {
      if(path.size() > 0) {
        PVector p = path.get(path.size()-1).get();
        if(mpos.dist(p) > 4) {
          path.add(mpos.get());
        }
      } else {
        path.add(mpos.get());
      }
    }
    // move toward path
    if(path.size() >= 1) {
      vel = path.get(0).get();
      vel.sub(pos);
      vel.normalize();
      vel.mult(0.4);
      pos.add(vel);
      // get there
      if(pos.dist(path.get(0).get()) < r) {
        path.remove(0);
      }
    } else {
      pos.add(vel);
    }
    // bounce
    if(init) {
      if(pos.x < 0-3*r || pos.x > width + 3*r) {pos.x = constrain(pos.x, -3*r, width+3*r); vel.x *= -1;}
      if(pos.y < 0-3*r || pos.y > height + 3*r) {pos.y = constrain(pos.y, -3*r, height+3*r); vel.y *= -1;}
    }
    // in screen
    if(pos.x > 0 && pos.x < width && pos.y > 0 && pos.y < height) init = true;
     
    // collision
    for(Unit u : units) {
      if(pos.dist(u.pos) < 2*r && !pos.equals(u.pos) && init && u.init) {
        gameState = 1;
      }
    }
     
  }
   
  void draw() {
    pushStyle();
    noFill();
    color c = color(#FCAD00);
    if(type == 2) c = color(#4F00FC);
    if(type == 3) c = color(#00FCA2);
    fill(c);
    stroke(0);
    strokeWeight(3.0);
    ellipse(pos.x, pos.y, r*2, r*2);
    popStyle();
    // path
    if(path.size() > 0) {
      pushStyle();
      noFill();
      stroke(0,100);
      strokeWeight(2.0);
      beginShape();
      vertex(pos.x,pos.y);
      for(PVector p : path) {
        vertex(p.x,p.y);
      }
      endShape();
      popStyle();
      pushStyle();
      noFill();
      stroke(0);
      strokeWeight(3.0);
      ellipse(path.get(path.size()-1).x,path.get(path.size()-1).y, 5,5);
      popStyle();
    }
  }
   
};
