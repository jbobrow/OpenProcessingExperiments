
float[][] eColor = new float[5][5];    
float[][] speed = {{1,0.5,1,0.5,1}, 
                   {0.5,1,0.5,1,0.5}, 
                   {1,0.5,1,0.5,1},
                   {0.5,1,0.5,1,0.5}, 
                   {1,0.5,1,0.5,1}};    
 
void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
  fill(82,162,197,50);
 
  for (int y = 0; y < 5; y ++) {
    for (int x = 0; x < 5; x ++) {
      eColor[y][x] = 0;    
    }
  }
}
 
void draw() {
  background(255);

  
  fill(67,  135,  233, 30);
  ellipse(200,200,200,200);
  ellipse(200,200,300,300);
  ellipse(200,200,400,400);
  ellipse(200,200,500,500);
  ellipse(200,200,600,600);

 
  for (int y = 0; y < 5; y ++) {
    for (int x = 0; x < 5; x ++) {
      eColor[y][x] += speed[y][x]; 
      if (eColor[y][x] > 100 || eColor[y][x] < 0) speed[y][x] = -speed[y][x];
      fill(0,eColor[y][x], eColor[y][x], 40);
      ellipse(x*100, y*100, 100, 100);    
    }
  }

 
}


