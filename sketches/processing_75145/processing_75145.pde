
boolean [] fillCircle = new boolean[10];
PVector [] circleCenter = new PVector[10];
String  [] stringID = {
  "↨", "⇊", "⇈", "↓", "↑"
};
float circleDiameter = 110;
float circleRadius = circleDiameter/2;
float xOffset = 70;
float xSpace = 10;
float yOffset = 120;
float ySpace = 10;
color[] colors = {
  #33CC99, #66FFCC, #00FF99, #33CC66, #009966, #33FFCC, #7cc0ce, #57aec0, #45a5b8, #69b7c7, #8fc9d5, #5fb2c3
}; //Land & Sea Colors
float opacity = 20;

void setup()
{
  size(620, 260); 
  smooth();
  textSize(32);

  int colNum = (int)random(1, 6);
  fill(colors[colNum], opacity);
  noStroke();
  rect(0, 0, width, height);
  stroke(2);

  for (int i = 0; i < circleCenter.length; i++)
  {
    if (i <  circleCenter.length/2)
    {
      circleCenter[i] = new PVector((xOffset + (xSpace + circleDiameter) * i), ySpace + yOffset/2);
      fillCircle[i] = false;
    }
    else
    {
      circleCenter[i] = new PVector((xOffset + (xSpace + circleDiameter) * (i - circleCenter.length/2)), ySpace + yOffset * 3/2);
      fillCircle[i] = true;
    }
  }
}

void draw()
{
  int colNum = (int)random(1, 6);
  fill(colors[colNum], opacity);
  noStroke();
  rect(0, 0, width, height);
  stroke(2);
  for (int i = 0; i < circleCenter.length; i++)
  {
    drawCircle(i);
  }
}

void mousePressed()
{
  for (int i = 0; i < circleCenter.length; i++)
  {
    if (inCircle(i, mouseX, mouseY))
    {
      switch(i)
      {
        //--------Only When Pressed--------
      case 0:
        fillCircle[i] = !fillCircle[i];
        break;

      case 5:
        fillCircle[i] = !fillCircle[i];
        break;  

        //-------Switch On Pressed--------
      case 1:
        fillCircle[i] = !fillCircle[i];
        break;

      case 6:
        fillCircle[i] = !fillCircle[i];
        break;

        //------Switch On Release-------
      case 2:

        break;

      case 7:

        break;

        //--------One Way Pressed--------
      case 3:
        if (inCircle(i, mouseX, mouseY))
        {
          fillCircle[i] = true;
        }
        break;

      case 8:
        if (inCircle(i, mouseX, mouseY))
        {
          fillCircle[i] = false;
        }
        break;

        //--------One Way Released--------
      case 4:

        break;

      case 9:

        break;
      }
    }
  }
}

void mouseReleased()
{
  for (int i = 0; i < circleCenter.length; i++)
  {
    switch(i)
    {
      //--------Only When Pressed--------
    case 0:
      fillCircle[i] = false;
      break;

    case 5:
      fillCircle[i] = true;
      break;  

      //--------Only When Pressed--------
    case 1:

      break;

    case 6:

      break;

      //------Switch On Release-------
    case 2:
      if (inCircle(i, mouseX, mouseY))
      {
        fillCircle[i] = !fillCircle[i];
      }
      break;

    case 7:
      if (inCircle(i, mouseX, mouseY))
      {
        fillCircle[i] = !fillCircle[i];
      }
      break;

      //--------One Way Pressed--------
    case 3:

      break;

    case 8:

      break;

      //-------One Way Released-------
    case 4:
      if (inCircle(i, mouseX, mouseY))
      {
        fillCircle[i] = true;
      }
      break;

    case 9:
      if (inCircle(i, mouseX, mouseY))
      {
        fillCircle[i] = false;
      }
      break;
    }
  }
}



void drawCircle(int i)
{
  if (fillCircle[i])
  {
    fill(0);
    ellipse(circleCenter[i].x, circleCenter[i].y, circleDiameter, circleDiameter);
    fill(255);
  }
  else
  {
    fill(255);
    ellipse(circleCenter[i].x, circleCenter[i].y, circleDiameter, circleDiameter);
    fill(0);
  }
  text(stringID[i % 5], circleCenter[i].x - 12, circleCenter[i].y + 12);
}

boolean inCircle(int i, int mx, int my)
{
  float distanceToCenter = dist(circleCenter[i].x, circleCenter[i].y, mx, my);
  if (distanceToCenter <= circleRadius)
  {
    return true;
  }
  else
  {
    return false;
  }
}

void keyPressed()
{ 
  setup();
}

