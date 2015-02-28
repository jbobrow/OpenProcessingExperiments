
float a = 0.0;

void setup() {
  size(720,480, P3D);
}

void draw() {
  background(149,255,224);
  
  fill(253,216,235);
  noStroke();
  rect(100,90,100,100);
  
  a += 0.005;
  if(a > TWO_PI) {
    a = 0.0;
  }
  
  translate(370,250,0);
  rotateY(a);
  stroke(255);
  noFill();
  box(200);

  translate(0, 0, 0);
  rotateY(a * 2);
  noFill();
  sphereDetail(7);
  sphere(100);

  translate(200,0,0);
  rotateY(a * 2);
  noFill();
  sphereDetail(7);
  sphere(50);
}


