
PImage bar;
PImage ball;
PImage enemy;
PImage landscape;
 
float ballX;
float ballY;
float ballDX = 0;
float ballDY = 1;
float ballS = 40;
float ey = 0;
float ballTimer = 0;
 
float enemyX = 100;
float enemyY = 100;
float enemySpeed = 5;
float enemyHealth = 100;
 
 
void setup()
{
  size(400, 500);
  noStroke();
  imageMode(CENTER);
   
  ballY = 1;
  ballX = width/2;
   
  ball = requestImage("basketball.jpg");
  bar = requestImage("");
  enemy = requestImage("basketball hoop.png");
  landscape = requestImage("");
   
  frameRate(30);
   
}
 
void draw()
{
  background(255);
  image(landscape, 400, 600);
  imageMode(CENTER);
   
  enemyX += enemySpeed;
  if (enemyX > width - 50)
  {
    enemySpeed = -enemySpeed;
  }
  if (enemyX < 50)
  {
    enemySpeed = -enemySpeed;
  }
   
  if (ball.width > 0)
  {
    image(ball, ballX, ballY, 100, 100);
  }
  if (bar.width > 0)
  {
    image(bar, mouseX, 700, 100, 50);
  }
   
  imageMode(CENTER);
  image(enemy, enemyX, enemyY, 100, 100);
   
  if (ballDY < 0 && dist(ballX, ballY, enemyX, enemyY) < 100)
  {
    enemyHealth -= 1;
    println(enemyHealth);
    ballTimer = 6;  
  }
   
  ballTimer += 1 / 30.0;
   
  if (ballTimer > 5 || ballY > height)
  {
    ballX = enemyX;
    ballY = enemyY;
    ballDY = 1.5;
    ballDX = 0;
    ballTimer = 0;
  }
   
  ballX += ballDX;
  ballY += 10 * ballDY;
    
  if (ballX >= width)
  {
    ballDX = ballDX * -1;
  }
    
  if (ballX <= 0)
  {
    ballDX = ballDX * -1;
  }
   
  if (dist(ballX, ballY, mouseX, 700) < 50)
  {
    ballDY = -ballDY;
    ballY = 650;
    ballDX = ((ballX + 50) - (mouseX + 50)) / 10;
  }
     
 
}



