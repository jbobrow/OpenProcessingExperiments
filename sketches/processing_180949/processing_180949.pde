
//a variable that can be true/false
boolean mouseDown = false;
void setup() {
  size(400,400) ;
  background(255) ;
  smooth();
}

void draw() {
  if (mousePressed == true) {
      strokeWeight(map(pmouseX,0,400,1,16));
      stroke(map(pmouseX,0,400,1,220)) ;
      line(pmouseX, pmouseY, mouseX, mouseY) ;
  }
 
}

//do this when mouse is pressed

void mousePressed() {
  strokeWeight(6) ;
  stroke(225,0 ,25) ;
  ellipse(mouseX,mouseY, 50, 50);
 
}
  
  void mouseReleased() {
    strokeWeight(6) ;
  stroke(225,0 ,25) ;
  triangle(mouseX,mouseY, 50, 50);
    mouseDown = false;
    
}

void keyPressed() {
  background(255);
  
}


