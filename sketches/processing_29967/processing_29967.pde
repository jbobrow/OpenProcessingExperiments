
PGraphics pg;
int w, h;
PImage [] img;
PImage test;

//skal packes ind i object
int x, x2, y, y2;
int e=0;
int e2=0;
int speedx=1;
int speedx2=1;
int speedy=-1;
int speedy2=-1;
int speeder=3;

int savename=0;

void setup() {
  size(160*4, 120*4);
  smooth();
  frameRate(240);
  w=width/4;
  h=height/4;

  x=w+1;
  x2=w+w/3;
  y=h+1;
  y2=h+h/5;

  img=new PImage[16];
  for (int i=0;i<16;i++) {
    img[i]=createImage(w, h, ARGB);
  }
  pg = createGraphics(w*4, h*4, P3D);
  test=createImage(w, h, ARGB);
}

void draw() {
  action();
}

void action() {
  if (x<w || x>w*3-w) {
    speedx*=-1;
  }
  if (x2<w || x2>w*3-w) {
    speedx2*=-1;
  }
  if (y<h || y>h*3-h) {
    speedy*=-1;
  }
  if (y2<h || y2>h*3-h) {
    speedy2*=-1;
  }
  e--;
  e2++;
  x=  x+speedx*(speeder+int(random(2)));
  x2=x2+speedx2*(speeder+int(random(2)));
  y=y+speedy*(speeder+int(random(2)));
  y2=  y2+speedy2*(speeder+int(random(2)));
  pg.beginDraw();
  pg.background(0);
  pg.strokeWeight(10);
  pg.pushMatrix();
  pg.stroke(0, 255, 255);
  pg.translate(x, y);
  pg.rotateX(radians(e));
  pg.line(-w/5, -w/5, w/5, w/5);
  pg.popMatrix();
  pg.pushMatrix();
  pg.stroke(255, 255, 0);
  pg.translate(x2, y2);
  pg.strokeWeight(15);

  pg.rotateX(radians(e2));
  pg.line(-w/3, -w/3, w/3, w/3);
  pg.popMatrix();
  pg.endDraw();
  /* for(int i=0;i<3;i++){
   for(int u=0;u<3;u++){
   img[i+(u*3)].copy(pg,i*3,u*3,0,0,w,h);
   }
   }*/
  background(0);
  for (int i=4;i>-1;i--) {
    for (int u=4;u>-1;u--) {
      blend(pg, i*w, u*h, w, h, 0, 0, w, h, DIFFERENCE);
      //img[i+(u*3)].copy(pg,i*3,u*3,0,0,w,h);
    }
  }
  test=get(0, 0, w, h);
  background(0);
  for (int i=4;i>-1;i--) {
    for (int u=4;u>-1;u--) {
      image(test, i*w, u*h, w, h);
    }
  }
}

void mousePressed() {
}


