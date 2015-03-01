
float ballX = 20;
float ballY = 20;
float speedX = 2;
float speedY = 0;
int hit = 0;
int miss = 0;
int level = 1;
void setup() {
  size(500,600);
}
void draw() {
  
  float paddle = 50;
  if(ballX < 0 || ballX > width) speedX = -speedX;
  if(ballY > height) {
    speedY = -speedY;
    float distance = abs(mouseX - ballX);
    if (distance < paddle) hit += 1;
    else miss += 1;
  } else speedY += 1;
  ballX += speedX;
  ballY += speedY;
  
  if (level = 1)
  {
      background(150,150,0);
      fill(200,100,50);
      ellipse(ballX,ballY,50,50);
     
  }
  
 
  
 
  
  rect(mouseX-paddle,height-10,2*paddle,50);

text ("hit: " + hit, 10, 20);
text ("miss: " + miss, 10, 40);
text ("Press 'space' to start new game", 300, 20);
text ("Level: " +level, 300, 40);
}﻿
void keyPressed()
{
  if(key == ' ')
  {
    hit=0;
    miss=0; 
  }
  if (key == 'LEFT')
  {
 
  }
  if (key == 'RIGHT')
  {
  
  } 
}
