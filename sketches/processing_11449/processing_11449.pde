
// Flocking 1

// ************************* DRAWING VARIABLES ************************** 
final int WINDOW_WIDTH  = 480;
final int WINDOW_HEIGHT = 600;
final int FRAME_RATE = 40;

final int NUM_BOIDS = 40;
final int CENTER_PULL_FACTOR = 80000;
final float BOUNCE_ABSORPTION = 0.75;

final color backColor = color(0, 0, 0);

PFont font,fontM;


// ************************* GLOBAL VARIABLES ************************** 


Boid[] flock = new Boid[NUM_BOIDS];
Vector v1 = new Vector();
Vector v2 = new Vector();
Vector v3 = new Vector();
Vector v4 = new Vector();


void setup() 
{
  size(WINDOW_WIDTH, WINDOW_HEIGHT); 
  background(backColor);
  
  font  = loadFont("HelveticaNeue-Medium-15.vlw");
  fontM = loadFont("HelveticaNeue-Medium-30.vlw"); 
  
  textFont(font, 15);
  
  randomSeed(int(random(1,1000)));
  
  for(int i=0; i<NUM_BOIDS; ++i)
  {
    flock[i] = new Boid();
    flock[i].xpos = random(0, WINDOW_WIDTH);
    flock[i].ypos = random(0, WINDOW_HEIGHT);
    
    flock[i].vx = random(-0.5, 0.5);
    flock[i].vy = random(-0.5, 0.5);

  } 
  
  frameRate(FRAME_RATE);
  smooth();
}


void draw() 
{   
  background(255,255,255);
  
  fill(0,0,0);
  
  for (int i=0; i<NUM_BOIDS; ++i)
  {
    flock[i].drawMe();
    updateFlock();
  } 
  
  textFont(fontM, 30);
  text("money", mouseX-40, mouseY+5);
  
}

void updateFlock()
{
  for (int i=0; i<NUM_BOIDS; ++i)
  {
    v1 = rule1(flock[i]);
    v2 = rule2(flock[i]);
    v3 = rule3(flock[i]);
    v4 = rule4(flock[i]);
    
    // add vectors to velocities
    flock[i].vx += v1.x + v2.x + v3.x + v4.x;
    flock[i].vy += v1.y + v2.y + v3.y + v4.y;
    
    limitVelocity(flock[i]);
    
    // update new position with previously calculated velocities
    flock[i].xpos += flock[i].vx;
    flock[i].ypos += flock[i].vy;
    
    if (flock[i].xpos < 0 || flock[i].xpos > WINDOW_WIDTH)
	flock[i].vx = -flock[i].vx*BOUNCE_ABSORPTION;
	
    if (flock[i].ypos < 0 || flock[i].ypos > WINDOW_HEIGHT)
	flock[i].vy = -flock[i].vy*BOUNCE_ABSORPTION;

  } // end for
}

void limitVelocity(Boid b)
{
  float vlim = 6;  //?????????????
  Vector v = new Vector();
  
  float velocity = sqrt(sq(b.vx) + sq(b.vy));
  
  if (velocity > vlim)
  {
    float vx = (b.vx/velocity)/vlim;
    float vy = (b.vy/velocity)/vlim;
    b.vx = vx;
    b.vy = vy;
  }  
  
} // end limitVelocity()


class Vector
{
  float x, y;
  
  public Vector()
  {
    x = 0;
    y = 0;
  }
  
  public Vector(float initX, float initY)
  {
    x = initX;
    y = initY;
  }
} // end class Vector

class Boid
{
  final int TRAIL_SCALE = 35;
  
  color myColor = color(255, 255, 255);
  int mySize = 2;
  
  float xpos, ypos;
  float vx, vy;
  
  //------------------------------------------------------------------------------------------------------------------------------
  //THIS
  //------------------------------------------------------------------------------------------------------------------------------
  
  void drawMe()
  {
    stroke(0,0,0);
    textFont(font, 15);
    line(xpos, ypos, xpos-TRAIL_SCALE*vx, ypos-TRAIL_SCALE*vy);
    text("human", xpos, ypos);
  }
  
  
} // end class Boid



Vector rule1(Boid b)
{
  Vector pc = new Vector();
  
  for (int i=0; i < NUM_BOIDS; ++i)
  {
    if (b != flock[i])
    {
	pc.x += flock[i].xpos;
	pc.y += flock[i].ypos;
    } // end if
  } // end for
	
  pc.x /= (NUM_BOIDS-1);
  pc.y /= (NUM_BOIDS-1);
  
  pc.x = (pc.x - b.xpos) / CENTER_PULL_FACTOR;
  pc.y = (pc.y - b.ypos) / CENTER_PULL_FACTOR;
   
  return pc;
} // end rule1()

Vector rule2(Boid b)
{
  Vector v = new Vector();
  
  for (int i=0; i < NUM_BOIDS; ++i)
  {
    if (b != flock[i])
    {
	if (distance2d(b, flock[i]) < 20)
	{
	  v.x -= flock[i].xpos - b.xpos;
	  v.y -= flock[i].ypos - b.ypos;
	} // end if
    } // end if
  } // end for
  
  return v;
} // end rule2()

Vector rule3(Boid b)
{
  Vector v  = new Vector();
  
  for (int i=0; i < NUM_BOIDS; ++i)
  {
    if (b != flock[i])
    {
	v.x += b.vx;
	v.y += b.vy;
    } // end if
  } // end for
  
  v.x /= (NUM_BOIDS - 1);
  v.y /= (NUM_BOIDS - 1);
  
  v.x = (v.x - b.vx)/8;
  v.y = (v.y - b.vy)/8;
  
  return v;
} // end rule3()


Vector rule4(Boid b)
{
  Vector t = new Vector(0,0);
  //return t;
  
  Vector v = new Vector();
  
  v.x = (mouseX - b.xpos) / CENTER_PULL_FACTOR;
  v.y = (mouseY - b.ypos) / CENTER_PULL_FACTOR;
  
  return v;
  
} // end rule4()


float distance2d(Boid v1, Boid v2)
{
  float x = abs(v1.xpos - v2.xpos);
  float y = abs(v1.ypos - v2.ypos);
  
  return((sqrt(x*x + y*y)));
}

