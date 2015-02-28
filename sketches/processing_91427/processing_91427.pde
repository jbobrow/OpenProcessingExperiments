
// Homework 9, 02-26-13
// Xinran Lu, xinranl@andrew.cmu.edu
// Copyright Xinran Lu Febuary 2013 Pittsburgh PA 15232

float [ ] xList = {random(50, 350), 
                random(50, 350),
                random(50, 350),
                random(50, 350),
                random(50, 350),
                random(50, 350),
                random(50, 350),
                random(50, 350),
                random(50, 350),
                random(50, 350) };
float [ ] yList = {random(50, 350), 
                random(50, 350),
                random(50, 350),
                random(50, 350),
                random(50, 350),
                random(50, 350),
                random(50, 350),
                random(50, 350),
                random(50, 350),
                random(50, 350) };
float [ ] sizeList = {random(10, 40),
                    random(10, 40),
                    random(10, 40),
                    random(10, 40),
                    random(10, 40),
                    random(10, 40),
                    random(10, 40),
                    random(10, 40),
                    random(10, 40),
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
                   
void setup()
{
  size(400, 400);  
  background(255);
  smooth();
}

void draw()
{
  drawFigure();
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
