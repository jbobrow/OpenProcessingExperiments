

MovingLight[] mol;
Halm[] hlm;
MovingPanorama mopa,mopb,mopc;
int numl,numh;
color skyClr,seeClr;

void setup() {
  size(900,450,P2D);
  colorMode(HSB,1.0,1.0,1.0,1.0);
  frameRate(25);
  skyClr = color(0.6,0.8,0.1,1.0);
  
  mopa = new MovingPanorama(1,1,100,20.0, 120.0, width,height,0.3);
  mopb = new MovingPanorama(1,2,120,20.0, 90.0, width,height,0.4);
  mopc = new MovingPanorama(1,3,150,30.0, 100.0, width,height,0.5);
  numl = 20;
  mol = new MovingLight[numl];
  for(int i=0;i<numl;i++) {
    mol[i] = new MovingLight(random(width),random(height), 50.0,width,height);
  }
  numh = 30;
  hlm = new Halm[numh];
  for(int i=0;i<numh;i++) {
    hlm[i] = new  Halm(width/numh*i, height,10+random(10.0),height/8+random(height/8*7),color(random(1.0),0.3,0.1,1.0),width,height);
  }
}

void draw() {
  background(skyClr);
  for(int i=0;i<120;i++) {
    seeClr = color(0.5+0.2/120*i,1.0/120*i,0.2,1.0);
    stroke(seeClr);
    line(0,150+i,width,150+i);
  }
  mopa.display();
  mopb.display();
  mopc.display();

  for(int i=0;i<mol.length;i++) {
    mol[i].display();
    mol[i].move();
  }
  for(int i=0;i<hlm.length;i++) {
    hlm[i].move(-5);
    hlm[i].display();
  }
}
class Halm {
  float breite;
  float hoehe;
  float stagewidth;
  float stageheight;
  color fillClr;
  int posx;
  int posy;
  float cx1,cx2,cx3,cx4;
  float cy1,cy2,cy3,cy4;
  float px1,py1,px2,py2,px3,py3;

  Halm(int x, int y,float b,float h,color fb,float w,float he) {
    breite = b;
    hoehe = h;
    stagewidth = w;
    stageheight = he;
    fillClr = fb;
    posx = x;
    posy = y;
    py1 = py2 = posy;
    px1 = (posx-b/2.0);
    px2 = (posx+b/2.0);
    cy1 = py1 - floor(random(hoehe));
    cy2 = py2 - floor(random(hoehe));
    cx1 = posx-breite/2+floor(random(breite));
    cx2 = posx+breite/2+floor(random(breite));
    px3 = posx+floor(random(-1.0,1.0)*breite);
    py3 = posy - hoehe;
    cx3 = px3 - floor(random(breite));
    cx4 = px3 + floor(random(breite));
    cy3 = py3 + floor(random(hoehe/2));
    cy4 = py3 + floor(random(hoehe/2));
  }

  void move(float offx) {
    float dpx1 = posx-px1;
    float dpx2 = px2-posx;
    float dpx3 = 0;
    float richt = 0;
    if(px3<posx) {
      richt = -1;
      dpx3 = posx-px3;
    }
    else {
      dpx3 = px3-posx;
      richt = 1;
    }
    float dcx1 = posx-cx1;
    float dcx2 = cx2-posx;
    float dcx3 = posx-cx3;
    float dcx4 = cx4-posx;
    posx += offx;
    if(posx<0) {
      posx = int(stagewidth);
    }
    else if(posx>stagewidth) {
      posx = 0;
    }
    px1 = posx - dpx1;
    px2 = posx + dpx2;
    if(richt<=0) {
      px3 = posx - dpx3;
    }
    else {
      px3 = posx + dpx3;
    }
    cx1 = posx - dcx1;
    cx2 = posx + dcx2;
    cx3 = posx - dcx3;
    cx4 = posx + dcx4;
  }

  void display() {
    stroke(fillClr);
    fill(fillClr);
    beginShape();
    vertex(px1,py1);
    bezierVertex(cx1, cy1, cx3, cy3, px3, py3);
    vertex(px3, py3);
    bezierVertex(cx4, cy4, cx2, cy2, px2, py2);
    vertex(px2,py2);
    vertex(px1,py1);
    endShape(CLOSE);
  }
}
class MovingLight {
  float vx;
  float vy;
  float maxrad;
  float posx;
  float posy;
  float stagew;
  float stageh;
  float farbton;
  MovingLight(float x,float y, float r,float w,float h) {
    posx = x;
    posy = y;
    maxrad = r;
    stagew = w;
    stageh = h;
    vx = random(-1.0,1.0);
    vy = -random(1.0)*5;
    farbton = random(1.0);
  }
  void display() {
    colorMode(HSB,1.0,1.0,1.0,1.0);
    ellipseMode(CENTER);
    smooth();
    noStroke();
    for(float i=maxrad;i> 0.0;i-=maxrad/10) {
      fill(color(farbton,random(0.3),maxrad/i,1.0/i));
      ellipse(posx,posy,i,i);
    }
  }
  void move() {
    
    int zuf = floor(random(500))+200;
    if(frameCount%zuf==0){
      vx = random(-1.0,1.0);
    }
    
    float nposx = posx+vx;
    float nposy = posy+vy;
    if(nposy<0){
      posy = stageh;
    }else{
      posy = nposy;
    }
    if(nposx > stagew){
      posx = 0;
    }else if(nposx < 0){
      posx = stagew;
    }else{
      posx = nposx;
    }
  }
}
class MovingPanorama {
  int direction;
  int velocity;
  float base;
  float min_height;
  float max_height;
  int stagewidth;
  int stageheight;
  float heights[];
  int curridx;
  float noisescale = 0.01;
  float noiseval;
  float persp;
  MovingPanorama(int dir,int vel,float bas,float minh, float maxh, int w,int h,float p) {
    direction = dir;
    velocity = vel;
    base = bas;
    min_height = minh;
    max_height = maxh;
    stagewidth = w;
    stageheight = h;
    persp = p;
    heights = new float[stagewidth+velocity];

    if(direction>=0) {
      curridx = 0;
      direction = 1;
      for(int i=0;i<heights.length;i++) {
        noiseval += noisescale;
        heights[i] = noise(noiseval)*(max_height-min_height);
      }
    }
    else {
      curridx = heights.length-1;
      direction = -1;
      for(int i=heights.length-1;i>0;i--) {
        noiseval += noisescale;
        heights[i] = noise(noiseval)*(max_height-min_height);
      }
    }
  }

  void display() {

    colorMode(HSB,1.0,1.0,1.0,1.0);
    color fb = color(0.4,persp/2.0,persp,1.0);
    if(direction>0) {
      noFill();
      stroke(fb);
      for(int i=0;i<heights.length-velocity;i++) {
        line(i,base,i,base-heights[i]);
      }

      for(int i=velocity;i<heights.length;i++) {
        heights[i-velocity] = heights[i];
      }
      for(int i=heights.length-velocity;i<heights.length;i++) {
        noiseval += noisescale;
        heights[i] = noise(noiseval)*(max_height-min_height);
      }
    }
    else {
      noFill();
      stroke(fb);
      for(int i=velocity;i<heights.length;i++) {
        line(i,base,i,base-heights[i]);
      }
      for(int i=heights.length-1;i>velocity;i--) {
        heights[i] = heights[i-velocity];
      }
      for(int i=velocity;i>0;i--) {
        noiseval += noisescale;
        heights[i] = noise(noiseval)*(max_height-min_height);
      }
    }
    //if(noiseval>0.9) noiseval = noisescale;
  }
}

