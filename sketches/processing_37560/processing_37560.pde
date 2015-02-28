
int [][]nearest;
float s = 0.5;
int maxp = 1000;
int np;
int[] x;
int[] y;
int c;
int fadeCount;

void setup()
{
  size(512,256);
  background(255);
  smooth();

  x = new int[maxp];
  y = new int[maxp];
  nearest = new int[height][width];

  c=0;
  restart();
  fadeCount=0;
}

void draw()
{
  int u=0,v=0;
  int p,q;
  int i;
  float farthest = 0;

  if( fadeCount>40 )
  {
    --fadeCount;
    return;
  }
  else if(fadeCount>0)
  {
    fill(255,255,255,6);
    rect(0,0,width,height);
    --fadeCount;
    return;
  }

  if( random(1)<0.6 )
    return;

  if( np>=maxp )
    return;

  for( q=0; q<height; q++ )
  {
    for( p=0; p<width; p++ )
    {
      int nr = nearest[q][p];
      float nearestDist=dist(p,q,x[nr],y[nr]);


      if( nearestDist>farthest )
      {
        u = p;
        v = q;
        farthest = nearestDist;
      }
    }
  }

  if( farthest>0 && np<maxp )
  {
    x[np] = u;
    y[np] = v;
    noStroke();
    switch( c%3 )
    {
    default:  
    case 0: 
      fill(255,0,0,60);
      break;
    case 1: 
      fill(0,255,0,60);
      break;
    case 2: 
      fill(0,0,255,60);
      break;
    }
    ellipse( x[np],y[np],2*farthest*s,2*farthest*s);
 
    ++np;
    if( np>=maxp || farthest <17 )
      restart();
    else
      checkNewPoint();
  }
}

void checkNewPoint( )
{
  int p,q;
  int nu = np-1;
  for( q=0; q<height; q++)
  {
    for( p=0; p<width; p++ )
    {
      int nr = nearest[q][p];
      if( dist(p,q,x[nu],y[nu]) < dist(p,q,x[nr],y[nr]) )
        nearest[q][p] = nu;
    }
  }
}


void restart( )
{
  noStroke();
  fadeCount = 100;

  x[0] = floor(random(width));
  y[0] = floor(random(height));
  np = 1;
  s = 1.0/3;
  ++c;

  int p,q;
  for( q=0; q<height; q++)
  {
    for( p=0; p<width; p++ )
    {
      nearest[q][p] = 0;
    }
  }
}




