
//Assignment 3: Green, Green, Grass of Home(10/30)
//TePang Chiang

PImage img1;
PImage img2;

int div = 10;

void setup(){
  size(300,500);
  img1 = loadImage("sparta-kai.jpg");
  img2 = loadImage("sparta-kai.png");
  frameRate(2);
}

void draw(){

  image(img1 ,0,0);
  
for (int i = 20; i<330; i+=1) {
    wiggle_line(i, 0, i, 430);
    }
 
  image(img2 ,0,0);

}

void wiggle_line(float sx, float sy, float ex, float ey) {

  strokeWeight(1);
  
  float xstep = (ex - sx)/div;
  float ystep = (ey - sy)/div;
  float lastx = sx;
  float lasty = sy;
  float y = sy;
  float x = sx;
  for (int i=0; i<div; i++) {
    x = x + xstep;
    x = x + random(-10,10) - 10;
    y = y + ystep;
    y = y + random(50) - 25;
    
    float s = second();
    
    stroke((s*10)%200,200,50);
    line (x, y, lastx, lasty);
    lastx = x;
    lasty = y;
  }
}



