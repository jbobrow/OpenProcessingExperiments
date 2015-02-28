
// background changes as
// mouse travels across-
// size is 255, so each movement changes
// fill of background and fill of circle

void setup(){
  size(255,255);
  smooth();
  background(255);
  ellipseMode(CENTER);
  
}



void draw(){
 
  fill ( mouseX);
  rect (0, 0, width, height);
  
  fill( abs(mouseX-255));
  ellipse(width/2, height/2, 200, 200);  
  
}
