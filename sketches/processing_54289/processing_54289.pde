
float ang=0.01;

void setup() {
  size(600, 400, P3D);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateX(ang);
  rotateY(ang);
  ang+= 0.01;
  box(40);
}


