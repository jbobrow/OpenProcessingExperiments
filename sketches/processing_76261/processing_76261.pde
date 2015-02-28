
//Robert Wohlforth  - rwohlfor
//Homework 11
//Copyright Pittsburgh 2012

int figureQuantity = 20, figureWidth;
float[] figureX = new float [figureQuantity], figureY = new float [figureQuantity], figureDX = new float [figureQuantity], figureDY = new float [figureQuantity];
color[] figureColor = new color [figureQuantity];

void setup()
{
  size(900, 700);
figureWidth = width/20;
for (int n = 0; n < figureQuantity; n++)
{figureX[n] = random (0,width);
figureY[n] = random (0,height);
figureDX[n] = random (2,3);
figureColor[n] = color(random (0,255), random (0,255), random (0,255));
}
}

void draw()
{drawBackground();
  drawFigure();
moveFigure();
wrapFigure();
bounceFigure();
gravity();
collision();
}

void drawBackground()
{background (50);
}


void drawFigure()
{for (int n = 0; n < figureQuantity; n++)
{
fill(figureColor[n]);
  ellipse(figureX[n],figureY[n],figureWidth,figureWidth);
}
}

void moveFigure()
{for (int n = 0; n < figureQuantity; n++)
{figureX[n] = figureX[n] + figureDX[n];
figureY[n] = figureY[n] + figureDY[n];
}
}

void wrapFigure()
{for (int n = 0; n < figureQuantity; n++)
{
  if (figureX[n] > width + (figureWidth/2) + 1)
  {figureX[n] = -figureWidth/2;
  }
  if (figureX[n] < -figureWidth/2 - 1)
  {figureX[n] = width + (figureWidth/2);
  }
}
}

void bounceFigure()
{for (int n = 0; n < figureQuantity; n++)
{
  if (figureY[n] > height - (figureWidth/2))
  {figureY[n] = height - (figureWidth/2) - 1;
    figureDY[n] = -figureDY[n];
  }
}
}

void gravity ()
{for (int n = 0; n < figureQuantity; n++)
{figureDY[n] = figureDY[n] + .1;
}
}

void collision()
{for (int n = 0; n < figureQuantity; n++)
  {for (int i = 0; i < figureQuantity; i++)
    {if (i != n)
      {if (dist(figureX[n], figureY[n], figureX[i], figureY[i]) < figureWidth)
        {if (figureDX[n] > 0)
          {if (figureX[n] < figureX[i])
            {figureDX[n] = -figureDX[n];
            }
          }
         else
           {if (figureX[n] > figureX[i])
            {figureDX[n] = -figureDX[n];
            }
           }
        }
      }
    }
  }
}

