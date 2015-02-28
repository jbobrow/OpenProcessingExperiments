
float x,y,z;

void setup() {
  //background(255,200,100);
  size(700,700,P3D);
  x = width/2;
  y = height/2;
  z = 0;
}

void draw() {
  translate(x,y,z);
  noStroke();
  lights();
  translate(0, 50, 60);
  fill(0,155,155);
  sphere(28);

  z++; // The rectangle moves forward as z increments.
}
