
//
// proximty01
//
// experimenting with particles moving in a direction
// related to the direction toward their nearest neighbor
//
// Matthew Conroy -- April 2010
//

PImage canvas1;

int numberOfBalls=400;
int radii=2;

float time=0;
float timeStep=0.02;

Ball[] balls;

Vect2D[] vels;

int[] closest = new int[numberOfBalls];

void setup (){
   size(600, 600);
   canvas1 = createImage(600,600,RGB);
 
   balls = new Ball[numberOfBalls]; vels = new Vect2D[numberOfBalls];
   
   for(int i=0; i<numberOfBalls; i++) { 
      //balls[i]=new Ball(random(600),random(600),radii);
      float fract=0.2;
      balls[i] = new Ball(random(width*fract,width*(1-fract)),random(height*fract,height*(1-fract)),radii);
      float angle=random(TWO_PI);
      //float vel0=random(0.8,1.2);
      float vel0=1.0;
      vels[i]=new Vect2D(vel0*cos(angle),vel0*sin(angle));
   }
   
   smooth();
   noStroke(); 
}

void draw(){
  timeStep = 0.0001*(mouseX-width/2);
  time=time+timeStep;
  background(0);
  for (int i=0; i< numberOfBalls; i++){
    balls[i].x += vels[i].vx;
    balls[i].y += vels[i].vy;
    float ff=1.0*i/numberOfBalls;
    noFill();
    stroke(255);
    //fill(255-balls[i].r*4.0,120);
    ellipse(balls[i].x, balls[i].y, balls[i].r*2, balls[i].r*2);
    //checkBoundaryCollision(balls[i], vels[i]);
    stroke(255);
    line(balls[i].x,balls[i].y,balls[closest[i]].x,balls[closest[i]].y);
    
    //stroke(255,0,0);
    //line(balls[i].x,balls[i].y,balls[i].x+30*vels[i].vx,balls[i].y+30*vels[i].vy);
  }
  
  adjustVelocities7(balls,vels);
  
  //checkObjectCollision(balls, vels);
}

//
//
//
//
//


void adjustVelocities7(Ball[] b, Vect2D[] v) { // make balls head toward/away from nearest neighbor
   float minDist=0,maxDistOverall=0;
   int closestIndex=0;
   for(int i=0; i<numberOfBalls; i++) {
      minDist=10000000;
      closestIndex=0;
      for(int j=0; j<numberOfBalls; j++) {   
         if (i!=j) {
            float z=dist(b[i].x,b[i].y,b[j].x,b[j].y);      
            if (z<minDist) {
               minDist=z;
               closestIndex=j;
               closest[i]=j;
            }
         }
      }
      
     // time=(mouseX/(1.0*width))*2*3.1415926535;
      
     
      //float xx=width/2.-b[i].x;
      //float yy=height/2.-b[i].y;
      float xx=b[closestIndex].x-b[i].x;
      float yy=b[closestIndex].y-b[i].y;
      
    
      float xx2 = xx*cos(time)-yy*sin(time);
      float yy2 = xx*sin(time)+yy*cos(time);
      xx=xx2;
      yy=yy2;
      float mag=sqrt(xx*xx+yy*yy);
      v[i].vx=0.3*xx/mag;
      v[i].vy=0.3*yy/mag;
   }
   
} 


class Ball{
  float x, y, r, m;

  // default constructor
  Ball() {
  }

  Ball(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    m = r*.1;
  }
}

class Vect2D{
  float vx, vy;

  // default constructor
  Vect2D() {
  }

  Vect2D(float vx, float vy) {
    this.vx = vx;
    this.vy = vy;
  }
}

// checkBoundaryCollision() function:
void checkBoundaryCollision(Ball ball, Vect2D vel){
  if (ball.x > width-ball.r){
    ball.x = width-ball.r;
    vel.vx *= -1;
  } 
  else if (ball.x < ball.r){
    ball.x = ball.r;
    vel.vx *= -1;
  } 
  else if (ball.y > height-ball.r){
    ball.y = height-ball.r;
    vel.vy *= -1;
  } 
  else if (ball.y < ball.r){
    ball.y = ball.r;
    vel.vy *= -1;
  }
}

