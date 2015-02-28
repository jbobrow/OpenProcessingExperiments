
float prevX;
float prevY;
int brush;
float R = 0;
float G = 0;
float B = 0;
float F = 240;
float eyeTimer = 0;
float S = 8;
float mouthTimer = 0;
float mouth = 0;
float eyeColor1 = 255;
float eyeColor2 = 255;
float eyeColor3 = 255;

void setup()
{
  size (500, 500);
}

void draw()
{
        
         
  //brush selection
  //brush 1
  
  if(brush == 0)
  {
    strokeWeight(S);
    
    stroke(R, G, B, F);
    
    if(mousePressed == true)
    {
      if(mouseButton == LEFT)
      {
        line(prevX, prevY, mouseX, mouseY);
        prevX = mouseX;
        prevY = mouseY;
      }
    }
      prevX = mouseX;
      prevY = mouseY;
  }
  
  //brush 2
  
  if(brush == 1)
  {
    if(mousePressed == true)
    {
      if (mouseButton == LEFT)
      {
        strokeWeight(8);
        pushMatrix();
        translate(mouseX, mouseY);
        rotate(random(360));
        fill(random(255), random(255), random(255), random(255));
        stroke(random(255), random(255), random(255), random(255));
        ellipse(0 ,0 , random(80), random(80));
        popMatrix();
      }
    }
  }
  
 
   //brush 3
   if(brush == 2)
   {
     if (mousePressed == true)
     {
      if (mouseButton == LEFT)
      {
        strokeWeight(6);
        stroke(random(255), random(255), random(255));
        fill(random(255), random(255), random(255));
        rect(prevX, prevY, 30, 30);
        ellipse(prevY, prevX, 30, 30);
        ellipse(width/2, height/2, mouseX, mouseY);
        rectMode(CENTER);
        rect(width/2, height/2, mouseX/2, mouseY/2);
        ellipse(50, 50, mouseX/5, mouseY/5);
        ellipse(450, 50, mouseX/5, mouseY/5);
        ellipse(50, 450, mouseX/5, mouseY/5);
        ellipse(450, 450, mouseX/5, mouseY/5);
        prevX = mouseX;
        prevY = mouseY;
      }
     }
      prevX = mouseX;
      prevY = mouseY;
   } 
}

//keys

void keyReleased()
{
  //brush selectors
  
   if (key == '1')
  {
   brush = 0;
  }
 
 if (key == '2')
  {
   brush = 1;
  } 
  
  if (key == '3')
  {
    brush = 2;
  }
  
  //paint color, and style selector// brush 1
  if(key == 'a')
  {
    R = R + 15;
    
    if(R >= 255)
    {
      R = 0;
    }
  } 
  if (key == 's')
  {
    G = G + 15;
    
    if (G >= 255)
    {
      G = 0;
    }
  }
  
  if (key == 'd')
  {
    B = B + 15;
    
    if ( B >= 255)
    {
      B = 0;
    }
  }
  
  if (key == 'f')
  {
    F = F + 25;
    
    if (F >= 255)
    {
      F = 4;
    }
  }
  
  if (key == 'z')
  {
    R = 0;
    G = 0;
    B = 0;
    F = 255;
  }
  
  if (key == 'x')
  {
    S = S + 2;
  }
  
  if (key == 'c')
  {
    S = S - 2;
    
    if (S <= 0)
    {
      S = 0;
    }
  }
}




