
/*
"Living Object" created by Adiel Fernandez

Lonely, mouse-hunting microbe that becomes stressed when not in pressence of the cursor.

*/

int initRad = 100;
int skinPoints = 100;
float amplitude = 0.25;
float frequency = 2*PI;
int flowerFactor = 2;

int circleFadeCounter = 0;

PVector mousePos;
PVector mouseGrav;
PVector pos;
float xPos;
float yPos;

PVector speed;
float xSpeed;
float ySpeed;

float angle;


float[] phase = new float[skinPoints];

PVector[] skinPos = new PVector[skinPoints];
PVector[] circlePos = new PVector[skinPoints];
PVector[] difference = new PVector[skinPoints];

boolean inPhase = false;
boolean justEntered = false;

//----------------------------------------SETUP----------------------------------------

void setup(){
  size(800, 800);
  cursor(CROSS);
  
  pos = new PVector(width/2, height/2);
  speed = new PVector(random(-2,2), random(-2,2));
  
  //load phase array and initialize difference array
  for(int i = 0; i < skinPoints; i++){
    phase[i] = PI*sin(2*PI*i*random(10000));
    difference[i] = new PVector(0.0, 0.0);
  }
  
  
  //load skinPos with XY coordinates
  for(int i = 0; i < skinPoints; i++){
    
    //place on diagonal line
    //skinPos[i] = new PVector(i*width/skinPoints, i* height/skinPoints); 
    //Place at random
    //skinPos[i] = new PVector(random(width), random(height));
    //place on circle
    float theta = map(i, 0, skinPoints, 0.0, 2*PI);

    //Code for polar flower
    //float r = initRad*cos(flowerFactor*theta); 
    //skinPos[i] = new PVector(r*cos(theta), r* -sin(theta));
    
    //code for perfect circle
    skinPos[i] = new PVector(initRad*cos(theta), initRad* -sin(theta));
    circlePos[i] = new PVector(initRad*cos(theta), initRad* -sin(theta));
    
  }
  
  
  
}

//----------------------------------------DRAW----------------------------------------

void draw(){
  background(230, 210, 80);
  //update mouse info into PVector
  mousePos = new PVector(mouseX, mouseY);
  
  //Update Points
  for(int i = 0; i < skinPoints; i++){
    
    
    
    //randomize vector directions
    //skinPos[i].rotate(random(-2*PI/800, 2*PI/800));

    if(inPhase){    
      //all points in phase
      float sine = amplitude*sin(frequency*millis()/1000.0);
      skinPos[i].setMag(skinPos[i].mag() + sine);
    } else {
      //using phase array
      float sine = amplitude*sin(frequency*millis()/1000.0 + phase[i]);
      phase[i] = phase[i] + random(-PI/8, PI/8);
      skinPos[i].setMag(skinPos[i].mag() + sine);
    }
    
    //add oscillations to magnitude

    
    
    
  }
  
  
  
  
  //drawPoints
  fill(25, 120, 0);
  noStroke();
//  stroke(280, 0, 0);
  strokeWeight(0);
  drawShape(pos.x, pos.y, angle, 1.0);
  
  
//  stroke(0, 255, 0);
  strokeWeight(0);  
  fill(50, 255, 0);
  drawShape(pos.x, pos.y, angle, 0.75);    



  //------------------------------Mouse Interaction------------------------------
  
  if(dist(mouseX, mouseY, pos.x, pos.y) < initRad){
    
    inPhase = true;
    for(int i = 0; i < skinPoints; i++){        
          skinPos[i] = PVector.lerp(skinPos[i], circlePos[i], 0.1);
    }
    
  } else {
    inPhase = false;
    justEntered = false;
  }
  
  //movement and bouncing
  pos.x += speed.x;
  pos.y += speed.y;
  
  if(pos.x < initRad || pos.x > width - initRad){
    speed.x *= -1;
  }
  if(pos.y < initRad || pos.y > height - initRad){
    speed.y *= -1;
  }  
  
  //rotation
  float sine = sin(millis()/2000.0);
  //angle = map(sine,-1, 1, -PI, PI);
  
  
  //gravity toward mouse
//  if(dist(mouseX, mouseY, pos.x, pos.y) < 00){
//    float theta = atan2(pos.y - mouseY, pos.x - mouseX);
//    speed.rotate(theta/20);
    
    //calculate vector between position and mouse
    mouseGrav = PVector.sub(mousePos, pos);
    
    //add small amount of gravity vector to speed
    speed = PVector.add(PVector.div(mouseGrav,6000), speed);
    
    //slow speed down when close to mouse
    if(dist(mouseX, mouseY, pos.x, pos.y) < 150){
      speed = PVector.mult(speed, 0.98);
      
      
  //  }
  }
  
  
}



//----------------------------------------FUNCTIONS----------------------------------------

void drawShape(float x, float y, float ang, float s){
  pushMatrix();
    translate(x, y);
    scale(s);
    rotate(ang);
    beginShape();
    for(int i = 0; i < skinPoints; i++){
      curveVertex(skinPos[i].x, skinPos[i].y);
    }
    curveVertex(skinPos[0].x, skinPos[0].y);
    curveVertex(skinPos[1].x, skinPos[1].y);
    curveVertex(skinPos[2].x, skinPos[2].y);
    curveVertex(skinPos[1].x, skinPos[1].y);
    endShape(CLOSE);
  popMatrix();
}


//void reloadCircle(){
//  for(int i = 0; i < skinPoints; i++){
//      float theta = map(i, 0, skinPoints, 0.0, 2*PI);
//      skinPos[i] = new PVector(initRad*cos(theta), initRad* -sin(theta));
//  } 
//}
