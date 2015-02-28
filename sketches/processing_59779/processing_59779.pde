


import geomerative.*;
color col=color(255);
color foodColor = color(255,6,6);
float speed = 100;
int cx, cy; 
int moveX = 0;
int moveY = 0;
int snakeX = 0;
int snakeY = 0;
int foodX = -1;
int foodY = -1;
boolean check = true;
int []snakesX;
int []snakesY;
int snakeSize = 1;
boolean gameOver = false;
PFont Font = createFont("Arial",40, true);
int windowSize = 340;
int pixelSize=2;
PGraphics pg;

void setup(){
  noSmooth();
size(int(windowSize), int(windowSize),P3D);
speed = 100;
  speed=speed/frameRate;
  snakesX = new int[100];
  snakesY = new int[100];
  cx = width/2;
  cy = height/2;
  snakeX = cx-5;
  snakeY = cy-5;
  foodX = -1;
  foodY = -1;
  gameOver = false;
  check = true;
  snakeSize =1;
  pg = createGraphics(160, 90, P2D);
  colorMode(HSB);
  noSmooth();
}

int xpos=20,ypos=20;
void draw(){
  
if(speed%10 == 0){
float  xc = 25;
  int timeDisplacement = frameCount;
  float calculation1 = sin( radians(timeDisplacement * 0.61655617));
  float calculation2 = sin( radians(timeDisplacement * -3.6352262));
   pg.beginDraw();
  pg.loadPixels();

  for (int x = 0; x < pg.width; x++, xc += pixelSize)
  {
    float  yc    = 25;
    float s1 = 128 + 128 * sin(radians(xc) * calculation1 );

    for (int y = 0; y < pg.height; y++, yc += pixelSize)
    {
      float s2 = 128 + 128 * sin(radians(yc) * calculation2 );
      float s3 = 128 + 128 * sin(radians((xc + yc + timeDisplacement * 5) / 2));  
      float s  = (s1+ s2 + s3) / 3;
      pg.pixels[x+y*pg.width] = color(s, 255 - s / 2.0, 255);
    }
  }   
  pg.updatePixels();
  pg.endDraw();
  image(pg,0,0,width,height); 

     laberinto();
    muros();
    runGame();
    
  }
  speed++;
  
 }
 
 void reset(){
  snakeX = cx-5;
  snakeY = cy-5;
  gameOver = false;
  check = true;
  snakeSize =1;
  moveY = 0;
  moveX = 0;
}
void runGame(){
  if(gameOver== false){
   drawfood();
    drawSnake();
    snakeMove();
    ateFood();
    checkHitSelf();
  }
  
}
 
void checkHitSelf(){
   for(int i = 1; i < snakeSize; i++){
       if(snakeX == snakesX[i] && snakeY== snakesY[i]){
          gameOver = true;
      }
   } 
}
void ateFood(){
  if(foodX == snakeX && foodY == snakeY){
     check = true;
     
  }
}
void drawfood(){
  fill(foodColor);
  while(check){
    int x = (int)random(1,windowSize/10);
    int y =  (int)random(1,windowSize/10);
    foodX = 5+x*10;
    foodY = 5+y*10;
     
    for(int i = 0; i < snakeSize; i++){
       if(x == snakesX[i] && y == snakesY[i]){
         check = true;
         i = snakeSize;
       }else{
         check = false;
       }
    }
     
  }
   
ellipse(foodX-5, foodY-5, 10, 10);
     
}
void drawSnake(){
  fill(col);
 
  for(int i = 0; i < snakeSize; i++) {
    int X = snakesX[i];
    int Y = snakesY[i];
  ellipse(X-5,Y-5,10,10);
  }
   
  for(int i = snakeSize; i > 0; i--){
    snakesX[i] = snakesX[i-1];
    snakesY[i] = snakesY[i-1];
  }
}
 
void snakeMove(){
  snakeX += moveX;
  snakeY += moveY;
  if(snakeX > windowSize-5 || snakeX < 5||snakeY > windowSize-5||snakeY < 5){
     gameOver = true;
  }
  snakesX[0] = snakeX;
  snakesY[0] = snakeY;
   
}
  
void keyPressed() {
  if(keyCode == UP) {  if(snakesY[1] != snakesY[0]-10){moveY = -10; moveX = 0;}}
  if(keyCode == DOWN) {  if(snakesY[1] != snakesY[0]+10){moveY = 10; moveX = 0;}}
  if(keyCode == LEFT) { if(snakesX[1] != snakesX[0]-10){moveX = -10; moveY = 0;}}
  if(keyCode == RIGHT) { if(snakesX[1] != snakesX[0]+10){moveX = 10; moveY = 0;}}
  if(keyCode == 'R') {reset();}
}

void laberinto(){
strokeWeight(2.2);
noFill();
//fila 2
rect(25,25,20,20);rect(65,25,20,20);rect(85,25,20,20);
rect(105,25,20,20);rect(125,25,20,20);rect(205,25,20,20);
rect(265,25,20,20);
//fila 3
rect(25,45,20,20);rect(65,45,20,20);rect(125,45,20,20);
rect(145,45,20,20);rect(165,45,20,20);rect(185,45,20,20);
rect(205,45,20,20);rect(225,45,20,20);rect(245,45,20,20);
rect(265,45,20,20);
//fila 4
rect(25,65,20,20);rect(65,65,20,20);rect(85,65,20,20);
rect(125,65,20,20);rect(265,65,20,20);
//fila 5
rect(25,85,20,20);rect(85,85,20,20);rect(125,85,20,20);
rect(165,85,20,20);rect(185,85,20,20);rect(225,85,20,20);
rect(205,85,20,20);rect(245,85,20,20);rect(265,85,20,20);
//fila 6
rect(25,105,20,20);rect(45,105,20,20);rect(65,105,20,20);
rect(85,105,20,20);rect(105,105,20,20);rect(125,105,20,20);
rect(165,105,20,20);rect(205,105,20,20);rect(245,105,20,20);
//fila 7
rect(25,125,20,20);rect(125,125,20,20);rect(165,125,20,20);
rect(205,125,20,20);rect(245,125,20,20);
//fila 8
rect(25,145,20,20);rect(65,145,20,20);rect(85,145,20,20);
rect(105,145,20,20);rect(125,145,20,20);rect(165,145,20,20);
rect(205,145,20,20);rect(245,145,20,20);rect(145,145,20,20);
//fila 9
rect(25,165,20,20);rect(65,165,20,20);rect(125,165,20,20);
rect(165,165,20,20);rect(245,165,20,20);rect(205,165,20,20);
//fila 10
rect(25,185,20,20);rect(45,185,20,20);rect(65,185,20,20);
rect(105,185,20,20);rect(125,185,20,20);rect(165,185,20,20);
rect(205,185,20,20);rect(245,185,20,20);rect(265,185,20,20);
//fila 11
rect(65,205,20,20);rect(125,205,20,20);
rect(145,205,20,20);rect(165,205,20,20);rect(205,205,20,20);
rect(225,205,20,20);rect(245,205,20,20);rect(265,205,20,20);
//fila 12
rect(45,225,20,20);rect(65,225,20,20);rect(85,225,20,20);
rect(105,225,20,20);rect(125,225,20,20);rect(225,225,20,20);
rect(265,225,20,20);
//fila 13
rect(45,245,20,20);rect(125,245,20,20);rect(145,245,20,20);
rect(165,245,20,20);rect(185,245,20,20);rect(205,245,20,20);
rect(225,245,20,20);rect(265,245,20,20);
//fila 14
rect(25,265,20,20);rect(45,265,20,20);rect(65,265,20,20);
rect(85,265,20,20);rect(125,265,20,20);rect(225,265,20,20);
rect(265,265,20,20);
//fila 15
rect(25,285,20,20);rect(85,285,20,20);rect(105,285,20,20);
rect(125,285,20,20);rect(145,285,20,20);rect(165,285,20,20);
rect(185,285,20,20);rect(205,285,20,20);rect(225,285,20,20);
rect(245,285,20,20);rect(265,285,20,20);
//los muros


};
void muros(){
fill(50,205,50);
//ultimo de cada fila
rect(285,5,20,20);rect(285,25,20,20);rect(285,45,20,20);
rect(285,65,20,20);rect(285,85,20,20);rect(285,105,20,20);
rect(285,125,20,20);rect(285,145,20,20);rect(285,165,20,20);
rect(285,185,20,20);rect(285,205,20,20);rect(285,225,20,20);
rect(285,245,20,20);rect(285,265,20,20);rect(285,285,20,20);
//primera fila
rect(5,5,20,20);rect(25,5,20,20);rect(45,5,20,20);
rect(65,5,20,20);rect(85,5,20,20);rect(105,5,20,20);
rect(125,5,20,20);rect(145,5,20,20);rect(165,5,20,20);
rect(185,5,20,20);rect(225,5,20,20);rect(245,5,20,20);
rect(265,5,20,20);rect(285,5,20,20);rect(205,5,20,20);
//ultima fila
rect(5,305,20,20);rect(25,305,20,20);rect(45,305,20,20);
rect(65,305,20,20);rect(105,305,20,20);rect(125,305,20,20);
rect(145,305,20,20);rect(165,305,20,20);rect(185,305,20,20);
rect(205,305,20,20);rect(225,305,20,20);rect(245,305,20,20);
rect(265,305,20,20);rect(285,305,20,20);rect(85,305,20,20);

//primero de cada fila
rect(5,25,20,20);rect(5,45,20,20);rect(5,65,20,20);
rect(5,85,20,20);rect(5,105,20,20);rect(5,125,20,20);
rect(5,145,20,20);rect(5,165,20,20);rect(5,185,20,20);
rect(5,205,20,20);rect(5,225,20,20);rect(5,245,20,20);
rect(5,265,20,20);rect(5,285,20,20);
//los bloques
//bloque 1
rect(45,25,20,20);rect(45,45,20,20);rect(45,65,20,20);
rect(45,85,20,20);rect(65,85,20,20);
//bloque 2
rect(85,45,20,20);rect(105,45,20,20);rect(105,65,20,20);
rect(105,85,20,20);
//bloque 3
rect(45,125,20,20);rect(65,125,20,20);rect(85,125,20,20);
rect(105,125,20,20);rect(45,145,20,20);rect(45,165,20,20);
//bloque 4 
rect(85,165,20,20);rect(85,185,20,20);rect(85,205,20,20);
rect(105,205,20,20);
//bloque 5
rect(25,205,20,20);rect(45,205,20,20);rect(25,225,20,20);
rect(25,245,20,20);
//bloque 6
rect(65,285,20,20);rect(45,285,20,20);
//bloque 7
rect(65,245,20,20);rect(85,245,20,20);rect(105,245,20,20);
rect(105,265,20,20);rect(105,165,20,20);
//bloque 8
rect(165,265,20,20);rect(185,265,20,20);
rect(205,265,20,20);
//bloque 9
rect(245,265,20,20);rect(245,245,20,20);rect(245,225,20,20);
//bloque 10
rect(225,185,20,20);rect(225,165,20,20);rect(225,145,20,20);
rect(225,125,20,20);rect(225,105,20,20);
//bloque 11
rect(265,165,20,20);rect(265,145,20,20);rect(265,125,20,20);
rect(265,105,20,20);
//bloque 12
rect(145,225,20,20);rect(165,225,20,20);rect(185,225,20,20);
rect(205,225,20,20);rect(185,205,20,20);rect(185,185,20,20);
rect(185,165,20,20);rect(185,145,20,20);rect(185,125,20,20);
rect(185,105,20,20);
//bloque 13
rect(225,25,20,20);rect(245,25,20,20);
//bloque 14
rect(145,185,20,20);rect(145,165,20,20);
rect(145,125,20,20);rect(145,105,20,20);rect(145,85,20,20);
rect(145,65,20,20);rect(165,65,20,20);rect(185,65,20,20);
rect(205,65,20,20);rect(225,65,20,20);rect(185,45,20,20);
rect(185,25,20,20);rect(145,25,20,20);rect(165,25,20,20);
rect(245,65,20,20);
}

      



;



