

//Code Credit http://www.openprocessing.org/sketch/67346
// Sprite Credit Gamefreak/Nintendo/pldh.net 


// Setup


Zubat[] Zubs = new Zubat[200];
 PImage zubat;
void setup() {
  size(500, 700);
  smooth();
 
  for (int i = 0; i < Zubs.length; i++) {
 
    Zubs[i] = new Zubat();
    Zubs[i].setupZubat(int(random(1)));
    
    zubat = loadImage("zubat.gif");
  }
}
 
 
 // Zubat Loop + Class
 
void draw() {
  background(0);
  for (int i = 0; i <Zubs.length; i++) {
    Zubs[i].updateZub();
    Zubs[i].drawZub();
  }
}
 
class Zubat {
  float x;
  float y;
 
  float w;
  float h;
 
  float xVel;
  float yVel;
 
 
 // Zubat Positioning 
 
 
  void setupZubat(int n) {
    x = random(10, width-50);
    y = random(10, height-50);
 
   
 
  
    if (n ==0) {
 
      xVel = random(2);
      yVel = random(2);
      if (random(50) < 25) {
        xVel*=-1;
      }
      if (random(50) < 25) {
        yVel*=-1;
      }
    }
 
    if (n == 1) {
      xVel = random(2, 4);
      yVel = random(2, 4);
      if (random(50) < 25) {
        xVel*=-1;
      }
      if (random(50) < 25) {
        yVel*=-1;
      }
      
    }
     
     if (n == 2) {
        xVel = random(4, 6);
        yVel = random(4, 6);
        if (random(50) < 25) {
          xVel*=-1;
        }
        if (random(50) < 25) {
          yVel*=-1;
        }
      }
  }
 
 
  void updateZub() {
    x += xVel;
    y += yVel;
 
    if (x < 0+(w/2) || x > width-(w/2)) {
      xVel*=-1;
    }
 
    if (y < 0+(h/2) || y > width-(h/2)) {
      yVel*=-1;
    }
  }
 
  void drawZub() {
    image(zubat, x,y);
    
  }

    }





