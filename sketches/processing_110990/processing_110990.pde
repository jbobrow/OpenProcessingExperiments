
float arrowTime = 5.0;
boolean flipTopBottom = true;
boolean flipLeftRight = true;
boolean bigShip = false;
boolean showCircle = true;
 
float flame[]=
{
  -0.75*4, 0.5*4,
  -1.75*4, 0.0*4,
  -0.75*4, -0.5*4
   
};
 
float ship[]=
{
  2.0*4, 0.0*4,
  -1.0*4, -1.0*4,
  -0.5*4, 0.0*4,
  -1.0*4, 1.0*4,
  2.0*4, 0.0*4
};
 
class Ship {
  boolean thrust;
  boolean turnLeft;
  boolean turnRight;
  float a;
  float x,y;
  float vx,vy;
   
  void Move( float sec )
  {
    int tt= 0 ;
     
    x = x+vx;
    y = y+vy;
    if( thrust )
    {
      float spd = 0.4;
      float tx = cos(a)*spd;
      float ty = sin(a)*spd;
      vx = vx +sec*tx;
      vy = vy +sec*ty;
    }
    if( turnLeft )
    {
      tt = -1;
    }
    else if( turnRight )
    {
      tt = 1;
    }
    a += tt*sec*3;
    while( a > PI ) a -= TWO_PI;
    while( a < -PI ) a += TWO_PI;
    if( y<0 || y>=height )
    {
      y = (y+height) %height;
      if( flipTopBottom )
      {
        x = width-x;
        vx = -vx;
        a = PI -a;
        if( a> PI ) a-=TWO_PI;
      }
    }
     
    if( x<0 || x>=width )
    {
      x = (x+width)%width;
      if( flipLeftRight )
      {
        y = height-y;
        vy = -vy;
        a = -a;
      }
    }
     
  }
   
  void Draw(  )
  {
    drawShape( 5, ship, x, y, a, showCircle );
    if( thrust) drawShape( 3, flame, x, y, a,false );   
  }
   
};
 
Ship myShip;
int lastMillis;
 
void setup( )
{
    size( 640,360 );
    smooth();
     
    myShip = new Ship();
    myShip.thrust = false;
    myShip.turnLeft = false;
    myShip.turnRight = false;
    myShip.a = -PI/2;
    myShip.x = 2*width/3;
    myShip.y = height/2;
    myShip.vx = myShip.vy = 0;
     
    lastMillis = millis();
}
 
void draw( )
{
  int tmp = millis();
    float sec = (tmp-lastMillis)/1000.0;
    lastMillis = tmp;
     
    myShip.thrust = joyUp;
    myShip.turnLeft = joyLeft;
    myShip.turnRight = joyRight;
     
    myShip.Move( sec );
     
    background( 0 );
    stroke(192);
    strokeWeight(1.75);
     
    myShip.Draw();   
    noFill();
 
  if( arrowTime>0  || true)
  {
    int t=height/2-50,b=height/2+50;
    int l=width/3-50,r=width/3+50;
    int m=10;
    int a = min( 255, 128+floor(arrowTime*255/2));
     
    noStroke();
    fill(100,100,128,64*a/255);
    rect( l-m,t-m,2*m+r-l,2*m+b-t);
    stroke(255,255,255,a);   
    arrowLine( l,t,r,t,flipTopBottom);
    arrowLine( l,b,r,b,false);
    arrowLine( l,t,l,b,flipLeftRight);
    arrowLine( r,t,r,b,false);
     
    if( arrowTime>0 )
      arrowTime -= sec;
  }
}
 
void drawShape( int np, float shp[], float x, float y, float r, boolean showCircle)
{
  int i;
  int ox,oy;
   
 
  for( ox = -width; ox<=width; ox+=width)
  {
    for( oy = -height; oy<=height; oy+=height )
    {
      if( true )
      {
        pushMatrix();
        float sx=1,sy=1;
        if( oy!=0 && flipTopBottom )
        {
          translate(width,0);
          scale(-1,1);
        }
        if( ox!=0 && flipLeftRight )
        {
          translate(0,height);
          scale(1,-1);
        }
        translate( x+ox, y+oy );
        rotate( r );
        if( showCircle )
        {
          noStroke();
          fill(100,100,128,64);
          ellipse( 0,0,80,80);
        }
        if( bigShip )
          scale(3);
 
        noFill();
        stroke(255);
        for( i=0; i<np; i++)
        {
          int j=(i+1)%np;
          line( shp[i*2],shp[i*2+1],shp[j*2],shp[j*2+1]);
        }
        popMatrix();
      }
    }
  }
}
 
void arrowLine( int x1,int y1, int x2, int y2, boolean flip)
{
  int s = 12;
  int dx = x2-x1;
  int dy = y2-y1;
  int xm = (x1+x2)/2;
  int ym = (y1+y2)/2;
  line( x1,y1,x2,y2 );
  if( flip )
  {
    dx = -dx;
    dy = -dy;
  }
  xm += dx/(2*s);
  ym += dy/(2*s);
  line( xm,ym, xm-dx/s-dy/s,ym-dy/s+dx/s);
  line( xm,ym, xm-dx/s+dy/s,ym-dy/s-dx/s);
}
 
 
boolean joyUp;
boolean joyDown;
boolean joyLeft;
boolean joyRight;
 
void keyPressed( )
{
  if( keyCode==UP ) joyUp = true;
  if( keyCode==DOWN ) joyDown = true;
  if( keyCode==LEFT ) joyLeft = true;
  if( keyCode==RIGHT ) joyRight = true;
   
  if( key=='t' )
  {
    flipTopBottom = !flipTopBottom;
    arrowTime = 5;
  }
  if( key=='l' )
  {
    flipLeftRight = !flipLeftRight;
    arrowTime = 5;
  }
  if( key=='c' )
  {
    showCircle = !showCircle;
  }
  if( key=='s' )
  {
    bigShip = !bigShip;
  }
}
 
void keyReleased( )
{
  if( keyCode==UP ) joyUp = false;
  if( keyCode==DOWN ) joyDown = false;
  if( keyCode==LEFT ) joyLeft = false;
  if( keyCode==RIGHT ) joyRight = false;
}
