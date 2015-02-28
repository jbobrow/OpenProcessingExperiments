
/** Animation with moving layers<br />
* 19. Jan 2011 by Peter Bosshard */
MovingLight[] mol;
Halm[] hlm;
MovingPanorama mopa,mopb,mopc;
int numl,numh;
color skyClr,seeClr;

void setup() {
  size(360,270,P2D);
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


