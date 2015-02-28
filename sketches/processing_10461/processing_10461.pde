
//
// predPrey01
//
// predator prey simulation 
//
// Matthew Conroy -- June 2010
//

PImage canvas1;

int[] popPrey;
int[] popPreds;
int popHistory=600;
int popSteps=10;
int popCount=0;
int popCountBeginning=0;
int popPreyAve=0;
int popPredsAve=0;

color predsColor=color(200,100,255);
color preyColor=color(255,255,255);

int enviroHeight=500;

int numberOfBalls=300;

int numberOfPreds=40;
int numberOfPrey=500;

float predSpeedLimit=1.5;
float preySpeedLimit=1.5;

float paramScale=0.4;
float preyBirthAge = 3.0*paramScale;
float predsBirthAge = 2.4*paramScale;
float predsHungerLimit = 2.2*paramScale;

float preyPopCap = 4000;

float killThresholdDist = 4.5;

int radii=2;

float time=0;
float timeStep=0.01;

ArrayList preds;
ArrayList prey;

Vect2D[] vels;
Vect2D[] accels;

int[] closest = new int[numberOfBalls];

void setup (){
   size(600, 600);
   canvas1 = createImage(600,600,RGB);
 
   frameRate(200);
   preds = new ArrayList();
   prey = new ArrayList();
   
   popPrey = new int[popHistory];
   popPreds = new int[popHistory];
   
   // set up predators
   for(int i=0; i<numberOfPreds; i++) { 
      Vect2D vv;
      Vect2D aa;
      vv = new Vect2D(0.0,0.0);
      aa = new Vect2D(0.0,0.0);
      float fract=0.3;
      preds.add(new PPBall(random(width*fract,width*(1-fract)),random(height*fract,height*(1-fract)),radii*1.,random(predsHungerLimit*0.8),vv,aa,0,random(predsBirthAge*0.9)));
   }
   
   // set up prey
    for(int i=0; i<numberOfPrey; i++) { 
      float fract=0.25;
      Vect2D vv;
      Vect2D aa;
      vv = new Vect2D(0.0,0.0);
      aa = new Vect2D(0.0,0.0);
      fract=0.3;
      prey.add(new PPBall(random(width*fract,width*(1-fract)),random(height*fract,height*(1-fract)),radii*1.,random(preyBirthAge*0.8),vv,aa,0,0));
   }
}




void draw(){
  
  smooth();
  
  time=time+timeStep;  
  
  background(0);
  adjustPositions(preds);
  
  adjustPositions(prey);
    
  // the prey give birth
   for(int i=0; i<prey.size(); i++) {
     PPBall temp = (PPBall) prey.get(i);
     if (temp.a>preyBirthAge) {
       PPBall baby;
       Vect2D vv;
       Vect2D aa;
       vv = new Vect2D(0.0,0.0);
       aa = new Vect2D(0.0,0.0);
       if (random(1)>sq(prey.size()/preyPopCap)) { // live birth more likely when it is not crowded
         prey.add(new PPBall(temp.x,temp.y,temp.r,random(preyBirthAge*0.2),vv,aa,0,0)); 
       } 
       prey.set(i,temp);
       temp.a=random(preyBirthAge*0.1);
     }
  }
  
  
  // the preds give birth
   for(int i=0; i<preds.size(); i++) {
     PPBall temp = (PPBall) preds.get(i);
     if (temp.birthTime>predsBirthAge) {
       PPBall baby;
       Vect2D vv;
       Vect2D aa;
       vv = new Vect2D(0.0,0.0);
       aa = new Vect2D(0.0,0.0);
       preds.add(new PPBall(temp.x,temp.y,temp.r,0,vv,aa,0,random(predsBirthAge*0.2)));
       preds.set(i,temp);
       temp.birthTime=0;
     }
  }
  
  
  
  // draw preds 
  for(int i=0; i< preds.size(); i++) {  
    PPBall temp=(PPBall) preds.get(i);
    fill(predsColor);
    stroke(predsColor);
    ellipse(temp.x, temp.y, temp.r*2, temp.r*2);
  }
  
  // draw prey
  for(int i=0; i< prey.size(); i++) {  
    PPBall temp=(PPBall) prey.get(i);
    noFill();
    stroke(preyColor);
    ellipse(temp.x, temp.y, temp.r*2, temp.r*2);
  }
  
  // kill the preds
  for(int i=preds.size()-1; i>=0; i--) {
    PPBall temp=(PPBall) preds.get(i);
    if (temp.hunger>predsHungerLimit) {
      preds.remove(i);
    }
  }
  
  // kill the prey
 
  int isClose=0;
  int j=0;
  for(int i=prey.size()-1; i>=0; i--) {
    isClose=0;
    j=0;
    PPBall tempPrey=(PPBall) prey.get(i);
    while((isClose==0) && j<preds.size()) {
      PPBall tempPred=(PPBall) preds.get(j);
      if(dist(tempPrey.x,tempPrey.y,tempPred.x,tempPred.y) < killThresholdDist) {
        isClose=1;
      tempPred.hunger=0; // this one just ate
       preds.set(j,tempPred);
      }
      ++j;
    }
    if (isClose==1) { prey.remove(i); 
    }
  }
 
  adjustVelocities13(preds,prey);
  
  // keep track of populations
  
  popPredsAve += preds.size();
  popPreyAve += prey.size();
  ++popCount;
  if (popCount==popSteps) {
    int[] temp1 = append(popPrey,popPreyAve/popSteps);
    int[] temp2 = append(popPreds,popPredsAve/popSteps);
    int[] temp1a = subset(temp1,1);
    int[] temp2a = subset(temp2,1);
    arrayCopy(temp1a,popPrey);
    arrayCopy(temp2a,popPreds);
    popCount=0;
    popPredsAve=0;
    popPreyAve=0;
     ++popCountBeginning;
  }
  
  //plot population data
  if (popCountBeginning<popPrey.length) {
    for(int i=popPrey.length-popCountBeginning; i<popPrey.length; i++) {
      stroke(preyColor);
      float popY=popToY(popPrey[i]);
      point(i-popPrey.length+popCountBeginning,popY);
      popY=popToY(popPreds[i]);
      stroke(predsColor);
      point(i-popPrey.length+popCountBeginning,popY);
    }
  }
  else{      
  for(int i=0; i<popPrey.length;i++) {
    stroke(preyColor);
    float popY=0;
    popY=popToY(popPrey[i]);
    point(i,popY);
    popY = popToY(popPreds[i]);
    stroke(predsColor);
    point(i,popY);
   }
  }
  

  
  //println("preds "+preds.size()+" prey "+prey.size());  
  

} // end draw



//
//
//
//
//
//


float popToY(float x) {
  return(height-5-95*x/(x+500));
}

void births(PPBall[] balls) {
  for(int i=0; i<balls.length; i++) {
     if (balls[i].a>1) {
       balls[i].a=0;
       PPBall baby;
       Vect2D vv;
       Vect2D aa;
       vv = new Vect2D(0.0,0.0);
       aa = new Vect2D(0.0,0.0);
       baby = new PPBall(balls[i].x,balls[i].y,balls[i].r,0,vv,aa,0,0);
       balls = (PPBall[]) append(balls,baby);
     }
  }
}


void adjustPositions(ArrayList balls) {
   for (int i=0; i<balls.size(); i++) {
      PPBall temp=(PPBall) balls.get(i);
      temp.x += temp.velocity.vx;
      temp.y += temp.velocity.vy;
      if (temp.x<0) { temp.x=temp.x+width; }
      if (temp.x>width) { temp.x=temp.x-width; }
      if (temp.y<0) { temp.y=temp.y+enviroHeight; }
      if (temp.y>enviroHeight) { temp.y=temp.y-enviroHeight; }
      temp.a += timeStep;
      temp.hunger += timeStep;
      temp.birthTime += timeStep;
      balls.set(i,temp);
   }
}



void speedLimit(Vect2D vels,float speedLimit) {
   float speed = dist(0,0,vels.vx,vels.vy);
   if (speed>speedLimit) {
     vels.vx = speedLimit*vels.vx/speed;
     vels.vy = speedLimit*vels.vy/speed;
   }
}

void adjustVelocities13(ArrayList preds, ArrayList prey) {
   for(int i=0; i< preds.size(); i++) {
     PPBall temp=(PPBall) preds.get(i);
      temp.velocity.vx += random(-0.1,0.1);
      temp.velocity.vy += random(-0.1,0.1);
      speedLimit(temp.velocity,predSpeedLimit);
      preds.set(i,temp);
   }
   for(int i=0; i< prey.size(); i++) {
     PPBall temp=(PPBall) prey.get(i);
      temp.velocity.vx += random(-0.1,0.1);
      temp.velocity.vy += random(-0.1,0.1);
      speedLimit(temp.velocity,preySpeedLimit);
      prey.set(i,temp);
   }
}


class PPBall{
  float x, y, r, a, hunger,birthTime;
  Vect2D velocity;
  Vect2D acceleration;
  

  // default constructor
  PPBall() {
  }

  PPBall(float x, float y, float r, float a, Vect2D velocity, Vect2D acceleration, float hunger, float birthTime) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.a = a; //age
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.hunger = hunger; // time since last eat (for predators)
    this.birthTime = birthTime; // time since last birth
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



