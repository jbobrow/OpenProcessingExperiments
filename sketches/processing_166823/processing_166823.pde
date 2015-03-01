
float[][] eColor = new float[5][5];
float[][] speed = {{1.7, 1.0, 0.6, 2.3, 0.8}
                     ,
                     {1.1, 2.4, 1.9, 0.3, 2.2}
                     ,
                     {2.0, 0.9, 2.9, 1.5, 3.3}
                     ,
                     {1.0, 0.6, 1.7, 1.2, 2.5}
                     ,
                     {3.5, 2.3, 1.3, 2.7, 0.4}};

void setup(){
  size(500, 500);
  background(255);
  smooth();
  noStroke();
  frameRate(60);
  fill(0);
}

void draw(){
  background(255);
  
  for(int y = 0; y < 5; y ++){
    for(int x = 0; x < 5; x ++){
      
      eColor[y][x] += speed[y][x]*10;
      
      if(eColor[y][x] > 255 || eColor[y][x] < 0){
        speed[y][x] = -speed[y][x];
      }
      
      fill(0, eColor[y][x], eColor[y][x]);
      rect(x*100, y*100, 100, 100);
      
      fill(eColor[y][x], 255, 0, 127);
      ellipse(x*100+50, y*100+50, 100, 100);
      
      fill(0, eColor[y][x], 255, 100);
      rect(x*100+25, y*100+25, 50, 50);
      
      
    }
  }
}


