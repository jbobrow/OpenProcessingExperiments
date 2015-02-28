
//ellipse that moves on a line and grows
void setup(){
  smooth();
  size(400,400);
}


void draw(){
  if(!mousePressed){
 background(150);
  }
  
 stroke(0);
 line(0, 0, 400, 400);
 stroke(255);
 noFill(); 
 ellipseMode(CORNER);
ellipse(mouseX, mouseX, mouseY, mouseY); 
}

