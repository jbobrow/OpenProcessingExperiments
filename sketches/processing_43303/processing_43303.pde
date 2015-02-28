
int Tpx=20;
int[] snakePosX = new int[2];
int[] snakePosY = new int[2];
int[] snakeDir = new int[2];
int[] applePos = new int[2];

void setup(){
  size(500,400,P3D);
  background(203);
  stroke(200);
  frameRate(6);
  for(int i=Tpx; i < width; i+=Tpx){
    line(i,0,i,height);
  }
  for(int i=Tpx; i < height; i+=Tpx){
    line(0,i,width,i);
  }
  
  snakePosX[0] = width/(2*Tpx);
  snakePosY[0] = height/(2*Tpx);
  snakeDir[0] = -1;
  snakeDir[1] = 0;
  newApple();
}
void draw(){
  background(203);

  // Delete px
  snakePosX = shorten(snakePosX);
  snakePosY = shorten(snakePosY);

  // New px 
  snakePosX = splice(snakePosX, snakePosX[0] + snakeDir[0], 0);
  if (snakePosX[0] == width/Tpx) snakePosX[0] = 0; 
  else if (snakePosX[0] < 0) snakePosX[0] = width/Tpx;
  
  snakePosY = splice(snakePosY, snakePosY[0] + snakeDir[1], 0);
  if (snakePosY[0] == height/Tpx) snakePosY[0] = 0; 
  else if (snakePosY[0] < 0) snakePosY[0] = height/Tpx;
  
  drawPixel(applePos[0], applePos[1], color(200, 0, 0, 200));
  drawPixel(snakePosX[0],snakePosY[0], color(100));
    
  for(int i=1; i < snakePosX.length; i++){
    drawPixel(snakePosX[i],snakePosY[i], color(100));
    // How to loose
    if ( snakePosX[0] == snakePosX[i] & snakePosY[0] == snakePosY[i]){
      noLoop();
    }
  }
  
  // Eat apple
  if ( snakePosX[0] == applePos[0] & snakePosY[0] == applePos[1]){
    newApple();
  }
  
  
}
void drawPixel(int x,int y, color col){
  pushMatrix();
  fill(col);
  stroke(0);
  translate(Tpx*x+1,Tpx*y+1);
  //rect(Tpx*x+1,Tpx*y+1,Tpx-1,Tpx-1);
  //rect(0,0,Tpx-1,Tpx-1);
  box(Tpx-1);
  popMatrix(); 
}
void keyPressed()
  {
   if (keyCode == UP)   {
    snakeDir[1] = -1;
    snakeDir[0] = 0;
  } else if (keyCode == DOWN) {
    snakeDir[1] = 1;
    snakeDir[0] = 0;
  } else if (keyCode == LEFT) {
    snakeDir[0] = -1;
    snakeDir[1] = 0;
  } else if (keyCode == RIGHT) {
    snakeDir[0] = 1;
    snakeDir[1] = 0;
  }
}
void newApple(){
  applePos[0] = int(random(1, width/Tpx-1));
  applePos[1] = int(random(1, height/Tpx-1));
  snakePosX = expand(snakePosX, snakePosX.length+1);
  snakePosY = expand(snakePosY, snakePosY.length+1);
}

