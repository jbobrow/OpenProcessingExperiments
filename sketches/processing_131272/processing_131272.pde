
//copyright Yoon-ji Kim 2014
//51-257 A: HW #5

//******GLOBAL VARIABLES******
float xA, yA, diamA, speedAx, speedAy; //variable set 1
float xB, yB, diamB, speedBx, speedBy; //variable set 2
color bgColor, ellipseColorA, ellipseColorB;

void setup()
{
  size(400, 400);
  smooth();
  
  //******figure A variables******
    xA = 0;
    yA = 0;
    diamA = 30; 
    speedAx = 2;
    speedAy = 2;
  
  //******figure B variables******
    xB = 350;
    yB = 350;
    diamB = 50;
    speedBx = 1;
    speedBy = 1;
  
  //******colors******
    bgColor = color(73, 94, 129, 20);
    ellipseColorA = color(255, 166, 31);
    ellipseColorB = color(50, 191, 133);
}

void draw()
{
  prepareWindow();
  moveFigures();
  drawFigures();
}

void prepareWindow()
{
  fill(bgColor);
  rect(0, 0, width, height);
  noStroke();
}

void moveFigures()
{
  //******GREEN ELLIPSE******
  if ((xB >= width-width) && (yB == height-diamB)) //bottom side
  {
    xB = xB - speedBx;
  }
  else if ((xB <= diamB) && (yB > height-height)) //left side
  {
    yB = yB - speedBy;
  }
  else if ((xB < width-diamB) && (yB == height-height)) //top side
  {
    xB += speedBx;
  }
  else if ((xB == width-diamB) && (yB < height-diamB)) //right side
  {
    yB += speedBy;
  }
  
  //******ORANGE ELLIPSE******
  if ((xA < width-diamA) && (yA == height-height)) //top side
  {
   xA += speedAx;
  }
  else if ((xA == width-diamA) && (yA < height-diamA)) //right side
  {
   yA += speedAy;
  }
  else if ((xA >= width-width) && (yA == height-diamA)) //bottom side
  {
   xA = xA - speedAx;
  }
  else if ((xA <= diamA) && (yA > height-height)) //left side
  {
    yA = yA - speedAy;
  }
}

void drawFigures()
{
  noStroke();
  ellipseMode(CORNER);
  figure(xA, yA, diamA); //orange ellipse
  figure(xB, yB, diamB, ellipseColorB); //green ellipse
}

void figure(float xA, float yA, float diamA)
{
  fill(ellipseColorA);
  ellipse(xA, yA, diamA, diamA);
}

void figure(float xB, float yB, float diamB, color ellipseColorB)
{
  fill(ellipseColorB);
  ellipse(xB, yB, diamB, diamB);
}


