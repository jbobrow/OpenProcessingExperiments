
/*
 This shows the mechanism driving my earlier Asemic Writing sketch.
   
 Only a subset of the original's features are supported.
  
 Original is here:
 http://www.openprocessing.org/visuals/?visualID=36960
 And the javascript version is here:
 http://www.openprocessing.org/sketch/111773 
*/
 
 
Hand h,f;
int lastMillis;
 
void setup( )
{
  size( 800,400 );
  smooth();
  background(220,220,190);
 
  h = new Hand(50,1*height/4,4*6,0,  5.0,5.0,new Nib(3,color(0,0,100)),7,3,-2,19);
  f = new Hand(50,3*height/4,4*6,0,  5.0,5.0,new Nib(3,color(100,0,0)),-3,5,-7,23);
  lastMillis = millis(); 
}
 
void draw( )
{
  int tmp = millis();
  float dt = (tmp-lastMillis)/1000.0;
  lastMillis = tmp;
  background(220,220,190);
   
  dt = min( dt,1/20.0);
     
  dt *= 1.5;
   h.update( dt );
   f.update( dt );
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
   float rx = 1;
   float ry = 0;
   float l = dist(0,0,vx,vy);
   if( l!=0)
   {
     rx = vx/l;
     ry = vy/l;
   }
 
 
    for(i=0; i<na;i++)
    {
      a[i].update(dt);
    }
     
    float [] ax = new float[na];
    float [] ay = new float[na];
    float x = 0;
    float y = 0;
    for( i=0; i<na; i++)
    {
      x += cos(a[i].a)*a[i].l;
      y += sin(a[i].a)*a[i].l;
      ax[i] = xpos + x*sx;
      ay[i] = ypos + y*sy;
    }
 
    pushMatrix();
    translate( width*0.8-xpos,0);
    x *= sx;
    y *= sy;
    float xp = xpos + x*rx - y*ry;
    float yp = ypos + y*rx + x*ry;
    pen.drawTo( xp,yp);
    pen.render();
 
    // draw machine [
    fill(0);
    noStroke();
    for( i=na-1; i>=0; i--)
    {
     noStroke();
        fill(0);
      if( i<na-1)
        ellipse(ax[i],ay[i],20,20);
      else
        ellipse(xpos,ypos,24,24);
      stroke(0);
      strokeWeight(12);
      if( i>0 )
        line(ax[i-1],ay[i-1],ax[i],ay[i]);
      else
        line(xpos,ypos,ax[i],ay[i]);
     }
 
    for( i=na-1; i>=0; i--)
    {
      noStroke();
      if( i<na-1)
      {
        fill(0);
        ellipse(ax[i],ay[i],16,16);
        fill(255);
        ellipse(ax[i],ay[i],14,14);
      }
      stroke(0);
      strokeWeight(8);
      if( i>0 )
        line(ax[i-1],ay[i-1],ax[i],ay[i]);
      else
        line(xpos,ypos,ax[i],ay[i]);
      stroke(255);
      strokeWeight(6);
      if( i>0 )
        line(ax[i-1],ay[i-1],ax[i],ay[i]);
      else
        line(xpos,ypos,ax[i],ay[i]);
   
      if(i==0)
      {
        noStroke();
        fill(0);
        ellipse(xpos,ypos,20,20);
        fill(255);
        ellipse(xpos,ypos,18,18);
      }
 
 
    }
    // ] machine
    popMatrix();
     
    xpos += dt*vx;
    ypos += dt*vy;
 
    if( false && xpos >width )
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
   
  void render()
  {
  }
}
 
// -----------
int maxq = 500;
class Nib extends Pen
{
  int nq;
  float[][] xq;
  float[][] yq;
   
  Nib( float szi, color ci )
  {
    nq = 0;
    xq = new float[maxq][4];
    yq = new float[maxq][4];
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
    if( dist(px,py,x,y) <6 )
      return;
 
    if( nq>=maxq )
    {
      int discard = 100;
      nq -= discard;
      for(int j=0; j<nq; j++)
      {
        for(int i=0; i<4;i++)
        {
          xq[j][i] = xq[j+discard][i];
          yq[j][i] = yq[j+discard][i];
        }
      }
    }
     
    xq[nq][0]=px-sz;yq[nq][0]=py-sz;
    xq[nq][1]=x-sz;yq[nq][1]=y-sz;
    xq[nq][2]=x+sz;yq[nq][2]=y+sz;
    xq[nq][3]=px+sz;yq[nq][3]=py+sz;
 
    ++nq;
    px = x;
    py = y;
  }
   
  void render( )
  {
    int i;
    for( i=0; i<nq; i++)
    {
      fill(c);
      noStroke();
      quad( xq[i][0],yq[i][0],
          xq[i][1],yq[i][1],
          xq[i][2],yq[i][2],
          xq[i][3],yq[i][3]);
    }
  }
}
