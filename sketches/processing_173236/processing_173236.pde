
float theta = radians(30);

void setup() {
  size(640, 440);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(100, 0, 100);
  stroke(255);
  float a = (mouseY / (float) height);
  float theta = radians(30);
  translate(width/2, height);
  noFill();
  bezier(-5, -70, 5, 5, 0, 0, 75, 10);
  translate(0, -120);
  branch(120);  
}


void branch(float h) 
{
  h *= 0.66;

  if (h >= 1) 
  {
    pushMatrix();    
    rotate(theta);
   
    noFill();
    bezier(-5, -70, 5, 5, 0, 0, 75, 10);  
    translate(0, -h);
    stroke(88, 100, 58, 10);
    branch(h);       
    popMatrix();    

    pushMatrix();
    rotate(-theta);
    stroke(88, 100, 58,100);
    noFill();
    bezier(-5, -70, 5, 5, 0, 0, 75, 10);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}

