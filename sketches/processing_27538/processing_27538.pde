
void setup(){
  size(500,500);
  background(#FAE18D);
  smooth();
  noCursor();
  strokeWeight(0.2);
}


void draw(){
stroke(0);

float a=random (mouseX, mouseY);
float b=random (mouseY,mouseX);
line (0,a,mouseX,mouseY);
line(0,b,mouseX,mouseY);
stroke(35);
line(500,a,mouseX,mouseY);
line(500,b,mouseX,mouseY);
}
                
