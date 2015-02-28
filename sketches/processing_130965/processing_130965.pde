
 
float theta;   

void setup() {
  size(600, 400);
}

void draw() {
  background(0);
  frameRate(30);
  stroke(255);
  float a = (mouseX / (float) width) * 90f;
  theta = radians(a);
  translate(width/2,height);
  line(0,0,0,-120);
  translate(0,-120);
  branch(120);
}

void branch(float h) {
  h *= 0.66;

  if (h > 2) {
    pushMatrix();
    rotate(theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}





