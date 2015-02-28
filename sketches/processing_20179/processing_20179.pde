
//01/22/2011  |  Molly Morin  |  mollymorin.com

//created for Emerging Formats for Digital Art, University of Notre Dame
//Here's the same set of functions passing several variables

////variables////////////////////////////////////////////////////////////////////
float centerX = 0;
float centerY = 250;
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
  
  //the stuff in parens() defines some features of this particular iteration
  //of the function
  display(random(0,255), random(10,30));//(shade of grey, width)
  moveHoriz(1, 0, width);//(speed, left bumper, right bumper)
  moveVert(3, 200, 300);//(speed, top bumper, bottom bumper)
}

////functions////////////////////////////////////////////////////////////////////

void display(float grey, float body){
  //body
  stroke(0);
  fill(grey);//<shade of grey will be passedas random
  rect(centerX, centerY, body,30);
   
  //spots on body
  noStroke();
  fill(255,0,0);//red
  ellipse(centerX, centerY-5, 4, 4);
  ellipse(centerX, centerY+1, 7, 7);
  ellipse(centerX, centerY+6, 10, 10);
}

//in functions,  i've added variables for speed and the constraints for 
//how far (left/right or up/down) the critter can go

void moveHoriz(int sp, int l, int r){//variables speed, left bumper, right bumper
    
  centerX = centerX+sp*dirX;//<--note I've replaces a number with sp
   
  if(centerX>r||centerX<l){//<--I've passed variables here too
    dirX=dirX*-1;
  }
}

void moveVert(int sp, int t, int b){//speed, top, bottom
     centerY = centerY+sp*dirY;
   
  if(centerY>b||centerY<t){
    dirY=dirY*-1;
  }
}

void mousePressed(){
  saveFrame("screenshot.jpg");
}

