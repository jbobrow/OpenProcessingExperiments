
float color1 = random(255);
float color2 = random(255);
float color3 = random(255);
float o = 0;

void setup (){
  size (500,500);
  smooth ();
  background (#FFFFFF);
}

void draw (){
  //stroke opacity based on float o
  stroke(#FFFFFF,o);
  //draws rectangle from center
  rectMode(CENTER);
  //random color based on floats, and opacity based on o
  fill (color1,color2,color3,o);
  rect(mouseX,mouseY,random(500),random(500));
  fill (color1,color2,color3,o);
  rect(mouseX,mouseY,random(500),random(500));
}

void keyPressed(){
  //randomizes color values on key press
  color1 = random(255);
  color2 = random(255);
  color3 = random(255);
}
  
void mouseDragged(){
  //makes brush visible when dragged
  o = 10;
}

void mouseReleased(){
  //when click released, the brush is gone
  o = 0;
}
