
//Creative Computing
//Fervido Frias
//February 20, 2013.

float cx = 250;
float cy = 320;
float speed = 1;
 
void setup() {
  size(600, 600);
}
 
void draw() {
   
  strokeWeight(5);
  stroke(89);
  rectMode(CENTER);
  background(255, 110, 26);
    
  rect(width/2, height/2, 100, 100);
  noStroke();
  fill (33, 255, 0);
 
  ellipse(cx-13, cy, 15, 15);
  cx += speed*3;
 
  if (cx >= 350) {
    speed = -1;
   
}
  if (cx < 275) {
    speed = 1;
  
}
   
  if ((mouseX > 250) && (mouseX < 350) && (mouseY > 250) && (mouseY < 350)) {
    fill (255, 226, 0);
  }
  
else if (mousePressed) {
    fill (255, 0, 0);
  }
  else {
    fill (255);
  } 
 


}


