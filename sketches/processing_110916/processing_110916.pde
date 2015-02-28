
int [][]g;
int gw,gh;
int nc,ndead;
int grain = 4;
Cutter [] c;
int iter = 0;
int numdir = 8;
 
void setup( )
{
  size(700,350,P2D);
   
  fullRestart(); 
}
 
void draw( )
{
  int i;
 
  for( i=0; i<nc; i++)
  {
    c[i].draw();
  }
  for( i=0; i<nc; i++)
  {
    c[i].move();
  }
   
  if( ndead >= 2*nc )
    restart();
}
// -----------------------
void fullRestart( )
{
  background(255);
   
  iter = -1;
  gw = width;
  gh = height;
  g = new int[gh][gw];
 
  restart();
}
 
void restart( )
{
  ++iter;
  numdir = floor(random(4,9));
   
  int i;
  ndead = 0;
  nc = 100;
  c = new Cutter[nc];
  for( i=0; i<nc; i++)
  {
    c[i] = new Cutter( gw,gh);
  }
   
  int s = iter*32;
  if( s>3256-32 )
    s = 255-32;
  stroke( s );
  //stroke( floor(random(255)),floor(random(255)),floor(random(255)));
}
// -----------------------
void keyPressed( )
{
  if( key==' ')
    fullRestart();
}
 
// -----------------------
class Cutter
{
  boolean []alive = new boolean[2];
  int []x = new int[2];
  int []y = new int[2];
  int []d = new int[2];
   
  Cutter( int w, int h )
  {
    int p,q;
    int watchdog=0;
     
    do {
      p = floor(random(w/grain))*grain;
      q = floor(random(h/grain))*grain;
      if( ++watchdog > 100 )
        break;
    } while( g[q][p]>0 );
    if( watchdog>100 )
    {
      alive[0]=alive[1]=false;
      ndead +=2;
    }
    else
    {
      g[q][p] = 1;
      x[0]=x[1]=p;
      y[0]=y[1]=q;
      alive[0]=alive[1]=true;
      d[0] = floor(random(numdir));
      do {
        d[1] = floor(random(numdir));
      } while( d[0]==d[1]);
    }   
  }
   
  void draw( )
  {
    int i;
    for( i=0; i<2; i++)
    {
      if( !alive[i] )
        continue;
      point( x[i],y[i] );
    }
  }
   
  void move( )
  {
    int i;
    for( i=0; i<2; i++)
    {
      if( !alive[i] )
        continue;
      switch(d[i])
      {
        case 0: x[i]+=1;break;
        case 1: x[i]-=1;break;
        case 2: y[i]+=1;break;
        case 3: y[i]-=1;break;
        case 4: x[i]+=1;y[i]+=1;break;
        case 5: x[i]+=1;y[i]-=1;break;
        case 6: x[i]-=1;y[i]+=1;break;
        case 7: x[i]-=1;y[i]-=1;break;
      }
      if( x[i]<0 || x[i]>=gw || y[i]<0 || y[i]>=gh || g[y[i]][x[i]]>0 )
      {
        alive[i]=false;
        ++ndead;
      }
      else
      {
        g[y[i]][x[i]] =1;
      }
    }
  }
}
