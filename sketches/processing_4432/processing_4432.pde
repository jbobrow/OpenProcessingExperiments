
float gravity, gravity2;

float velocity, velocity2;
float x, y, x2, y2;
float bounce, bounce2;
float ballWidth, ballHeight;
float bounceWall, velocityX, bounceWall2, velocityX2;
boolean fire;
int col;




Ball[] balls;

void setup()
{
  size(582,465);
  smooth();
  background(255);
  balls = new Ball[2000];
  colorMode(HSB);
PImage b;
b = loadImage("australia.jpg");
image(b, 0, 0);
  for(int i = 0; i < 2000; i++)
  {

    balls[i] = new Ball(random(0.7, 0.9), random(-10, 10), random(-2, 0), random(0.4, 0.8), width/2, height/2, color(int(random(255)), int(random(255)), int(random(255))), int(random(20, 50)));

  }
}

void draw()
{



  if(fire){
    for(int i = 0; i < 2000; i++)
    {
      balls[i].drawBall();

    }
  }



}

void mouseReleased()
{
  background(255);
  fire = true;
  PImage b;
b = loadImage("australia.jpg");
image(b, 0, 0);
  for(int i = 0; i < 2000; i++)
  
  {
    col = int(random(0, 50));
    balls[i] = new Ball(random(0.5, 0.8), random(-10, 10), random(-30, 0), random(0.4, 0.8),465, 325, color(col, 255, 255), int(random(20, 100)));

  }
}

class Ball
{
  float gravity, velY, velX, bounce;
  float x, y, px, py;
  float ballWidth, ballHeight;
  float bounceWall;
  color col;
  int life;

  Ball(float gravity_, float velX_, float velY_, float bounce_, float x_, float y_, color col_, int life_)
  {
    gravity = gravity_;
    velY = velY_;
    velX = velX_;
    bounce = bounce_;
    ballHeight = 10;
    ballWidth = 10;
    bounceWall = bounce;
    x = x_;
    y = y_;
    px = x_;
    py = y_;
    col = col_;
    life = life_;
  }

  void drawBall()
  {
    velY = velY +gravity;
    y = y + velY;
    x = x + velX;
    if(life > 0)
    {
      stroke(col, life);

      line(px, py, x, y );
      px = x;
      py = y;
      bounce();
      life--;
    }
  }

  void bounce()
  {
    if(y >= height)
    {
      velY = -velY*bounce;
      y = height;
    }
    if(x > width)
    {
      x = width;
      velX = -velX*bounceWall;

    }
    else if(x < 0)
    {
      x = ballWidth/2;
      velX = -velX * bounceWall;
    }

  }

}



