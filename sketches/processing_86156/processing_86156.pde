
/*
  This program draws a house with a chimney that smokes when 
  the mouse is pressed and a sun that "controls" the time of 
  day based on its location in the sky. 
  Author: Alexandra Porras
  *** Simple house program borrowed from Program1_House.pde
  written by Alexandra Porras and Rene Charlebois.
*/

int windowX = 20;
int windowY = 20;
int sunSize = 50;
int cloudSize = 0;  
int smokeX = 98;
int smokeY = 60;
  
void setup() {
  size(200,200);
  smooth();
  rectMode(CENTER);
  
  println("Move the sun to change the time of day.");
  println();
  println("Click the mouse to make the chimney smoke.");
}

void draw() {
  background(mouseX+40,mouseX+90,mouseX+100); //draw sky that changes based on location of mouse
  
  fill(255,255,0);
  noStroke();
  ellipse(mouseX,mouseY,sunSize,sunSize); //draw sun
  
  fill(200);
  stroke(120);
  ellipse(smokeX,smokeY,cloudSize+10,cloudSize-7);//draw smoke cloud
  
  stroke(0);
  fill(5,98,23);
  rect(100,182.5,200,40); //draw ground
  
  fill(245,196,146);
  rect(75,138,100,75); //draw building

  fill(49,27,4);
  rect(98,68,15,25); //draw chimney
  triangle(25,100,75,50,125,100); //draw roof

  fill(160,2,2);
  rect(75,158,20,35); //draw door

  fill(150);
  ellipse(70,162,5,5); //draw doorknob

  fill(mouseX+240,mouseX+230,mouseX+100); //change color of windows based on mouseX location
  rect(45,140,windowX,windowY); //draw left window
  line(45,130,45,150);
  line(35,140,55,140);
  rect(105,140,windowX,windowY); //draw right window
  line(105,130,105,150);
  line(95,140,115,140);
  
} 

void mousePressed() {   
  fill(200);
  stroke(120);
  ellipse(smokeX,smokeY,cloudSize+10,cloudSize-7);//draw smoke cloud 
  
  cloudSize = cloudSize + 3;
  smokeX = smokeX + 5;
  smokeY = smokeY - 5;
}


