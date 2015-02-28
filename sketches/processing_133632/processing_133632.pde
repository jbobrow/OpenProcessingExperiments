
void setup() {  
  size(250, 250, P3D);
}

void draw() 
{  
  background(255);  //set background white
  noFill();
  stroke(0, 150);
  translate(width/2, height/2);
  rotateX(radians(frameCount));
  rotateY(radians(frameCount));
  rotateZ(radians(frameCount));
  box(95);
  fill(0, 150);
  text("Learn how to do this at Coding Grace Creative Coding Workshop, Dublin March 15th");
}
