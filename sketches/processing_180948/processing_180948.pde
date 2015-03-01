
//a variable that can be true/false
boolean mouseDown = false;

void setup() {
  size(400,400);
  background(225);
  smooth();
}
  
void draw() {
  
if (mousePressed==true) { 
  strokeWeight(map(pmouseX,0,400,1,6));
  stroke(map(pmouseX,0,400,0,220));
  line(pmouseX, pmouseY, mouseX, mouseY);
}
     
}

//do this when mouse is pressed

void mousePressed() {
  strokeWeight(6);
  noFill();
  stroke(225,0 ,25);
  ellipse(mouseX,mouseY, 150, 50);
  
  

}

void mouseReleased() {
  mousedown = false;
  ellipse(mouseX,mouseY,50,50);
}


// do this when key is pressed

void Keypressed() {
background(255);
}

  


