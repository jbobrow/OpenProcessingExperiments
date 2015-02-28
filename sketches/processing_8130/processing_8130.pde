
/** 
 *
 * Voronoi diagram animation
 * by Ben Chun (ben@benchun.net)
 *
 * 19 October 2009
 *
 **/

Site[] sites;

static int NUM_SITES = 8;
static int SITE_MAX_VEL = 2;
static int SITE_MARKER_SIZE = 6;


float fps = 0;

void setup()
{
  size(400,400);
  
  /* P2D mode gives about 3x better performance than the default JAVA2D
     but changes how some things look. For example, smooth() isn't smooth. */
  //size(800,600, P2D);
  
  smooth();
  sites = new Site[NUM_SITES];
  for(int i=0; i<sites.length; i++)
  {
    sites[i] = new Site();
  }
}

void draw()
{
  float start = millis();
  
  drawRegions();
  drawSites();
  moveSites();
  
  float end = millis();
  float elapsed = end - start;
  float current_fps = 1000/elapsed;
  if (abs(current_fps - fps) > 0.5)
  {
    fps = current_fps;
    println("FPS: "+round(fps));
  }
}

void drawRegions()
{
  loadPixels(); // must call before using pixels[]
 
  for(int x=0; x<width; x++)
  {
    for(int y=0; y<height; y++)
    {
      float minDist = width+height;
      int closest = 0;
      for(int i=0; i<sites.length; i++)
      {
        Site s = sites[i];
        float d = dist(x,y, s.x, s.y);
        if (d<minDist)
        {
          closest = i;
          minDist = d;
        }
      }
      
      /* the naive, slow way */
      //stroke(sites[closest].c);
      //point(x,y);

      /* set() is about 3x faster in P2D mode (just as slow as stroke/point in JAVA2D) */
      //set(x,y,sites[closest].c);

      /* pixels[] is about 10x faster in P2D and 4x faster in JAVA2D */
      pixels[y*width+x] = sites[closest].c;
    }
  }
  updatePixels(); // must call after using pixels[]
}

void drawSites()
{
  for(int i=0; i<sites.length; i++)
  {
    Site s = sites[i];
    fill(255, 128);
    stroke(0);
    ellipse(s.x, s.y, SITE_MARKER_SIZE, SITE_MARKER_SIZE);
  }
}

void moveSites()
{
  for(int i=0; i<sites.length; i++)
  {
    Site s = sites[i];
    s.move();
  }
}



class Site
{
  float x, y;
  color c;
  PVector vel;
  
  Site()
  {
    x = random(width);
    y = random(height);
    c = color(random(128), random(128,192), random(128,255));
    vel = new PVector(random(-SITE_MAX_VEL,SITE_MAX_VEL), random(-SITE_MAX_VEL,SITE_MAX_VEL));
  }
  
  void move()
  {
    x += vel.x;
    y += vel.y;
    if ((x<0) || (x>width)) vel.x *= -1;
    if ((y<0) || (y>height)) vel.y *= -1;
  }
}

