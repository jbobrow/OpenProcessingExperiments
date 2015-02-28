
//Copyright Michelle Guarino. All Rights Reserved.
//HW 11


int MAX = 10;

float [] wd; 
float [] ht; 
float [] x; 
float [] y; 
float [] dx; 
float [] dy;
float [] xspeed;
float [] yspeed;
color [] col;

void setup ()
{
  size (600,600);
  
  x= new float [MAX];
  firstArray (x,50,width-50);
  
  y= new float [MAX];
  firstArray (y,50,height-50);
  
  wd= new float [MAX];
  firstArray (wd,0,width*.1);
  
  ht= new float [MAX];
  firstArray (ht,0,height*.1);
  
  dx= new float [MAX];
  firstArray (dx,5,15);
  
  dy= new float [MAX];
  firstArray (dy,5,15);
  
  col= new color [MAX];
  colorArray ( ); 
}


void draw () 
{
  display ();
  bouncingcircles ();
  drawcircles ();
}


void firstArray( float [] thearray, float low, float high)
{
    for (int i = 0; i < thearray.length; i++) 
    {
    thearray[i]=int(random(low,high));
    } 
}


void colorArray ()
{
  for (int i = 0; i < col.length; i++) {
  col[i]=color(random(255),random(255),random(255));
  }
}

void bouncingcircles ()
{
 for (int i = 0; i < x.length; i++) {
  x[i]+=dx[i];
  if (x[i] > width) 
  {
  dx[i]=-dx[i];
  }
  if (x[i] < 0)
  {
  dx[i]=-dx[i];
  }


  y[i]+=dy[i];
  if (y[i] > height) 
  {
  dy[i]=-dy[i];
  }
  if (y[i] < 0)
  {
  dy[i]=-dy[i];
  }
 }
}

void drawcircles ()
{
 for (int i = 0; i < MAX; i++) {
    fill (col[i]);

 ellipse (x[i],y[i], wd[i], ht[i]); 
 } 
}

void display ()
{
strokeWeight (0);
fill (255,255,255,90);
rect (0,0,width,height);
}

