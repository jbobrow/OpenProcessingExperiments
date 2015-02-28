
///Copyright Sophie Vennix, siv;
///Homework8
///March 18, 2014

///changes number of triangles; 
final int MAX = 80;

float [] xVals = new float [MAX];
float [] yVals = new float [MAX];
//float [] dim = new float [MAX];
color [] shapeCol = new color [MAX];
float [] deltaX = new float [MAX];
float [] deltaY =  new float [MAX];
///sw = star width
float sw = 80;

void setup()
  { 
    size(600,400); 
    for (int i = 0; i<xVals.length; i++)
    {
      xVals[i] = width/2-xVals[i]/2;
      yVals[i] = height/2;
      
      shapeCol[i] = color(random(255), random(255), random(255), random(0,200));
     
      deltaX[i] = random(1,6);
      deltaY[i] = random(1,6);
    }
  }
  
void draw()
{
  fill(0);
  rect( 0, 0, width, height );
  drawShapes();
  moveShapes(); 
}

void drawShapes(){
  for (int i = 0; i<xVals.length; i++){
    shapes(i);
  }
}

void shapes (int i){
  float x = xVals[i];
  float y = yVals[i];
  
  noStroke();
  fill(shapeCol[i]);
  //triangle(x,y, x+x/3, y-2*y/3, x+ 2*x/3, y);
  //triangle(x, y-y/3, x+x/3, y+y/3, x+2*x/3, y-y/3);
  triangle(x,y, x+sw, y-2*sw, x+ 2*sw, y);
  triangle(x, y-sw, x+sw, y+sw, x+2*sw, y-sw);
}

void moveShapes()
{
  for (int i =0; i<xVals.length; i++)
  {
    xVals[i] = xVals[i] + deltaX[i];
    yVals[i] = yVals[i] + deltaY[i];
    
    //if shape goes too far left or too far right, bounce back
    if (xVals[i] < 0-sw)
      {
        deltaX[i] = - deltaX[i];
        deltaY[i] = deltaY[i];
      }
    if (xVals[i] > width-sw)
      {
        deltaX[i] = - deltaX[i];
        deltaY[i] = deltaY[i];
      }
      
    //if shape goes too far up or down, bounce back;
    if (yVals[i] < 0)
      {
        deltaY[i] = - deltaY[i];
        deltaX[i] =  deltaX[i];
      }
    if (yVals[i] > height){
      deltaY[i] = - deltaY[i];
      deltaX[i] = deltaX[i];
    }
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    setup();
  }
  else
  {
    exit();
  }
}



