
//Exam 3 practice
//Daniel C Lee

final int MAX = 100;
int [] x, y, dx, dy, edge;
color[] col;

void setup()
{
 size(400, 700);
 rectMode(CENTER);
 frameRate(24);
 stroke( 255);
 
 x = new int [MAX];
 y = new int [MAX];
 dx = new int [MAX];
 dy = new int [MAX];
 edge = new int [MAX];
 col = new color [MAX];
 
 initializeIntArray( x, 0, width);
 initializeIntArray( y, 0, 1);
 initializeIntArray(dx, 1, 8);
 initializeIntArray(dy, 1, 8);
 initializeIntArray( edge, 15, 50);
 initializeColorArray();
}

void initializeIntArray(int [] array, int small, int big)
{
  for (int i = 0; i < array.length; i++)
  {
   array[i] = int (random(small, big));
  }
  
}

void initializeColorArray()
{
 for ( int i = 0; i < col.length; i++)
 {
  col[i] = color(random(255), random(255), random(255));
 } 
}

void draw()
{
 background(0);
 moveFigures();
 drawFigures(); 
}

void moveFigures()
{
  int i = 0;
  for (i = 0; i < x.length; i++)
  {
 //code this function
 x[i] = x[i]+ dx[i];
 y[i] = y[i]+ dy[i];
  }
 bounceFigures();
 wrapFigures();
}

void bounceFigures()
{
  int i = 0;
  for(i= 0; i< x.length; i++)
  {
   if(x[i] + dx[i] > width || x[i] + dx [i] < 0 )
 {
 dx[i] = dx[i] * -1;
 }  
 }
}

void wrapFigures()
{
 int i = 0;
 for(i =0; i < x.length; i++)
 {
   if(y[i] + dy[i] > height)
   {
    y[i] = -40; 
   }
 } 
}


void drawFigures()
{
 for (int i = 0; i < x.length-1; i++)
 {
  fill(col[i]);
  rect(x[i], y[i], edge[i], edge[i]);
  line(x[i+1], y[i+1], x[i], y[i]);
 } 
 fill(col[x.length-1]);
 rect(x[x.length-1], y[x.length-1], edge[x.length-1], edge[x.length-1]);
 line( x[x.length-1], y[x.length-1], x[0], y[0]);
}
  

