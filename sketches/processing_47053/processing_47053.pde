
//hw12, november 2011
//copyright manuela kind, cmu pittsburgh pa

//--------variables-------
final int MAX = 100;
int [] x, y, wd, ht, dx, dy;
color [] col;

//---------setup---------

void setup()
{
size (600,600);
smooth();

x = new int [MAX];     //pos x
y = new int [MAX];     //pos y
wd = new int [MAX];    //width
ht = new int [MAX];    //height
dx = new int [MAX];    //deltax
dy = new int [MAX];    //deltay
  
col = new color [MAX]; //color

initializeArray(x, width-width, width);  //setting "certain" array size between smallest, largest value
initializeArray(y, height-height, height);  

initializeArray(wd, 5, 50);  
initializeArray(ht, 5, 50);  

initializeArray(dx, -10, 10);  
initializeArray(dy, 3, 10);  

initializeColorArray (col);
}

//---------draw----------

void draw()
{
background (150,200,250);

drawF(); 
moveF();
  
}

//------initialize-------

//figure-arrays
void initializeArray (int [] array, int small, int large)
{
for (int i = 0; i < array.length; i++)
  {
  array[i] = int (random (small, large));
  }
}

//color
void initializeColorArray (color [] col)
{
for ( int i = 0; i < col.length; i++)  
  {
  col [i] = color (random(225,255), random(225,255), random(225,255), 75);
  }
}

//---------figures-------
void drawF()
{
for (int i=0; i< MAX; i++)
  {
  stroke(255,150);
  fill(col[i]);
  ellipse(x[i], y[i], wd[i], wd[i]);
  }
}

//--------moving---------
void moveF()
{
  for (int i = 0; i < MAX; i++)
  {
  y [i] = y[i] - dy[i];
  
    if (y[i] < height-height)
    {
    y [i] = height+100;
    x [i] = int (random(width));
    redraw();
    }
  
  x [i] = x[i] - dx[i];
     
    if (x[i] < width-width && x[i] > width)   
    {
    y [i] = int (random(height));
    x [i] = width+100;
    }
  
  }
}



