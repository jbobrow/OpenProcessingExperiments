
//Sara Humel 
//Andrew id: shumel
//Copyright 2012

//Try to hit the nerd with the ball. Use your mouse to influence the movement of the ball. 
// The eyes of the nerd follow the ball. And the mouth opens as the ball moves closer. 



 //Nerd Variables
  float dN = 30;
  float xN = random(0+dN*.5,400-dN*.5);
  float yN = random(0+dN*.5,400-dN*.5);
  float xPlus = random(.5, 6);
  float yPlus = random(.5, 6);
  boolean goingLeft;
  boolean goingUp;
 //Ball Variables
  float dH = 20;
  float xH = 200;
  float yH = 200;
  float  xSpeed;
  float  ySpeed;
  
 //Game Variables
   int hits;
   boolean wasHit;
  

void setup(){
  size(400,400);
  //background(255,255,255);
  smooth();
   //Nerd Variables
  float dN = 100;
  float xN = random(0+dN*.5,400-dN*.5);
  float yN = random(0+dN*.5,400-dN*.5);
  float xPlus = random(.5, 4);
  float yPlus = random(.5, 4);
  boolean goingLeft;
  boolean goingUp;
 //Hipster Variables
  float dH = 200;
  float xH = 200;
  float yH = 200;
  }
  

  
void draw(){
  
  hit();
  if(wasHit == true) {
   gotHit(); 
  } else {
  bounceNerd();
  drawBall();
  wrapBall();
  scoreAndTime();
  }
  }
  
  
void drawNerd(float xN, float yN, float dN){
  fill(232,188,117);
  strokeWeight(1);
  stroke(0,0,0);
  ellipse(xN,yN,dN,dN);
  fill(255,255,255);
  //eyes
  noStroke();
  ellipse(xN-.25*dN, yN-dN*.05, dN*.2, dN*.2);
  ellipse(xN+.25*dN, yN-dN*.05, dN*.2, dN*.2);
  //pupils
  fill(0,0,255);
  float mlx = constrain (xH, xN-.3*dN, xN-.2*dN);
  float mrx = constrain (xH, xN+.2*dN, xN+.3*dN);
  float my = constrain (yH, yN-dN*.1, yN-dN*.0);
  stroke(0,0,255);
  ellipse(mlx, my, dN*.05, dN*.05);
  ellipse(mrx, my, dN*.05, dN*.05);
  //glasses
  noFill();
  stroke(0,0,0);
  strokeWeight(3);
  ellipse(xN-.25*dN, yN-dN*.05, dN*.4, dN*.4);
  ellipse(xN+.25*dN, yN-dN*.05, dN*.4, dN*.4);
  line(xN-.05*dN, yN-dN*.05, xN+.05*dN, yN-dN*.05);
  //mouth
  stroke(0);
  strokeWeight(.5);
  fill(0);
  float distance = dist(xH,yH,xN,yN);
  if (distance < 0){
    distance = distance*-1;
  }
  float mS = .05*width-.05*distance;
  ellipse(xN, yN+dN*.25, mS, mS);
  //bowtie
  fill(255,0,0);
  stroke(255,0,0);
  rectMode(CENTER);
  rect(xN, yN+dN*.5, dN*.1, dN*.05);
  triangle(xN, yN+dN*.5, xN-dN*.2, yN+dN*.4, xN-dN*.2, yN+dN*.6);
  triangle(xN, yN+dN*.5, xN+dN*.2, yN+dN*.4, xN+dN*.2, yN+dN*.6);
  noFill();
  }
  
  
void bounceNerd() {
  dN = width*.2;
  fill(255,255,255);
  stroke(255,255,255);
 rect(width*.5, width*.5, width,width);
  
  drawNerd(xN,yN,dN);
  //LEFT and RIGHT
  if (xN <= 0+.5*dN && goingLeft == true){
    goingLeft = false;
    xN+= xPlus;
  }
  if (xN <= width-.5*dN && goingLeft == false){
    xN+= xPlus;
  }
  if (xN >= width-.5*dN && goingLeft == false){
    goingLeft = true;
    xN-= xPlus;
  }
  if (xN >= 0+.5*dN && goingLeft == true){
    xN-= xPlus;
  }
  //UP and DOWN
  if (yN <= 0+.5*dN && goingUp == true){
    goingUp = false;
    yN += yPlus;
  }
  if (yN <= width-.5*dN && goingUp == false){
    yN += yPlus;
  }
  if (yN >= width-.5*dN && goingUp == false){
    goingUp = true;
    yN -= yPlus;
  }
  if (yN >= 0+.5*dN && goingUp == true){
    yN -= yPlus;
  }
  }
  
  
void drawBall(){
  fill(203,66,66);
  ellipse(xH,yH,dH,dH);
}


void wrapBall(){
   xH = xH + xSpeed; 
   yH = yH + ySpeed;
  if(xH > width){
   xH = 0; 
  }
  if(xH < width-width){
   xH = width; 
  }
  if (yH > height){
   yH = 0;
  }
  if (yH < 0){
   yH = height;
  }
  
}

void mouseDragged(){
  if (mouseX > pmouseX) {
   xSpeed = xSpeed + .5; 
  }
  if (mouseX < pmouseX){
  xSpeed = xSpeed- .5;
  }
  if (mouseY > pmouseY) {
   ySpeed = xSpeed + .5; 
  }
  if (mouseY < pmouseY) {
   ySpeed = ySpeed - .5; 
  }
}

void hit(){
  
 if(dist(xH,yH,xN,yN) <= (dH+dN)*.5){
   fill(0,0,255);
   rect(width/2,height/2,width,height);
  xN = random(width);
  yN = random(width);
  xH = random(width);
  yH = random(width); 
  xPlus = random(.5, 6);
  yPlus = random(.5, 6);
  xSpeed = 0;
  ySpeed = 0;
  hits++;
  wasHit = true;
  
}
}

void gotHit() {
  
  fill(0,0,255);
   rect(width/2,height/2,width,height);
  wasHit=false;
}

void scoreAndTime(){
  strokeWeight(1);
  fill(0);
  text("score: " + hits, width/10,width/10);
  text("time: "+ millis()/1000, width/10,(width/10)+20);
}          
