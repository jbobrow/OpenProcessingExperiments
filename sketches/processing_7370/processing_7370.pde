
PImage a;
boolean ashow;
float ax;
float ay;

PImage b;
boolean bshow;
float bx;
float by;

PImage c;
boolean cshow;
float cx;
float cy;

PImage d;
boolean dshow;
float dx;
float dy;

PImage e;
boolean eshow;
float ex;
float ey;

PImage f;
boolean fshow;
float fx;
float fy;

PImage g;
boolean gshow;
float gx;
float gy;

PImage h;
boolean hshow;
float hx;
float hy;

PImage i;
boolean ishow;
float ix;
float iy;

PImage j;
boolean jshow;
float jx;
float jy;

PImage k;
boolean kshow;
float kx;
float ky;

PImage er;

int timercount;
int timerstart;
int q;
int w;

PImage img;
String imageName;
String imageName2;
String imageName3;
String imageName4;
String imageName5;

void setup(){
  size(600,500);
  background(57,111,224);
  
  timerstart = 0;
  
  w = 0;
  
  er = loadImage("error.png");
  
  a = loadImage("popup.jpg");
  ax = random(-150,100);
  ay = random(-150,100);
  float xa = random(0,1);
  if (xa< 0.5) {
    ashow = true;
  } else {
    ashow = false;
  }
  
  b = loadImage("popup3.jpg");
  bx = random(-50,250);
  by = random(0,height-250);
  float xb = random(0,1);
  if (xb< 0.5) {
    bshow = true;
  } else {
    bshow = false;
  }
  
  c = loadImage("popup5.jpg");
  cx = random(-100,300);
  cy = random(-100,height-200);
  float xc = random(0,1);
  if (xc< 0.5) {
    cshow = true;
  } else {
    cshow = false;
  }
  
  d = loadImage("popup10.jpg");
  dx = random(-100,width-300);
  dy = random(50,height);
  float xd = random(0,1);
  if (xd< 0.5) {
    dshow = true;
  } else {
    dshow = false;
  }
  
  e = loadImage("popup8.jpg");
  ex = random(-100,width);
  ey = random(-100,height);
  float xe = random(0,1);
  if (xe< 0.5) {
    eshow = true;
  } else {
    eshow = false;
  }
  
  f = loadImage("popup11.jpg");
  fx = random(-100,width-200);
  fy = random(-100,height-250);
  float xf = random(0,1);
  if (xf< 0.5) {
    fshow = true;
  } else {
    fshow = false;
  }
  
  g = loadImage("popup9.jpg");
  gx = random(-100,400);
  gy = random(200,300);
  float xg = random(0,1);
  if (xg< 0.6) {
    gshow = true;
  } else {
    gshow = false;
  }
  
  h = loadImage("popup2.jpg");
  hx = random(-100,width-100);
  hy = random(-100,height-100);
  float xh = random(0,1);
  if (xh< 0.6) {
    hshow = true;
  } else {
    hshow = false;
  }
  
  i = loadImage("popup4.jpg");
  ix = random(-100,width-100);
  iy = random(-100,height-100);
  float xi = random(0,1);
  if (xi< 0.6) {
    ishow = true;
  } else {
    ishow = false;
  }
  
  j = loadImage("popup1.jpg");
  jx = random(0,width);
  jy = random(0,height);
  float xj = random(0,1);
  if (xj< 0.6) {
    jshow = true;
  } else {
    jshow = false;
  }
  
  k = loadImage("popup7.jpg");
  kx = random(0,width);
  ky = random(0,height);
  float xk = random(0,1);
  if (xk< 0.6) {
    kshow = true;
  } else {
    kshow = false;
  }
  
  int num = int(random(1,12));
imageName = "popup" + num + ".jpg";

}

void draw(){
  q = w += 1;

timercount = (timerstart += 1);

if(ashow) {
   image(a, ax, ay);
 }

if(bshow) {
   image(b, bx, by);
 }

if(cshow) {
   image(c, cx, cy);
 }
 
if(dshow) {
   image(d, dx, dy);
 }

if(eshow) {
   image(e, ex, ey);
 }
 
if(fshow) {
   image(f, fx, fy);
 }
 
if(gshow) {
   image(g, gx, gy);
 }
 
if(hshow) {
   image(h, hx, hy);
 }
 
if(ishow) {
   image(i, ix, iy);
 }
 
if(jshow) {
   image(j, jx, jy);
 }
 
if(kshow) {
   image(k, kx, ky);
 }
 
 if((keyPressed) || (mousePressed)){
  int num = int(random(1,11));
  int num2 = int(random(1,11));
  int num3 = int(random(1,11));
  int num4 = int(random(1,11));
  int num5 = int(random(1,11));
  imageName = "popup" + num + ".jpg";
  imageName2 = "popup" + num2 + ".jpg";
  imageName3 = "popup" + num3 + ".jpg";
  imageName4 = "popup" + num4 + ".jpg";
  imageName5 = "popup" + num5 + ".jpg";
  img = loadImage(imageName);
  g = loadImage(imageName);
  h = loadImage(imageName2);
  i = loadImage(imageName3);
  j = loadImage(imageName4);
  k = loadImage(imageName5);
  }

  if(timercount > 400){
    background(0,0,255);
    image(er,100,150);
  }
  
}

