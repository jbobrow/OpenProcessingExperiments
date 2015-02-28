
//hannah schmitt
//homework 11
//copyright hannah schmitt carnegie mellon university 2012

int MAX = 10;

float [] cx;
float [] cy;
float [] dcx;
float [] dcy;
color [] col;

void setup ()
{
  size (400, 400);
  background(153, 198, 245);
  
  cx= new float [MAX]; //setting array to a specific length
  cy= new float [MAX];
  dcx= new float [MAX];
  dcy= new float [MAX];
  col= new color [MAX]; 
  
  
  cx = initArray(cx, 0, width);
  cy = initArray(cy, 0, height);
  dcx= initArray(dcx, random(1,5), random(1,5));
  dcy= initArray(dcy, random(1,5), random(1,5));
  initColorArray();
 
  
  drawEllipse ();
}

void draw ()
{
 
 drawEllipse();
 bounceEllipse ();
}

float [] initArray (float [] any, float low, float high)
{
  for(int i= 0; i< any.length; i++)
  {
    any [i] = random(low, high);
  }
   return any;
}

void drawEllipse ()
{
  for (int i = 0; i< cx.length; i++)
  {fill(col [i]);
  stroke(random(255),random(255), random(255));
    ellipse(cx[i], cy[i], 20, 20);
  }
}

void bounceEllipse ()
{ 
  for (int i = 0; i< cx.length; i++)
  {
    
    println(dcx[i]);
    cx[i] += dcx [i];
    
    if (cx[i] > width || cx [i]< 0)
    {
    dcx[i] = -dcx[i];
    cx[i] += dcx [i];
    col [i] = color(int(random(255)), int(random(255)), int(random(255)));
  }
  
   cy[i] += dcy [i];
   if (cy[i] > height || cy [i]< 0)
    {
    dcy[i] = -dcy[i];
    cy[i] += dcy [i];
    col [i] = color(int(random(255)), int(random(255)), int(random(255)));
  }
  }
  
}
 

void initColorArray ()
{
  for(int i= 0; i< col.length; i++)
  {
   col [i] = color(int(random(255)), int(random(255)), int(random(255)));
  }
   
  
}



