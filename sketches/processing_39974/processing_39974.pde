
/* THUY LINH DO
ASSIGNMENT 3 CREATION & COMPUTATION
OCAD UNIVERSITY FALL 2011
*/
Robot robot;
int button = 0;
int[] xpos = new int[10];
int[] ypos = new int[10];

//function setup
void setup(){
  size(600, 400);
  frameRate(30);
  smooth();
  for (int i=0; i<xpos.length; i++){
    xpos[i]=0;
    ypos[i]=0;
  }
}

//function draw
void draw() {
  //call function draw background
  drawBackground(button);
  //using array to display robot
  for (int i = 0; i < xpos.length-1; i ++ ) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  // New location
  xpos[xpos.length-1] = mouseX;  
  ypos[ypos.length-1] = mouseY;  
  // Draw everything
  for (int i = 0; i < xpos.length; i ++ ) {  
  robot = new Robot(xpos[i],ypos[i], button);  
  robot.display( int(255*float(i)/float(xpos.length)) );
 }
}

//function drawBackground
 void drawBackground (int typeBg) {
   if (typeBg == 0) {
     background(210,237,243);
     println("I have superpowers, I know teleportation!");
   } else if (typeBg ==1) {
     background(252,229,46);
     println("Wow it's too light!");
   } else if (typeBg ==2) {
     background(0);
     println("Where is this place, I'm scared!!!");
   } else {
     background(219,179,180);     
     println("Happy!");   
   }
 }
 
//Declare object class Robot 
  class Robot{
  //robot variables
  float robotX;
  float robotY;
  int robotButton;
  int robotColor;
  //robot constructor
  Robot(float tempX, float tempY, int tempButton){
  robotX = tempX;
  robotY = tempY;
  robotButton = tempButton;
  robotY = constrain(robotY, 0, height+100);
  robotX = constrain(robotX, 0, width);
  }
  //function display robot 
   void display(float opacity) {
pushMatrix();     
strokeWeight (3);
//ROBOT HEAD
//coloring the head
stroke(174,223,228,opacity); 
fill(174,223,228,opacity);
rect (robotX-60,robotY-150,120,120);
rect (robotX-80,robotY-130,160,80); 
//antennae
stroke(0,0,0,opacity);
line (robotX, robotY-150, robotX-10, robotY-170);
line (robotX, robotY-150, robotX+10, robotY-170);
//head border lines
line (robotX-60, robotY-150, robotX+60, robotY-150);
line (robotX-60, robotY-30, robotX+60, robotY-30);
line (robotX-80, robotY-130, robotX-80, robotY-50);
line (robotX+80, robotY-130, robotX+80, robotY-50);
//head's corners
ellipseMode(CORNER);
arc(robotX-80, robotY-150, 40, 40, PI, TWO_PI-PI/2);
arc(robotX+40, robotY-150, 40, 40, TWO_PI-PI/2, TWO_PI);
arc(robotX+40, robotY-70, 40, 40, 0, PI/2);
arc(robotX-80, robotY-70, 40, 40, PI/2, PI);
//eyes change based on number of times mouse clicked 
if (robotButton==2) { 
    //emotional eyes
    line(robotX-40, robotY-120, robotX-60, robotY-125);
    line(robotX-40, robotY-120, robotX-60, robotY-115);
    line(robotX+40, robotY-120, robotX+60, robotY-125);
    line(robotX+40, robotY-120, robotX+60, robotY-115);
  } else  if (robotButton==0) {
    //round eyes
    ellipseMode(CENTER);
    fill(0,0,0,opacity);
    ellipse(robotX-45,robotY-120,10,10);
    ellipse(robotX+45,robotY-120,10,10);
  } else if (robotButton==1){
    //eyes with glasses
    rectMode(CENTER);
    fill (150,150,150,opacity);
    rect(robotX-40, robotY-120,50, 20);
    rect(robotX+40,robotY-120,50, 20);
    line(robotX-15,robotY-120,robotX+15,robotY-120);
    rectMode(CORNER);
    fill(0,0,0,opacity);
    line(robotX-55, robotY-120,robotX-25, robotY-120);
    line(robotX+25, robotY-120,robotX+55, robotY-120);
  } else {
    //happy eyes
    fill(174,223,228,opacity);
    stroke(0,0,0,opacity); 
    ellipseMode(CENTER);
    arc(robotX-40, robotY-115, 20, 20, PI, TWO_PI-PI/2);
    arc(robotX-40, robotY-115, 20, 20, TWO_PI-PI/2, TWO_PI);
    arc(robotX+40, robotY-115, 20, 20, PI, TWO_PI-PI/2);
    arc(robotX+40, robotY-115, 20, 20, TWO_PI-PI/2, TWO_PI);
  }
//blush
ellipseMode(CENTER);
stroke(247,165,170,opacity);
fill(247,165,170,opacity); 
ellipse(robotX-50,robotY-100,10,10);
ellipse(robotX+50,robotY-100,10,10);
//mouth
stroke(0,0,0,opacity); 
line (robotX-20, robotY-100, robotX+20, robotY-100);
//ROBOT BODY
fill(174,223,228,opacity);
rect (robotX-25,robotY-30,50,50);
//button
ellipse (robotX,robotY-5,30,30);
line (robotX-5, robotY-10, robotX-5, robotY);
line (robotX+5, robotY-10, robotX+5, robotY);
//hands
line (robotX-25, robotY-30, robotX-35, robotY+5);
line (robotX+25, robotY-30, robotX+35, robotY+5);
//legs
line (robotX-15, robotY+20, robotX-15, robotY+45);
line (robotX+15, robotY+20, robotX+15, robotY+45);
popMatrix();
}
  }

//Mouse pressed function
void mousePressed() {
    if (button<3){
      button += 1;} else {
      button=0;}
}



