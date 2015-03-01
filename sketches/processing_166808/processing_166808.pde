
float[][] eColor = new float[4][5];  
float[][] speed = {{1.5, 2.5, 9.0, 7.2, 10.9}, 
                   {0.5, 2.0, 5.0, 4.0, 10.0}, 
                   {1.5, 10.0, 7.0, 1.0, 0.5},
                   {0.7, 5.0, 8.0, 1.0, 12.0}}; 
                   
void setup() {
  size(400, 300);
  background(255);
  smooth();
  noStroke();
  fill(0);
  rectMode(CENTER);
 
  for (int y = 0; y < 4; y ++) {
    for (int x = 0; x < 5; x ++) {
      eColor[y][x] = 0;  
    }
  }
}
 
void draw() {
  background(255);
 
  for (int y = 0; y < 4; y ++) {
 
    for (int x = 0; x < 5; x ++) {
      
      eColor[y][x] += speed[y][x];  
      
      if (eColor[y][x] > 255 || eColor[y][x] < 0) speed[y][x] = -speed[y][x];
 
      fill(eColor[y][x], 200, 0, 100);
      rect(x*100, y*100, 100, 100);   
      rect(x*100, y*100, 50, 50); 
      
      fill(eColor[y][x], 0, 200, 100);
      rect(x*100, y*100, 75, 75); 
      rect(x*100, y*100, 25, 25); 
    }
  }
}


