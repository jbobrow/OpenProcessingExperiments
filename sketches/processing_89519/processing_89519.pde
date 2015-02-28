
/*
  Ex2_Draw
  Jimmy Vuong
  1/29/13
  This is a drawing program that we will use to try
  different function in on interactive environment.
  */
  
  
void setup(){
  size(480,480);
  smooth();
}
void draw(){
  //draw a line with my mouse whil i have the button pressed.
  
  
  if (mousePressed == true){ //change the color when i click the mouse
  line(mouseX,mouseY,pmouseX,pmouseY);
  
  }
}

void mouseReleased(){
  stroke(random(0,255),random(0,255),random(0,255),120);}
  /* mouseRelease is when u do not click the mouse it doesn't do
  anything.
  */
