
int [] x=new int [4];  //spline coordinates
int [] y=new int [4];
float t=0;  //spline parameter
PImage bob;
PImage [] bkg=new PImage[4];  //background buffers
int bkgswitch=0;  //background switcher

void setup() {
  int i,j,offs=0;
  for (j=0;j<4;j++) {
    x[j]=int(random(5,320-25));
    y[j]=int(random(5,200-25));
  }
  for (j=0;j<4;j++) {
    bkg[j]=new PImage(320,200); 
    for (i=0;i<64000;i++) {  //is there no simpler way to fill an arbitrary PImage?
      bkg[j].pixels[i]=0xff000000;
    }
  }
  size(320,200);
  background(color(0));
  bob=loadImage("bbb.gif");
  for (i=0;i<17;i++) {
    for (j=0;j<17;j++) {
      if ((sq(i-8.5)+sq(j-8.5))>sq(8.0)) {
        bob.pixels[j+i*17]&=0xffffff;     
      } 
    }
  }
  frameRate(20);
}

void draw() {
  int j,xx,yy;
  xx=int(curvePoint(x[0],x[1],x[2],x[3],t));
  yy=int(curvePoint(y[0],y[1],y[2],y[3],t));
  bkg[bkgswitch].blend(bob,0,0,17,17,xx,yy,17,17,BLEND);
  set(0,0,bkg[bkgswitch]);
  bkgswitch=(bkgswitch+1)&3;
  t+=0.025;
  if (t>1) {
    for (j=0;j<3;j++) {
      x[j]=x[j+1];
      y[j]=y[j+1];
    }
    x[3]=int(random(5,320-25));
    y[3]=int(random(5,200-25));      
    t=0;
  }
}

