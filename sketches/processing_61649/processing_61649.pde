
// 48-257, bumyeolk_Project2
// Bumyeol Kim, Copyright 2012

float boxX, boxY, boxWidth, boxHeight;
float objX, objY, objWidth;

float buttonWidth, buttonHeight;
float buttonX, aButtonY, bButtonY, cButtonY, dButtonY;

float velocityX = random(1, 4);
float velocityY = random(1, 4);

boolean a, b, c;

void setup()
{
  size(800, 600);
  background(255);
  smooth();
  
  boxWidth = .6 * width;
  boxHeight = .6 * height;
  boxX = .07 * width;
  boxY = .3 * height;
  objX = boxX + (.5 * boxWidth);
  objY = boxY + (.5 * boxHeight);
  buttonWidth = .25 * boxWidth;
  buttonHeight = .2 * boxHeight;
   
  buttonX = .75 * width;
  aButtonY = .3 * height;
  bButtonY = .45 * height;
  cButtonY = .6 * height;
  dButtonY = .75 * height;
  
  a = false; 
  b = false;
  c = false;
  
  textAlign(CENTER);
  textSize(50);
  fill(0);
  text("< Color Match >" , .5 * width, .15 * height);
}

void draw()
{
  drawBG();
  drawObj();
  moveObj();
  buttons();
  clicker();
}

void drawBG()
{
  fill(#AEFAEF);
  rect(boxX, boxY, boxWidth, boxHeight);
  if(a)
  {
    aDraw();
  }
  if(b)
  {
    bDraw();
  }
  if(c)
  {
    cDraw();
  }
}

void drawObj()
{
  objWidth = .2 * boxWidth;
  strokeWeight(4);
  stroke(#FFB624);
  fill(#FFD024);
  ellipse(objX + (.5 * objWidth) + 10, objY + 15, .3 * objWidth, .3 * objWidth);
}

void moveObj()
{
  objX = objX + velocityX;  
  if(objX >= boxX + boxWidth - objWidth)
  {
    velocityX = - velocityX;
    objX = objX + velocityX;  
  }
  if(objX <= boxX)
  {
    velocityX = - velocityX;
  }
  objY = objY + velocityY;
  if(objY >= boxY + boxHeight - objWidth/3)
  {
    velocityY = - velocityY;
    objY = objY + velocityY;    
  }
  if(objY <= boxY + objWidth/5)
  {
    velocityY = - velocityY;
  }
}

void buttons()
{
  rect(buttonX, aButtonY, buttonWidth, buttonHeight); 
  rect(buttonX, bButtonY, buttonWidth, buttonHeight); 
  rect(buttonX, cButtonY, buttonWidth, buttonHeight); 
  rect(buttonX, dButtonY, buttonWidth, buttonHeight); 
  
  textAlign(CENTER);
  textSize(30);
  strokeWeight(5);
  
  fill(#0BB70C);
  text("Green " , buttonX + buttonWidth/2, aButtonY + buttonHeight/2);
  fill(#FF0000);
  text("Red " , buttonX + buttonWidth/2, bButtonY + buttonHeight/2);
  fill(#070BD8);
  text("Blue " , buttonX + buttonWidth/2, cButtonY + buttonHeight/2);
  fill(0);
  text("Reset " , buttonX + buttonWidth/2, dButtonY + buttonHeight/2);
}

void clicker()
{
  if(mousePressed)
  {
    if(mouseX >= buttonX && mouseX < buttonX + buttonWidth && mouseY >= aButtonY && mouseY < aButtonY + buttonHeight)
    {
      a = !a;
    }
    if(mouseX >= buttonX && mouseX < buttonX + buttonWidth && mouseY >= bButtonY && mouseY < bButtonY + buttonHeight)
    {
       b = !b; 
    }
    if(mouseX >= buttonX && mouseX < buttonX + buttonWidth && mouseY >= cButtonY && mouseY < cButtonY + buttonHeight)
    {
       c = !c; 
    }
    if(mouseX >= buttonX && mouseX < buttonX + buttonWidth && mouseY >= dButtonY && mouseY < dButtonY + buttonHeight)
    {
       a = false; 
       b = false;
       c = false;
       background(random(255), random(255), random(255));
       textAlign(CENTER);
       textSize(50);
       fill(random(255), random(255), random(255));
       text("< Color Match >" , .5 * width, .15 * height);
    } 
  }
}

void aDraw()
{
  strokeWeight(8);
  fill(#0BB70C);
  rect(150, 200, 300, 150 );  
}

void bDraw()
{
  stroke(#6A4500);
  fill(#FF0000);
  strokeWeight(4);
  rect(130, 410, 150, 80);
}

void cDraw()
{
  stroke(#874CD8);
  fill(#070BD8);
  ellipse(420, 450, 150, 120);
}

void keyPressed()
{
  if(key == CODED) 
  {
    if(keyCode == UP) 
    {
      if(velocityY <= 15)  velocityY = velocityY + 2;
    } 
    else if(keyCode == DOWN) 
    {
      velocityY = velocityY - 2;
    } 
    else if(keyCode == RIGHT)
    {
      velocityX = velocityX + 2;
    }
    else if(keyCode == LEFT)
    {
      velocityX = velocityX - 2;
    }
  }
  
  if(key == ' ')
  {
    velocityX = 0;
    velocityY = 0;
  }
  
  if(key == 's' )
  {
    velocityX = random( 1, 4);
    velocityY = random( 1, 4);
  }
  
  else if(key == 'p')
  {
    saveFrame("proj2.jpg");
  }
}


