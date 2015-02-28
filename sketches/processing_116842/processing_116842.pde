
Planet[] p = new Planet[100];
float[] mag = new float[p.length];
float[] vel = new float[p.length];
Planet sun;
float sunWidth = 60;
int planetCount = 0;
int starNumber = 200;
int[] starsX = new int[starNumber];
int[] starsY = new int[starNumber];
int[] starSize = new int[starNumber];

void setup(){
  size(1200, 1200);
  assignStars(starNumber);
  sun = new Planet(sunWidth, 0, color(255, 200, 0));
  for(int i = 0; i < p.length; i++) {
    p[i] = new Planet(random(10,35), random(0, 2*PI), color(random(0, 255), random(0, 255), random(0, 255)));
    mag[i] = random(50, 400);
    vel[i] = random(-PI/30, PI/30);
  }
}

void draw() {
 background(0);
 drawStars(starNumber);
 sun.flipSwitch(true);
 sun.display(width/2, height/2);
 for(int i = 0; i < p.length; i++) {
   if(p[i].planetOn) {
     p[i].display(width/2, height/2);
     p[i].orbit(mag[i], vel[i]);
   }
 }
 }

void mousePressed() {  
  p[planetCount].flipSwitch(true);
  mag[planetCount] = dist(mouseX, mouseY, width/2, height/2);
  planetCount++;
 
  if(abs(mouseX-width/2) < sunWidth/2 && abs(mouseY-height/2) < sunWidth/2) {
      planetCount = 0;
      for(int i = 0; i < p.length; i++)
      p[i].flipSwitch(false);
  }
  
}


void assignStars(int amount) {
  
  for(int i = 0; i < amount; i++) {
  starsX[i] = int(random(width));
  starsY[i] = int(random(height)); 
  starSize[i] = int(random(3,7));
 }
}

void drawStars(int amount) {
  for(int i = 0; i < amount; i++) {
  fill(255, random(100, 255));
  ellipse(starsX[i], starsY[i], starSize[i], starSize[i]);
  }
}
class Planet {

  float centerX = width/2;
  float centerY = height/2;
  float x = centerX;
  float y = centerY;
  float frames = 0;
  float speed = PI/30;
  float diameter;
  float orbitRad;
  boolean planetOn = false;
  color planetFill = 255;
  
  Planet(float tempDiam, float start, color shade) {
    diameter = tempDiam;
    frames = start;
    planetFill = shade;
  }
  
  void flipSwitch(boolean flip) {
  planetOn = flip;
  }
  
  void display(float tempX, float tempY) {
      noStroke();
      fill(planetFill);
      centerX = tempX;
      centerY = tempY;
      ellipse(x, y, diameter, diameter);
  }
  
  void orbit(float mag, float vel) {
    if(planetOn) {
      orbitRad = mag;
      x = mag*cos(frames)+centerX;
      y = mag*sin(frames)+centerY;
      speed = vel;
      frames += speed;
      noFill();
      stroke(255, 50);
      ellipse(centerX, centerY, mag*2, mag*2);
    }
  }
  
  float returnX() {
    return x;
  }
  
  float returnY() {
    return y;
  }

}


