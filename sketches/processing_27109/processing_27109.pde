

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;
 
 
 Minim m;
AudioSample kick;

 
float ballX, ballY; 
float difX, difY; 
float friction = 0.01; 
boolean capt = false; 
float bounce = 1;
  boolean bUp = true;
  boolean ran = false;
  float ranX = 0;
  float ranY = 0;

  int seg = 20;
 
void setup(){
  size(500, 500);
  
    m = new Minim(this);
  kick = m.loadSample("bang_1.wav",2048);
  if (kick == null)println("didnt load");
  
  

  ballX  = width/2;
  ballY  = height/2;
   
 // noCursor();
  smooth();
}
 
void draw(){
   
  background(255);
 int k = 0;
 int L = 0;
 int colour = 0;
 

  

  if (!ran){
    difX = mouseX - ballX;
    difY = mouseY - ballY;
  }else{ 
    difX = ranX - ballX;
    difY = ranY - ballY;
  }
   

  ballX += difX * friction;
  ballY += difY * friction;
 

 
    
  ball(ballX, ballY);
  
  
   

  stroke(0);
  noFill();
  //ellipse(mouseX, mouseY, 20, 20);
}
 
void ball(float x, float y){
  
  noStroke();
   
// Clac the dist between ball and mouse
  float d = dist(ballX, ballY, mouseX, mouseY);
  if (ran){
    d = dist(ballX, ballY, ranX, ranY);
  }
  
 //Bounce lower when close to mouse
  if (bUp){
    bounce +=(30*friction);
  }else{
    bounce -=(30*friction);
  }
  if (bounce >= d/15){
    bUp = false;
  }
  if (bounce <= 1 && bUp == false){
    bUp = true;
    if (d > 20)kick.trigger();
  }
  
  
  
  // mouse follow and capture
  if(d < 1){
  capt = true;
  }

  
   
  fill(0);
  ellipse(x, y, 10+bounce, 10 +bounce );
  fill(0,150);
  ellipse(x+bounce*2, y+bounce*2, 10+bounce, 10 +bounce );
 
  
}
 
void mouseMoved(){
  capt = false;
}
void mouseClicked(){
 /*if (!ran){
   ran = true; 
   ranX = round(random(width));
   ranY = round(random(height));
 }else{
   ran = false;
 }*/
 
 
 
}


void stop(){
  
  kick.close();
  m.stop();
  super.stop();
}

