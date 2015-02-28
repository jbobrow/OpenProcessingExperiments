
void setup() {
  size(300, 200);//in processing this works fine for me at 800x600
  colorMode(RGB, 100);
}
float f = 0;
float z = 0;
void draw() {
  fill(20, 20);
  noStroke();
  rect(0, 0, width, height);
  stroke(50);
  noFill();
  int rows = int(height/15)+ 4;
  int cols = int(width/15) + 4;
  float d = 16;
  for (int j = 0; j < rows; j++) {
    beginShape();
    for (int i = 0; i < cols; i++) {
      float n = map(noise(i/6.0, j/6.0 + f, z), 0, 1, -d, d);
      curveVertex(-15 + i*15, -15 + j*15 + n);
    }
    endShape();
  }
  for (int i = 0; i < cols; i++) {
    beginShape();
    for (int j = 0; j < rows; j++) {
      float n = map(noise(i/6.0, j/6.0 + f, z), 0, 1, -d, d);
      curveVertex(-15 + i*15 + n, -15 + j*15);
      float c = map(noise(i/6.0, j/6.0 + f, z), 0.1, 0.9, 100, 0);
      fill(c, 50);
      rect(-15 + i*15 + n, -15 + j*15 + n, 15, 15);
      noFill();
    }
    endShape();
  }
  f += 0.02;
  z += 0.03;
}
