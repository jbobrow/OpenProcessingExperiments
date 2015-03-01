
float s, c;
float R = 65;

float[] angle = new float[4];
float[] aspeed = {1.0, 0.1, -0.5, 0.8};
float[][] eSize = new float[4][12];
float[][] espeed = {{0.1, 0.5, 0.3, 0.2, 1.5, 0.7, 1.1, 0.9, 0.4, 1.3, 0.8, 0.6},
                 {1.0, 2.0, 1.5, 2.0, 0.05, 0.6, 1.2, 0.3, 0.1, 1.1, 0.09, 0.8},
                 {0.4, 0.8, 0.08, 1.1, 1.4, 2.2, 1.6, 0.5, 0.1, 1.0, 2.0, 0.7},
                 {1.9, 1.2, 0.09, 0.5, 2.4, 0.05, 1.0, 2.0, 1.8, 0.08, 1.5, 0.7}};
int[][] cColor = {{50, 100, 250, 100, 200, 127, 60, 230, 120, 20, 200, 120},
                {127, 240, 30, 90, 10, 100, 0, 100, 250, 100, 200, 150},
                {60, 230, 120, 20, 200, 120, 100, 50, 200, 150, 30, 90},
                {100, 50, 200, 150, 30, 90, 50, 100, 250, 100, 200, 127}};
float minSize = 1.0;
float maxSize = 75.0;

void setup(){
  size(500, 500);
  background(255);
  smooth();
  noStroke();
  fill(0);
  
  for(int y = 0; y < 4; y ++){
    for(int x = 0; x < 12; x ++){
      eSize[y][x] = minSize;
    }
    angle[y] = 0;
  }
}

void draw(){
  background(255);
  
  
  
  for(int y = 0; y < 4; y ++){
    for(int x = 0; x < 12; x ++){
      float theta = radians(angle[y]+x*30);
      s = (y+1)*R*cos(theta);
      c = -(y+1)*R*sin(theta);
       
      eSize[y][x] += espeed[y][x];     
      if(eSize[y][x] > maxSize || eSize[y][x] < minSize){
        espeed[y][x] = -espeed[y][x];
      }
      
        fill(cColor[y][x], cColor[y][x], 0, 170);
        ellipse(s+250, c+250, eSize[y][x], eSize[y][x]);    
    }
    angle[y] += aspeed[y];
      if(angle[y] >= 360) angle[y] = 0;
  }
}


