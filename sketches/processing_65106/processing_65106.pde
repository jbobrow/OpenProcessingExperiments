
Ball myBall;
Ball myBall2;
PImage man;
 
int NUM_BALLS = 6000;
 
Ball[] myBalls = new Ball[NUM_BALLS];
color[] myColors = {#5389BF, #3D5E7E, #2F475D};
 
 
void setup()
{
  size(600, 600);
  smooth();
  noStroke();
  frameRate(80);
  imageMode(CENTER);
  man= loadImage("man.png");
 
    for (int i = 0; i<NUM_BALLS; i++)
  {
    myBalls[i] = new Ball();
    myBalls[i].posX = random(0, width);
    myBalls[i].posY = random(0, height);
    myBalls[i].speedY = random(2, 10);
    myBalls[i].myColor = myColors[i % 3];
 
  }
}
 
void draw()
{
  background(0, 0, 0, 200);
  image (man , width/2,height/2 , 700 , height);
    for (int i = 0; i<NUM_BALLS; i++)
  {
 
    myBalls[i].update();
  }
 
}
 
class Ball
{
  //properties
  int myDiameter = 2;
  float posX = 250;
  float posY = 0;
  float speedX = 0;
  float speedY = 1;
  color myColor = #5389BF;
 
  void update() {
    fill(myColor);
    ellipse(posX, posY, myDiameter, myDiameter);
    if (posY > height)
    {
 
      speedY *= -1;
      speedX = random(-3, 3);
    }
    if ((posY < (height - 40+(speedY * 10))) && (speedY < 0))
    {
      posY = 0;
      speedY = random(4, 10);
      speedX = 0;
    }
    posX += speedX;
    posY += speedY;
  }
}


