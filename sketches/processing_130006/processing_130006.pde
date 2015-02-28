
// land before they run out of fuel
ArrayList<Unit> units = new ArrayList<Unit>();
ArrayList<PVector> supply = new ArrayList<PVector>();
PVector mpos = new PVector();
boolean flag = false;
PVector star;
ArrayList<PVector> stars = new ArrayList<PVector>();
int score = 0;
float time = 0;
boolean pressed = false;
int ttype = 2;
int nexttype = 0;
int nexttype1 = 1;
int nexttype2 = 1;
color c1 = color(#00F4FA);
float into = 0.0;
PImage over;

int levelNum = 0;

// game variables
float colorSplit = 0.5;
float starDelay = 0.0;
float starTime = 0.0;
int maxStars = 5;
int maxFuel = 99999;
int fuelCount = 0;
boolean timerOn = false;
float timer = 0.0;
float timerLimit = 60000.0;

//import apwidgets.*;
////the following are all pieces we need to pull in from the android sdk
//APMediaPlayer getFuel;
//APMediaPlayer getFuel2;
//APMediaPlayer shareFuel;
//APMediaPlayer getDiamond;
//APMediaPlayer spawnFuel;
//APMediaPlayer die;
//APMediaPlayer music;

// init
void setup() {
  size(800,600);
  smooth();
//  getFuel = new APMediaPlayer(this);
//  getFuel.setMediaFile("sounds/pickup1.mp3");
//  shareFuel = new APMediaPlayer(this);
//  shareFuel.setMediaFile("sounds/share.mp3");
//  getDiamond = new APMediaPlayer(this);
//  getDiamond.setMediaFile("sounds/diamond1.mp3");
//  die = new APMediaPlayer(this);
//  die.setMediaFile("sounds/die1.mp3");
//  spawnFuel = new APMediaPlayer(this);
//  spawnFuel.setMediaFile("sounds/spawn2.mp3");
//  music = new APMediaPlayer(this);
//  music.setMediaFile("sounds/music1.mp3");
//  music.start();
//  music.setLooping(true);
  over = loadImage("over.png");
  c1 = color(#00F4FA);
  for(int i = 0; i < 2; i++) {
    Unit u = new Unit();
    u.pos = new PVector(-10, height/2);
    u.vel = new PVector(0.5,0);
    if(i==1) {u.pos.x = width+10.0; u.vel.x = -0.5;}
    u.type = i;
    units.add(u);
  }
  for(int i = 0; i < 4; i ++) {
    int t = 0;
    if(random(1) < 0.5) t = 1;
    PVector s = new PVector(random(width), random(height),t);
    supply.add(s);
  }
  star = new PVector(random(width), random(80,height-80));
  time = millis();
  reset();
  timer = millis();
}


// update
void draw() {
  mpos = new PVector(mouseX, mouseY);
  background(240);
  if(units.size() == 1) units = new ArrayList<Unit>();
  
  // new stars
  if(millis() - starTime > starDelay && stars.size() < maxStars) {
    star = new PVector(random(80,width-80), random(80,height-80));
    stars.add(star);
    starTime = millis();
  }
  
  // add fuel
  if(millis() - time > 2200 && fuelCount < maxFuel) {
//    spawnFuel.seekTo(0);
//    spawnFuel.start();
    PVector s = new PVector(random(width), random(50,height-50),nexttype);
    boolean uhoh = false;
    do {
      uhoh = false;
      s = new PVector(random(width), random(50,height-50),nexttype);
      for(PVector q : supply) {
        if(s.dist(q) < 40) {uhoh = true; break;}
      }
    } while(uhoh);
    nexttype = nexttype1;
    nexttype1 = nexttype2;
    nexttype2 = 0;
    if(random(1) < colorSplit) nexttype2 = 1;
    supply.add(s);
    time = millis();
    into = 40.0;
  }
  
  // update missiles
  for(int i = units.size()-1; i >= 0; i--) {
    Unit u = units.get(i);
    u.update();
    u.draw();
    for(int j = supply.size() - 1; j >= 0; j--) {
      PVector s = supply.get(j);
      if(s.dist(u.pos) < u.r + 10) {
        if(u.type == int(s.z)) {
          u.fuel += 30.0;
//          getFuel.seekTo(0);
//          getFuel.start();
        } else {
//          u.fuel -= 20.0;
          u.hitv = 255.0;
//          getFuel.seekTo(0);
//          getFuel.start();
        }
        supply.remove(j);
      }
      if(ttype == u.type || ttype == 2) {
        // remove star
        for(int k = stars.size()-1; k>=0; k--) {
          star = stars.get(k);
          if(u.pos.dist(star) < u.rr+20) {
//            getDiamond.seekTo(0);
//            getDiamond.start();
//            star = new PVector(random(80,width-80), random(80,height-80));
            stars.remove(k);
            u.gotv = 255.0;
            ttype = 2;
            if(random(1) < 0.0) {
              ttype = 0;
              if(random(1) < 0.5) ttype = 1;
            }
            score++;
          }
        }
      }
    }
    // collision
//    for(int j = units.size()-1; j > i; j--) {
//      if(i!=j) {
//        Unit o = units.get(j);
//        if(o.pos.dist(u.pos) < o.rr + u.rr && !o.pos.equals(u.pos) && o.init && u.init) {
//          units.remove(j);
//          units.remove(i);
//          break;
//        }
//      }
//    }
  }
  for(int i = units.size()-1; i >= 0; i--) {
    Unit u = units.get(i);
    if(u.fuel <= 0) units.remove(i);
  }
  for(int i = supply.size() - 1; i >= 0; i--) {
    PVector s = supply.get(i);
    ellipseMode(CENTER);
    fill(#FCAD00);
    if(s.z == 1.0) fill(c1);
    stroke(0); noStroke();
    ellipse(s.x, s.y, 20,20);
  }
  
  for(int k = 0; k < stars.size(); k++) {
    star = stars.get(k);
    pushMatrix();
    translate(star.x,star.y);
    rotate(PI/4);
    rectMode(CENTER);
    fill(0,255,0);
    if(ttype == 0) fill(#FCAD00);
    if(ttype == 1) fill(c1); 
    rect(0,0,20,20);
    popMatrix();
  }
  // border
  fill(50); noStroke();
  rectMode(CORNER);
  rect(0,height-40,width,40);
  // equals button
  fill(255,0,0);
  noStroke();
  if(mpos.dist(new PVector(width/2, height - 50)) < 30) {
//    fill(155,0,0);
    stroke(50);
    strokeWeight(2.0);
    // equals
    if(mousePressed && !pressed) {
      float totalfuel = 0.0;
//      shareFuel.seekTo(0);
//      shareFuel.start();
      fill(100,0,0);
      for(Unit u : units) {
        totalfuel+=u.fuel;
      }
      totalfuel /= 2;
      totalfuel *= 0.95;
      for(Unit u : units) {
        u.fuel = totalfuel;
      }
      pressed = true;
    }
  }
  ellipse(width/2, height-35,60,60);
  if(!mousePressed) pressed = false;
  
  textAlign(CENTER,CENTER);
  textSize(36);
  fill(0);
  
//  text("=",width/2, height-60);
  
  // timer
//  float percent = (millis()-time) / 5000.0;
//  rectMode(CENTER);
//  noStroke();
//  fill(#FCAD00);
//  if(nexttype == 1) fill(c1);
//  rect(width/2, 20, 100*(1.0-percent), 10);
//  noFill();
//  stroke(0);
//  rect(width/2, 20, 100, 10);


  fill(50); noStroke();
  rectMode(CORNER);
  rect(0,0,width,40);
  noStroke();
  into -= 0.5;
  if(into<0.0) into = 0.0;
  fill(#FCAD00);
  if(nexttype2 == 1) fill(c1);
  ellipse(20-into,20,20,20);
  fill(#FCAD00);
  if(nexttype1 == 1) fill(c1);
  ellipse(60-into,20,20,20);
  fill(#FCAD00);
  if(nexttype == 1) fill(c1);
  ellipse(100-into,20,20,20);
  
  
  pushMatrix();
  translate(width-80,20);
  rotate(PI/4);
  rectMode(CENTER);
  fill(0,255,0);
  if(ttype == 0) fill(#FCAD00);
  if(ttype == 1) fill(c1); 
  rect(0,0,20,20);
  popMatrix();
  textSize(24);
  fill(255);
  textAlign(CENTER,CENTER);
  text(str(score),width-40,17);
  
  int ttt = int((timerLimit - (millis() - timer))/1000);
  if(timerOn) {
    text(str(ttt), width/2,17);
    if(ttt <= 0) reset();
  }
  
//  image(over,0,0);
  
  if(units.size() == 0) {
    fill(0);
    textSize(48);
    text("Game Over", width/2, height/2);
    if(mousePressed) reset();
    textSize(14);
    text("click to try again", width/2, height/2 + 50);
  }
  
}



// reset
void reset() {
  fuelCount = 0;
  timer = millis();
  score = 0;
  units = new ArrayList<Unit>();
  c1 = color(#00F4FA);
  // level
  if(levelNum == 0) {
    colorSplit = 0.5;
    starDelay = 0.0;
    maxStars = 1;
    timerOn = false;
  }
  if(levelNum == 1) {
    colorSplit = 1.0;
    starDelay = 99999999999.0;
    maxStars = 5;
    timerOn = false;
  }
  for(int i = 0; i < 2; i++) {
    Unit u = new Unit();
    u.pos = new PVector(-10, height/2);
    u.vel = new PVector(0.5,0);
    if(i==1) {u.pos.x = width+10.0; u.vel.x = -0.5;}
    u.type = i;
    units.add(u);
  }
  supply = new ArrayList<PVector>();
  for(int i = 0; i < 4; i ++) {
    int t = 0;
    if(random(1) < 0.5) t = 1;
    PVector s = new PVector(random(width), random(height),t);
    supply.add(s);
  }
  stars = new ArrayList<PVector>();
  if(starDelay > 99999999.0) {
    for(int i = 0; i < maxStars; i++) {
      star = new PVector(random(width), random(height));
      stars.add(star);
    }
  }
  time = millis();
  nexttype = 0;
  nexttype1 = 0;
  nexttype2 = 0;
  if(random(1) < colorSplit) nexttype = 1;
  if(random(1) < colorSplit) nexttype1 = 1;
  if(random(1) < colorSplit) nexttype2 = 1;
}


// unit object
class Unit {
  
  float r = 10.0;
  float rr = 0.0;
  float rv = 0.0;
  float vr = 0.0;
  float fuel = 100.0;
  PVector pos = new PVector();
  PVector vel = new PVector();
  boolean dragged = false;
  boolean init = false;
  int type = 0;
  float hitv = 0.0;
  float gotv = 0.0;
  ArrayList<PVector> path = new ArrayList<PVector>();
  
  Unit() {
  }
  
  void update() {
    fuel -= 0.09;
    if(fuel > 100.0) fuel = 100.0;
    hitv -= 5.0;
    if(hitv < 0) hitv = 0.0;
    gotv -= 5.0;
    if(gotv < 0) gotv = 0.0;
    // start drag
    if(mousePressed && mpos.dist(pos) < 30 && !flag) {
      flag = true;
      dragged = true;
      path = new ArrayList<PVector>();
    }
    if(path.size() > 0) {
      if(mousePressed && mpos.dist(path.get(path.size()-1)) < 30 && !flag) {
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
      vel.mult(0.8);
      pos.add(vel);
      // get there
      if(pos.dist(path.get(0).get()) < r) {
        path.remove(0);
      }
    } else {
      vel.normalize();
      vel.mult(0.3);
      pos.add(vel);
    }
    // bounce
    if(init) {
      int fff = 0;
      if(pos.x < 0-fff*r || pos.x > width + fff*r) {pos.x = constrain(pos.x, -fff*r, width+fff*r); vel.x *= -1;}
      fff = -4;
      if(pos.y < 0-fff*r || pos.y > height + fff*r) {pos.y = constrain(pos.y, -fff*r, height+fff*r); vel.y *= -1;}
    }
    // in screen
    if(pos.x > 0 && pos.x < width && pos.y > 0 && pos.y < height) init = true;
    
  }
  
  void draw() {
    pushStyle();
    noFill();
    color c = color(#FCAD00);
    if(type == 1) c = c1;
    if(type == 3) c = color(#00FCA2);
    fill(c);
    stroke(0);
    strokeWeight(3.0);
//    ellipse(pos.x, pos.y, r*2, r*2);
    popStyle();
    // path
    if(path.size() > 0) {
      pushStyle();
      noFill();
      stroke(0,100);
      strokeWeight(4.0);
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
      strokeWeight(4.0); fill(0);
      ellipse(path.get(path.size()-1).x,path.get(path.size()-1).y, 10,10);
      popStyle();
    }
    // fuel
    rectMode(CORNER);
    strokeWeight(1.0);

//    noStroke();
//    fill(0,255,0);
//    rect(pos.x - 20, pos.y - r*2 - 5, 40*fuel/100.0,5);
//    fill(0,0); stroke(0); strokeWeight(1.0);
//    rect(pos.x - 20, pos.y - r*2 - 5, 40,5);

    rr = 0.0;
    rr = (-30 + sqrt(30*30 + 4*fuel/100*675))/2;
    rr+=15;
    
//    fill(c); noStroke();
//    ellipse(pos.x,pos.y,rr,rr);
//    fill(0); noStroke();
//    ellipse(pos.x,pos.y,15,15);
//    stroke(0,100);
//    noFill();
//    ellipse(pos.x,pos.y,30,30);

    //
    rr = sqrt(fuel*30*30/100.0);
    rr = 30*fuel/100.0;
    vr += (rr-rv)*0.25;
    vr *= 0.85;
    rv = rv+vr;
    fill(c); noStroke();
    ellipse(pos.x, pos.y, rv*2, rv*2);
    stroke(c);
    noFill();
    ellipse(pos.x, pos.y, 60,60);
    
    strokeWeight(6.0);
    stroke(255,0,0,hitv);
    ellipse(pos.x,pos.y,60,60);
    stroke(0,255,0,gotv);
    ellipse(pos.x,pos.y,60,60);
  }
  
};
