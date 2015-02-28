

float SPEED = 15;
float R = 5;
int NUMBER = 21;
Ball[] balls = new Ball[NUMBER];

void setup(){

  size(500,500);
  frameRate(20);
  background(0);
  
  float angle = TWO_PI / NUMBER;
  for (int i = 0; i < NUMBER; i++){
    float addx = cos(angle*i);
    float addy = sin(angle*i);
    balls[i] = new Ball(
    width / 2 + addx*50,height / 2 + addy*50,
    SPEED*addx + 1,SPEED*addy + 1);
  }
}

void draw(){
  fadeToBlack();
  for (int i = 0; i < NUMBER; i++){
    Ball ball = (Ball)balls[i];
    ball.move();
    ball.draw();
  }
}

class Ball
{
  float x,y;
  float vx,vy;
  
  Ball(
  float _x,float _y,float _vx,float _vy){
      x = _x;
      y = _y;
      vx = _vx;
      vy = _vy;
  }
    
    void move(){
      
      x = x + vx;
      if(x - R <= 0){
        x = R;
        vx*= -1;
      }
      if(x + R >= width){
        x = width - R;
        vx*= -1;
      }
      
      y = y + vy;
      if(y - R <= 0){
        y = R;
        vy*=-1;
      }
      if(y + R >= height){
        y = height - R;
        vy*= -1;  }
    }
    
    void draw(){
      fill(random(100,255),random(100,255),random(100,255),100);
      stroke(random(100,255),random(100,255),0);
      ellipse(x,y,mouseX,mouseY);
    }
   
}

void fadeToBlack(){
  noStroke();
  fill(0,60);
  rectMode(CORNER);
  rect(0,0,width,height);
}


