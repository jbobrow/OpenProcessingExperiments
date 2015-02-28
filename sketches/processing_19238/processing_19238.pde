
//01/22/2011  |  Molly Morin  |  mollymorin.com
//development sample for lesson 2, learning processing
//created for Emerging Formats for Digital Art, University of Notre Dame
//This is a scalable zoog. it will grow depending on the location of mouse X


////variables:  we will slowly move values that define your sketch here

float centerX = 250;//the horizontal center
float centerY = 250;//the vertical center


////setup:  this defines the size and some features of your sketch
void setup(){
  size (500,500);//the size of your sketch in pixels
  smooth();//turns on anti-ailiasing, witch smooths out some rough edges
}

////draw:  this is where the action happens

void draw(){
  
  //ask me what a variable is doing in draw(). . .
  float mouseFloatX = mouseX; //this turns mouseX into a float
  float scX = mouseFloatX/500; //i chose a short name for this variable cause we're gonna use it a lot!
  
  background(250, 230, 160);//pale yellow
  
  rectMode(CENTER);//draw rectangles from center
  
  //body
  stroke(0);
  fill(50);
  //begin scaling
  //rect(centerX, centerY,40,60); <---I'll replace this
  rect(centerX, centerY, 40*scX, 60*scX); // <---with this
  
  //spots on body
  noStroke();
  fill(255,0,0);//red
  //ellipse(centerX, centerY-5, 4, 4);<---same replacement strategy here
  ellipse(centerX, centerY-10*scX, 8*scX, 8*scX);//<---applies here too
  //NOTE!!!!! relative locations, not just sizes have to be scaled
  ellipse(centerX, centerY+2*scX, 14*scX, 14*scX); 
  ellipse(centerX, centerY+12*scX, 20*scX, 20*scX);
  
  
  //front left leg, yep, keep scaling.  use command+c and command+v to paste
  stroke(0); //solid black
  strokeWeight(4*scX);//yes, even the strokes are getting scaled
  line (centerX-20*scX, centerY-30*scX, centerX-80*scX, centerY-90*scX);//body segment
  stroke(0, 190);
  line (centerX-80*scX, centerY-90*scX, centerX-40*scX, centerY-290*scX);//middle segment
  strokeWeight(2*scX);
  line (centerX-40*scX, centerY-290*scX, centerX-20*scX, centerY-344*scX);//end segment
  
  //front right leg
  //notice the symmetry...where x values are "-10 above, it is +10 here
  //y values are the same, as symmetry is along y axis
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

 void mousePressed(){
   saveFrame ("screenshot.jpg");
 }

//notes:  This is not effecient, even for a sketch without variables
//that's OK, we can make it more efficient later

