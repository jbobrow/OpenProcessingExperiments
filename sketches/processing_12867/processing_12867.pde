
float robotX;
float robotY;

float balloonR;
float balloonG;
float balloonB;

void setup(){
  size (500,500);
  robotX = width/2;
  robotY = height + 100;
  smooth();
  
}

void draw(){
  background(255);
  fill(0,65,205);
  ellipseMode(CENTER);
  rectMode(CORNER);
  
  //robot body
  stroke(0);

  //this trap is flipping upside down for me...
  //quad(robotX,robotY,robotX+50,robotY,robotX+75,robotY-85,robotX-15,robotY-85);
  
  
  //ROBOT LEFT ARM
  stroke(0);
  rect(robotX,robotY-65,18,75);
  
  rect(robotX,robotY,50,76);
  
  //robot head
  stroke(0);
  rect(robotX+7.5,robotY-35,35,35);
  
  //robot leg left
  stroke(0);
  rect(robotX,robotY+76,22,30);
 
  //robot leg right
  stroke(0);
  rect(robotX+28,robotY+76,22,30);
  
  //robot right arm
  stroke(0);
  rect(robotX+35,robotY+5,18,75);
  
  //balloon string
  stroke(1);
  line(robotX+9,robotY-65,robotX+10,robotY-125);
  
  //balloon
  stroke(0);
  fill(255,0,0);
  ellipse(robotX+9,robotY-150,45,55);
  
  robotY = robotY - 1;
  
}

