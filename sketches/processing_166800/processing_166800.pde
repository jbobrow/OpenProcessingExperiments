
float[][] eSize = new float[4][6];
float[][] speed = {{1.0, 1.5, 2.0, 2.0, 1.5, 1.0},
                   {1.0, 1.5, 2.0, 2.0, 1.5, 1.0},
                   {1.0, 1.5, 2.0, 2.0, 1.5, 1.0},
                   {1.0, 1.5, 2.0, 2.0, 1.5, 1.0}};
int[][] cColor ={{50, 55, 60, 65, 70, 75},
                   {100, 105, 110, 115, 120, 125},
                   {150, 155, 160, 165, 170, 175},
                    {200, 205, 210, 215, 220, 225}};
              


  
float minSize = 1.0;     
float maxSize = 100.0; 
 
 
void setup() {
  size(500, 500);
  frameRate(14);
  background(204, 255, 255);
  smooth();
  noStroke();
  fill(0);
  for(int y = 0; y < 4; y ++){
    for(int x = 0; x < 6; x ++){
      eSize[y][x] = minSize;
    }
  }
}
 void draw(){
   background(204, 255, 255);
   translate(width/2, height/2);
   for(int y = 0; y < 4; y ++){
    for(int x = 0; x < 6; x ++){
      eSize[y][x] += speed[y][x];
      if(eSize[y][x] > maxSize || eSize[y][x] < minSize) speed[y][x] = -speed[y][x];
      fill(0, cColor[y][x], 255, 127);
      rotate(radians(frameCount));
      ellipse(13*x+100, 13*y+100, eSize[y][x], eSize[y][x]);
    }
   }
 }
 


