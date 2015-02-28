
//Elli_091912

float x=50;
float y=200;
float xx=300;
float yy=200;
float cx=200;
float cy=-2;
float ccx=20;
float ccy=-10;

float xd=0;
float yd=0;
float xxd=0;
float yyd=0;
float cxd=0;
float cyd=0;
float ccxd=0;
float ccyd=0;

float xi=20;
float yi=15;
float xxi=15;
float yyi=10;
float cxi=9;
float cyi=5;
float ccxi=5;
float ccyi=2;

float r=50;
float g=234;
float b=79;

void setup() {
  size(300, 300);
  background(255);
  smooth();
  frameRate(100);

}

void draw () {
  background(255);
  noStroke();

  translate(-22, -55);
  fill(r, g, b);
  bezier(x, y, cx, cy, ccx, ccy, xx, yy);
  x+=(xi*xd);
  y+=(yi*yd);
  xx+=(xxi*xxd);
  yy+=(yyi*yyd);
  cx+=(cxi*cxd);
  cy+=(cyi*cyd);
  ccx+=(ccxi*ccxd);
  ccy+=(ccyi*ccyd);


  if (x>=500) {
    x= 500-1;
    xd= -1;
  }

  if (x<=1) {
    x=1;
    xd=1;
  }

  if (y>=500) {
    y=500-1;
    yd=-1;
  }
  if (y<=1) {
    y=1;
    yd=1;
  }

  if (cx>=500) {
    cx=500-1;
    cxd=-1;
    g+=10;
  }
  if (cx<=1) {
    cx=1;
    cxd=1;
    g-=15;
  }

  if (cy>=500) {
    cy=500-1;
    cyd=-1;
    r+=15;
  }
  if (cy<=1) {
    cy=1;
    cyd=1;
    r+=30;
  }

  if (ccx>=500) {
    ccx=500-1;
    ccxd=-1;
  }
  if (ccx<=1) {
    ccx=1;
    ccxd=1;
  }

  if (ccy>=500) {
    ccy=500-1;
    ccyd=-1;
    b+=10;
  }
  if (ccy<=1) {
    ccy=1;
    ccyd=1;
    b+=5;
  }

  if (xx>=500) {
    xx=500-1;
    xxd=-1;
  }
  if (xx<=1) {
    xx=1;
    xxd=1;
  }

  if (yy>=500) {
    yy=500-1;
    yyd=-1;
  }
  if (yy<=1) {
    yy=1;
    yyd=1;
  }
}


