
void setup(){
  size(1280 ,900);
  background(#c0c0c0);
  smooth();
  noCursor();
  strokeWeight(0.1);
}
 
 
 
 
void draw(){
stroke(0);
 
float a=random (mouseX, mouseY);
float b=random (mouseY,mouseX);
line (0,a,mouseX,mouseY);
line(0,b,mouseX,mouseY);
stroke(15);
line(2000,a,mouseX,mouseY);
line(2000,b,mouseX,mouseY);
}


