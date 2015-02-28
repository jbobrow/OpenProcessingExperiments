
/* @pjs preload="boat.png, wave1.png, wave2.png, wave3.png, wave4.png, wave5.png"; font = "JosefinSlab-Bold.ttf"; */

int x1 = -600 ;
int x2 = 0 ;
int x3 = -600 ;
int x4 = 0 ;
int x5 = -600 ;
int xb = -300 ;

int xt = 850 ;

PFont Josefin ;

PImage boat ;
PImage wave1 ;
PImage wave2 ;
PImage wave3 ;
PImage wave4 ;
PImage wave5 ;

void setup() {
  size(800,800);
  background(#27ffe8);
  noStroke();
  ellipseMode(CENTER);
  boat = loadImage("boat.png");
  wave1 = loadImage("wave1.png");
  wave2 = loadImage("wave2.png");
  wave3 = loadImage("wave3.png");
  wave4 = loadImage("wave4.png");
  wave5 = loadImage("wave5.png");
  Josefin = createFont("JosefinSlab-Bold.ttf", 200);
  frameRate(20);
}

void draw() {
  background(#27ffe8);
  
  textFont(Josefin);
  fill(#b8fcf7);
  text("I'M ON A BOAT!", xt, 220);
  xt = xt - 5 ;
  if (xt < -1800) {
    xt = 850;
  }
  
//Boat
  image(boat,xb,70,244,310) ;
 
  xb = xb + 1 ;
  if (xb > 850) {
    xb = -300 ;
  }
 
  
  
//Waves
  image(wave1,x1,0,1400,800) ;
  x1 = x1 + 5 ;
  if (x1 > 0) {
    x1 = -600 ;
  }
  image(wave2,x2,0,1400,800) ;
  x2 = x2 - 4 ;
  if (x2 < -600) {
    x2 = 0 ;
  }
  image(wave3,x3,0,1400,800) ;
  x3 = x3 + 3 ;
  if (x3 > 0) {
    x3 = -600 ;
  }
  image(wave4,x4,0,1400,800) ;
  x4 = x4 - 2 ;
  if (x4 < -600) {
    x4 = 0 ;
  }
  image(wave5,x5,0,1400,800) ;
  x5 = x5 + 1 ;
  if (x5 > 0) {
    x5 = -600 ;
  }
}


