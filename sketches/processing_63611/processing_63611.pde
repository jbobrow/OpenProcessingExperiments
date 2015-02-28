
void setup(){
  size (500,500);
}
void draw(){
  background(0);
   
  float R = random (0);
  float G = random (100,150);
  float B= random (100,200);
  fill (R,G,B);
  noStroke();
  if (mousePressed == true){
  float r =random(-100,100);
  ellipse (mouseY,mouseX,r,r);
  ellipse (mouseX,mouseY,r,r);
  ellipse (mouseX,mouseX,r,r);
  ellipse (mouseY,mouseY,r,r);
  }
}

