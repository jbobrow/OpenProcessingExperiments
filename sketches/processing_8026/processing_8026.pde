
//PImage utab=new PImage(320,200);
//PImage vtab=new PImage(320,200);
int [][] utab=new int [320][200];
int [][] vtab=new int [320][200];
int uoffs=0,voffs=0;
PImage tex;

void setup() {
  size(320,200);
  precalc();
  tex=loadImage("tex.jpg");
  println(tex.width);
}

void precalc() {
  int x,y,offs;
  float f;
  offs=0;
  for (y=0;y<200;y++) {
    for (x=0;x<320;x++) {
      f=8192/sqrt(pow((x-160),2)+pow((y-100),2));
      //utab.pixels[offs]=color(int(f),int(f),int(f));
      utab[x][y]=int(f)&255;
      f=128*atan2(y-100,x-160)/PI;
      //vtab.pixels[offs]=color(int(f),int(f),int(f));
      vtab[x][y]=int(f)&255;
      offs++;
    }
  }
}

void draw() {
  loadPixels();
  int x,y,offs,u,v;
  offs=0;
  for (y=0;y<200;y++) {
    for (x=0;x<320;x++) {
      u=(utab[x][y]+voffs)&255;
      v=(vtab[x][y]+uoffs)&255;
      pixels[offs++]=tex.pixels[(u<<8)+v];
    }
  }
  updatePixels();
  uoffs++;
  voffs++;
}

