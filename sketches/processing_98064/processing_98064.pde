
int numberBalls = 500;
int numberSnow = 700;
Ball[] myBalls = new Ball[numberBalls];
Ball[] backsnow = new Ball[numberSnow];
void setup()
{
  size(700, 600);
  smooth();
  noStroke();
 for(int i = 0; i<numberSnow; i++)
{ 
  backsnow[i] = new Ball();
   backsnow[i].myDiameter = 4;
   backsnow[i].posX = random(0, width);
   backsnow[i].posY = random(0, height);
   backsnow[i].speedX = random(0, .7);
   backsnow[i].speedY = random(2, 3);
   backsnow[i].r = random(80, 150);
 }

 for(int i =0; i<numberBalls; i++)
 {
   myBalls[i] = new Ball();
   myBalls[i].myDiameter = 4;
   myBalls[i].posX = random(0, width);
   myBalls[i].posY = random(0, height);
   myBalls[i].speedX = random(0, 4);
   myBalls[i].speedY = random(1, 3);
   myBalls[i].r = random(140, 255);
   myBalls[i].a = 300;
 }
}
void draw()
{
  background(10);
  for(int i =0; i<numberBalls; i++)
 {

   myBalls[i].update();
   backsnow[i].update();
 }
}

class Ball 
{

  int myDiameter = 10;
  float r = 255;
  float g = 255;
  float b = 255;
  float a = 110;
  float posX = 250; 
  float posY = 250;
  float speedX = 5; 
  float speedY = 2;
  void update()
  {

  fill(r, a);
  ellipse(posX, posY, myDiameter, myDiameter);
  posX+= speedX;
  posY+= speedY;
  if(posX > width)
  posX = 0;
  if(posX < 0)
  posX= width;
  if(posY > height)
  posY = 0;
  if(posY < 0)
  posY = height;
  if(speedY < 2)
  {

  myDiameter = 3;
  r = 150;
  }

  if(speedY < 1.5)
  {

  myDiameter = 2;
  r = 100;
  }

  if(speedY < 1.2)
  {

  myDiameter = 1;
  r = 80;
  }
 }
}


