
// HW 12
// Copyright Felipe Castelblanco, Nov 2011
 
final int MAX = 120; // constant

int [] balls, lig, x, y, deltaX, deltaY, deltaZ, w, h; // arrays
color [ ] col; // Color array

void setup ()
{
  size (600, 600, P3D);
  balls = new int [MAX];
  lig = new int [MAX];
  x = new int [MAX];
  y = new int [MAX];
  w = new int [MAX];
  h = new int [MAX];
  deltaX = new int [MAX];
  deltaY = new int [MAX];
  deltaZ = new int [MAX];
  
  //initializers//
  x = initialize2d (0,width);
  y = initialize2d (0,height);
  
  w = initialize2d (0,width);
  h = initialize2d (0,height);
  
  deltaZ = initialize2d ( -50, 50);
  deltaX = initialize2d ( -10, 10);
  deltaY = initialize2d ( -5, 5);
  
  balls = initialize2d (0,100);
  
  col = intColor ();
  

 noStroke();
 frameRate(25);

}

void draw ()
{
  
background (255);  
ballsDraw ();
MoveObjects();

}

void ballsDraw( )
{
 
  
 
 for ( int i = 0; i < x.length; i++)
 { 
 fill (col[i],1);
 rect (x[i] , y[i], i, i);
 
 }
 
directionalLight(200, 150, 226, 0, 0, -1);
 translate (width/2,height/2,0);
 
 for (int j = 0; j < balls.length; j++)
 {

translate (x[j]-width/2,y[j]-height/2,deltaZ[j]);

 fill(col [ j ], col[j]);
 box(balls[j]);
 
} 

}

void MoveObjects()
{
 for (int i = 0; i < MAX; i++)
{ 
 x[i] = x[i] + deltaX[i]; //move around
 y[i] = y[i] + deltaY[i]; //move around
 
 if (x[i] > width + w[i] || x[i] < -w[i])
 {
   deltaX[i] = deltaX[i] *-1;
 }
 
 if (y[i] > height + h[i] || y[i] < -h[i])
 {
   deltaY[i] = deltaY[i] *-1;
 }
 
} 
  
}

int [ ] initialize2d ( int w, int h)
{
  int [ ] tempIn = new int [MAX];
  for (int i = 0; i < tempIn.length ; i++ )
  {
    tempIn[ i ] = int(random(w,h));
  }
  
  return tempIn;
}


color [ ] intColor ( )
{
  color [ ] tempCol = new color [MAX];
  
  for (int i = 0; i < tempCol.length; i++)
  {
    int redC = int (random(200));
    int greenC = int(random(200));
    int blueC = int(random(200));
    
    tempCol [ i ] = color (redC, greenC, blueC);
  }
  
  return tempCol;
    
  }
  


