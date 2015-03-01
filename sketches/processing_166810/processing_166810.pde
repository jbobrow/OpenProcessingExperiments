
float[][]eColor = new float[3][6];
float[][]speed = {{2.0, 1.8, 1.6, 1.4, 1.2, 1.0},
                  {2.2, 2.0, 1.8, 1.6, 1.4, 1.2},
                  {2.4, 2.2, 2.0, 1.8, 1.6, 1.4}};

void setup(){
  size(500,500);
  smooth();
  noStroke();
  fill(0);
  
  for(int y = 0;y < 3;y++){
    for(int x = 0;x < 6; x++){
      eColor[y][x] = 0;
    }
  }
}

void draw(){
  background(255);
  for(int y = 0;y < 3;y++){
    for(int x = 0;x < 6; x++){
       eColor[y][x] +=  speed[y][x];
       
       if (eColor[y][x] > 255 || eColor[y][x] < 0) speed[y][x] = -speed[y][x];
       
       fill(0, eColor[y][x], 255, 175);
       triangle(0+100*x, 84+168*y, 50+100*x, 0+168*y, -50+100*x, 0+168*y);
       
       fill(0, eColor[y][x], 255, 200);
       triangle(50+100*x, 168+168*y, 100+100*x, 84+168*y, 0+100*x, 84+168*y);
       
       fill(0, eColor[y][x], 255, 225);
       triangle(50+100*x, 0+168*y, 100+100*x, 84+168*y, 0+100*x, 84+168*y);
       
       fill(0, eColor[y][x], 255, 250);
       triangle(0+100*x, 84+168*y, 50+100*x, 168+168*y, -50+100*x, 168+168*y);
       
       
    }
  }
}


