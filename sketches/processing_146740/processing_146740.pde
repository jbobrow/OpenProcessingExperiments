
// Copyright 2014 Jacklynn PHam
// ICE 21

//int x, y, dim;

int dim;

int [] xVals = {0, 10, 20, 30, 40, 50, 60};
int [] yVals = {100, 200, 250, 350, 400, 520, 550};
int [] dX = { 2, 4, 6, 8, 10, 12, 14 };

//float dx;

color red, green, blue;

void setup()
{
  size(600, 600);

  stroke(255); 

  rectMode(CENTER);

  dim = 30;
//  x = 0;
//  y = 150;

//  dx = 5;

  red = color(255, 100, 100);
  green = color(200, 255, 150);
  blue = color(0, 150, 255);
}

void draw()
{
  background(200, 255, 150);
  drawCircles();
  //drawFigures();
  moveFigures();
 changeFigures();
}

void drawCircles()
{
  strokeWeight(3);
  fill(red);
  ellipse(width/2, height/2, width/3*2, height/3*2); //red circle
  fill(blue);
  ellipse(width/2, height/2, width/3, height/3); // blue circle
}

void changeFigures()
{
   for (int i = 0; i < xVals.length; i++) {
   strokeWeight(3);
   float  center = dist(width/2, height/2, xVals[i], yVals[i]);
  
  if ( center < width/6 || center < height/6) { 
    fill(0); 
    rect(xVals[i], yVals[i], dim, dim);
      }

 else if ( center < width/3 || center < height/3 ) {
    fill(0,255,0);
    ellipse(xVals[i], yVals[i], dim, dim); 
     }

  else {
    point(xVals[i], yVals[i]);
    }
  } 
}
void moveFigures()
{

 for (int i = 0; i < xVals.length; i++) {
   xVals[i] += dX[i]; // move right
   
  if (xVals[i] > width-20) {
    dX[i]=-dX[i]; // move left
  }
  if (xVals[i] < 0) { 
    dX[i]=-dX[i]; // move back right
    xVals[i]+=dX[i];
  }
  }
}

//void drawFigures()
//{
//  strokeWeight(5);
//  for (int i = 0; i < xVals.length; i++) {
//   point(xVals[i], yVals[i]);
//  }
//}



