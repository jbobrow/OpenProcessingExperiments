
void setup()
{
  size(600, 400);
}

float ballX = 200;
float ballY = 100;
float speedX = 10; // 1 = training 5 = easy 10 = medium 15 = hard
float speedY = 1;
int hit = 0;
int miss = 0;


void draw()
{
  if (mousePressed) { 
    hit = 0; 
    miss = 0;
  }

  float paddle = 1000/(hit+10);
  if (ballX < 0 || ballX > width) speedX = -speedX;
  if (ballY > height)
  { 
    speedY = -speedY;
    float distance = abs(mouseX - ballX);
    if (distance < paddle) hit += 1;
    else miss += 1;
  } 
  else speedY += 1;

  ballX+= speedX;
  ballY+= speedY;

  background(200, 200, 50);
  fill(150, 900, 50);
  ellipse(ballX, ballY, 50, 50);
  fill(10, 200, 50);
  rect(mouseX-paddle, height-10, 2*paddle, 10);

  fill(0);
  text("hit: " + hit, 10, 20);
  text ("miss: " + miss, 10, 40);
}



