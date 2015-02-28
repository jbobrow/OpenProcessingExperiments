
/*****************************************
 * Assignment 01
 * Name:         Henry Bradford
 * E-mail:       hbradfor@haverford.edu
 * Course:       CS 110 - Section 01
 * Submitted:    9/12/12
 * 
 * An interactive program in which a fish is surrounded by nets
***********************************************/
//general qualities
void setup() 
{
  size(500,500);
  smooth();
}

void draw()
{
  //background
  background(0,150,255);
  
 //bottom left net
 stroke(255);
 line(0,mouseY+50, mouseX-450,500);
 line(0,mouseY+100, mouseX-400,500);
 line(0,mouseY+150, mouseX-350,500);
 line(0,mouseY+200, mouseX-300,500);
 line(0,mouseY+250, mouseX-250,500);
 line(0,mouseY+300, mouseX-200,500);
 line(0,mouseY+350, mouseX-150,500);
 line(0,mouseY+400, mouseX-100,500);
 line(0,mouseY+450, mouseX-50,500);
 line(0,mouseY+500, mouseX,500);
 
  //top left net
 line(0,mouseY, mouseX-450,0);
 line(0,mouseY-50, mouseX-400,0);
 line(0,mouseY-100, mouseX-350,0);
 line(0,mouseY-150, mouseX-300,0);
 line(0,mouseY-200, mouseX-250,0);
 line(0,mouseY-250, mouseX-200,0);
 line(0,mouseY-300, mouseX-150,0);
 line(0,mouseY-350, mouseX-100,0);
 line(0,mouseY-400, mouseX-50,0);
 line(0,mouseY-450, mouseX,0);
 
 //top right net
 line(500,mouseY, mouseX+500,0);
 line(500,mouseY-50, mouseX+450,0);
 line(500,mouseY-100, mouseX+400,0);
 line(500,mouseY-150, mouseX+350,0);
 line(500,mouseY-200, mouseX+300,0);
 line(500,mouseY-250, mouseX+250,0);
 line(500,mouseY-300, mouseX+200,0);
 line(500,mouseY-350, mouseX+150,0);
 line(500,mouseY-400, mouseX+100,0);
 line(500,mouseY-450, mouseX+50,0);
 
 //bottom right net
 line(500,mouseY, mouseX+450,500);
 line(500,mouseY+50, mouseX+400,500);
 line(500,mouseY+100, mouseX+350,500);
 line(500,mouseY+150, mouseX+300,500);
 line(500,mouseY+200, mouseX+250,500);
 line(500,mouseY+250, mouseX+200,500);
 line(500,mouseY+300, mouseX+150,500);
 line(500,mouseY+350, mouseX+100,500);
 line(500,mouseY+400, mouseX+50,500);
 line(500,mouseY+450, mouseX,500);
 
 //fish
 noStroke();
 //tail
 fill(220,130,0);
 triangle(mouseX,mouseY-30, pmouseX+20,pmouseY+25, pmouseX-20,pmouseY+25);
 //fins
 fill(220,130,0);
 triangle(mouseX,mouseY-30, mouseX-50,pmouseY-10, mouseX+50,pmouseY-10);
 //body
 fill(240,150,0);
 ellipse(mouseX,mouseY-20, 50,70);
 //eyewhites
 fill(255);
 ellipse(mouseX-8,mouseY-50, 6,6);
 ellipse(mouseX+8,mouseY-50, 6,6);
 //pupils
 fill(0);
 ellipse(mouseX-8,mouseY-50, 2,2);
 ellipse(mouseX+8,mouseY-50, 2,2);
 //dorsal line
 stroke(220,130,0);
 line(mouseX,mouseY-55, mouseX,mouseY+20);
 //dorsa lfin
 noStroke();
 fill(220,130,0);
 triangle(mouseX, mouseY-30, pmouseX-3,mouseY-5, pmouseX+3, mouseY-5);
}
