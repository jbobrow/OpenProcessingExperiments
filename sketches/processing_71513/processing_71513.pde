
/*
kof timestamp:
 Fri Sep 21 23:41:46 CEST 2012
 
 
 
 ,dPYb,                  ,dPYb,
 IP'`Yb                  IP'`Yb
 I8  8I                  I8  8I
 I8  8bgg,               I8  8'
 I8 dP" "8    ,ggggg,    I8 dP
 I8d8bggP"   dP"  "Y8ggg I8dP
 I8P' "Yb,  i8'    ,8I   I8P
 ,d8    `Yb,,d8,   ,d8'  ,d8b,_
 88P      Y8P"Y8888P"    PI8"8888
 I8 `8,
 I8  `8,
 I8   8I
 I8   8I
 I8, ,8'
 "Y8P'
 */



/////////////////////// RESOLUTION 

float res = 2;
HashMap pnts;

/////////////////////// BASIC VARS

float X, Y, pX, pY;

/////////////////////// SETUP

void setup() {

  size(444, 333, P2D);

  colorMode(HSB);

  pnts = new HashMap();

  int cnt = 0;

  for (float y = 0;y<height;y+=res)
    for (float x = 0;x<width;x+=res) {
      pnts.put(cnt, new Pnt(new PVector(x, y)));
      cnt++;
    }
}

/////////////////////// DRAW


void draw() {
  /////////////////////// SLOW FADE
  fill(0, 200);
  noStroke();
  rect(0, 0, width, height);

  /////////////////////// CAMERA SHAKE
  translate((noise(frameCount/2.0, 0)-0.5)*10, (noise(0, frameCount/2.0)-0.5)*10);

  pX = X;
  pY = Y;

  X = mouseX;//noise(frameCount/30.0,0)*width;
  Y = mouseY;//noise(0,frameCount/30.0)*height;


  for (int i =0 ; i < pnts.size();i++) {
    Pnt tmp = (Pnt)pnts.get(i);

    tmp.update();
  }

  for (int i =0 ; i < pnts.size();i++) {
    Pnt tmp = (Pnt)pnts.get(i);

    tmp.draw();
  }


  /////////////////////// PIX EFFECTS
 fastblur(g, 2); 
  blend(g, 0, 0, width, height, 0, 0, width, height, ADD);
 

 }

/////////////////////// CLASS DEFINITION

class Pnt {
  PVector bpos, pos, vel, acc, forward, back;
  float d;

  Pnt(PVector _pos) {
    bpos = new PVector(_pos.x, _pos.y);
    pos = new PVector(_pos.x, _pos.y);

    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void draw() {

    stroke(lerpColor(color(vel.mag()*22+120, 5, 255), #ffcc00, norm(atan2(vel.y-acc.y, vel.x-vel.x), -PI, PI)), 200-d);
    if (d<200 && vel.mag()<30.0) {
      //strokeWeight(constrain(vel.mag()/20.0,1.1,2));
      point(pos.x, pos.y);
    }
  }

  /////////////////////// DYNAMICS MOVEMENT DESCRIPTION
  void update() {
    d = dist(bpos.x, bpos.y, X, Y);
    forward = new PVector(X-bpos.x, Y-bpos.y);
    acc.add(forward);

    float sp = dist(X, Y, pX, pY);
    acc.mult(30.123/(d+sp));

    back = new PVector(bpos.x-pos.x, bpos.y-pos.y);
    acc.add(back);
    acc.mult(1/(d+0.00001));
    vel.add(acc);
    pos.add(vel);

    vel.mult(0.99-1/(d+1.001));
    acc.limit(100.0);
    vel.limit(100.0);
  }
}


/////////////////////// MODIFY AS YOU NEED!


