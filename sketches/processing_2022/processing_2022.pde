
float theta;

void setup() {
  size(800, 500);
  smooth();
}

void draw() {
background(0,0,0);
frameRate(10);
stroke(10,190,0);
float a = (mouseX / (float) width) * 30f;
theta = radians(a);
translate(width/2, height);
strokeWeight(10);
line(0,0,0, -200);
strokeWeight(1);
translate(0,-200);
branch(120);
}

void branch(float h) {
  h *=0.66;
  if (h > 2) {
    pushMatrix(); 
    rotate (theta);
    line(0,0,0, -h);
    translate(0, -h);
    branch (h);
    popMatrix();
    pushMatrix();
    rotate(-theta);
    ellipse(5,5,10, -h);
    translate(0, -h);
    branch(h);
    popMatrix();    
   
  }
} 
  

