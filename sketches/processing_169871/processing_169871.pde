
//ghost movement
float ghostX = 50, ghostY = 200;
float ghostXspeed = 5.8, ghostYspeed = 4.2;
int ghostXdirection = 1, ghostYdirection = 1;
 
//pumpkin movement
float pumpkinX = 0;
float pumpkinSpeed =4;
int pumpkinXdirection =1, pumpkinYdirection =1;
 
//green movement
float greenX = 325, greenY = 150, greenSpeed = 2.5;
int greenXdirection = -1, greenYdirection = -1;
 
void setup()
{
  size(600,600);
 
//images 
  back = loadImage("background.jpg");
  green = loadImage ("icon1.png");
  devil = loadImage("icon2.png");
  pumpkin = loadImage("icon3.png");
  ghost = loadImage("icon4.png");
   
}
 
void draw()
{
  time = millis()/1000;
   
  //background
  back.resize(600,600);
  image(back, 0, 0);
 
//ghost
if(time>0)
{
  if(time<17.5)
  {
  ghostX = ghostX + (ghostXspeed * ghostXdirection);
  ghostY = ghostY + (ghostYspeed * ghostYdirection);
   
  if(ghostX > width-90 || ghostX < 0)
  {
    ghostXdirection *= -1;
  }
  if(ghostY > height-90 || ghostY < 0)
  {
    ghostYdirection *= -1;
  }
   
  ghost.resize(142,142);
  image(ghost, ghostX, ghostY);
  
}
}
 
//pumpkin
if(time>8)
{
  pumpkinX = pumpkinX + pumpkinSpeed;
  pumpkin.resize(100, 100);
  image(pumpkin,300 , pumpkinX);
}
 
//green
if(time > 10)
{
  if(time < 24)
  {
    greenX = greenX + (greenSpeed * greenXdirection);
    greenY = greenY + (greenSpeed * greenYdirection);
     
    if(greenY > height-60 || greenY <-5)
    {
      greenYdirection *= -1;
    }
    else if(greenX <- 40)
    {
      greenX = 640;
    }
    green.resize(50, 60);
    image(green, greenX, greenY);
  }
}
 
//devil
if(time > 24)
{
  devil.resize(300,200);
  image(devil, 200, 200);
}
}
 
 
// sampled code and helped by Joe


