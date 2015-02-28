
int shapeCount = 12;
 
float[] sizes = new float[shapeCount];
float[] offsets = new float[shapeCount];
//
void setup() {
  size(1280, 720, P3D);
  for (int i = 0; i < shapeCount; i++) {
    sizes[i] = random(2, 50);
    offsets[i] = random(20);
  }
}
// 
void draw() {
  
  lights();
  smooth();
  frameRate(15);
  background(random(15));
  camera(mouseX / 3, -30.0, 100.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0);
  float t = map(mouseX, 0, width, 0, 25);
  for (int i = 0; i < shapeCount; i++) {
 //
    float x = sin(t/2 + offsets[i]) * 3 * t;
    float y = cos(t/2 + offsets[i] * 2) * 4 * t;
    float z = (float) java.lang.Math.pow(t, 1.75) * offsets[i] / 50;
    pushMatrix();
    noStroke();
    fill(0,0,random(255));
 //
    translate(x, y, z);
    rotateX(offsets[i] * t / 50);
    rotateY(offsets[i] * t / 40);
    rotateZ(offsets[i] * t / 30);
    box(5, random(100),5);
    box(20,5,5);
    popMatrix();
  }
}


