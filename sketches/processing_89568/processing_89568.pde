
/*
  EX2_Draw
  Jeffrey Pangilinan
  1/29/2013
  
  This is a drawing program that we will use to try 
  different functions in an interactive environmet. 
*/


void setup(){
  size(480,480);
  smooth();
}


void draw(){
    //draw a line with my mouse while i have the button pressed.  if (mousePressed){ 
    if (mousePressed == true){
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
}  

void mouseReleased(){
  stroke(random(0,255),random(0,255),random(0,255),120);
}
