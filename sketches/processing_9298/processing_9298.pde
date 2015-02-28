
//
// proximty03
//
// some flocking 
//
// Matthew Conroy -- April 2010
//

PImage canvas1;

int numberOfBalls=70;
int radii=2;

float time=0;
float timeStep=0.02;

Ball[] balls;

Vect2D[] vels;
Vect2D[] accels;

int[] closest = new int[numberOfBalls];

void setup (){
   size(600, 600);
   canvas1 = createImage(600,600,RGB);
 
   balls = new Ball[numberOfBalls]; vels = new Vect2D[numberOfBalls]; accels = new Vect2D[numberOfBalls];
   
   for(int i=0; i<numberOfBalls; i++) { 
      //balls[i]=new Ball(random(600),random(600),radii);
      float fract=0.25;
      balls[i] = new Ball(random(width*fract,width*(1-fract)),random(height*fract,height*(1-fract)),radii);
      float angle=random(TWO_PI);
      //float vel0=random(0.8,1.2);
       accels[i]=new Vect2D(0.0,0.0);
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
    
    //line(balls[i].x,balls[i].y,balls[closest[i]].x,balls[closest[i]].y);
    
    //stroke(255,0,0);
    //line(balls[i].x,balls[i].y,balls[i].x+30*vels[i].vx,balls[i].y+30*vels[i].vy);
  }
  
  adjustVelocities9(balls,vels,accels);
  
  //checkObjectCollision(balls, vels);
}

//
//
//
//
//
void adjustVelocities9(Ball[] b, Vect2D[] v, Vect2D[] a) { // make balls head toward/away from nearest neighbor
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
    //vector to nearest neighbor
    float xx=b[closestIndex].x-b[i].x;
    float yy=b[closestIndex].y-b[i].y;
    float mag1 = magnitude(xx,yy);
    xx = 15*xx/mag1;
    yy = 15*yy/mag1;
    
    
    //vector to center
    float xx2 = mouseX-b[i].x;
    float yy2 = mouseY-b[i].y;
    float mag2 = magnitude(xx2,yy2);
    xx2 = 15*xx2/mag2;
    yy2 = 15*yy2/mag2;
    
      
    //a[i].vx=-xx*0.01+xx2*0.01;
    //a[i].vy=-yy*0.01+yy2*0.01;
    
    if ((mag2<10) || (mag1<10)) {
      a[i].vx=-xx*0.01;
      a[i].vy=-yy*0.01;
    }
    else {
      a[i].vx=xx2*0.01;
      a[i].vy=yy2*0.01;
    }
    
    
    v[i].vx += a[i].vx;
    v[i].vy += a[i].vy;
    
    mag2=magnitude(v[i].vx,v[i].vy);
    if (mag2>3.75) {
      v[i].vx = 3.75*v[i].vx/mag2;
     v[i].vy = 3.75*v[i].vy/mag2;
    }
    b[i].r = 5-mag2;
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



