
/*
  EX2_Draw
  Max Serna
  1/29/2013
  
  This is a drawing program that we use to try 
  different functions in an interactive environment
 */

void setup(){
  size(480, 240);
  smooth();
}

void draw() {
  //draw a line with my mouse while I have button pressed
  if (mousePressed == true){ 
    line(mouseX,mouseY, pmouseX, pmouseY);
  }
}
  void mouseReleased(){ //change line color
   stroke(random(0,255),random(0,255),random(0,255),120);
  }
