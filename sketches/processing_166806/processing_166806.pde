
float[][] eSize = new float[6][6];
float[][] speed = {{1, 2, 3, 4, 5,8},
                   {6, 7, 8, 9, 10,0.3},
                   {0.4, 0.8, 0.08, 1.1, 1.4,0.1},
                 {0.4, 0.8, 0.8, 1.1, 1.4,1.9},
                 {1.5, 2.5, 3.5, 4.5, 5.5,0.5},
                   {6.5, 7.5, 8.5, 9.5, 10.5,0.7}
           };
float minSize = 1.0;
float maxSize = 100.0;

void setup(){
  size(500,500);
  smooth();
  noStroke();
  
  for(int y = 0; y < 6; y++){
    for(int x = 0; x < 6; x++){
      eSize[y][x] = minSize;
    }
  }
}

void draw() {
  background(200);
  for(int y = 0; y < 6; y++){  
    for(int x = 0; x < 6; x++){  
      eSize[y][x] += speed[y][x];
      if(eSize[y][x] > maxSize || eSize[y][x] < minSize) speed[y][x] = -speed[y][x];
      fill(0,255,20);
      stroke(20);
      ellipse(y*100, y*100, eSize[y][x], eSize[y][x]);
      
      fill(100,120,150,50);
      ellipse(x*100, 100, eSize[y][x], eSize[y][x]);
      
      fill(50,150,255,50);
      ellipse(x*100, 400, eSize[y][x], eSize[y][x]);
    }
  }
}


