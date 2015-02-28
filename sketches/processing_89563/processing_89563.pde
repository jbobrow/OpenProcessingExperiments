
/*
  EX2_Draw
  Martin Ebro
  1/29/2013
  
  This is a drawing program the we will use to try
  different functions in an interactive environment
*/

void setup () {
  size(480,480);
  smooth();
}

void draw (){
  //Draw a line with my mouse while i have the button pressed
  
  if(mousePressed==true){
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
}
void mouseReleased(){
    stroke(random(0,255),random(0,255),random(0,255),120);
}
