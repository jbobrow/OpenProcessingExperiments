
int X, Y;
int directionx, directiony;

void setup()
{
  size(300,400);
  X = 0;
  Y = 180;
  directionx = 1;
  directiony = -1;
}

void draw()
{
 background(0,0,0);
  
 X += directionx * 1;
 Y += directiony * 1;
 if (X > 300)
  directionx = -1;
 if (X < 0)
  directionx = 1;
  
 if (Y > 400)
   directiony = -1;
 if (Y < 0)
   directiony = 1;
 
 ellipse(X,Y,40,40);
}


