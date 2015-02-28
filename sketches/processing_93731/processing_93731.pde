
//Prisca A Ohito. 3.19.13
//copyright Prisca Ohito. 
final int MAX = 4;

float [ ] xList = {random(50, 250), random(50, 250), random(50, 250), random(50, 250),
                  random(50, 250), random(50, 250), random(50, 250), random(50, 250),
                  random(50, 250), random(50, 250)};
float [ ] yList = {random(100, 550), random(100, 550), random(100, 550), random(100, 550),
                  random(100, 550), random(100, 550), random(100, 550), random(100, 550),
                  random(100, 550), random(100, 550) };
float [ ] deltaY = {1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2};
float [ ] deltaX = {2.8, 2.8, 2.8, 2.8, 2.8, 2.8, 2.8, 2.8, 2.8, 2.8};
float [ ] sizeList = {random(10, 40), random(10, 40), random(10, 40), random(10, 40),
                    random(10, 40), random(10, 40), random(10, 40), random(10, 40),
                    random(10, 40), random(10, 40)};
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
  size(600, 600);
  background (0);
}

void draw()
{
  fill(0, 10);
  rect(0, 0, width, height);
  drawEllipse();
  bounceVert();
  bounceHoriz(); 
}

void drawEllipse( )
{
  for (int i = 0; i<xList.length; i++)
  {
    stroke(colList [i]);
    noFill();
    ellipse(xList[i], yList[i], sizeList[i]*1.5, sizeList[i]*1.5);
    ellipse(xList[i]*2, yList[i]*2, sizeList[i]*.25, sizeList[i]*.25);
    ellipse(xList[i]/2, yList[i]/2, sizeList[i]*4, sizeList[i]*4);
  }
}

void bounceVert ()
{
  for (int i = 0; i<deltaY.length; i++)
   {
     yList[i] += deltaY[i];

    if (yList[i] >  height || yList[i] < 0)  // too far down? up? 
    {
      deltaY[i] = -deltaY[i]; // go up? down?
    }
  }
}

void bounceHoriz()
{
  for (int i = 0; i<deltaX.length; i++)
  {     
    xList[i] += deltaX[i];
        if (xList[i] >  width || xList[i] < 0)  // too far left? right?  
        {
          deltaX[i] = -deltaX[i];
        }
  }
}
