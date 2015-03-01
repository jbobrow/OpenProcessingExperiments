
float[][] eColor = new float[5][5];    
float[][] speed = {{10 , 5   , 0.5 , 5   , 10 }, 
                   {5  , 12.5, 7.5 , 12.5, 5  }, 
                   {0.5, 7.5 , 15.0, 7.5 , 0.5},
                   {5  , 12.5, 7.5 , 12.5, 5  }, 
                   {10 , 5   , 0.5 , 5   , 10 }};     
 
void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
  fill(0);
  rectMode(CENTER);
 
  for (int y = 0; y < 5; y ++) {
    for (int x = 0; x < 5; x ++) {
      eColor[y][x] = 0;    
    }
  }
}
 
void draw() {
  background(255);
 
  for (int y = 0; y < 5; y ++) {
 
    for (int x = 0; x < 5; x ++) {
      eColor[y][x] += speed[y][x];   
      
      if (eColor[y][x] > 255 || eColor[y][x] < 0) speed[y][x] = -speed[y][x];
   
      fill(0, eColor[y][x], 200, 250);
      rect(x*100+25, y*100+25, 100, 100);   
 
      fill(0, eColor[y][x], 50, 177);
      rect(x*100, y*100, 100, 100);    

      fill(0, eColor[y][x], 200, 100);
      rect(x*100-25, y*100-25, 100, 100);    
 
 
      fill(255, eColor[y][x], 50, 127);
      rect(x*100+50, y*100+50, 100, 100);    
    }
  }
}


