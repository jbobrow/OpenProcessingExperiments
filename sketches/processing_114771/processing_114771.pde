
//Story
//30 primitives
//10 loops
//changes in foreground and background

int timer, colorTimer, colorTimer2, colorTimer3, morphColor;
boolean stage1, stage2, stage3, backgroundChange, fireworks, sunMode;
int playerX, playerY, blueX, blueY, sunX, sunY, color1, color2;
float squareFactor, circleFactor;

void setup()
{
  size(600, 600);
  
  timer = 0; colorTimer = 0; colorTimer2 = 0; colorTimer3 = 0;
  stage1 = true; stage2 = false; stage3 = false; backgroundChange = false;
  fireworks = false; sunMode = false;
  playerX = 315; playerY = 395; blueX = 435; blueY = 335;
  morphColor = 116; sunX = 500; sunY = 230; color1 = 216; color2 = 298;
  squareFactor = 1.0; circleFactor = 0.0;
}

void draw()
{
  //SKY CODE
  timer++;
  colorMode(HSB, 360);
  
  sunY = (int)(0.005*pow(sunX - 300, 2));
  if(timer%8 == 0)
  {
    sunX--;
  }
  
  if(stage1)
  {
    if(timer % 2 == 0)
    {
      colorTimer++;
    }
    
    fill(216, 280, colorTimer);
  }
  
  if(stage2)
  {
    if(timer % 4 == 0)
    {
      colorTimer--;
    }
    
    fill(216, colorTimer, 352);
  }
  
  if(stage3)
  {
    if(timer % 5 == 0)
    {
      colorTimer--;
      colorTimer3++;
    }
    
    if(timer % 7 == 0)
    {
      colorTimer2--;
    }
    
    fill(colorTimer2, colorTimer3, colorTimer);
  }
  
  rect(300, 100, 601, 200);
  
  if(stage1 && colorTimer >= 352)
  {
    stage1 = false;
    stage2 = true;
    colorTimer = 280;
  }
  
  if(stage2 && colorTimer <= 0)
  {
    stage2 = false;
    stage3 = true;
    colorTimer = 352;
    colorTimer2 = 48;
  }
  
  if(stage3 && colorTimer <= 0 && colorTimer2 <= 0)
  {
    stage3 = false;
    stage1 = true;
    sunX = 500;
    sunY = 220;
    colorTimer = 0;
    colorTimer3 = 0;
  }
  
  if(sunMode)
  {
    fill(62, 324, 360);
    rect(sunX, sunY, 30, 30);
  }
  
  
  //BACKGROUND
  rectMode(CORNER);
  stroke(0);
  if(!backgroundChange)
  {
    fill(#BCBCBC);
  }
  
  else
  {
    fill(#763668);
  }
  backgroundChange = false;
  rect(0, 200, 600, 400);
  for(int x = 0; x < 600; x += 30)
  {
    line(x, 200, x, height);
  }
    
  for(int y = 200; y < 600; y += 30)
  {
    line(0, y, width, y);
  }
  
  
  
  
  //PLAY CODE
  rectMode(CENTER);
  if(isContacting(playerX, playerY, 585, 575))
  {
    fill(#BCBCBC);
    rect(585, 575, 30, 30);
  }
  
  else
  {
    fill(0);
    rect(585, 575, 30, 30);
  }
  
  fill(0);
  rect(playerX, playerY, 30, 30);
  
  fill(41, 331, 349);
  rect(135, 455, 30, 30);
  if(isContacting(playerX, playerY, 135, 455))
  {
    fill(0);
    line(130, 450, 130, 445);
    line(140, 450, 140, 445);
    bezier(125, 455, 130, 463, 140, 463, 145, 455);
  }
  
  fill(312, 216, 216);
  
  rect(405, 545, 30, 30);
  if(isContacting(playerX, playerY, 405, 545))
  {
    backgroundChange = true;
  }
  
  if(!isContacting(playerX, playerY, 225, 575))
  {
    fill(116, 311, 154);
    rect(225, 575, 30, 30);
  }
  
  else
  {
    morphColor++;
    fill(morphColor%360, 311, 154);
    rect(225, 575, 30, 30);
  }
  
  fill(234, 337, 187);
  rect(blueX, blueY, 30, 30);
  if(isContacting(playerX, playerY, blueX, blueY))
  {
    if(playerX - blueX > 0)
    {
      blueX -= 30;
    }
    
    if(playerX - blueX < 0)
    {
      blueX += 30;
    }
    
    if(playerY - blueY > 0 && blueY > 215)
    {
      blueY -= 30;
    }
    
    if(playerY - blueY < 0)
    {
      blueY += 30;
    }
  }
  
  if(!isContacting(playerX, playerY, 195, 305))
  {
    squareFactor = 1.0;
    circleFactor = 0.0;
  }
  else
  {
    if(circleFactor < 1.0)
    {
      squareFactor -= 0.01;
      circleFactor += 0.01;
    }
  }
  

  fill(179, 288, 238);

  pushMatrix();
  translate(195, 305);
  scale(squareFactor);
  rect(0, 0, 30, 30);
  popMatrix();
  
  pushMatrix();
  translate(195, 305);
  scale(circleFactor);
  ellipse(0, 0, 30, 30);
  popMatrix();
  
  
  fill(26, 345, 281);
  rect(525, 365, 30, 30);
  if(isContacting(playerX, playerY, 525, 365))
  {
    fill(0);
    line(520, 355, 520, 360);
    line(530, 355, 530, 360);
    noFill();
    bezier(515, 375, 520, 365, 530, 365, 535, 375);
  }
  
  
  fill(113, 288, 346);
  rect(585, 215, 30, 30);
  if(isContacting(playerX, playerY, 585, 215))
  {
    partyMode(585, 215, 200);
  }
  
  fill(62, 324, 360);
  if(!sunMode)
  {
    rect(15, 215, 30, 30);
  }
  
  if(isContacting(playerX, playerY, 15, 215))
  {
    sunMode = true;
  }
  
  
  fill(360);
  rect(15, 575, 30, 30);
  
  if(isContacting(playerX, playerY, 15, 575))
  {
    for(int r = 15; r < 600; r+= 60)
    {
      for(int c = 215; c < 600; c+=60)
      {
        fill(color1, 360, 360);
        rect(r, c, 30, 30);
      }
    }
    
    for(int r = 45; r < 600; r+= 60)
    {
      for(int c = 245; c < 600; c+=60)
      {
        fill(color2, 360, 360);
        rect(r, c, 30, 30);
      }
    }
    
    if(timer% 30 == 0)
    {
      int temp = color2;
      color2 = color1;
      color1 = temp;
    }
  }
}
boolean isContacting(int x1, int y1, int x2, int y2)
{
  if((abs(x1 - x2) <= 30) && (abs(y1 - y2) <= 30))
  {
    return true;
  }
  
  return false;
}

void partyMode(int centerX, int centerY, int maxTimer)
{
  noStroke();
  int[] targetsX = new int[12];
  int[] targetsY = new int[12];
  int counter = 1;
  for(int c = 0; c < 12; c++)
  {
    targetsX[c] = (int)random(0, 250);
    targetsY[c] = (int)random(30, 150);
    
  }
  while(counter < maxTimer)
  {
    for(int c = 0; c < 12; c++)
    {
      if(timer % 5 == 0)
      {
        rect(centerX - (counter*((float)targetsX[c]/maxTimer)), 
          centerY - (counter*((float)targetsY[c]/maxTimer)),
          2, 2);
      }
    }
    
    counter++;
  }
}

void keyPressed()
{
  if(key == CODED)
  {
    if (keyCode == UP)
    {
      if(playerY > 215)
      {
        playerY -= 30;
      }
    }
    
    if (keyCode == DOWN)
    {
      if(playerY < 575)
      {
        playerY += 30;
      }
      
    }
    
    if (keyCode == LEFT)
    {
      if(playerX > 15)
      {
        playerX -= 30;
      }
    }
    
    if (keyCode == RIGHT)
    {
      if(playerX < 585)
      {
        playerX += 30;
      }
    }
  }
}


