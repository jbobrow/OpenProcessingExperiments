
float mouthSize = (50*PI)/180;
float pacX, pacY, velocity;
boolean mouthOpen;
int point = 1;

void setup()
{
  size(750, 750);
  
  pacX = 100;
  pacY = height/2;
  
  velocity = 5;
}

void draw()
{
  if(dist(mouseX, mouseY, pacX, pacY)<10)
    println("You Win");

  background(0);
  

  //10 dots
  for(int i = 0; i<=750; i+=750/10)
  {
    stroke(255);
    strokeWeight(10);
    if(i>pacX || pacY == height/2)
      point(i, height/2);
    
  }
  
  //pacX+=velocity;
  //fully open
  if(mouthSize >= (50*PI)/180)
    mouthOpen = true;

  //fully closed
  if(mouthSize <= 0)
    mouthOpen = false;

  //opening and closing of a mouth
  if(mouthOpen)
    mouthSize -= 5*PI/180;
  else
    mouthSize += 5*PI/180;
  
  //sets back at begginning of screen
  if(pacX>=850)
    pacX = -100;
  
  fill(255, 255, 0);
  stroke(0);
  arc(pacX, pacY, 120, 120, mouthSize, 2*PI - mouthSize);
}

void keyPressed() 
{
  if(key == 'd')
    pacX += 10;
  if(key == 'w')
    pacY -= 10;
  if(key == 's')
    pacY += 10;
  if(key == 'a')
    pacX -= 10;
}
