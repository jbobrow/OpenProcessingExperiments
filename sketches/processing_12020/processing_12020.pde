


void setup() 
{
  size(400,200);
  fill(0);
  noCursor();
  smooth();
}


void draw(){
  background(255);
  
int size = int(abs(pmouseX-mouseX)+abs(pmouseY-mouseY));

pushMatrix();
  translate(mouseX, mouseY);
float angle = atan2(pmouseY-mouseY, pmouseX-mouseX);
rotate(angle);
ellipse(0, 0, 30+size, 30);
popMatrix();
}

