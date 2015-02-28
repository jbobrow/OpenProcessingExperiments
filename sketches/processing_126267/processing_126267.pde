
float time = 0;

void setup() {
  size(600, 600, P3D);
  noStroke();
  smooth();
  fill(64, 255, 64);
}

void draw() {
  ambientLight(64, 64, 64);
  directionalLight(255, 255, 255, 0, -1, -1);
  background(255);
  
  time += 0.01;  

  for (int i = 0; i < 200; i += 10) {
    pushMatrix();
    translate(600 / 2, 600 / 2, 0);
    float rad = radians(i * time);
    rad = min(PI * 1.5, rad);
    rotateX(rad);    
    rotateY(rad);
    donut(0, 0, i);
    popMatrix();
  }
}

void donut(float x, float y, float r) {

  beginShape(TRIANGLE_STRIP);

  for (int i = 0; i <= 36; i++) {
    float px = cos(radians(i * 10));
    float py = sin(radians(i * 10));

    vertex(x + (px * r), y + (py * r), 0);
    vertex(x + (px * (r + 10)), y + (py * (r + 10)), 0);
  }

  endShape(CLOSE);
}



