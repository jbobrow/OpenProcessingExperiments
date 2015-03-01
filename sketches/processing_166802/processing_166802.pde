
float[][] speed = {{5.5, 5, 4.5, 4, 3.5,3,2.5,2,1.5,1,0.5},   
                   {0.5, 1, 1.5, 2, 2.5,3,3.5,4,4.5,5,5.5}};
float[][] g = new float[2][11];
float[][] p = new float[2][11];
float maxSize = 500.0;
float minSize = 1.0;
 
 
void setup() {
  size(500, 500);
  background(0);
  smooth();
  noStroke();
  fill(0);
  
  for(int x = 0; x < 2; x++){   
    for(int y = 0; y < 11; y++){
      g[x][y] = minSize;
    }
  }
   for(int x = 0; x < 2; x++){   
    for(int y = 0; y < 11; y++){
      p[x][y] = maxSize;
    }
  }
}
 
void draw() {
 background(0);
for(int x = 0; x < 1;x++){
 for(int y = 0; y < 11; y++){
  g[x][y] = g[x][y] + speed[x][y];
  if(g[x][y] > maxSize || g[x][y] < minSize) speed[x][y] = -speed[x][y];
  fill(255,100,100,100);
  ellipse(g[x][y], 50*y, 50, 50); 
  fill(100,255,100,100);
  ellipse(50*y, g[x][y], 50, 50);
 }
}

for(int x = 1; x < 2;x++){
 for(int y = 0; y < 11; y++){
  p[x][y] = p[x][y] - speed[x][y];
  if(p[x][y] > maxSize || p[x][y] < minSize) speed[x][y] = -speed[x][y];
  fill(100,100,255,100);
  ellipse(p[x][y], 50*y, 50, 50);
  fill(255,255,100,100);
  ellipse(50*y, p[x][y], 50, 50);  
 }
}

  

}


