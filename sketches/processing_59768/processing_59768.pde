
class nombre{     
  nombre(){
  }
  PFont Font1 = createFont("Arial",30, true);

 void  nombre1(int PX,int PY){
      String modelString = "NIVEL"+n;
      textAlign (CENTER);
      textFont(Font1);
      text(modelString,PX,PY,100);
 }
   PFont Font2 = createFont("Arial",30, true);
     
      void soccer(int A,int B){
      String modelString = "punt:"+N;

      textAlign (CENTER);
      textFont(Font2);
      text(modelString,A,B,12);
  }    
    
};
color col=color(200,50,250);
color foodColor = color(199,150, 120);
float speed = 100;
int n=1;
int N=0    ;
int cx, cy;
int h=12;
int s=11;
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
int windowSize = 500;
boolean gameOver = false;
PFont Font = createFont("Arial",40, true);
PFont fontA;
nombre titulo;
void setup(){
  size(int(windowSize), int(windowSize),P3D);
   
  background(0);
  speed = 100;
  speed=speed/frameRate;
  snakesX = new int[100];
  snakesY = new int[100];
  
  cx = width/2;
  cy = height/2;
  titulo= new nombre();
  snakeX = cx-5;
  snakeY = cy-5;
  foodX = -1;
  foodY = -1;
  gameOver = false;
  check = true;
  snakeSize =1;
  noStroke();
}

void draw(){


  if (h==0){
 reset();
 h=s;
 s--;
 n++;
 }  
  if(speed%h == 0){
      background(0);
    titulo.nombre1(250,100);
    titulo.soccer(70,50);
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
  }else{
      String modelString = "PERDISTE :'(";
      textAlign (CENTER);
      textFont(Font);
      text(modelString,  250,250,120);
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
     snakeSize++;
     N=10+N;
     h--; 
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
   
ellipse(foodX-5, foodY-5, 13, 13);
     
}
void drawSnake(){
  fill(col);
 
  for(int i = 0; i < snakeSize; i++) {
    int X = snakesX[i];
    int Y = snakesY[i];
  ellipse(X-5,Y-5,13,13);
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
  if(keyCode == 'R') {reset();
N=0;
h=12;
s=11;
n=1;
}
}


