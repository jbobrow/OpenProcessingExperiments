
float[][] eColor = new float[5][5];  
float[][] eSize = new float[5][5];  

float[][] speed = {{0.1, 0.5, 0.3, 0.2, 1.5},
                   {1.0, 2.0, 0.5, 2.0, 0.05},
                   {1.0, 4.0, 1.8, 3.0, 0.05},
                   {2.0, 5.0, 1.7, 5.0, 0.45},
                   {1.0, 6.0, 1.5, 7.0, 0.75},
                   {2.5, 0.8, 0.08, 1.1, 1.8}};
float minSize = 1.0;
float maxSize = 100.0;

void setup() {
  size(500, 500);
  background(255);
  smooth();
  noStroke();
  fill(0);
 
  for (int y = 0; y < 5; y ++) {
    for (int x = 0; x < 5; x ++) {
      eSize[y][x] = minSize;
      eColor[y][x] = 0; 
    }
  }
}


void draw() {
  background(0);
 
  for (int y = 0; y < 5; y ++) {
 
    for (int x = 0; x < 5; x ++) {
      eColor[y][x] += speed[y][x];
      eSize[y][x] += speed[y][x];
      
     if (eColor[y][x] > 255 || eColor[y][x] < 0) speed[y][x] = -speed[y][x];
 
      fill(0, eColor[y][x], 225, 100);
      rect(x*100, y*100, 100, 100);  
    }
  }
}


