
float circw()
{
  float x1 = random(0.,1.);
  float x2 = random(0.,1.);
  return sqrt( -2*log(x1) ) * cos(TWO_PI*x2);
}

void setup()
{
  size(600,600,JAVA2D);
  colorMode(HSB,1.0,1.0,1.0,1.0);
  ellipseMode(CENTER);
  smooth();
  frameRate(4);
  reset();
}

void mousePressed()
{
  reset();
}

float px[], py[], r[];
int num_points = 9;
int circles;

color c, bg;

void reset()
{
  float h = random(0.,1.);
  float s = random(0.5,0.7);
  float v = random(0.7,0.8);
  bg = color(h,s,v);
  makeBackground();
  c = color(h, s - 0.1, v + 0.1, 0.75 );
  noFill();
  makePoints();
  circles = 0;
}

void makeBackground()
{
  background(bg);
  color bgp = color( hue(bg), saturation(bg) -0.05, brightness(bg)+0.05);
  float m = -1.0*random(0.25,1.0);
  noStroke();
  fill(bgp);
  int step = 6;
  for(int x = 0; x <= width; x += step) {
    for(int y = 0; y <= height; y += step) {
      float r = step* 0.5*(sin( PI * (x+m*y)/150.0 ) + 1.0);
      ellipse(x,y,r,r);
    }
  }
}
  

void makePoints()
{
  px = new float[num_points];
  py = new float[num_points];
  r = new  float[num_points];
  for(int i = 0; i < num_points; ++i) {
    px[i] = random(0,width);
    py[i] = random(0,height);
    r[i] = random(0, (width+height)/2.0 * 0.2 );
  }
}

void mutateStroke()
{
  c = color( (hue(c) + random(0,0.01) ) % 1.0, 
             saturation(c),
             brightness(c) );
}


void draw()
{
  stroke(c);
  strokeWeight( 1.0 + (width+height)/2.0 * 0.005 * abs( circw() ) );
  int idx = int(random(0,num_points));
  ellipse( px[idx], py[idx], r[idx], r[idx] );
  r[idx] += random( (width + height)/2.0 * 0.1 );
  ++circles;
  if(circles % 10 == 0 ) {
    makePoints();
    mutateStroke();
  }
  if(circles % 100 == 0 ) {
    reset();
  }
}
  
  

