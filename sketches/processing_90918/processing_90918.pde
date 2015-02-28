
class BoxPiston {
  float x;
  float y;
  float theta;

  BoxPiston(float x, float y, float theta) {
    this.x = x;
    this.y = y;
    this.theta = theta;
  }

  void draw() {
    float distanceToMouse = dist(mouseX, mouseY, x, y);
    float amp = distanceToMouse / width;
    amp = 1 - pow(1 - amp, 2.5);
    
    float hue = map(amp, 0, 1, 100, 0);
    float sat = map(amp, 0, 1, 200, 255);
    float bright = 215;
    fill(hue, sat, bright);
    
    
    pushMatrix();
    float z = sin(theta) * 140 * amp;
    translate(x, y, z);
    box(30, 20, 50);
    popMatrix();

    theta += 0.05;
  }
}

BoxPiston[] pistons;
Random generator;

void setup() {
  size(800, 600, P3D);
  colorMode(HSB);
  background(158, 10, 250);
  smooth();
  noStroke();
  cursor(HAND);
  
  generator = new Random();
  
  int rows = 11;
  pistons = new BoxPiston[rows * rows];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < rows; j++) {
      float x = map(i, 0, rows, 200, width-100);
      float y = map(j, 0, rows, 150, height-150);
      pistons[(i*rows) + j] = new BoxPiston(x, y, random(TWO_PI));
    }
  }
}



void draw() {
  background(158, 15, 250);
  
  lights();
  //ambientLight(0, 0, 200);
  directionalLight(240, 5, 255, -30, 20, -40);
  directionalLight(240, 5, 255, 30, 20, -40);
  
  for (BoxPiston piston : pistons) {
    piston.draw();
  }
}
