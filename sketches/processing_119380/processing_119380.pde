
//Assignment 4: Flowering Flowers 2013.11.06
//TePang Chiang N76014087

int div = 10;
float s = second();
int counter = 0;

void setup() {
  size(600, 600);
  frameRate(2);
  background(0);
}

void draw() { 
  
if (counter >30) {
    clearBackground();
    counter = 0;
}

//background  grass 

for (int i = 0; i<700; i+=3) {
    Grass(i, -50, i, 500);
}
    
//Flowers
//Flower(mouseX, mouseY,10);
  
stroke(255,180,  0);
Flower(int(random(width)), int(random(height)),50);
counter++;
stroke(255, 10,150,150);
scale(random(1,1.5));
Flower(int(random(width)), int(random(height)),50);
counter++;
stroke(200, 20,255,50);
scale(random(1.5,2));
Flower(int(random(width)), int(random(height)),50);
counter++;

}

//background  grass 
void Grass(float sx, float sy, float ex, float ey) {

strokeWeight(random(0.5,1));
   
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
     
    //stroke((s*10)%200,200,50,80);  //green
    stroke(random(100,150),80);
    line (x, height-y, lastx, height-lasty);
    lastx = x;
    lasty = y;
  }  
}

//flower
void Flower(int centX, int centY,float radius) {

  radius = 10;
  float x, y;
  float lastx = -999;
  float lasty = -999;
  float radiusNoise = random(50);
  for (float ang=0; ang<=360*2; ang+=0.5) {
    radiusNoise += 0.05;
    radius += 0.05;   
 
    float thisRadius = radius + (noise(radiusNoise)*100) - 100;
    float rad = radians(ang);                                  
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
 
 
    if (lastx > -999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
  }
}

void clearBackground() {
    background(0);
}




