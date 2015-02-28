
//Happy Holidays postcard  Written by Rodrigo Medina
// designplaygrounds.com   25 Dec 2010

import processing.opengl.*;
import toxi.physics.*;
import toxi.geom.*;

VerletPhysics physics;
int SIZE =10;
// The variable we use to keep track of the current method
int drawingMethod =0 ;

boolean cumulative = true;
boolean controlIt= true;
boolean freeze=false;


PImage dpgrounds;
PFont font;


void setup(){
  size(550,400,OPENGL);
  smooth();
  //For initializing our particles stuff
 font = loadFont("Eureka-90.vlw");
   textFont(font, 50);
   
   dpgrounds= loadImage("dpgrounds.png");
  rectMode(CENTER);
  ellipseMode(CENTER);
  initPhysics();
background(0);
}
void draw(){

  //background(255);
  //Update the particle physics engine if not freezed
if (!freeze) physics.update();
// We check if we have to control and if there is at least one particle
if (controlIt && physics.particles.size() > 0){
  // We assign the xy coordinated of the first particle to the mouse xy
  physics.particles.get(0).x=mouseX;
  physics.particles.get(0).y=mouseY;
}

// We create a separate method for drawing
drawParticles();
fill(0);
text("HAPPY HOLYDAYS !!",80,180);
 image(dpgrounds,390,370);
}
void drawParticles(){
  if(cumulative){
    
    //We switch between the different drawing method based on the DrawingMethod Value
    
     
    stroke(255,25);
    //MULTIPLE pARTICLES
    for (int i=2; i < physics.particles.size();i++){
      VerletParticle p1=physics.particles.get(i-1);
      VerletParticle p2=physics.particles.get(i);
      line (p1.x,p1.y,p1.z,p2.x,p2.y,p2.z);
    }
   }
 
}

//We create a method in charge of initializing our particels

void initPhysics(){
float restLength = 40;
float strength = 0.0002f;

float minRestLenght=50;
float repuslionStrenght= 0.002f;
int nbParticles= 10;


  physics = new VerletPhysics();
  
 AABB aabb= new AABB(new Vec3D(width/2,height/2,0),new Vec3D(width/2,height*.4,0));
  
  physics.setWorldBounds(aabb);
  
// We loop and add as many anonymus particles to our particles engine

for (int i= 0 ; i< nbParticles; i ++){
  physics.addParticle(new VerletParticle(random (width*.3,width*.33),random (height *.5,height *.55),0));
  
}

// we still ad springs  , we link every particle  to the previously created one

// We strart at 1 because the particle 0 has no previous particle

for (int i =2; i<physics.particles.size();i++){
  physics.addSpring(new VerletSpring(physics.particles.get(i-1),
  physics.particles.get(i),restLength,strength));
}

// We ring particles , to close the ring 
//We also check in the meantime if we have enough particles to avoid nullPointer exceptions

  if (physics.particles.size() >=3) {
    physics.addSpring(new VerletSpring(physics.particles.get(1), 
physics.particles.get(physics.particles.size()-1), restLength, strength));
  }
//Now we add a VerletMinDistanceSpring between the first particles and each particle

for (int i=1; i<physics.particles.size(); i++){
  physics.addSpring(new VerletMinDistanceSpring (physics .particles.get(0),
  physics.particles.get(i),minRestLenght,repuslionStrenght));
}
}
//Method toggles the controIt value
void toggleControl (){
  controlIt = !controlIt;
}
void mousePressed(){
  toggleControl();
}


void keyPressed(){
if(key=='j' ||key =='J'){
    //Jitter the particle with a magnitude of up to 10
  for (int i=0; i< physics.particles.size(); i ++){
    physics.particles.get(i).jitter(10);
  }
  }
  
 

  
}






