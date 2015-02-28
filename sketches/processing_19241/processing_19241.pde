
//01/22/2011  |  Molly Morin  |  mollymorin.com
//development sample for lesson 2, learning processing
//created for Emerging Formats for Digital Art, University of Notre Dame
//Conditionals...if I clik, it starts a silk thread


////variables:  we will slowly move values that define your sketch here

float centerX = 250;//the horizontal center...this will become mouseX mouseY 
float centerY = 250;//the vertical center

float scX = 0.3;

float webX=centerX;//<---new variables...see below how they will determine the start of a line
float webY=centerY;

////setup:  this defines the size and some features of your sketch
void setup(){
  size (500,500);
  smooth();
}

////draw:  this is where the action happens
void draw(){
  
  centerX = mouseX;
  centerY = mouseY+50;
  
  background(150, 115, 80);

  //a conditional!  if i clik the mouse, the variables webX, webY will be the xy values of this point
  if(mousePressed){
    webX=mouseX;
    webY=mouseY;
  }
  
  //web line. 
  stroke (100, 255, 255);
  line (mouseX, mouseY+50, webX, webY);
  
  rectMode(CENTER);
  
  //body
  stroke(0);
  fill(50);

  rect(centerX, centerY, 40*scX, 60*scX); 
  
  //spots on body
  noStroke();
  fill(255,0,0);
  ellipse(centerX, centerY-10*scX, 8*scX, 8*scX);
  ellipse(centerX, centerY+2*scX, 14*scX, 14*scX); 
  ellipse(centerX, centerY+12*scX, random(19,45)*scX, 20*scX);//<---this makes the red dot flutter a little
  
  //front left leg, yep, keep scaling.  use command+c and command+v to paste
  stroke(0); //solid black
  strokeWeight(4*scX);//yes, even the strokes are getting scaled
  line (centerX-20*scX, centerY-30*scX, centerX-80*scX, centerY-90*scX);//body segment
  stroke(0, 190);
  line (centerX-80*scX, centerY-90*scX, centerX-40*scX, centerY-290*scX);//middle segment
  strokeWeight(2*scX);
  line (centerX-40*scX, centerY-290*scX, centerX-20*scX, centerY-344*scX);//end segment
  
  //front right leg
  stroke(0); 
  strokeWeight(4*scX);
  line (centerX+20*scX, centerY-30*scX, centerX+80*scX, centerY-90*scX);//body segment
  stroke(0, 190);
  line (centerX+80*scX, centerY-90*scX, centerX+40*scX, centerY-290*scX);//middle segment
  strokeWeight(2*scX);
  line (centerX+40*scX, centerY-290*scX, centerX+20*scX, centerY-344*scX);//end segment
  
  //back left leg
  stroke(0); 
  strokeWeight(6*scX);
  line (centerX-20*scX, centerY+30*scX, centerX-140*scX, centerY+130*scX);//body segment
  strokeWeight(2);
  strokeWeight(4*scX);
  line (centerX-140*scX, centerY+130*scX, centerX-80*scX, centerY+290*scX);//middle segment
  strokeWeight(2*scX);
  line (centerX-80*scX, centerY+290*scX, centerX-70*scX, centerY+350*scX);//end segment
  
  //back right leg
  stroke(0); 
  strokeWeight(6*scX);
  line (centerX+20*scX, centerY+30*scX, centerX+140*scX, centerY+130*scX);//body segment
  strokeWeight(4*scX);
  stroke(0, 190);
  line (centerX+140*scX, centerY+130*scX, centerX+80*scX, centerY+290*scX);//middle segment
  strokeWeight(2*scX);
  line (centerX+80*scX, centerY+290*scX, centerX+70*scX, centerY+350*scX);//end segment
  


}


//notes:  This is not effecient, even for a sketch without variables
//that's OK, we can make it more efficient later

