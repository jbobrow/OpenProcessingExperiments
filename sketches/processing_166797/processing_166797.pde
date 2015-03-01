
float[][] eColor = new float[2][2];

float eSpeed = 0.2;
float eSize = 200.0; 

float[][] speed = {{1.5, 3.5}, 
                   {2.5, 4.5}};

float minSize = 200.0;
float maxSize = 250.0;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
  fill(0);
 
  for (int y = 0; y < 2; y ++) {
    for (int x = 0; x < 2; x ++) {
      eColor[y][x] = 0;
    }
  }
}

void draw() {
  background(255);

  for (int y = 0; y < 2; y ++) {
    for (int x = 0; x < 2; x ++) {
      eColor[y][x] += speed[y][x];

      if (eColor[y][x] > 255 || eColor[y][x] < 0) speed[y][x] = -speed[y][x];
        fill(eColor[y][x], 50, 100);
        rect(x*200, y*200, 200, 200);      
    }
  }
  
  for (int z = 0; z < 600; z += 200) {
    for (int w = 0; w < 600; w += 200) {
      fill(255, 255, 255);
      eSize += eSpeed;
      if(eSize > maxSize || eSize < minSize) eSpeed = - eSpeed;
      ellipse(w, z, eSize, eSize);
    }
  }
}



