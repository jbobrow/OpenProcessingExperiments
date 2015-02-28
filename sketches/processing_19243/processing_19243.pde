
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
  
  //conditionals
  
  rectMode(CENTER);
  
  //a conditional with some math to make the spider curl up
  if(mouseX>240 && mouseX<260 && mouseY>240 && mouseX<260){
    //front legs
    fj1x=30;
    fj1y=20;
    fj2x=4;
    fj2y=30;
    feX=1;
    feY=35;
    
    //back legs
    bj1x=30;
    bj1y=10;
    bj2x=15;
    bj2y=40;
    beX=12;
    beY=50;
  }else{
    fbX=6;//f=front, b=body, x
    fbY=9;
    fj1x=26;//j1=joint1...by my definition, first joint from body
    fj1y=27;
    fj2x=12;
    fj2y=80;
    feX=6; //e=end
    feY=90;

    //back legs
    bbX=6;
    bbY=9;
    bj1x=40;
    bj1y=25;
    bj2x=30;
    bj2y=90;
    beX=26;
    beY=100;
  }
  
  
  //body
  stroke(0);
  fill(50);

  if(mousePressed){
    rect(centerX, centerY, random(10,15), random(15,22));
  }else{
    rect(centerX, centerY, 12, 18); 
  }
  
  //spots on body
  noStroke();
  fill(255,0,0);
  ellipse(centerX, centerY-3, 2, 2);
  ellipse(centerX, centerY+1, 4, 4); 
  ellipse(centerX, centerY+4, 6, 6);
  
  //front left leg
  stroke(0); //solid black
  strokeWeight(2);
  line (centerX-fbX, centerY-fbY, centerX-fj1x, centerY-fj1y);//body segment
  stroke(0, 190);
  strokeWeight(1);
  line (centerX-fj1x, centerY-fj1y, centerX-fj2x, centerY-fj2y);//middle segment
  strokeWeight(1);
  line (centerX-fj2x, centerY-fj2y, centerX-feX, centerY-feY);//end segment
  
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


//notes:  This is not effecient, even for a sketch without variables
//that's OK, we can make it more efficient later

