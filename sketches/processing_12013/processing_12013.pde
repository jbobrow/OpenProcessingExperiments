
// ftp://69.31.121.43/developer/presentations/2005/GDC/Sponsored_Day/GDC_2005_VolumeRenderingForGames.pdf
int px = 0;
int py = 0;
void setup()
{
  size(640,480);
  
  st = 0;
}
class vRes
{
  PVector c;
  float   a;
  vRes( PVector _c, float _a )
  {
      c = _c;
      a = _a;
  }
}

PVector intSphereBound( PVector sp, float r2, PVector ro, PVector dir)
{
  PVector  d = new PVector();
  d.set( ro);
  d.sub( sp);
  float c = d.dot(d) - r2*r2;
  float b = d.dot(dir);
  float t = b*b-c;
  if ( t > 0.0f) {
    float st =sqrt(t);
    t = -b-st;
    return new PVector( max( -b-st, 0.f), max( -b+st, 0.f),0.f);
  }
  return new PVector( -1.f, -1.f);
}


void doRay( Raymarcher marcher )
{
  PVector origin = new PVector(0.f,0.f,-4.f);
    PVector dir = new PVector( -width/2,-height/2,width);
    dir.add( new PVector( px, py,0.0));
    dir.normalize();
    
    PVector c =marcher.integrate( origin, dir);
    
    c.mult( 255.);
    // should do gamma
    set( (int)px,(int)py,color(c.x,c.y,c.z));
    px++;
}
int g_CurrentVolume=0;
float oldtime = 0;
float st;
void mousePressed()
{
  g_CurrentVolume= (g_CurrentVolume+1)%Volumes.length;
  py=0;
  st = 0;
  
}
void draw()
{
   if ( py == 0)
     background(0);
  
    // lets do a ray
    Raymarcher marcher = new Raymarcher( Volumes[g_CurrentVolume], 0.04f);
   for (int i =0; i < 16; i++)
    {
      px=0;
      for (int j =0; j < width; j++)
         doRay(marcher);
         
       if ( py < height)
         py+=2;
       else if (st == 0)
       {
         st = 1;
         py=1;
       }         
    }
}

