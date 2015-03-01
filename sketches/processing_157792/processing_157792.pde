
//Random generator;
color baseColor;
ArrayList splatters;
boolean clearBackground;
boolean DEBUG = true;
boolean DEBUG_INIT = true;
boolean DEBUG_LOGIC = true;

float nextGaussian()
{
  return( (random(1)*2 - 1) + (random(1)*2 - 1) + (random(1)*2 - 1) );
}

void setup()
{

  splatters = new ArrayList<Splatter>();
  size(1000, 800);
  smooth();
  background(0);
  baseColor = color(random(255), random(255), random(255), 125);
}

void draw()
{
  if (clearBackground)
    background(0);
    
  Splatter newSplatter = new Splatter(baseColor, mouseX, mouseY, 50);
  splatters.add(newSplatter);  
  
  for (int i = splatters.size()-1; i >= 0; i--) {
    Splatter splatter = (Splatter)splatters.get(i);
    
    splatter.Draw();
    
    splatter.Update();
    
    if (splatter.finished) {
      splatters.remove(i);
    }
  }
  
  smooth();
  noCursor();
}

void mousePressed()
{
  baseColor = color(random(255), random(255), random(255), 125);
}

void keyPressed()
{
   if (key == ' ')
      clearBackground = !clearBackground;
}
class Splatter
{
  private static final float POS_DEV = 45;
  private static final float R_DEV = 15;
  private static final float VELOCITY_DEV = 2.5;
  private static final float VELOCITY_MEAN = 1;
  private static final float TURNING_SPEED_DEV = .25;
  private static final float TURNING_SPEED_MEAN = .25;
  private static final float COLOR_DEV = 40;
  private static final float fadeSpeed = .3;
  private static final float shrinkSpeed = .1;
  
  private float direction;
  private float velocity;
  private float turningSpeed;
  
  private float x, y, r;
  private color c;
  private boolean finished;
  
  Splatter(color base, float x, float y, float r)
  {
    this.x = nextGaussian() * POS_DEV + x;
    this.y = nextGaussian() * POS_DEV + y;
    this.r = nextGaussian() * R_DEV + r;
    this.c = color(
      nextGaussian() * COLOR_DEV + red(base),
      nextGaussian() * COLOR_DEV + green(base),
      nextGaussian() * COLOR_DEV + blue(base),
      nextGaussian() * COLOR_DEV + alpha(base)
    );
    finished = false;
    direction = random(TWO_PI);
    velocity = nextGaussian() * VELOCITY_DEV + VELOCITY_MEAN;
    turningSpeed = nextGaussian() * TURNING_SPEED_DEV + TURNING_SPEED_MEAN;
  }
  
  void Update()
  {
    r -= shrinkSpeed;
    if (r < 0)
      finished = true;
    float a = alpha(c);
    a -= fadeSpeed;
    c = color(red(c), green(c), blue(c), a);
    if (a < 0)
      finished = true;
     
      
    Walk();
  }
  
  void Walk()
  {
     direction += random(-turningSpeed, turningSpeed);
     x += cos(direction) * velocity;
     y += sin(direction) * velocity;
     
     if (x < -r || x > width + r || y < - r || y > height + r)
       finished = true;
  }

  void Draw()
  {
    noStroke();
    fill(c);
    ellipse(x, y, r, r);
  }
}


