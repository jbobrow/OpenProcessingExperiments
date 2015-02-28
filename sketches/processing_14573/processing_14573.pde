

// import processing.opengl.*;

static final int NBALLS = 8;
static final int texRes = 512;

int divisions = 1;
PFont fontA;

class Bally {
  PVector ctr;
  PVector vel;
  float rad;
  Bally(float x, float y) {
    float f = texRes/128.0;
    ctr = new PVector(f*x,f*y,0);
    vel = new PVector(0,0,0);
    rad = f*4.0;
  }
  void advance(float Limit) {
    ctr.add(vel);
    if (ctr.x<0) { ctr.x = abs(ctr.x); vel.x *= -1.0; }
    if (ctr.x>=Limit) { ctr.x = 2.0*Limit-ctr.x; vel.x *= -1.0; }
    if (ctr.y<0) { ctr.y = abs(ctr.y); vel.y *= -1.0; }
    if (ctr.y>=Limit) { ctr.y = 2.0*Limit-ctr.y; vel.y *= -1.0; }
  }
}


PGraphics pg;

Bally[] balls;

public void setup() {
  size(800,600,P3D);
  balls = new Bally[NBALLS];
  for (int i=0; i<NBALLS; i++) {
    balls[i] = new Bally(random(44,84), random(44,84));
    balls[i].vel.x = random(-.2,.2);
    balls[i].vel.y = random(-.2,.2);
  }
  pg = createGraphics(texRes,texRes,P3D);
  divisions = 1;
  fontA  = createFont("Arial", 32);
  textFont(fontA);
  pg.textFont(fontA);
}

public void draw() {
  pg.beginDraw();
  pg.background(90);
  pg.noStroke();
  pg.noFill();
  pg.strokeWeight=1;
  pg.stroke(60);
  for (int i=0; i<texRes; i++) {
    int q = ((i*16) & 0xFF);
    pg.stroke(q,0,0,32);
    pg.line(0,i,texRes,i);
    pg.stroke(0,q,0,32);
    pg.line(i,0,i,texRes);
  }
  pg.fill(255);
  pg.text("Divisions = "+divisions,5,40);
  pg.fill(150);
  pg.text("(arrow keys change)",10,70);
  pg.fill(200);
  for (int i=0; i<NBALLS; i++) {
    Bally b = balls[i];
    b.advance((float)texRes);
    pg.ellipse(b.ctr.x,b.ctr.y,b.rad,b.rad);
  }
  pg.endDraw();
  float cs = 512.0;
  float hs = cs/2.0;
  float ss = cs/texRes;
  background(128);
  camera(
  //width/2.0,height/2.0, (height/2.0) / tan(PI*60.0 / 360.0),
  0.0, 0.0, (height/2.0) / tan(PI*60.0 / 360.0),
        0.0, 0.0, 0.0,
        //width/2.0, height/2.0, 0.0,
        0.0, 1.0, 0.0);
  rotateX(0.75);
  rotateY(0.005*frameCount);
  textureMode(NORMALIZED);
  noStroke();
  fill(255);
  float uvstep = 1.0/divisions;
  for (int j=0; j<divisions; j++) {
    float v = j/(float)divisions;
    float vn = v + uvstep;
    for (int i=0; i<divisions; i++) {
      float u = i/(float)divisions;
      float un = u + uvstep;
      beginShape();
      texture(pg);
      vertex((u*cs)-hs,(v*cs)-hs,0, u,v);
      vertex((un*cs)-hs,(v*cs)-hs,0, un,v);
      vertex((un*cs)-hs,(vn*cs)-hs,0, un,vn);
      vertex((u*cs)-hs,(vn*cs)-hs,0, u,vn);
      endShape();
    }
  }
  noFill();
  strokeWeight(1);
  stroke(255,100,20);
  for (int i=0; i<(NBALLS/2); i++) {
    Bally b = balls[i];
    Bally c = balls[i+(NBALLS/2)];
    bezier(ss*b.ctr.x-hs,ss*b.ctr.y-hs,0,
           ss*b.ctr.x-hs,ss*b.ctr.y-hs,100,
           ss*c.ctr.x-hs,ss*c.ctr.y-hs,100,
           ss*c.ctr.x-hs,ss*c.ctr.y-hs,0);
     ellipse(ss*b.ctr.x-hs,ss*b.ctr.y-hs,ss*b.rad,ss*b.rad);
     ellipse(ss*c.ctr.x-hs,ss*c.ctr.y-hs,ss*b.rad,ss*b.rad);
  }
  line(hs,hs,0, hs,hs,20);
  line(-hs,hs,0, -hs,hs,20);
  line(-hs,-hs,0, -hs,-hs,20);
  line(hs,-hs,0, hs,-hs,20);
}

public void keyReleased() {
  if (key == CODED) {
    if ((keyCode == UP) || (keyCode == RIGHT)) {
      divisions++;
    } else if ((keyCode == DOWN) || (keyCode == LEFT)) {
      divisions--;
      if (divisions<1) {
        divisions=1;
      }
    } else {
        text("?",width,height);
    }
  }
}

