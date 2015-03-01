
float[][] eColor = new float[6][6];
float[][] speed = {{1.5, 2.5, 9.0, 7.2, 10.9, 2.8}, 
                   {0.5, 2.0, 5.0, 4.0, 10.0, 6.1}, 
                   {1.5, 12.0, 7.0, 1.0, 0.5, 4,9},
                   {1.5, 2.5, 9.0, 7.2, 10.9, 2.8}, 
                   {0.5, 2.0, 5.0, 4.0, 10.0, 6.1}, 
                   {1.5, 12.0, 7.0, 1.0, 0.5, 4,9}};
 
void setup() {
  size(500, 500);
  background(255);
  smooth();
  noStroke();
  fill(0);
  rectMode(CENTER);
 
  for (int y = 0; y < 6; y ++) {
    for (int x = 0; x < 6; x ++) {
      eColor[y][x] = 0;
    }
  }
}
 
void draw() {
  background(255);
 
  for (int y = 0; y < 6; y ++) {
 
    for (int x = 0; x < 6; x ++) {
      eColor[y][x] += speed[y][x];
      if (eColor[y][x] > 255 || eColor[y][x] < 0) speed[y][x] = -speed[y][x];
 
      fill(45, eColor[y][x], 123, 127);
      rect(x*100, y*100, 100, 100);
 
      fill(25, eColor[y][x], 255, 127);
      rect(x*100, y*100, 100, 100);
 
      fill(255, eColor[y][x], 0, 127);
      rect(x*100+50, y*100+50, 100, 100);
    }
  }
}


