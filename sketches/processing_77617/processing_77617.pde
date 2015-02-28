
//Patrick Clancy
//Homework 10
//Copyright, Patrick Clancy, Carnegie Mellon University, 2012

final int max = 50;

int [] rectOne;
int [] rectTwo;

int [] speed;
int [] speedTwo;

color [] col;
int [] siz;

void setup()
{ 
  size(400, 400);
  background(50, 130, 175);
  frameRate(10);
  noStroke();
  smooth();
  
  rectOne = new int [ max ];
  rectTwo = new int [ max ];
  
  siz = new int [ max ];
  
  speed = new int [ max ];
  speedTwo = new int [ max ];
  
  col = new int [ max ];
  
  myColor();
  
  myArray(rectOne, 10, 60);
  myArray(rectTwo, 150, 45);
  
  myArray(siz, 30, 123);
  
  myArray(speed, 50, 50);
  myArray(speedTwo, 11, 13);
  
}

void draw ()
{
  createRect ();
  moveRect ();
}

void myArray (int [] anyArray, int low, int high)
{
 for (int v=0; v < anyArray.length; v++)
  {
    anyArray[v] = int(random( low,high ));
  }
}
    
void myColor ()
{
 for (int v = 0; v < col.length; v++)
  {
  col[v] = color ((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  
  }
}
 
void createRect() 
{
   for (int v=0; v < max; v++)
 {
   fill(col[v],20);
   
   rect(rectOne[v], rectTwo[v], siz[v], siz[v]);
   rect(rectOne[v], rectTwo[v], siz[v], siz[v]);
   
 }
}
 
void moveRect() 
{
  for (int v=0; v < max; v++)
 
  {
    rectOne[v] = rectOne[v] + speed[v];
    if (rectOne[v] + (siz[v]/2) > width)
    {
      speed[v] = -speed[v];
    }
    if (rectOne[v] + (siz[v]/2) < -width)
    {
      speed[v] = -speed[v];
    }
    rectTwo[v] = rectTwo[v] + speedTwo[v];
      
    if (rectTwo[v] + (siz[v]/2) > height)
    {
      speedTwo[v] = -speedTwo[v];
    }
    if (rectTwo[v] + (siz[v]/2) < -height)
    {
      speedTwo[v] = -speedTwo[v];
    }
  }
}


  
  
  

