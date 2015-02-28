
//01/22/2011  |  Molly Morin  |  mollymorin.com
//development sample for lesson 2, learning processing
//created for Emerging Formats for Digital Art, University of Notre Dame
//Rollover, my zoog curls up if you mouse-over, shrinks if you click


////variables:  we will slowly move values that define your sketch here

float centerX = 250;//the horizontal center
float centerY = 250;//the vertical center

//i'm defining each leg joint as a variable...nomencalture becomes important here
//i will need front and back, but can use symmetry to do left and right
//front legs
float fbX=6;//f=front, b=body, x
float fbY=9;
float fj1x=26;//j1=joint1...by my definition, first joint from body
float fj1y=27;
float fj2x=12;
float fj2y=80;
float feX=6; //e=end
float feY=90;

//back legs
float bbX=6;
float bbY=9;
float bj1x=40;
float bj1y=25;
float bj2x=30;
float bj2y=90;
float beX=26;
float beY=100;

////setup:  this defines the size and some features of your sketch
void setup(){
  size (500,500);
  smooth();
}

////draw:  this is where the action happens
void draw(){

  background(150, 115, 80);
  
  rectMode(CENTER);
  
  //body
  stroke(0);
  fill(50);
  
  //spots on body
  noStroke();
  fill(255,0,0);
  ellipse(centerX, centerY-3, 2, 2);
  ellipse(centerX, centerY+1, 4, 4); 
  ellipse(centerX, centerY+4, 6, 6);
  
  for(int i=1; i<6; i++){
  //front left leg
  stroke(0); //solid black
  strokeWeight(2);
  line (centerX-fbX*i, centerY-fbY+2*i, centerX-fj1x*i, centerY-fj1y-i);//body segment
  stroke(0, 190);
  strokeWeight(1);
  line (centerX-fj1x*i, centerY-fj1y-i, centerX-fj2x*i, centerY-fj2y-i);//middle segment
  strokeWeight(1);
  line (centerX-fj2x*i, centerY-fj2y-i, centerX-feX*i, centerY-feY-i);//end segment
  }
  //front right leg
  stroke(0); 
  strokeWeight(2);
  line (centerX+fbX, centerY-fbY, centerX+fj1x, centerY-fj1y);//body segment
  stroke(0, 190);
  strokeWeight(1);
  line (centerX+fj1x, centerY-fj1y, centerX+fj2x, centerY-fj2y);//middle segment
  line (centerX+fj2x, centerY-fj2y, centerX+feX, centerY-feY);//end segment
  
  //back left leg
  stroke(0); 
  strokeWeight(2);
  line (centerX-bbX, centerY+bbY, centerX-bj1x, centerY+bj1y);//body segment
  strokeWeight(2);
  strokeWeight(1);
  line (centerX-bj1x, centerY+bj1y, centerX-bj2x, centerY+bj2y);//middle segment
  strokeWeight(1);
  line (centerX-bj2x, centerY+bj2y, centerX-beX, centerY+beY);//end segment
  
  //back right leg
  stroke(0); 
  strokeWeight(2);
  line (centerX+bbX, centerY+bbY, centerX+bj1x, centerY+bj1y);//body segment
  strokeWeight(1);
  stroke(0, 190);
  line (centerX+bj1x, centerY+bj1y, centerX+bj2x, centerY+bj2y);//middle segment
  strokeWeight(1);
  line (centerX+bj2x, centerY+bj2y, centerX+beX, centerY+beY);//end segment
  


}

 void mousePressed(){
   saveFrame ("screenshot.jpg");
 }

//notes:  This is not effecient, even for a sketch without variables
//that's OK, we can make it more efficient later

