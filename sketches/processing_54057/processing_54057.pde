
float ang = 0.0;

void setup() {
  size(500, 500, P3D);
}

void draw() {
  background(100);
  stroke(0);
  strokeWeight(5);

  directionalLight(255, 0, 0, 0, 50, 50);
  directionalLight(0, 255, 0, 200, 50, -200);
  directionalLight(0, 0, 255, -200, 50, -200);

  translate(width/2, height/2);
  rotateX(PI/3);
  rotateZ(ang);
  ang += 0.05;
  scale(2);

  box(50);

  line(0, -100, 0, 100);
  line(-100, 0, 100, 0);
  line(0, 0, -100, 0, 0, 100);
}


