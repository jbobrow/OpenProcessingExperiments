
void setup(){
  background(30);
  size(400,400);
  smooth();
}
 
void draw(){
  frameRate(100);
  float r=random (80,250);
  noStroke();
  if(mousePressed == true) {
  triangle (0,0,mouseX,mouseY,0+mouseX/15,0+mouseY/15)
  fill(30,r,180,40)
    }
  
}
