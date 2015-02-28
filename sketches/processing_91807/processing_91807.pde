
// Homework 10, 03-03-13
// Xinran Lu, xinranl@andrew.cmu.edu
// Copyright Xinran Lu March 2013 Pittsburgh PA 15232

float [ ] xList = {random(50, 350), random(50, 350), random(50, 350),
                   random(50, 350), random(50, 350), random(50, 350),
                   random(50, 350), random(50, 350), random(50, 350),
                   random(50, 350) };
float [ ] yList = {random(50, 350), random(50, 350), random(50, 350),
                   random(50, 350), random(50, 350), random(50, 350),
                   random(50, 350), random(50, 350), random(50, 350),
                   random(50, 350) };
float [ ] sizeList = {random(10, 40), random(10, 40), random(10, 40),
                      random(10, 40), random(10, 40), random(10, 40),
                      random(10, 40), random(10, 40), random(10, 40),
                      random(10, 40) };
int [ ] colList = {color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)), 
                   color(random(255), random(255), random(255)), 
                   color(random(255), random(255), random(255)), 
                   color(random(255), random(255), random(255)), 
                   color(random(255), random(255), random(255)), 
                   color(random(255), random(255), random(255)), 
                   color(random(255), random(255), random(255)), 
                   color(random(255), random(255), random(255)), 
                   color(random(255), random(255), random(255)) };
float [ ] deltaX = {random(-5, 5), random(-5, 5),
                    random(-5, 5), random(-5, 5),
                    random(-5, 5), random(-5, 5),
                    random(-5, 5), random(-5, 5),
                    random(-5, 5), random(-5, 5)};
float [ ] deltaY = {random(-5, 5), random(-5, 5),
                    random(-5, 5), random(-5, 5),
                    random(-5, 5), random(-5, 5),
                    random(-5, 5), random(-5, 5),
                    random(-5, 5), random(-5, 5)};
                   
void setup()
{
  size(400, 400);  
  background(255);
  smooth();
}

void draw()
{
  background(255);
  drawFigure();
  moveFigure();
}

void drawFigure()
{
  for(int i = 0; i < xList.length; i++)
  {
    noStroke();
    fill(colList[i]);
    ellipse(xList[i], yList[i], sizeList[i], sizeList[i]);
    ellipse(xList[i], yList[i]+sizeList[i], sizeList[i]*1.5, sizeList[i]*1.5);
  }
}

void moveFigure()
{
  for(int i = 0; i < xList.length; i++)
  {
    xList[i] = xList[i] + deltaX[i];
    yList[i] = yList[i] + deltaY[i];
    if(xList[i] > width || yList[i] > height || xList[i] < 0 || yList[i] < 0)
    {
      deltaX[i] = -deltaX[i];
      deltaY[i] = -deltaY[i];
    }
  }  
}
