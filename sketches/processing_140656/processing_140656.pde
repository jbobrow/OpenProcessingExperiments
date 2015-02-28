

float a=0;

void setup() {
  
  size(600, 600, P3D);
  strokeWeight(2);
  stroke(229, 0, 54, 20);
  fill(1, 150);
}

void draw() {
  
  translate(300, 300);
  rotateY(cos(a));
  rotateZ(sin(a));
  rect(200-a*10);
  a+=0.02;
  if (a>20) a=20;
}



