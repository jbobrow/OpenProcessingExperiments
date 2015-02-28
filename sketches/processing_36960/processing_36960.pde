
int iter = 5;
Hand h,g,f;
void setup( )
{
  size( 800,400 );
  smooth();
  background(220,220,190);

  h = new Hand(0,1*height/9,4,0,1.0,2.0,new Nib(1.5,color(0,0,100)),7,3,-2,19);
  g = new Hand(0,2*height/9,2.5,0,0.5,1.0,new Pen(1.6,color(100,0,0)),3,5,7,-11);
  f = new Hand(0,3*height/9,3,0,0.5,1.5,new Nib(2,color(0,0,0)),-3,5,-7,23);
}

void draw( )
{
  float dt = 1/30.0;

  for( int i=0; i<iter; i++)
  {
    h.update( dt );
    g.update( dt );
    f.update( dt );
  }
}
// -----------
class Hand
{
  Pen pen;
  int na;
  Arm []a;
  float xpos ;
  float ypos ;
  float vx,vy;
  float sx,sy;
  float px,py;


  Hand( float xi, float yi, float vxi, float vyi, float sxi, float syi,Pen peni,
         int a1,int a2, int a3, int a4 )
  {
    pen = peni;
    
    na = 4;
    a = new Arm[na];
  // 7,3,-2.19
    a[0] = new Arm( 5,0,2*PI/a1);
    a[1] = new Arm( 5,0,2*PI/a2);
    a[2] = new Arm( 5,0,2*PI/a3);
    a[3] = new Arm( 5,0,2*PI/a4);
  
    xpos = xi;
    ypos = yi;
    vx = vxi;
    vy = vyi;
    sx = sxi;
    sy = syi;
  }
  
  void update( float dt )
  {
  int i,j;
   float l = dist(0,0,vx,vy);
   float rx = vx/l;
   float ry = vy/l;
   
    for(i=0; i<na;i++)
    {
      a[i].update(dt);
    }
    
    float x = 0;
    float y = 0;
    for( i=0; i<na; i++)
    {
      x += cos(a[i].a)*a[i].l;
      y += sin(a[i].a)*a[i].l;
  
    }
    x *= sx;
    y *= sy;
    float xp = xpos + x*rx - y*ry;
    float yp = ypos + y*rx + x*ry;
    pen.drawTo( xp,yp);
    
    xpos += dt*vx;
    ypos += dt*vy;

    if( xpos >width )
    {
      xpos = 0;
      ypos += height*3/9;
      pen.first = true;
    }
    
  }
  
}
// -----------
class Arm
{
  float l;
  float a;
  float w;
  
  Arm( float li, float ai, float wi )
  {
    l = li;
    a = ai;
    w = wi;
  }
  
  void update( float dt )
  {
    a += w*dt;
    if( a>PI ) a -= 2*PI;
    if( a<-PI ) a+= 2*PI;
  }
}

// -----------
class Pen
{
  boolean first;
  float px,py;
  float sz;
  color c;
  
  Pen( )
  {
    first = true;
    sz = 1.0;
    c = color(0,0,0);
  }
  
  Pen( float szi, color ci )
  {
    first = true;
    sz = szi;
    c = ci;
  }
  void drawTo( float x, float y )
  {
    if( first )
    {
      px = x;
      py = y;
      first = false;
      return;
    }
    if( dist(px,py,x,y) <2 )
      return;
    stroke(c);
    strokeWeight(sz);
    line( px,py,x,y);
    px = x;
    py = y;
  }
}

// -----------
class Nib extends Pen
{
    
  Nib( float szi, color ci )
  {
    first = true;
    sz = szi;
    c = ci;
  }
  void drawTo( float x, float y )
  {
    if( first )
    {
      px = x;
      py = y;
      first = false;
      return;
    }
    if( dist(px,py,x,y) <2 )
      return;
    strokeWeight(1.0);
    stroke(c);
    line( px,py,x,y);
    fill(c);
    noStroke();
    quad( px-sz,py-sz,x-sz,y-sz,x+sz,y+sz,px+sz,py+sz);
    px = x;
    py = y;
  }
}









