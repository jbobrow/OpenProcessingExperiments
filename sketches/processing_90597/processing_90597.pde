
/*
 EX2_Draw
 AundieMegan Soriano
 1/29/2013
 
 This is a drawing program that we will use to try
 different functions in an interactive environment.
*/

void setup(){
  size(480,480);
  smooth();
}

void draw(){
  //Draw a line when I have my button pressed.
 
 
  if (mousePressed==true) { //draw a line with my mouse while I have the button pressed.
   line(mouseX,mouseY,pmouseX,pmouseY);
    }
  }
  void mouseClicked(){
    stroke(random(0,255),random(0,255),random(0,255),120);
    //changes the color everytime you click on the mouse.
   }
