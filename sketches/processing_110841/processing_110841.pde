
PImage img;
int gw;
int gh;
int s = 2;
int nc = 3;
float speed = 1;
int frame=0;
int a1=20,a2=255;
int a = a1;
 
void setup()
{
  int i,j,k;
   
  size( 500,300,P2D);
   
 
  seed();   
 
}
 
void draw( )
{
  int j;
   
  if( frame<30 )
  {
    ++frame;
  }
  else
  {
    img.loadPixels();
    for(j=0; j<gw*gh*speed; j++)
      persuade( );
    img.updatePixels();
  }
  image( img,0,0,img.width*s,img.height*s );
}
 
 
void seed()
{
  int i,j,k;
 
  gw = width/s;
  gh = height/s;
  img = createImage( gw,gh, ARGB );
 
  img.loadPixels();
 
  for( k=i=0; i<gw; i++ )
  {
    for( j=0; j<gh; j++)
    {
      color c;
      switch( floor(random(nc)) )
      {
        default:
        case 0: c=color(0,0,0,a);break;
        case 1: c=color(255,255,255,a);break;
        case 2: c=color(200,0,0,a);break;
        case 3: c=color(0,100,160,a);break;
        case 4: c=color(64,192,0,a);break;
      }
      img.pixels[k++] = c;
    }
  }
  img.updatePixels();
  background(0);
  image( img,0,0,img.width*s,img.height*s );
  frame = 0; 
}
 
void persuade(  )
{
  int i1,j1;
  int i2,j2;
  int d;
   
  i2 = i1 = floor(random(gw));
  j2 = j1 = floor(random(gh));
   
  if( random(1)>0.5 )
    d= 1;
  else
    d= -1;
  if( random(1)>0.5 )
    i2 = (i2+gw+d)%gw;
  else
    j2 = (j2+gh+d)%gh;
   
   
  img.pixels[j1*gw+i1] = img.pixels[j2*gw+i2];
   
}
 
void drawCell( int i, int j, int a )
{
 
  rect( i*s,j*s,s,s);
}
 
void drawAll( int a )
{
  int i,j;
  noStroke();
  for( i=0; i<gw; i++ )
  {
    for( j=0; j<gh; j++)
    {
      drawCell( i,j,a );
    }
  }
}
 
 
 
void keyPressed( )
{
  if( key=='2' ) { nc=2;seed();}
  if( key=='3' ) { nc=3;seed();}
  if( key=='4' ) { nc=4;seed();}
  if( key=='5' ) { nc=5;seed();}
   
  if( key=='b' ) { a^=(a1^a2);seed();}
 
  if( key=='6' ) { s=1;seed();}
  if( key=='7' ) { s=2;seed();}
  if( key=='8' ) { s=3;seed();}
  if( key=='9' ) { s=4;seed();}
 
}
