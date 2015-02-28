
PImage b;
void setup()
{
  size(500,400);
  smooth();
  b = loadImage("space.jpg");
  textSize(32);
}
float ballX = 80;
float ballY = 0;
float speedX = 8;
float speedY = 2;
int score = 0;
int miss = 0;
 
 
void draw()
{
  background(b);
  if(mousePressed){ score = 0; miss = 0;}
   
  float paddle = 1000/(score+10);
  if(ballX < 0 || ballX > width) speedX = -speedX;
  if(ballY > height){
    speedY = -speedY;
    float distance = abs(mouseX-ballX);
    if(distance < paddle) score +=1;
    else miss += 1;
  } else speedY += 1;
   
  ballX += speedX;
  ballY += speedY;
   
  background(b);
  fill(200,50,50);
  ellipse(ballX, ballY, 50, 50);
  fill(50,100,200);
  rect(mouseX-paddle, height-10, 2*paddle, 10);
   
  fill(255);
  text("score: " + score, 10, 30);
  text("miss: " + miss, 10, 60);
   
  if(score>=10)text("You Win!", 200, 200);
  else if(miss>=3)text("You Lose!", 200,200);
}


