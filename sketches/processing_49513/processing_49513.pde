
boolean gameOver = false;

void setup ()
{
  size (600, 400);
}

float ballX = 200;
float ballY = 100;
float speedX = 10;
float speedY = 2;
int hit = 0;
int miss = 0;

void draw ()
{
  if (gameOver) {
    textAlign (CENTER);
    fill(255);
    text ("GAME OVER", width/2, height/2);
    
  }
  else 

      if (mousePressed) { 
      hit = 0; 
      miss = 0;
    }
  float paddle = 1000/ (hit+10);
  if (ballX < 0 || ballX > width) speedX = -speedX;
  if (ballY > height) {
    speedY = -speedY;
    float distance = abs (mouseX - ballX);
    if (distance < paddle) hit +=1;
    else miss += 1;
  } 
  else speedY += 1;

  speedY += 1;

  ballX += speedX;
  ballY += speedY;

  background (139, 216, 229);
  fill (240, 174, 223);
  ellipse (ballX, ballY, 50, 50);
  fill (80, 37, 17);
  rect (mouseX-100, height-10, 200, 10);

  text ("hit: " + hit, 10, 20);
  text ("miss: " + miss, 10, 40);
}


