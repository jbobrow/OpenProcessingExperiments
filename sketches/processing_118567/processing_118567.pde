
float windowX = 500;
float windowY = 500;

float lineX = random(windowX);
float lineY = random(windowY);
float prevX = lineX;
float prevY = lineY;
float lineTurn;
float LineL = 3;

float lineX2 = random(windowX);
float lineY2 = random(windowY);
float prevX2 = lineX2;
float prevY2 = lineY2;
float lineTurn2;
float LineL2 = 3;

float lineX3 = random(windowX);
float lineY3 = random(windowY);
float prevX3 = lineX3;
float prevY3 = lineY3;
float lineTurn3;
float LineL3 = 3;

float lineX4 = random(windowX);
float lineY4 = random(windowY);
float prevX4 = lineX4;
float prevY4 = lineY4;
float lineTurn4;
float LineL4 = 3;

float lineX5 = random(windowX);
float lineY5 = random(windowY);
float prevX5 = lineX5;
float prevY5 = lineY5;
float lineTurn5;
float LineL5 = 3;

float lineX6 = random(windowX);
float lineY6 = random(windowY);
float prevX6 = lineX6;
float prevY6 = lineY6;
float lineTurn6;
float LineL6 = 3;

float wormNumb = 0;
boolean buttonPressed = false;
float growX = 5;
float growY = 5;

float x = random(windowX);
float y = random(windowY);
float easing = 0.025;

void setup()
{
  size(500, 500);
  background(0);
}

void draw()
{ 
  if(wormNumb < 1)
  {
    lineTurn = random(12);
    
    if(lineTurn >= 0 && lineTurn < 3)
    {
      lineX = lineX - LineL;
      lineY = lineY - LineL;
    }
    
    if(lineTurn >= 3 && lineTurn < 6)
    {
      lineX = lineX + LineL;
      lineY = lineY - LineL;
    }
    
    if(lineTurn >= 6 && lineTurn < 9)
    {
      lineX = lineX + LineL;
      lineY = lineY + LineL;
    }
    
    if(lineTurn >= 9 && lineTurn < 12)
    {
      lineX = lineX - LineL;
      lineY = lineY + LineL;
    }
    
    if(lineX <= 0)
    {
      lineX = windowX;
      prevX = windowX;
    }
    
    if(lineX > windowX)
   {
      lineX = 0;
      prevX = 0;
   } 
   
     if(lineY <= 0)
     {
       lineY = windowY;
       prevY = windowY;
     }
     
     if(lineY > windowY)
     {
       lineY = 0;
       prevY = 0;
     }
      stroke(255, 0, 0);
      line(lineX, lineY, prevX, prevY);
      
      prevX = lineX;
      prevY = lineY;
  }
//---------------------------------------------------------------------------    
    if(wormNumb < 2)
    {
      lineTurn2 = random(12);
    
    if(lineTurn2 >= 0 && lineTurn2 < 3)
    {
      lineX2 = lineX2 - LineL2;
      lineY2 = lineY2 - LineL2;
    }
    
    if(lineTurn2 >= 3 && lineTurn2 < 6)
    {
      lineX2 = lineX2 + LineL2;
      lineY2 = lineY2 - LineL2;
    }
    
    if(lineTurn2 >= 6 && lineTurn2 < 9)
    {
      lineX2 = lineX2 + LineL2;
      lineY2 = lineY2 + LineL2;
    }
    
    if(lineTurn2 >= 9 && lineTurn2 < 12)
    {
      lineX2 = lineX2 - LineL2;
      lineY2 = lineY2 + LineL2;
    }
    
    if(lineX2 <= 0)
    {
      lineX2 = windowX;
      prevX2 = windowX;
    }
    
    if(lineX2 > windowX)
   {
      lineX2 = 0;
      prevX2 = 0;
   } 
   
     if(lineY2 <= 0)
     {
       lineY2 = windowY;
       prevY2 = windowY;
     }
     
     if(lineY2 > windowY)
     {
       lineY2 = 0;
       prevY2 = 0;
     }
      stroke(0, 255, 0);
      line(lineX2, lineY2, prevX2, prevY2);
      
      prevX2 = lineX2;
      prevY2 = lineY2;
    }
    
//------------------------------------------------------------------------
  if(wormNumb < 3)
  {
      lineTurn3 = random(12);
    
    if(lineTurn3 >= 0 && lineTurn3 < 3)
    {
      lineX3 = lineX3 - LineL3;
      lineY3 = lineY3 - LineL3;
    }
    
    if(lineTurn3 >= 3 && lineTurn3 < 6)
    {
      lineX3 = lineX3 + LineL3;
      lineY3 = lineY3 - LineL3;
    }
    
    if(lineTurn3 >= 6 && lineTurn3 < 9)
    {
      lineX3 = lineX3 + LineL3;
      lineY3 = lineY3 + LineL3;
    }
    
    if(lineTurn3 >= 9 && lineTurn3 < 12)
    {
      lineX3 = lineX3 - LineL3;
      lineY3 = lineY3 + LineL3;
    }
    
    if(lineX3 <= 0)
    {
      lineX3 = windowX;
      prevX3 = windowX;
    }
    
    if(lineX3 > windowX)
   {
      lineX3 = 0;
      prevX3 = 0;
   } 
   
     if(lineY3 <= 0)
     {
       lineY3 = windowY;
       prevY3 = windowY;
     }
     
     if(lineY3 > windowY)
     {
       lineY3 = 0;
       prevY3 = 0;
     }
      stroke(0, 0, 255);
      line(lineX3, lineY3, prevX3, prevY3);
      
      prevX3 = lineX3;
      prevY3 = lineY3;
  }

//------------------------------------------------------------------------
  if(wormNumb < 4)
  {
      lineTurn4 = random(12);
    
    if(lineTurn4 >= 0 && lineTurn4 < 3)
    {
      lineX4 = lineX4 - LineL4;
      lineY4 = lineY4 - LineL4;
    }
    
    if(lineTurn4 >= 3 && lineTurn4 < 6)
    {
      lineX4 = lineX4 + LineL4;
      lineY4 = lineY4 - LineL4;
    }
    
    if(lineTurn4 >= 6 && lineTurn4 < 9)
    {
      lineX4 = lineX4 + LineL4;
      lineY4 = lineY4 + LineL4;
    }
    
    if(lineTurn4 >= 9 && lineTurn4 < 12)
    {
      lineX4 = lineX4 - LineL4;
      lineY4 = lineY4 + LineL4;
    }
    
    if(lineX4 <= 0)
    {
      lineX4 = windowX;
      prevX4 = windowX;
    }
    
    if(lineX4 > windowX)
   {
      lineX4 = 0;
      prevX4 = 0;
   } 
   
     if(lineY4 <= 0)
     {
       lineY4 = windowY;
       prevY4 = windowY;
     }
     
     if(lineY4 > windowY)
     {
       lineY4 = 0;
       prevY4 = 0;
     }
      stroke(255, 255, 0);
      line(lineX4, lineY4, prevX4, prevY4);
      
      prevX4 = lineX4;
      prevY4 = lineY4;
  }
    
//--------------------------------------------------------------------
  if(wormNumb < 5)
  {
  lineTurn5 = random(12);
    
    if(lineTurn5 >= 0 && lineTurn5 < 3)
    {
      lineX5 = lineX5 - LineL5;
      lineY5 = lineY5 - LineL5;
    }
    
    if(lineTurn5 >= 3 && lineTurn5 < 6)
    {
      lineX5 = lineX5 + LineL5;
      lineY5 = lineY5 - LineL5;
    }
    
    if(lineTurn5 >= 6 && lineTurn5 < 9)
    {
      lineX5 = lineX5 + LineL5;
      lineY5 = lineY5 + LineL5;
    }
    
    if(lineTurn5 >= 9 && lineTurn5 < 12)
    {
      lineX5 = lineX5 - LineL5;
      lineY5 = lineY5 + LineL5;
    }
    
    if(lineX5 <= 0)
    {
      lineX5 = windowX;
      prevX5 = windowX;
    }
    
    if(lineX5 > windowX)
   {
      lineX5 = 0;
      prevX5 = 0;
   } 
   
     if(lineY5 <= 0)
     {
       lineY5 = windowY;
       prevY5 = windowY;
     }
     
     if(lineY5 > windowY)
     {
       lineY5 = 0;
       prevY5 = 0;
     }
      stroke(0, 255, 255);
      line(lineX5, lineY5, prevX5, prevY5);
      
      prevX5 = lineX5;
      prevY5 = lineY5;
  }
    
//-------------------------------------------------------------
if(wormNumb < 6)
{
  lineTurn6 = random(12);
    
    if(lineTurn6 >= 0 && lineTurn6 < 3)
    {
      lineX6 = lineX6 - LineL6;
      lineY6 = lineY6 - LineL6;
    }
    
    if(lineTurn6 >= 3 && lineTurn6 < 6)
    {
      lineX6 = lineX6 + LineL6;
      lineY6 = lineY6 - LineL6;
    }
    
    if(lineTurn6 >= 6 && lineTurn6 < 9)
    {
      lineX6 = lineX6 + LineL6;
      lineY6 = lineY6 + LineL6;
    }
    
    if(lineTurn6 >= 9 && lineTurn6 < 12)
    {
      lineX6 = lineX6 - LineL6;
      lineY6 = lineY6 + LineL6;
    }
    
    if(lineX6 <= 0)
    {
      lineX6 = windowX;
      prevX6 = windowX;
    }
    
    if(lineX6 > windowX)
   {
      lineX6 = 0;
      prevX6 = 0;
   } 
   
     if(lineY6 <= 0)
     {
       lineY6 = windowY;
       prevY6 = windowY;
     }
     
     if(lineY6 > windowY)
     {
       lineY6 = 0;
       prevY6 = 0;
     }
      stroke(255, 0, 255);
      line(lineX6, lineY6, prevX6, prevY6);
      
      prevX6 = lineX6;
      prevY6 = lineY6;
}
    
//-----------------------------------------------
if(buttonPressed  == true)
{
  if(wormNumb == 0)
  {
    float targetX = lineX;
    float dx = targetX - x;
    if(abs(dx) > 1)
    {
      x += dx * easing;
    }
    
    float targetY = lineY;
    float dy = targetY - y;
    if(abs(dy) > 1)
    {
      y += dy * easing;
    }
      
      fill(255);
      stroke(255);
      ellipse(x, y, 5, 5);
      
      if(x >= lineX - 3 && x <= lineX + 3)
       {
         if(y >= lineY -3 && y <= lineY + 3)
         {
           wormNumb = 1;
         }
       }
  }
//---------------------------------------------------
    if(wormNumb == 1)
  {
    float targetX = lineX2;
    float dx = targetX - x;
    if(abs(dx) > 1)
    {
      x += dx * easing;
    }
    
    float targetY = lineY2;
    float dy = targetY - y;
    if(abs(dy) > 1)
    {
      y += dy * easing;
    }
      
      fill(255, 0, 0);
      stroke(255, 0, 0);
      ellipse(x, y, 5, 5);
      
      if(x >= lineX2 - 3 && x <= lineX2 + 3)
       {
         if(y >= lineY2 -3 && y <= lineY2 + 3)
         {
           wormNumb = 2;
         }
       }
  }
  
  if(wormNumb == 2)
  {
    float targetX = lineX3;
    float dx = targetX - x;
    if(abs(dx) > 1)
    {
      x += dx * easing;
    }
    
    float targetY = lineY3;
    float dy = targetY - y;
    if(abs(dy) > 1)
    {
      y += dy * easing;
    }
      
      fill(0, 255, 0);
      stroke(0, 255, 0);
      ellipse(x, y, 5, 5);
      
      if(x >= lineX3 - 3 && x <= lineX3 + 3)
       {
         if(y >= lineY3 -3 && y <= lineY3 + 3)
         {
           wormNumb = 3;
         }
       }
  }
  
  if(wormNumb == 3)
  {
    float targetX = lineX4;
    float dx = targetX - x;
    if(abs(dx) > 1)
    {
      x += dx * easing;
    }
    
    float targetY = lineY4;
    float dy = targetY - y;
    if(abs(dy) > 1)
    {
      y += dy * easing;
    }
      
      fill(0, 0, 255);
      stroke(0, 0, 255);
      ellipse(x, y, 5, 5);
      
      if(x >= lineX4 - 3 && x <= lineX4 + 3)
       {
         if(y >= lineY4 -3 && y <= lineY4 + 3)
         {
           wormNumb = 4;
         }
       }
  }
  
  if(wormNumb == 4)
  {
    float targetX = lineX5;
    float dx = targetX - x;
    if(abs(dx) > 1)
    {
      x += dx * easing;
    }
    
    float targetY = lineY5;
    float dy = targetY - y;
    if(abs(dy) > 1)
    {
      y += dy * easing;
    }
      
      fill(255, 255, 0);
      stroke(255, 255, 0);
      ellipse(x, y, 5, 5);
      
      if(x >= lineX5 - 3 && x <= lineX5 + 3)
       {
         if(y >= lineY5 -3 && y <= lineY5 + 3)
         {
           wormNumb = 5;
         }
       }
  }
  
  if(wormNumb == 5)
  {
    float targetX = lineX6;
    float dx = targetX - x;
    if(abs(dx) > 1)
    {
      x += dx * easing;
    }
    
    float targetY = lineY6;
    float dy = targetY - y;
    if(abs(dy) > 1)
    {
      y += dy * easing;
    }
      
      fill(0, 255, 255);
      stroke(0, 255, 255);
      ellipse(x, y, 5, 5);
      
      if(x >= lineX6 - 3 && x <= lineX6 + 3)
       {
         if(y >= lineY6 -3 && y <= lineY6 + 3)
         {
           wormNumb = 6;
         }
       }
  }
  
  if(wormNumb == 6)
  {
    growX += 1;
    growY += 1;
    fill(255, 0, 255);
    stroke(255, 0, 255);
    ellipse(x, y, growX, growY);
  }
}
}


void keyReleased()
{
  if(keyCode == ENTER)
  {
    buttonPressed = true;
  }
}


