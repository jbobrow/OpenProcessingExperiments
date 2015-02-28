
int nmark;
int ntry;
void setup( )
{
  size( 400,400);
  smooth();
  
  reset();
  ntry = 16;
}

void draw( )
{
  int i;
  
  stroke(0,128);
  HowBad b = new Round();
  HowBad c = new Horiz();
  HowBad d = new Short();
  HowBad e = new Central();
  for(i=0; i<10 && nmark<1000; i++ )
  {
    ++nmark;
//    oneScratch();
    makeMark( b, ntry, 1,1,198,198);
    makeMark( c, ntry, 1,201,198,198);
    makeMark( d, ntry, 201,1,198,198);
    makeMark( e, ntry, 201,201,198,198);
  }
  
}

// ------------------------
class HowBad
{
  float badness( Mark m, int w, int h )
  {
    return random(1);
  }
}
// ------------------------
class Horiz extends HowBad
{
  float badness( Mark m, int w, int h )
  {
    float dx = abs( m.x1-m.x2);
    float dy = abs( m.y1-m.y2);
    if( dx==0 )
      dx = 0.1;
    return dy/dx;
  }
}

// ------------------------
class Short extends HowBad
{
  float badness( Mark m, int w, int h )
  {
    float d = dist(m.x1,m.y1,m.x2,m.y2);
    return d;
  }
}
// ------------------------
class Central extends HowBad
{
  float badness( Mark m, int w, int h )
  {
    float xc = w/2;
    float yc = h/2;
    float d = dist(xc,yc,m.x1,m.y1)+dist(xc,yc,m.x2,m.y2);
    return d;
  }
}

// ------------------------
class Round extends HowBad
{
  float badness( Mark m, int w, int h )
  {
    float xc = w/2;
    float yc = h/2;
      float d1 = dist(xc,yc,m.x1,m.y1);
      float d2 = dist(xc,yc,m.x2,m.y2);
      float d3 = dist(xc,yc,(m.x1+m.x2)/2,(m.y1+m.y2)/2);
      float mx = max(d1,d2);
      mx = max( mx,d3 );
      float v1 = abs(d1-d3)/mx;
      float v2 = abs(d2-d3)/mx;
      float v = max(v1,v2);
    return v;
  }
}

// ------------------------
class Mark
{
  float x1,y1,x2,y2;
  float badness;
  
  Mark( HowBad b, int w, int h )
  {
    x1 = random(w);
    x2 = random(w);
    y1 = random(h);
    y2 = random(h);
    badness = b.badness( this,w,h );
  }
}

// ------------------------
void makeMark( HowBad b, int tries, int x,int y,int w, int h )
{
  int i;
  Mark m = new Mark(b,w,h);
  
  for( i=1; i<tries; i++)
  {
    Mark mtmp = new Mark(b,w,h);
    if( mtmp.badness < m.badness )
      m = mtmp;
  }
  line( x+m.x1,y+m.y1, x+m.x2, y+m.y2);
}

// ------------------------

void keyPressed( )
{
  if( key==' ')
    reset();
}

void reset( )
{
  background(230,230,210);
  nmark = 0;
  ntry *= 4;
  if( ntry >5000 )
    ntry = 4;
}



