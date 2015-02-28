
/*****************************************
 * Assignment 02
 * Name:  Stephanie Bredbenner
 * E-mail: sbredbenne@brynmawr.edu
 * Course: CS 110 - Section 01
 * Submitted: 9/18/2012
 * My sketch for assignment 2, for which I coded a Quidditch pitch.
 When a key is pressed, the color of the grass and the location
 of the broom change randomly.  When the mouse is pressed, a
 golden snitch appears, and the size of the snitch changes 
 depending on the location of the mouse. 
***********************************************/
void setup () {
//set up
  size (500, 500);
  smooth ();
  drawBackground (); 
}

void draw () {
}
void mousePressed (){
  stroke (1);
  strokeWeight (1);
  ellipseMode (CORNER);
  //small snitch
if (mouseY < 200 && mouseY > 40 && mouseX < 250){
  fill (246, 250, 33); 
  ellipse (mouseX,mouseY, 40, 40);
  fill (255); 
  triangle (mouseX+40,mouseY-20, mouseX+50,mouseY, mouseX+40,mouseY+20);
  triangle (mouseX,mouseY-20, mouseX-10,mouseY, mouseX,mouseY+20);
}
//medium snitch
else if (mouseY < 200 && mouseY > 60 && mouseX > 250 && mouseX < 425) {
  fill (246, 250, 33);  
  ellipse (mouseX,mouseY, 60, 60);
  fill (255); 
  triangle (mouseX+60,mouseY-30, mouseX+80,mouseY, mouseX+60,mouseY+30);
  triangle (mouseX,mouseY-30, mouseX-20,mouseY, mouseX,mouseY+30);
}
//big snitch
else if (mouseY  < 270 && mouseY > 200 && mouseX < 410 && mouseX > 10) {
  fill (246, 250, 33);  
  ellipse (mouseX,mouseY, 90, 90);
  fill (255);
  triangle (mouseX+90,mouseY-50, mouseX+110,mouseY, mouseX+90,mouseY+50);
  triangle (mouseX,mouseY-50, mouseX-20,mouseY, mouseX,mouseY+50);
}
}
void keyPressed () {
  drawBackground ();
}
  
void drawBackground () {
//variables declared
float triangleLeftX = 1;
float triangleLeftY = 410;
float triangleTopX = 20;
float triangleTopY = 330;
float triangleRightX = 40;
float triangleRightY = 410;
float endGrass = 500; 
float spacing = 20; 
float grassColor = random (1, 255); 
float broomLeftX = random (230, 400);
float broomLeftY = random (50, 300);
float broomSpacing = 100;

//sky and randomized grass
background (114, 179, 242);
noStroke (); 
fill (0, grassColor, 0);
quad (0,400, 500,400, 500,500, 0,500);
while (triangleRightX <= endGrass) {
  triangle (triangleLeftX,triangleLeftY, triangleTopX,triangleTopY, triangleRightX,triangleRightY);
  triangleLeftX = triangleLeftX + spacing;
  triangleTopX = triangleTopX + spacing;
  triangleRightX = triangleRightX + spacing;
}
//hoops
stroke (219, 199, 46);
strokeWeight (8);
noFill (); 
ellipseMode (CENTER); 
ellipse (50,200, 75, 75); 
ellipse (110,100, 90, 90); 
ellipse (170,200, 75, 75); 
fill (246, 250, 33); 
line (50,240, 50,365); 
line (110,145, 110,365); 
line (170,240, 170,365); 

//randomized broom
strokeWeight (8);
stroke (165, 110, 58);
line (broomLeftX,broomLeftY, broomLeftX + broomSpacing,broomLeftY);
fill (115, 65, 18);
stroke (105, 55, 8);
triangle (broomLeftX,broomLeftY, broomLeftX-50,broomLeftY+30, broomLeftX-50,broomLeftY-30);
}

