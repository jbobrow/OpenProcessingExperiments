
//Robert Wohlforth - rwohlfor
//Homework 8 - "Compass Magnet"
//Copyright Pittsburgh 2012

//Move the mouse to change the direction of the lines.
//Press R to change the color to red.
//Press G to change the color to green.
//Press B to change the color to blue.
//Press SPACE to invert the background.

float lineLength, lineX, lineY,rValue,gValue,bValue,backCol = 0;
boolean bRed = true, bGreen = false, bBlue = false;

void setup ()
{background (backCol);
  size (500, 500);
  lineLength = width/10;
  strokeWeight (10);
}

void draw ()
{background (backCol);
drawLines();
}

void drawLines()
{lineY = 0;
while (lineY < height+lineLength)
{lineX = 0;
while (lineX < width+lineLength)
{
  if (bRed == true)
  {rValue = map(dist(lineX,lineY,mouseX,mouseY),0,width,255,0);
  }
  else
{rValue = 0;
}
if (bGreen == true)
{gValue = map(dist(lineX,lineY,mouseX,mouseY),0,width,255,0);
}
else
{gValue = 0;
}
if (bBlue == true)
{bValue = map(dist(lineX,lineY,mouseX,mouseY),0,width,255,0);
}
else
{bValue = 0;
}
stroke (rValue, gValue, bValue);
line (lineX, lineY, lineX+((lineLength/dist(lineX,lineY,mouseX,mouseY))*(mouseX-lineX)), lineY+((lineLength/dist(lineX,lineY,mouseX,mouseY))*(mouseY-lineY)));
lineX = lineX + lineLength + 10;
}
lineY = lineY + lineLength + 10;
}
}

void keyReleased()
{if (key == 'r')
{bRed = true;
bGreen = false;
bBlue = false;
}
if (key == 'g')
{bRed = false;
bGreen = true;
bBlue = false;
}
if (key == 'b')
{bRed = false;
bGreen = false;
bBlue = true;
}
if (key == ' ')
{if (backCol == 0)
{backCol = 255;
}
else
{backCol = 0;
}
}
}

