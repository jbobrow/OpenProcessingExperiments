
int numBoids = 100;
int distThreshold1 = 10;
int distThreshold2 = 20;
int distThreshold3 = 30;
float cohesionFactor = 100;
float separationFactor = 10;
float alignmentFactor = 10;
float velocityLimit = 3;
float trailLimit = 5;

float r1 = 1.5; // Cohesion:   pull to center of flock
float r2 = 1.2; // Separation: avoid bunching up
float r3 = 0.1; // Alingment:  match average flock speed

Boid[] flock = new Boid[numBoids];

   
void setup(){
  size(800, 800);  
  background(0);
  frameRate(35);
  
  randomSeed(int(random(1,1000)));
  
  for(int i=0; i<numBoids; ++i){
    flock[i] = new Boid();
    flock[i].xpos = random(0, width);
    flock[i].ypos = random(0, height);
     
    flock[i].vx = random(-5, 5);
    flock[i].vy = random(-5, 5);
  }
  



}

 
void draw(){
  fill(195);
  noStroke();
  rect(0, 0, width, height);
  
  noFill();
  stroke(50);
  strokeWeight(5.0);
  for(int i=0; i<numBoids; ++i){
    flock[i].update();
    flock[i].drawFlock();
  }
  
  noStroke();
  fill(30);
  fill(200);
}


 
class Boid{
  Vector v1 = new Vector();
  Vector v2 = new Vector();
  Vector v3 = new Vector();
  
  float xpos, ypos;
  float vx, vy;
  
  void drawFlock(){
    line(xpos, ypos, xpos-trailLimit*vx, ypos-trailLimit*vy);
  }
   
  void update(){
    v1.x = v1.y = v2.x = v2.y = v3.x = v3.y = 0;
    
    rule1();
    rule2();
    rule3();
    
    // add vectors to velocities helps force them into groups
    vx += r1*v1.x + r2*v2.x + r3*v3.x;
    vy += r1*v1.y + r2*v2.y + r3*v3.y;
    
    limitVelocity();
    
    xpos += vx;
    ypos += vy;
    
    if(xpos < 0){
      xpos = width;
    } else if(xpos > width){
      xpos = 0;
    }
    if(ypos < 0){
      ypos = height;
    } else if(ypos > height){
      ypos = 0;
    }
  }
  //used sqrt so I will always get a positive number
  void limitVelocity(){
    float velocity = sqrt(sq(vx) + sq(vy));
    if(velocity > velocityLimit){
      vx = (vx/velocity)*velocityLimit;
      vy = (vy/velocity)*velocityLimit;
    }
  }
  
  // Cohesion
  void rule1(){
    float len = 0;
    int count = 0;
    
    for(int i=0; i < numBoids; ++i){
      if(this != flock[i]){
        len = dist(xpos, ypos, flock[i].xpos, flock[i].ypos);
        if(len > distThreshold2 && len < distThreshold3){
          v1.x += flock[i].xpos;
          v1.y += flock[i].ypos;
          count++;
        }
      }
    }
    
    if(count > 0){
      v1.x /= count;
      v1.y /= count;
      v1.x = (v1.x - xpos) / cohesionFactor;
      v1.y = (v1.y - ypos) / cohesionFactor;
    }
  }
  
  // Separation
  void rule2(){
    float len = 0;
    
    for(int i=0; i < numBoids; ++i){
      if(this != flock[i]){
        len = dist(xpos, ypos, flock[i].xpos, flock[i].ypos);
        if(len < distThreshold1){
          v2.x -= (flock[i].xpos - xpos)/separationFactor;
          v2.y -= (flock[i].ypos - ypos)/separationFactor;
        }
      }
    }
  }
  
  // Alingment
  void rule3(){
    float len = 0;
    int count = 0;
    
    for(int i=0; i < numBoids; ++i){
      if(this != flock[i]){
        len = dist(xpos, ypos, flock[i].xpos, flock[i].ypos);
        if(len > distThreshold1 && len < distThreshold2){
          v3.x += flock[i].vx;
          v3.y += flock[i].vy;
          count++;
        }
      }
    }
    
    if(count > 0){
      v3.x /= count;
      v3.y /= count;
      v3.x = (v3.x - vx)/alignmentFactor;
      v3.y = (v3.y - vy)/alignmentFactor;
    }
  }
}

class Vector{
  float x, y;
  
  public Vector(){
    x = 0;
    y = 0;
  }
  
  public Vector(float inX, float inY){
    x = inX;
    y = inY;
  }
}
