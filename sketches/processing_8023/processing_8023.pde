
int xsize=320;
int ysize=200;
int fheight=80;
float cellsize=40;
color cellon=color(0,100,240);
color celloff=color(0,50,100);
color [] cellcol={cellon,celloff};
float move=0;
PImage ubb;
float cirrad=50;
float rot=0;
float radinc=1;

void setup () {
  size(xsize,ysize);
  fill(0);
  ubb=loadImage("ubb.jpg");
}

void draw() {
  pushMatrix();
  set(0,0,ubb);
  loadPixels();
  drawField(pixels);
  updatePixels();
  float cir;
  translate(xsize/2,ysize/2);
  rotate(rot);
  for (cir=0;cir<TWO_PI;cir+=TWO_PI/20) {
    ellipse(cirrad*cos(cir),cirrad*sin(cir),10,10);
  }
  popMatrix();
  rot+=0.02;
  cirrad+=radinc;
  if (cirrad>70 || cirrad<40) {
    radinc*=-1;
  }
}

void drawField(int [] p) {
  int i,j;
  int offs=ysize*xsize-xsize/2;
  int drawcoliy=0;
  int drawcolix;
  float cx,cy=0;
  float cxspeed=1;
  float cyspeed=PI/6;
  float acc=(PI/4)/fheight;
  float angle=(PI/3);
  float cheight=150;
  for (i=0;i<fheight;i++) {
    cx=cellsize/2;
    while (cx>cellsize) {
      cx-=cellsize;
    }
    float yy=cheight*tan(cyspeed);
    cxspeed=0;
    for (j=0;j<xsize/2;j++) {      
      cx=yy*tan(cxspeed);
      cxspeed+=angle/(xsize/2);
      drawcolix=drawcoliy;
      while (cx>cellsize) {
        drawcolix=1-drawcolix;
        cx-=cellsize;
      }      
      p[offs++]=cellcol[drawcolix];
    }
    cy=cheight*tan(cyspeed)+move;
    drawcoliy=0;
    while (cy>cellsize) {
      drawcoliy=1-drawcoliy;
      cy-=cellsize;
    }
    cyspeed+=acc;    
    offs-=xsize+xsize/2;
  }
  //flip
  offs=ysize*xsize-xsize/2;
  int offs2=offs-1;
  for (i=0;i<fheight;i++) {
    for (j=0;j<xsize/2;j++) {
      p[offs2--]=p[offs++];
    }
    offs-=xsize+xsize/2;
    offs2-=xsize/2;
  }  
  move+=2;
}

