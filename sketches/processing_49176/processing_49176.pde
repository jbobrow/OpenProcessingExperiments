
/*
Author: vicky lo
Purpose: Assignment-4 "Flowering Flowers"
Concept: Winter Flower
Reference: 1.Noisy Spirals, Noisy Circles, and 100 Spirals. Exercises provided in class by:schien@mail.ncku.edu.tw
*/
  
float maxDistance;

  
void setup() {
  size(600, 400);
  background(0,112,33,10);
  strokeWeight(1);
  smooth();
  //noLoop();
  frameRate (10);

 }
 
 
 
void flower() {
  // refresh
  int centX = 150;
  int centY = 200;
  float x, y;
  // draw 100 spirals
  for (int i = 0; i<100; i++) {                                        
    float lastx = -999;
    float lasty = -888;
    float radiusNoise = random(10);
    float radius = 20;
    stroke(random(50), random(100), random(300), 80);
  
    int startangle = int(random(360));                                 
    int endangle =  1440 + int(random(1440));                          
    int anglestep =  5 + int(random(5));
    for (float ang = startangle; ang <= endangle; ang += anglestep) {
      radiusNoise += 1;
      radius += 0.5;
      float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
      float rad = radians(ang);
      x = centX + (thisRadius * cos(rad));
      y = centY + (thisRadius * sin(rad));
      if (lastx > -999) {
        line(x,y,lastx,lasty);
      }
      lastx = x;
      lasty = y;
    }
  }
}
void branches () {
    if
    (mousePressed) {
    strokeWeight (0); 
    stroke(20,219,21);
     
  float xstep = 10;
  float ystep = 10;
  float lastx = random (50);
  float lasty = random (50);
  float y = random (500);
  for (int x=0; x<=500; x+=xstep) {
    ystep = random(10) - 10;
    y += ystep;
     
    line(y, x, lasty, lastx);
     
    line(x, x+y-100, lastx, lastx+lasty-100);
         
    lastx = x;
    lasty = y;
  }
}
}
void fade() {
  fill(255, 10);
  noStroke();
  rect(0, 0, width, height);
}

void draw(){
  flower();
  branches();
   fade();
}


