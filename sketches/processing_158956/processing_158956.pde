
// adapted from http://openprocessing.org/sketch/2785
// alexis farmer 2014

int   nPoints    = 4096;   // points to draw
float complexity = 8;      // wind complexity
float maxMass    = .8;     // max pollen mass
float timeSpeed  = .02;    // wind variation speed
float phase      = TWO_PI; // separate u-noise from v-noise

float windSpeed  = 40; // wind vector magnitude for debug
int   step       = 10; // spatial sampling rate for debug

float[] pollenMass;
float[][] points;

void setup()
{
  size( 512, 512, P2D );
  
  points     = new float[nPoints][2];
  pollenMass = new float[nPoints];
  for( int i = 0; i < nPoints; i++ )
  {
    points[i] = new float[]{random(0, width), random(0, height)};
    pollenMass[i] = random(0, maxMass);
  }
  noiseDetail(14);
  background(255);
}

void draw()
{  
  float t = frameCount * timeSpeed;
  
  stroke( 0, 10 );
  
  for (int i = 0; i < nPoints; i++)
  {
    float x = points[i][0];
    float y = points[i][1];
    
    float normx = norm(x, 0, width);
    float normy = norm(y, 0, height);
    float u = noise(t + phase, normx * complexity + phase, normy * complexity + phase);
    float v = noise(t - phase, normx * complexity - phase, normy * complexity + phase);
    float speed = ( 1 + noise( t, u, v ) ) / pollenMass[i];
    x += lerp( -speed, speed, u );
    y += lerp( -speed, speed, v );
    
    if ( x < 0 )
      x = width - 1;
    else if ( x >= width)
      x = 0;
    
    if ( y < 0 )
      y = height - 1;
    else if ( y >= width)
      y = 0;
    
    point(x, y);
      
    points[i][0] = x;
    points[i][1] = y;
  }
}

void mousePressed() {
  setup();
}
