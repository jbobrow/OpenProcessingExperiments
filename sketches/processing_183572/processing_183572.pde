
float a = 0;
float lx;
float ly;
float lz;
boolean paused = false;
 
void setup() {
  size(500, 400, P3D);
  noFill();
  stroke(255);
  smooth();
  colorMode(HSB, 100);
}
void draw() {
  background(#051E39);
  translate(250, 200);
 
  float b = a;
  float c = a / 50;
 
  rotateY(noise(a/10)*10);
  rotateX(noise(0,a/10)*10);
  rotateZ(noise(0,0,a/10)*10);
   
  strokeWeight(3);
  stroke(100); 
  while(b < a+10) {
    float x = 1000 * noise(b, 0, c) - 500;
    float y = 1000 * noise(c, b, 0) - 500;
    float z = 1000 * noise(0, c, b) - 500;
    line(x, y, z, lx, ly, lz);
    strokeWeight(map(z,-300,300,0,6));
    stroke((noise(b+20)*150+50)%100, 80, 80);
    lx = x;
    ly = y;
    lz = z;
     
    b = b + 0.03;
  }
  a = a + 0.01;
}
