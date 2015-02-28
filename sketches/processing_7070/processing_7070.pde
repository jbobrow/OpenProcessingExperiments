
float[] p_x, p_y, f, o;

float last_x, last_y;
float m_x, m_y;
float dx, dy;

float mass = 1.0;

float damping = 0.9;

int num_points = 5;

float time = 0.0;
float deltat = 0.005;

void setup()
{
  size(600,600,P2D);
  //size(screen.width,screen.height,P2D);
  //Go as fast as possible
  frameRate(9000);
  colorMode(HSB,1,1,1,1);
  smooth();
  reset();
}

boolean drawPath = false;

void keyPressed()
{
  if(key == ' ') {
    drawPath = !drawPath;
  }
}

void mousePressed()
{
  reset();
}

void reset()
{
  background(0);
  float radius = min(width,height)/2.0 -10.0;
  p_x = new float[num_points];
  p_y = new float[num_points];
  f   = new float[num_points];
  o   = new float[num_points];
  for(int i = 0; i < num_points; ++i) {
    float theta = (TWO_PI*i)/num_points -HALF_PI;
    p_x[i] = width/2.0 + radius*cos(theta);
    p_y[i] = height/2.0 + radius*sin(theta);
    f[i]   = random(2.0) + 0.1;
    o[i]   = random(1000);
  }
  m_x = width/2.0;
  m_y = height/2.0;
  last_x = m_x;
  last_y = m_y;
  dx = 0;
  dy = 0;
}

float k(int i)
{
  return pow(sin(f[i]*time + o[i]),2.0);
}
float last_millis = 0;

void draw()
{
  if(frameCount % 60 == 0) {
    float cur_millis = millis()/1000.0;
    float delta = cur_millis - last_millis;
    println(60/delta);
    last_millis = cur_millis;
  }
  time += deltat;
  last_x = m_x;
  last_y = m_y;
  integrate(deltat);
  strokeWeight(2.0);
  for(int i = 0; i < num_points; ++i) {
    stroke( k(i), 0.85,1,0.1);
    line(m_x,m_y,p_x[i],p_y[i]);
  }
  if( drawPath ) {
    stroke(0.5,1,1,1);
    strokeWeight(2.5);
    line(last_x,last_y,m_x,m_y);
  }
}


void integrate(float step)
{
  float d2x = 0;
  float d2y = 0;
  for(int i = 0; i < num_points; ++i) {
    d2x += k(i)*(p_x[i] - m_x);
    d2y += k(i)*(p_y[i] - m_y);
  }
  d2x -= damping*dx;
  d2y -= damping*dy;
  d2x /= mass;
  d2y /= mass;
  dx += step*d2x;
  dy += step*d2y;
  m_x += step*dx;
  m_y += step*dy;
}

