
/** 
Deconstructing a particle system: The Grid.

A response to the different ways of filling a square by Sol LeWitt, 
also an examination of the creative process involved in creating my particle systems.

Everytime you restart the applet it will look different, whether it be the 
speed of the particles or the color, or the number.  
Philippe Moore
December 12, 2009
**/
SParticle sp, sp2;
XParticle xp, xp2;
XYParticle xyp, xyp2;
XYAParticle xyap, xyap2;

SParticles sps1, sps2;
XParticles xps1, xps2;
XYParticles xyps1, xyps2;
XYAParticles xyaps1, xyaps2;

void setup() {
  size(800, 800);
  colorMode(HSB, 1000);
  smooth();
  background(0);
  //first row
  sp = new SParticle(width/8.0, height/8.0, 10.0);
  xp = new XParticle(3*(width/8.0), height/8.0, 10.0, width/4.0, width/2.0);
  xyp = new XYParticle(5*(width/8.0), height/8.0, 10.0, width/2.0, 3*(width/4.0), 0.0, height/4.0);
  xyap = new XYAParticle(7*(width/8.0), height/8.0, 10.0, 3*(width/4.0), width/1.0, 0.0, height/4.0);
  //second row
  sp2 = new SParticle(width/8.0, 3*(height/8.0), 10.0);
  xp2 = new XParticle(3*(width/8.0), 3*(height/8.0), 10.0, width/4.0, width/2.0);
  xyp2 = new XYParticle(5*(width/8.0), 3*(height/8.0), 10.0, width/2.0, 3*(width/4.0), height/4.0, height/2.0);
  xyap2 = new XYAParticle(7*(width/8.0), 3*(height/8.0), 10.0, 3*(width/4.0), width/1.0, height/4.0, height/2.0);
  //third row
  sps1 = new SParticles(random(30), 0.0, width/4.0, height/2.0, 3*(height/4.0));
  xps1 = new XParticles(random(30), width/4.0, width/2.0, height/2.0, 3*(height/4.0)); 
  xyps1 = new XYParticles(5.0, width/2.0, 3*(width/4.0), height/2.0, 3*(height/4.0));
  xyaps1 = new XYAParticles(10.0, 3*(width/4.0), width/1.0, height/2.0, 3*(height/4.0));
  //fourth row
  sps2 = new SParticles(random(30), 0.0, width/4.0, 3*(height/4.0), height/1.0);
  xps2 = new XParticles(random(30), width/4.0, width/2.0, 3*(height/4.0), height/1.0); 
  xyps2 = new XYParticles(5.0, width/2.0, 3*(width/4.0), 3*(height/4.0), height/1.0);
  xyaps2 = new XYAParticles(10.0, 3*(width/4.0), width/1.0, 3*(height/4.0), height/1.0);
}

void draw() {
  //background(499);
  lines();
  strokeWeight(1);
  //first row
  sp.display(0);
  xp.display(0);
  xyp.display(0);
  xyap.display(0);
  //second row
  sp2.display(1);
  xp2.display(1);
  xyp2.display(1);
  xyap2.display(1);
  //third row
  sps1.display(0);
  xps1.display(0);
  xyps1.display(0);
  xyaps1.display(0);
  //fourth row
  sps2.display(1);
  xps2.display(1);
  xyps2.display(1);
  xyaps2.display(1);
}

int startX = 0;
int startY = 0;

void lines() {
  strokeWeight(10);
  for (int i=0; i<5; i++) {
    line(startX, startY, startX, height);
    startX+=width/4;
  }
  startX=0;
  for (int j=0; j<5; j++) {
    line(0, startY, width, startY);
    startY+=height/4;
  }
  startY=0;
}
    

