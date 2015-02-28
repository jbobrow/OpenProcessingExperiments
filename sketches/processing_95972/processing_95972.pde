
float paddlewidth=10;
float paddleheight=40;
float ballx;
float bally;
float ballsize = 10;
int score1 = 0;
int score2 = 0;
class Paddle{
  float x;
  float y;
  float direction;
 Paddle(float initx){
  x= initx;
  y= height /2;
  direction = 0;
 }
 void draw(){
    rect(x,y,paddlewidth,paddleheight);
 }
 void move(){
   y = y + direction;
   //&& = and, || = or
   if(y <40){
    y = y - direction;
   }else if (y > height-40){
     y = y -dircetion;
   }
 }
}

Paddle paddle1;
Paddle paddle2;
void setup(){
  size(400,400);
  paddle1 = new Paddle(20);
  paddle2 = new Paddle( width - 20);
  ballx = width /2;
  bally = height/2;
}
void draw(){
  noStroke();
  background(0);
  rectMode(CENTER);
  //Net
  for(int i= 0;i < height; i +=10){
    rect(width/2, i , 1, 5);
  }
  paddle1.draw();
  paddle2.draw();
  paddle1.move();
  paddle2.move();
  //Ball
  rect(ballx,bally,ballsize,ballsize);
  //Score
  textSize(80);
  textAlign(CENTER);
  text(score1,width /4, 80);
  text(score2,width*3/4,80);
}
void keyPressed(){
  if (key == 'a'){
    println("player 1 start moving up");
    paddle1.direction = -5;
  }else if (key == 'z'){
    println("player 1 start moving down");
    paddle1.direction = 5;
  }else if (key == ';'){
    println("player 2 start moving up");
    paddle2.direction = -5;
  }else if (key == '.'){
    println("player 2 start moving down");
    paddle2.direction = 5;
  }
} 
void keyReleased(){
    if (key == 'a'){
    println("player 1 stop moving");
    paddle1.direction = 0;
  }else if (key == 'z'){
    println("player 1 stop moving");
    paddle1.direction = 0;
  }else if (key == ';'){
    println("player 2 stop moving");
    paddle2.direction = 0;
  }else if (key == '.'){
    println("player 2 stop moving");
    paddle2.direction = 0;
  }
}
