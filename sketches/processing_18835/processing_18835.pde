
//01/22/2011  |  Molly Morin  |  mollymorin.com
//development sample for lesson 1, learning processing
//created for Emerging Formats for Digital Art, University of Notre Dame
//  Here we re-define the zoog from its center, and call it centerX, centerY
////setup:  this defines the size and some features of your sketch
float centerX = 0;
float centerY = 250;

int dir = 1;

void setup(){
  size (500,500);//the size of your sketch in pixels
  smooth();//turns on anti-ailiasing, witch smooths out some rough edges
}

////draw:  this is where the action happens

void draw(){
  //background color in Red, Green, Blue
  //try placing background() in setup, see what happens
  background(250, 230, 160);//pale yellow
  
  //set the rectangle mode so it draws form the center
  //cause I like it that way
  rectMode(CENTER);
  
  //body
  stroke(0);//black
  fill(50);//almost black
  rect(centerX, centerY,mouseX/20,30);
  
  //spots on body
  //i just ballparked these and then monkeed around with them till they looked right
  noStroke();
  fill(255,0,0);//red
  ellipse(centerX, centerY-5, 4, 4);
  ellipse(centerX, centerY+1, 7, 7); 
  ellipse(centerX, centerY+6, 10, 10);
  
  //front left leg
  stroke(0); //solid black
  strokeWeight(2);
  line (centerX-10, centerY-15, centerX-40, centerY-45);//body segment
  stroke(0, 190);
  line (centerX-40, centerY-45, centerX-20, centerY-145);//middle segment
  strokeWeight(1);
  line (centerX-20, centerY-145, centerX-10, centerY-172);//end segment
  
  //front right leg
  //notice the symmetry...where x values are "-10 above, it is +10 here
  //y values are the same, as symmetry is along y axis
  stroke(0); 
  strokeWeight(2);
  line (centerX+10, centerY-15, centerX+40, centerY-45);//body segment
  stroke(0, 190);
  line (centerX+40, centerY-45, centerX+20, centerY-145);//middle segment
  strokeWeight(1);
  line (centerX+20, centerY-145, centerX+10, centerY-172);//end segment
  
  //back left leg
  stroke(0); 
  strokeWeight(3);
  line (centerX-10, centerY+15, centerX-70, centerY+65);//body segment
  strokeWeight(2);
  stroke(0, 190);
  line (centerX-70, centerY+65, centerX-40, centerY+145);//middle segment
  strokeWeight(1);
  line (centerX-40, centerY+145, centerX-35, centerY+175);//end segment
  
  //back right leg
  stroke(0); 
  strokeWeight(3);
  line (centerX+10, centerY+15, centerX+70, centerY+65);//body segment
  strokeWeight(2);
  stroke(0, 190);
  line (centerX+70, centerY+65, centerX+40, centerY+145);//middle segment
  strokeWeight(1);
  line (centerX+40, centerY+145, centerX+35, centerY+175);//end segment
  
 /* centerX = centerX+2;
  
 if(centerX>500){
    centerX=0;
   }*/
 
 
  
 centerX = centerX+3*dir;
  
  if(centerX>500||centerX<0){
    dir=dir*-1;
  }
}

//notes:  This is not effecient, even for a sketch without variables
//that's OK, we can make it more efficient later

