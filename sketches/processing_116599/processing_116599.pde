
// balloon
boolean flag = false;
PVector balloon = new PVector();
PVector balloontarget = new PVector();
int balloonHeight = 0;
int balloonSlots = 6;
int balloonWeights[];
int balloonNextSlot = 0;
float balloonNotch;

boolean win = false;

int targetHeight = 3;
int heightRange = 6;
int numWeights = 6;
float heightInterval = 50.0;

int pilx = 400;

ArrayList<Weight> weights = new ArrayList<Weight>();



float speed = 0.0;

PImage bg;
PImage zrb;
PImage pil;

// init
void setup() {
  size(440,440);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(24);
  
  bg = loadImage("balloonbg.png");
  zrb = loadImage("balloon.png");
  pil = loadImage("pillar.png");
  
  balloon = new PVector(100,heightInterval);
  balloonWeights = new int[6];
  
  for(int i = 0; i < numWeights; i++) {
    Weight w = new Weight(new PVector(40+i*40,400),1);
    weights.add(w);
  }
  
}

// update
void draw() {
  // bg
  background(0);
  image(bg,0,0);
  
  // pilar
  float pily = heightInterval + targetHeight*heightInterval;
  image(pil, pilx - pil.width/2, pily - pil.height/2);
  
  // balloon
  balloon.y += 0.1 * (balloontarget.y - balloon.y);
//  rect(balloon.x, balloon.y, 120,20);
  image(zrb, balloon.x - zrb.width/2, balloon.y - zrb.height + 20);
  int balloonTotal = 0;
  for(int i = 0; i < balloonSlots; i++) {
    if(balloonWeights[i] != 0) {
      Weight w = weights.get(balloonWeights[i]-1);
      balloonTotal += w.value;
      w.pos.y = balloon.y;
    }
  }
  balloontarget = new PVector(balloon.x, heightInterval + balloonTotal*heightInterval);
  for(int i = 0; i < balloonSlots; i++) {
    float x = balloon.x - 0.5*(balloonSlots)*20.0 + 0.5*20.0 + i*20.0;
    ellipse(x,balloon.y,10,10);
  }
  // move weights down
  for(int i = 1; i < balloonSlots; i++) {
    if(balloonWeights[i-1] == 0 && balloonWeights[i] != 0) {
      balloonWeights[i-1] = balloonWeights[i];
      balloonWeights[i] = 0;
    }
  }
  // take weights off
  for(int i = 0; i < balloonSlots; i++) {
    if(balloonWeights[i] != 0) {
      Weight w = weights.get(balloonWeights[i]-1);
      if(!w.onBalloon) balloonWeights[i] = 0;
    }
    if(balloonWeights[i] != 0) {
      Weight w = weights.get(balloonWeights[i]-1);
      w.targetpos.x = balloon.x - 0.5*(balloonSlots)*20.0 + 0.5*20.0 + i*20.0;
      w.targetpos.y = balloon.y;
    }
  }
  // put weights on
  for(int i = weights.size()-1; i >= 0; i--) {
    Weight w = weights.get(i);
    if(!w.onBalloon && !w.dragged) {
      // col
      if(abs(balloon.x - w.pos.x) < 70 && abs(balloon.y - w.pos.y) < 30) {
        // available spot?
        for(int j = 0; j < balloonSlots; j++) {
          if(balloonWeights[j] == 0) {
            balloonWeights[j] = i+1;
            w.onBalloon = true;
            w.targetpos.x = balloon.x - 0.5*(balloonSlots)*20.0 + 0.5*20.0 + i*20.0;
            w.targetpos.y = balloon.y;
            w.pos.y = balloon.y;
            break;
          }
        }
      }
    }
  }
  
  // weights
  for(Weight w : weights) {
    w.update();
    w.draw();
  }
  
  // yay!
  if(abs(pily - balloon.y) < 10.0 && balloonTotal == targetHeight) {
    win = true;
  }
  if(win) {
    pilx -= 4;
    if(pilx < -40) {
      pilx = width + 400;
      targetHeight = floor(random(heightRange));
    }
    if(pilx == 400) win = false;
  }
  
}

// weight class
class Weight {
  PVector pos;
  PVector targetpos;
  PVector originpos;
  PVector offset = new PVector();
  boolean dragged = false;
  boolean active = true;
  boolean onBalloon = false;
  PImage img;
  int value = 0;
  
  
  Weight(PVector p, int t) {
    pos = p.get();
    targetpos = pos.get();
    originpos = pos.get();
    value = t;
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
        targetpos = originpos.get();
        flag = false;
      }
    } else {
      if(mousePressed && !flag && !win) {
        if(abs(mouseX - pos.x) < 20.0) {
          if(abs(mouseY - pos.y) < 20.0) {
            dragged = true;
            onBalloon = false;
            targetpos = originpos.get();
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
    if(!onBalloon) ellipse(pilx-400+pos.x, pos.y, 20.0, 20.0);
    else ellipse(pos.x, pos.y, 20.0, 20.0);
    popStyle();
  }
  
};


