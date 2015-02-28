


PFont font;
int radius = 300;
int ox = 350;
int oy = 350;
Clock  myClock;


void setup() {
  int j;
  font = loadFont("ArialMT-20.vlw");
  textFont(font);
  size( ox*2,oy*2 );
  smooth();
  strokeWeight(0.5);
  myClock = new Clock( ox, oy, radius, 16 );
}

void draw() {
  background(255);

  myClock.draw();
}


class Clock {
  float  cx;
  float  cy;
  float  rad;
  int    npoint;
  String[]  legend;
  int[]  path;
  int    pathlen;
  float  pathshow;

  Clock( float icx, float icy, float irad, int inpoint )
  {
    int j;
    int k;
    cx = icx;
    cy = icy;
    rad = irad;
    setnpoint( inpoint );
    pathshow=0;
  }
  
  void setnpoint( int inpoint )
  {
    int j,k;
    npoint = inpoint;
    legend = new String[npoint];
    path = new int[npoint*2];
    pathlen = 0;
    for( j=0; j<npoint; j++)
    {
      legend[j] = "";
    }
    
    k = 0;
    for( j=0;j<npoint;j++ )
    {
      k += j;
      label( k, ""+j );
      path[pathlen] = k;
      pathlen += 1;
    }  }

  void label( int pt, String s )
  {
    legend[ pt % npoint ] = s;
  }
  

  float xpos( int pt )
  {
    pt = pt% npoint;
    float a = pt*TWO_PI/npoint;
    return rad*sin(a);
  }

  float ypos( int pt )
  {
    pt = pt% npoint;
    float a = pt*TWO_PI/npoint;
    return -rad*cos(a);
  }

  void draw( )
  {
    noFill();
    stroke(128);
    ellipse( cx,cy,rad*2,rad*2);
    fill(0);
    stroke(0);
    int j;

    textAlign(CENTER,CENTER);
    for( j=0; j<npoint; j++)
    {
      float x = xpos(j);
      float y = ypos(j);
      ellipse( cx+x, cy+y, 3, 3 );

      if( npoint<=32 )
      {
        if( j<=pathshow )
        {
          x = xpos(path[j]);
          y = ypos(path[j]);
          text( ""+j, cx+x*1.1, cy+y*1.1);
      }
     
          
      //text( legend[j], cx+x*1.1, cy+y*1.1);
      }
    }
    
    float ps = pathshow;
    for( j=0; j<pathlen-1; j++ )
    {
      int a = path[j];
      int b = path[j+1];
      float dx = xpos(b)-xpos(a);
      float dy = ypos(b)-ypos(a);
      if( ps >= 1 )
        line( cx+xpos(a),cy+ypos(a), cx+xpos(b),cy+ypos(b));
      else
        line( cx+xpos(a),cy+ypos(a), cx+xpos(a)+ps*dx,cy+ypos(a)+ps*dy);
      ps -= 1;
      if( ps<= 0 )
        break;
    }
    
    pathshow += 0.02;
    if( pathshow > pathlen )
      pathshow = pathlen;

 
  }
}

