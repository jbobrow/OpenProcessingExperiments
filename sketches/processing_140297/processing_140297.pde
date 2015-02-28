
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// 257/757  Spring 2014
// HW #8
// 3/4/14

// Declare particle variables
int numParticles = 16; 
float [ ] particleX = new float[numParticles];
float [ ] particleY = new float[numParticles];
float [ ] particleSize = new float[numParticles];
color [ ] particleColor = new color[numParticles]; 
color [ ] particleColPass = new color[numParticles]; 
color [ ] particleColSkin = new color[numParticles];
float [ ] particleDirection = new float[numParticles];
float [ ] particleSpeedMax = new float[numParticles];
float [ ] particleSpeed = new float[numParticles];
boolean [ ] particleVis = new boolean[numParticles];
boolean [ ] particleBounce = new boolean[numParticles];
float [ ] particleDirectionMax = new float[numParticles];
int indexNextInvisible;
float deltaSpeed;
float fadeIn;
int colorChoice;
float spinSpeed;

//********************************************************************
void setup(){
  //size(displayWidth,displayHeight-50);
  size(600,400);
  background(0);
  deltaSpeed = .001;
  fadeIn = 255;
  spinSpeed = 6;
  
  // traverse array and initialize variables
  for(int i = 0; i<particleX.length; i++){
    // set initial X and Y values in center of screen
    particleX[i] = width/2;
    particleY[i] = height/2;
    
    // set initial particle size
    particleSize[i] = random(30,60);
    
    // set color of car
    particleColor[i] = color(random(255),random(255),random(255));
    // set color of passenger shirt
    particleColPass[i] = color(random(0,150),random(0,150),random(0,150));
    // set color of passenger skintone
    colorChoice = round(random(1,3));
    switch(colorChoice){
      case 1:
        particleColSkin[i] = color(149,120,70);
        break;
      case 2:
        particleColSkin[i] = color(210,180,140);
        break;
      case 3:
        particleColSkin[i] = color(255,218,185);
        break;
    }
    
    // set particle direction (random number of degrees)
    particleDirection[i] = random(1,360);
    particleDirectionMax[i] = particleDirection[i];
    
    // set max speed to random number
    particleSpeedMax[i] = random(1,3);
    // set initial speed to zero
    particleSpeed[i] = 0;
    
    // set as intitially invisible
    particleVis[i] = false;
    
    // no bounces occuring initially
    particleBounce[i] = false;
  }
  
  // set first particle as visible
  particleVis[0] = true;
  indexNextInvisible = 1;
  
  releaseParticles();
}

//********************************************************************
void draw(){
  // draw background
  fill(0);
  rect(0,0,width,height);
  
  // particles
  moveParticles();
  drawParticles();
  
}

//********************************************************************
void moveParticles(){  
  // accelerate particles
  if(deltaSpeed < 1){
    deltaSpeed *=1.03;
  }
  
  // traverse array and move VISIBLE particles
  for(int i = 0; i<particleX.length; i++){
    
    // move visible particles only
    if(particleVis[i]){
      // each particle will move in its given direction at a speed of particleSpeed
      particleX[i] += particleSpeed[i] * cos(radians(particleDirectionMax[i]));
      particleY[i] -= particleSpeed[i] * sin(radians(particleDirectionMax[i]));

      // incrementally increase speed until speed reaches max
      if(particleSpeed[i] < particleSpeedMax[i]){
        particleSpeed[i] += deltaSpeed;
      }
      
      // test for hitting sides
      //-----------------------------------------
      // CHECK LEFT EDGE
      if(particleX[i]-(particleSize[i]/2) < 0){
        // particle is touching left edge
        particleX[i] = (particleSize[i]/2);
        // update direction
        particleDirectionMax[i]  = 180 - particleDirectionMax[i];
        // trigger bounce
        particleBounce[i] = true;
      }
      
      // CHECK RIGHT EDGE
      if(particleX[i]+(particleSize[i]/2) > width){
        // particle is touching right edge
        particleX[i] = width-(particleSize[i]/2);
        // update direction
        particleDirectionMax[i]  = 180 - particleDirectionMax[i];
        // trigger bounce
        particleBounce[i] = true;
      }
      
      // CHECK TOP EDGE
      if(particleY[i]-(particleSize[i]/2) < 0){
        // particle is touching top edge
        particleY[i] = (particleSize[i]/2);
        // update direction
        particleDirectionMax[i] *= -1;
        // trigger bounce
        particleBounce[i] = true;
      }
      
      // CHECK BOTTOM EDGE
      if(particleY[i]+(particleSize[i]/2) > height){
        // particle is touching bottom edge
        particleY[i] = height-(particleSize[i]/2);
        // update direction
        particleDirectionMax[i] *= -1;
        // trigger bounce
        particleBounce[i] = true;
      }
      
      // test for hitting other particles
      //-----------------------------------------
      for(int j=0;j<particleX.length; j++){ 
        // make sure particles tested aren't myself or invisible
        if(i!=j && particleVis[j]){
          if(areWeIntersecting(particleX[i],particleY[i],particleSize[i],particleX[j],particleY[j],particleSize[j])){
            // particles are intersecting
            
            // determine which particle is on LEFT (A) and which is on RIGHT (B)
            // send index numbers of collision particles to "collision" function
            if(particleX[j]<particleX[i]){
              // if particle j is on the left, assign it to A position
              collision(j,i);
            }else{
              // if particle i is on the left OR particles are vertically alligned, assign i to A position
              collision(i,j);
            }
            
            // trigger bounce
            particleBounce[i] = true;
            particleBounce[j] = true;
          }
        }
      }
      
      // spin car towards ultimate direction
      //-----------------------------------------
      if(particleDirection[i] != particleDirectionMax[i]){
        if(abs(particleDirectionMax[i] - particleDirection[i]) < spinSpeed){
          particleDirection[i] = particleDirectionMax[i];
        }else if(particleDirectionMax[i]  > particleDirection[i]){
          particleDirection[i] += spinSpeed;
        }else{
          particleDirection[i] -= spinSpeed;
        }
      }
    }
  }
}

//********************************************************************
void collision(int indexA, int indexB){
  // index A = index number of the particle on the left
  // index B = index number of the particle on the right
    
  // declare local variables
  float particleCenterLineSlope; // slope of line connecting the center points of each particle
  float collisionPlaneAngle; // angle of collision plane relative to a vertical line 
  float particleDistance; // distance between center points of particles
  float overlapDistance; // distance of overlap between particles
  float collisionXA0; // particle A's original speed along the line of collision
  float collisionXB0; // particle B's original speed along the line of collision
  float collisionXA; // particle A's speed along the line of collision
  float collisionXB; // particle B's speed along the line of collision
  float collisionYA; // particle A's speed normal to the line of collision
  float collisionYB; // particle B's speed normal to the line of collision
  float colX; // x coordinate of collision point
  float colY; // y coordinate of collision point
  
  // FIND THE COLLISION PLANE ANGLE
  //-----------------------------------------
  // find the slope of the line connecting the center points of each particle
  particleCenterLineSlope = -(particleY[indexB]-particleY[indexA])/(particleX[indexB]-particleX[indexA]);
  
  // find the angle of the collision plane (normal to line connecting center points); relative to vertical line
  collisionPlaneAngle = degrees(atan(particleCenterLineSlope));
  
  // RETURN PARTICLES TO POINT OF COLLISION (remove any overlap)
  //-----------------------------------------
  particleDistance = sqrt(sq(particleX[indexB]-particleX[indexA])+sq(particleY[indexB]-particleY[indexA]));
  overlapDistance = ((particleSize[indexA]/2)+(particleSize[indexB]/2))-particleDistance;
  // check for overlap
  if(overlapDistance > 0){
    // particles are overlapping
    
    // move particle A back in the direction it came from, half the overlap distance
    particleX[indexA] += (overlapDistance/2) * cos(radians(particleDirectionMax[indexA]+180));
    particleY[indexA] -= (overlapDistance/2) * sin(radians(particleDirectionMax[indexA]+180));
    
    // move particle B back in the direction it came from, half the overlap distance
    particleX[indexB] += (overlapDistance/2) * cos(radians(particleDirectionMax[indexB]+180));
    particleY[indexB] -= (overlapDistance/2) * sin(radians(particleDirectionMax[indexB]+180));
  }
  
  // FIND PARTICLE SPEEDS COMPONENTS RELATIVE TO THE COLLISION LINE AND PLANE
  //-----------------------------------------
  collisionXA0 = cos(radians(particleDirectionMax[indexA]-collisionPlaneAngle));
  collisionXB0 = cos(radians(particleDirectionMax[indexB]-collisionPlaneAngle));
  collisionYA = sin(radians(particleDirectionMax[indexA]-collisionPlaneAngle));
  collisionYB = sin(radians(particleDirectionMax[indexB]-collisionPlaneAngle));
  
  // SET NEW PARTICLE ANGLES
  //-----------------------------------------
  collisionXA = -abs(collisionXA0);
  collisionXB = abs(collisionXB0);
  // new angle
  particleDirectionMax[indexA] = degrees(atan(collisionYA/collisionXA))+collisionPlaneAngle+180;
  particleDirectionMax[indexB] = degrees(atan(collisionYB/collisionXB))+collisionPlaneAngle;
 
}

//********************************************************************
void drawParticles(){
  
  rectMode(CENTER);
  
  // traverse array and draw VISIBLE particles 
  for(int i = 0; i<particleX.length; i++){
    if(particleVis[i]){
      
      // check for bounce happening
      if(particleBounce[i]){
        stroke(255);
        // reset to false
        particleBounce[i] = false;
        drawFigure(i,true);
        stroke(0);
      }else{
        stroke(0);
        drawFigure(i,false);
      }
    }
  }
  
  // fade in
  fill(0,0,0,fadeIn);
  rectMode(CORNER);
  rect(0,0,width,height);
  if(fadeIn > 0 ){
    fadeIn -=5;
  }else{
    fadeIn = 0;
  }
}

//********************************************************************
void drawFigure(int index, boolean bounceHappening){
  // declare local variables
  float x = particleX[index];
  float y = particleY[index];
  float sz = particleSize[index];
    
  pushMatrix();
    translate(x,y);
    rotate(radians(-particleDirection[index]+90));
    
    // car
    fill(particleColor[index]);
    strokeWeight(sz/10);
    if(bounceHappening){
      stroke(255);
      rect(0,0,sz,sz,sz*.4);
    }else{
      stroke(100);
      rect(0,0,sz,sz,sz*.4);
    }
    strokeWeight(1);
    
    // headlights
    fill(255);
    noStroke();
    arc(-(sz*.3),-(sz*.3),sz/4,sz/4,PI*.75,PI*1.75);
    arc((sz*.3),-(sz*.3),sz/4,sz/4,PI*1.25,PI*2.25);
    
    // passenger compartment
    fill(100);
    stroke(0);
    ellipse(0,sz/6,sz*3/4,sz*.5);
    
    // steering wheel
    strokeWeight(sz/15);
    stroke(0);
    noFill();
    ellipse(0,-(sz*.12),sz/3,sz/3);
    
    // wire
    stroke(255);
    strokeWeight(sz/25);
    fill(255);
    line(0,sz*.7,0,sz/3);
    ellipse(0,sz*.7,sz/15,sz/15);
    
    // body
    strokeWeight(1);
    fill(particleColPass[index]);
    noStroke();
    ellipse(0,sz/5,sz*.6,sz*.3);
    // left arm
    beginShape();
      vertex(-(sz*.12),-(sz*.12));
      vertex(-(sz*.20),-(sz*.12));
      vertex(-(sz*.3),sz/5);
      vertex(-(sz*.15),sz/5);
    endShape();
    // right arm
    beginShape();
      vertex((sz*.12),-(sz*.12));
      vertex((sz*.20),-(sz*.12));
      vertex((sz*.3),sz/5);
      vertex((sz*.15),sz/5);
    endShape();
    
    // hands
    noStroke();
    fill(particleColSkin[index]);
    ellipse(-(sz/6),-(sz*.12),sz/7,sz/7);
    ellipse((sz/6),-(sz*.12),sz/7,sz/7);
    
    // head
    ellipse(0,sz/4,sz/3,sz/3);
    
  popMatrix();

}

//********************************************************************
boolean areWeIntersecting(float x1,float y1, float size1, float x2, float y2, float size2){
  // check whether particles 1 and 2 are intersecting  
  
  // declare local variables
  float centerDist;
  boolean intersection;
  
  // use distance formula to find distance between center points
  centerDist = sqrt(sq(x1-x2)+sq(y1-y2));
  
  if(centerDist<((size1/2)+(size2/2))){
    intersection = true;
  }else{
    intersection = false;
  }
  
  return(intersection);
}

//********************************************************************
void releaseParticles(){
  // declare local variables
  boolean goodLocation = false;
   
  // traverse array of all particles
  for(int i = 0; i<particleX.length; i++){
    
    // find a place to put item #i
    while(goodLocation == false){
      goodLocation = true;
      
      // propose random x,y location
      particleX[i] = random(particleSize[i]/2,width-particleSize[i]/2);
      particleY[i] = random(particleSize[i]/2,height-particleSize[i]/2);
      
      // check for intersections
      for(int j=0; j<i; j++){
        if(areWeIntersecting(particleX[i],particleY[i],particleSize[i]*1.5,particleX[j],particleY[j],(particleSize[j]*1.5))){
          // bad location, keep looking
          goodLocation = false;
        }
      }
    }
    
    particleVis[i] = true;
    goodLocation = false;
  }
}

//********************************************************************
void keyPressed(){
  if(key == ' '){
    // spacebar = reinitialize variables
    setup();
  }else{
    // any other key = terminate program
    exit();
  }
}

//********************************************************************



