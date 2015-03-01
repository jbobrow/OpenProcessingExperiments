
//bubble movement
float bubbleX = 50, bubbleY = 200;
float bubbleXspeed = 2.8, bubbleYspeed = 2.2;
int bubbleXdirection = 1, bubbleYdirection = 1;

//feather movement
float featherX = 0;
float featherY = 0;
float featherSpeed = 1;
int featherXdirection = 1, featherYdirection = 1;

//pup movement
float pupX = 325, pupY = 150, pupSpeed = 2.5;
int pupXdirection = -1, pupYdirection = -1;

void setup()
{
  size(600,600);

//images  
  bg = loadImage("background.jpg");
  pup = loadImage("animal2.png");
  adult = loadImage("animal1.png");
  feather = loadImage("feather.png");
  bubble = loadImage("bubble.jpg");
  
}

void draw()
{
  time = millis()/1000;
  
  //background
  bg.resize(600,600);
  image(bg, 0, 0);

//bubble
if(time>0)
{
  if(time<17.5)
  {
  bubbleX = bubbleX + (bubbleXspeed * bubbleXdirection);
  bubbleY = bubbleY + (bubbleYspeed * bubbleYdirection);
  
  if(bubbleX > width-50 || bubbleX < 0)
  {
    bubbleXdirection *= -1;
  }
  if(bubbleY > height-50 || bubbleY < 0)
  {
    bubbleYdirection *= -1;
  }
  
  bubble.resize(50, 50);
  image(bubble, bubbleX, bubbleY);
}
}

//feather
if(time>4)
{
  featherY = featherY + featherSpeed;
  feather.resize(90, 70);
  image(feather,100 , featherY);
}

//pup
if(time > 6)
{
  if(time < 24)
  {
    pupX = pupX + (pupSpeed * pupXdirection);
    pupY = pupY + (pupSpeed * pupYdirection);
    
    if(pupY > height-60 || pupY <-5)
    {
      pupYdirection *= -1;
    }
    else if(pupX <- 40)
    {
      pupX = 640;
    }
    pup.resize(50, 60);
    image(pup, pupX, pupY);
  }
}

//adult
if(time > 24)
{
  adult.resize(50, 60);
  image(adult, 100, 350);
}
}


  
 
  


