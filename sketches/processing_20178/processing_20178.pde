
//01/22/2011  |  Molly Morin  |  mollymorin.com

//created for Emerging Formats for Digital Art, University of Notre Dame
//Here's an example for functions.  I've removed spidey's legs for simplicity

////variables////////////////////////////////////////////////////////////////////
float centerX = 300;
float centerY = 100;
int dirX = 1;
int dirY = 1;
////setup////////////////////////////////////////////////////////////////////////

 
void setup(){
  size (500,500);//the size of your sketch in pixels
  smooth();//turns on anti-ailiasing, witch smooths out some rough edges
}
 

////draw/////////////////////////////////////////////////////////////////////////
 
void draw(){
 
  background(250, 230, 160);
  rectMode(CENTER);
  
  //This replaces all that messy stuff that was in draw
  //try commenting out moveHoriz() or moveVert(), see what happens
  //this is easier than commenting out 5 or 6 lines of code
  display();//show the body
  moveHoriz();//move it horizontally
  moveVert();//move it vertically
}

////functions////////////////////////////////////////////////////////////////////

void display(){
  //body
  stroke(0);//black
  fill(50);//almost black
  rect(centerX, centerY, 20,30);
   
  //spots on body
  noStroke();
  fill(255,0,0);//red
  ellipse(centerX, centerY-5, 4, 4);
  ellipse(centerX, centerY+1, 7, 7);
  ellipse(centerX, centerY+6, 10, 10);
}

void moveHoriz(){
     centerX = centerX+3*dirX;
   
  if(centerX>width||centerX<0){
    dirX=dirX*-1;
  }
}

void moveVert(){
     centerY = centerY+1*dirY;
   
  if(centerY>height||centerY<0){
    dirY=dirY*-1;
  }
}

