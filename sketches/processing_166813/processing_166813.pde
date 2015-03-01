
float[][] eSize = new float[5][5]; 


float[][] eColor = new float[5][5]; 
float[][] speed = {{0.5, 2.3, 4.0, 1.2, 2.9}, 
                   {0.2, 7.0, 1.0, 3.3, 2.0}, 
                   {1.5, 2.0, 2.6, 1.8, 0.5},  
                   {3.3, 6.0, 2.6, 1.4, 7.5},
                   {0.8, 2.6, 2.6, 1.0, 3.5}}; 
 
 
 float minSize = 1.0;   
float maxSize = 45.0;
 
 
void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
  fill(0);
  rectMode(CENTER);
 
  for (int y = 0; y < 5; y ++) {
    for (int x = 0; x < 5; x ++) {
      eColor[y][x] = 100; 
    }
  }
  
  for(int y = 0; y < 5; y++){     
    for(int x = 0; x < 5; x++){
      eSize[y][x] = minSize;
    }
  }
  
}
 
void draw() {
  background(255);

  for (int y = 0; y < 5; y ++) {
 
    for (int x = 0; x < 5; x ++) {
      eColor[y][x] += speed[y][x];  
      if (eColor[y][x] > 255 || eColor[y][x] < 0) speed[y][x] = -speed[y][x];
 
      fill(0, eColor[y][x], 255, 100);
      ellipse(x*100, y*50, 50, 100); 
 
      fill(0, eColor[y][x], 0, 100);
      ellipse(x*100, y*100, 50, 100); 
 
      fill(100, eColor[y][x], 0, 125);
      ellipse(x*100+50, y*100+50, 100, 50); 
      
      fill(255, eColor[y][x], 0,100);
     rect(x*100+50, y*100, 50, 50);
    }
  }
  
  
   for(int y = 0; y < 5; y++){   
    for(int x = 0; x < 5; x++){   
      eSize[y][x] += speed[y][x];   
    
      if(eSize[y][x] > maxSize || eSize[y][x] < minSize) speed[y][x] = +speed[y][x];
      ellipse(100*x, 100*y, eSize[y][x], eSize[y][x]);   
    }
  }
  
  
  
}


