
//Gravity  by Christian Hahn 2009: christianmhahn.com

int xSize  = 600;
int ySize  = 500;
int totalParticles  = 0;
int maxParticles    = 200;
Particle[] particle;
int buffer = 0;
boolean grabbing = false;

void setup(){
  size(xSize, ySize);
  background(0);
  smooth();
  strokeWeight(4);
  ellipseMode(CENTER_DIAMETER);
  colorMode(RGB,255);
  particle  = new Particle[maxParticles];
}

void draw(){  
  if (mousePressed && buffer == 0 && totalParticles < maxParticles - 1){
    for (int i=totalParticles-1; i>=0 && !grabbing; i--){
        if(distance(mouseX,mouseY,particle[i].x1,particle[i].y1) < particle[i].radius){
            particle[i].grabbed = true;
            grabbing = true;
            break;
        }
    }    
    if(!grabbing){
      particle[totalParticles] = new Particle(mouseX, mouseY, totalParticles, random(.01,8));
      totalParticles ++;
      buffer++;
    }    
  }  
  if (!mousePressed && (buffer!=0 || grabbing)){
    buffer = 0;
    grabbing = false;
    for (int i=0; i<totalParticles; i++){
       particle[i].grabbed = false;
    }
  }  
  fill(0, 60);
  noStroke();
  rect(0, 0, width, height);
  for (int i=0; i<totalParticles; i++){
    particle[i].collectForce();
  }
}

class Particle {
  int index;  
  float x0 = 0;
  float y0 = 0;
  float x1 = 0;
  float y1 = 0;
  boolean grabbed = false; 
  float massAmount = 1;
  float diameter = sqrt(massAmount)*20;
  float radius = diameter/2;
  float xSpeed = 0;
  float ySpeed = 0;
  float xAccel = 0;
  float yAccel = 0;
  float G = 2;
  float minDist;
  
  Particle(float xInit, float yInit, int setIndex, float setMass){
     x0 = xInit;
     y0 = yInit;
     x1 = xInit;
     y1 = yInit;
     index = setIndex;
     massAmount = setMass;
     diameter = sqrt(massAmount)*20;
     radius = diameter/2;
  }  
  void collectForce(){
    xAccel = 0;
    yAccel = 0;
    minDist = 1000;    
    for (int i=0; i<totalParticles; i++){
      if(index != particle[i].index){
        float gDist = distance(x0, y0, particle[i].x0, particle[i].y0);
        float gTheta = -radians(angleOf(x0, y0, particle[i].x0, particle[i].y0));        
        if(gDist < minDist){minDist = gDist;}        
        float force = (G * massAmount * particle[i].massAmount)/(gDist);
        if(abs(gDist) > (diameter)) {
            xAccel += force/massAmount * cos(gTheta);
	    yAccel += force/massAmount  * sin(gTheta);
        }
      }
    } 
    move();   
  }
 void move(){
    xSpeed = xSpeed + xAccel;
    ySpeed = ySpeed + yAccel;
    x1 = x0 + xSpeed;
    y1 = y0 + ySpeed;    
    render();
  }  
 void render(){ 
    noStroke();    
    if(grabbed){
      fill(150, 150, 255, 100);
      ellipse(mouseX, mouseY, diameter+8, diameter+8);
      fill(0, 255);
      stroke(150, 150, 255, 255);
      ellipse(mouseX, mouseY, diameter, diameter);
      x0 = mouseX;
      y0 = mouseY;
    }
    else{
      float chargeCol = 1000/minDist/50;
      float totCol1 = 100+(chargeCol*6);
      float totCol2 = 150+(chargeCol*chargeCol);  
      float totCol3 = diameter+8+chargeCol;    
      fill(totCol1, totCol1, 255, chargeCol*150 + 3);
      ellipse(x1, y1, totCol3, totCol3);
      fill(0, 255);
      stroke(totCol2, totCol2, 255, chargeCol*255  + 3);
      ellipse(x1, y1, diameter, diameter);
      x0 = x1;
      y0 = y1;
    }
  }
}

float angleOf(float x1, float y1, float x2, float y2){
  float xd = x1 - x2;
  float yd = y1 - y2;
  float t = atan2(yd,xd);
  float a = (180 + (-(180 * t) / PI));
  return a;
}
float distance(float x1, float y1, float x2, float y2){
  float xd = x1 - x2;
  float yd = y1 - y2;
  float td = sqrt(xd * xd + yd * yd);
  return td;
}

