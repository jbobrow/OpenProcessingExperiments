
//
// gravity03
//
// some gravity
//
// Matthew Conroy -- May 2010
//

PImage canvas1;

int numberOfBalls=30;
int radii=5;

float time=0;
float timeStep=0.02;

Ball[] balls;

Vect2D[] vels;
Vect2D[] accels;

int[] closest = new int[numberOfBalls];

void setup (){
  
   frameRate(200);
   size(800, 600);
 
   balls = new Ball[numberOfBalls]; vels = new Vect2D[numberOfBalls]; accels = new Vect2D[numberOfBalls];
   
   for(int i=0; i<numberOfBalls; i++) { 
      //balls[i]=new Ball(random(600),random(600),radii);
      float fract=0.25;
      balls[i] = new Ball(random(width*fract,width*(1-fract)),random(height*fract,height*(1-fract)),radii);
      float angle=random(TWO_PI);
      //float vel0=random(0.8,1.2);
       accels[i]=new Vect2D(0.0,0.0);
      float vel0=0.3;
      vels[i]=new Vect2D(vel0*cos(angle),vel0*sin(angle));
     
   }
   
   smooth();
   noStroke(); 
   background(0);
}

void draw(){
  
  timeStep=0.001;
  time=time+timeStep;
  if (time>0.01) {
      time=0;
      fill(0,4);
  rect(0,0,width,height);
  }
  for (int i=0; i< numberOfBalls; i++){
    balls[i].x += vels[i].vx;
    balls[i].y += vels[i].vy;
    float ff=1.0*i/numberOfBalls;
    noFill();
    float yeah=i*1.0/numberOfBalls;
    stroke(255*yeah,255*4*yeah*(1-yeah),255-255*yeah);
    fill(255*yeah,255*4*yeah*(1-yeah),255-255*yeah);
    
    ellipse(balls[i].x, balls[i].y, balls[i].r, balls[i].r);
  }
  
  adjustVelocities10(balls,vels,accels);
  
}

//
//
//
//
//
void adjustVelocities10(Ball[] b, Vect2D[] v, Vect2D[] a) { // adjust directions of particles
   float minDist=0,maxDistOverall=0;
   int closestIndex=0;
   
   for(int i=0; i<numberOfBalls; i++) {
        
    float accelX=0;
    float accelY=0;
    
    for(int j=0; j<6; j++) {
      float xx2 = width*(0.2+0.6*(j % 2))-b[i].x;
      float yy2 = height*(0.2+0.3*(j% 3))-b[i].y;         
    
      float mag2 = magnitude(xx2,yy2);
      xx2 = xx2/(mag2*mag2+0.4);
      yy2 = yy2/(mag2*mag2+0.4);
    
      accelX = accelX+xx2;
      accelY = accelY+yy2;
    }
       
    a[i].vx=accelX*1.0;
    a[i].vy=accelY*1.0;
    
    v[i].vx += a[i].vx;
    v[i].vy += a[i].vy;
    
 }
}

float magnitude(float a, float b) {
  return(sqrt(a*a+b*b));
 
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



