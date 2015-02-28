
import processing.pdf.*;

int numRows;
int numCols;
float flowerDia = 200;
boolean notDrawn = true;

void setup()
{
  size(1200, 800, PDF, "wallpaper.pdf");
  background(188, 232, 255);
  numRows = (int)(height/flowerDia);
  numCols = (int)(width/flowerDia);
}

void draw()
{
  if(notDrawn)
  {
    drawFootSuns();
    notDrawn = !notDrawn;
  }
  
  exit();
}

void drawTentacle()
{  
  fill(#A248C6);
  noStroke();
  
  beginShape();
  curveVertex(-10, -10);
  curveVertex(-10, -10);
  curveVertex(15, -18);
  curveVertex(30, 2);
  curveVertex(40, -2);
  curveVertex(40, -2);
  endShape();
  
  beginShape();
  curveVertex(-10, 6);
  curveVertex(-10, 6);
  curveVertex(15, -2);
  curveVertex(30, 14);
  curveVertex(40, -2);
  curveVertex(40, -2);
  endShape();
}  

void drawFootSuns()
{
    smooth();
  
  float rad = 0;

  for(int i = 0; i <= numRows; i++)
  {
     for(int j = 0; j <= numCols; j++)
     {
       if((j % 2 ==0 && i % 2 == 0) || (j % 2 == 1 && i % 2 == 1))
       {
         for(int k = 0; k < 16; k++)
         {
           pushMatrix();
           translate(cos(rad) * (50), sin(rad) * (50));
           rotate(rad);
           drawTentacle();
           popMatrix();
           rad += PI/8;
         }       
        
         pushMatrix();
         noStroke();
         fill(52, 151, 255);
         for(float k = 0; k < 250; k++)
         {
            rotate(.11);
            if(k <= 200) rect(k/5, 0, 5, 5);
            else rect(40, 0, 5, 5);
         }
         popMatrix(); 
       }
       else
       {
          pushMatrix();
          drawTwistings();
          popMatrix();
       }
          
       if(j < numCols) translate(flowerDia, 0);
     }
     translate(-(flowerDia) * numCols, 0);
     translate(0, flowerDia);
  }
}

void drawTwistings()
{
  int currentX = -100;
  int currentY = -100;
  
  for(int i = 0; i < 2; i ++)
  {
    for(int j = 0; j < 2; j++)
    {
      
      if(currentX == -100 && currentY == -100)
      {
        generateTwist(currentX, currentY, 100, -100);
        generateTwist(currentX, currentY, -100, 100);
        generateTwist(currentX, currentY, 100,100);
      }
      else if(currentX == 100 && currentY == -100)
      {
        generateTwist(currentX, currentY, -100, -100);
        generateTwist(currentX, currentY, -100, 100);
        generateTwist(currentX, currentY, 100, 100);
      }
      else if(currentX == -100 && currentY == 100)
      {
        generateTwist(currentX, currentY, -100, -100);
        generateTwist(currentX, currentY, -100, 100);
        generateTwist(currentX, currentY, 100, 100);
      }
      else if(currentX == 100 && currentY == 100)
      {
        generateTwist(currentX, currentY, -100, -100);
        generateTwist(currentX, currentY, 100, -100);
        generateTwist(currentX, currentY, -100, 100);
      }
      currentX += 200;
    }
    currentX -= 400;
    currentY += 200;
  }
}

void generateTwist(int x, int y, int destX, int destY)
{
  stroke(0, 0, 0);
  fill(#A248C6, 50);
  beginShape();
  curveVertex(x, y);
  curveVertex(x, y);
  curveVertex(random(-100, 100), random(-100, 100)); 
  curveVertex(random(-100, 100), random(-100, 100)); 
  curveVertex(destX, destY);
  curveVertex(destX, destY);
  endShape();
}            
                                                
