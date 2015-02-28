
//alexandra merski amerski@nadrew.cmu.edu
//copyright 2013

 
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
  background(230);
  smooth();
  strokeWeight (1);
}
 
void draw()
{
  drawFigure();
}
 
void drawFigure()
{
  for(int i = 0; i < xList.length; i++)
  {
    stroke(colList[i]);
    noFill ();
    rect(xList[i], yList[i], sizeList[i], sizeList[i]);
    rect(xList[i]-sizeList[i], yList[i]-sizeList[i], sizeList[i], sizeList[i]);
  }
}



