

float f[], g[], r[], cr;
float x[], y[], z[];

float fc = TWO_PI/24.0;
float c_angle = PI/12.0;
float speed = 1.0;
float max_rot_t = 9.0;
float min_rot_t = 3.0;
float max_r = 100.0;
float min_r = 20.0;

int fps = 30;
int duration = 30;

int num_segments = 3;
boolean constrain_segments = false;
boolean shade = true;

int num_points = fps*duration;
int cur_point;

void reset()
{
  println("reset");
  //control parameters
  f = new float[num_segments];
  g = new float[num_segments];
  r = new float[num_segments];
  cr = 0;
  for(int i = 0; i < num_segments; ++i) {
    if( constrain_segments ) {
      boolean axis = (random(1.0) > 0.5 ? true : false);
      f[i] = axis ? TWO_PI/random(min_rot_t,max_rot_t) : 0;
      g[i] = axis ? 0 : TWO_PI/random(min_rot_t,max_rot_t);
    } else {
      f[i] = TWO_PI/random(min_rot_t,max_rot_t);
      g[i] = TWO_PI/random(min_rot_t,max_rot_t);
    }
    f[i] *= speed;
    g[i] *= speed;
    r[i] = random(min_r,max_r);
    cr += r[i];
  }
  cr *= 3.0;
  
  //data points
  x = new float[num_points];
  y = new float[num_points];
  z = new float[num_points];
  //state
  cur_point = 0;
}
  

void setup()
{
  //size(500,500,OPENGL);
  size(500,500,P3D);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  colorMode(HSB,1.0,1.0,1.0);
  frameRate(fps);
  smooth();
  reset();
}

void mousePressed()
{
  reset();
}

void draw()
{
  //println("draw");
  if( cur_point == num_points ) {
    reset();
  }
  background(0);
  if( mouseX > 3 || mouseY > 3 ) {
    fill( map(mouseX,0,width,0,1.0), map(mouseY,0,height,0.5,1.0), 0.85);
  } else {
    fill(0.57,0.95,0.85);
  }
  ambientLight(0,0,0.65);
  pointLight(0,0,1, 0,-0.5*cr,0);
  pointLight(0,0,1, 0, 0.5*cr,0);
  
  /*axes*/
  strokeWeight(0.5);
  stroke(0,0,0.25);
  line(-0.5*cr,0,0,    0.5*cr,0,0); // x
  line(0,-0.5*cr,0,    0,0.5*cr,0); // y
  line(0,0,-0.5*cr,    0,0,0.5*cr); // z
  
  float t = float(cur_point)/fps;
  camera( cr*cos(fc*t), -cr*sin(c_angle), cr*sin(fc*t),
          0,0,0,
          0,1.0,0.0 );
          
  //draw arms
  stroke(0,0,0.6);
  strokeWeight(2.0);
  float ax, ay, az, bx, by, bz;
  ax = 0; ay =0; az = 0;
  bx = 0; by =0; bz = 0;
  for(int i = 0; i < num_segments; ++i) {
    bx = ax + r[i]*sin(f[i]*t)*cos(g[i]*t);
    by = ay + r[i]*sin(f[i]*t)*sin(g[i]*t);
    bz = az + r[i]*cos(g[i]*t);
    line(ax, ay, az, bx, by, bz);
    ax = bx; ay = by; az = bz;
  }
  
  //update next point
  x[cur_point] = bx;
  y[cur_point] = by;
  z[cur_point] = bz;
  
  //draw path
  if( shade ) {
    noStroke();
    beginShape(TRIANGLE_FAN);
    vertex(0,0,0);
    for(int i = 0; i < cur_point; ++i) {
      vertex(x[i],y[i],z[i]);
    }
    vertex(x[cur_point],y[cur_point],z[cur_point]);
    endShape();
  } else {
    stroke(0,0,1);
    strokeWeight(1.0);
    for(int i = 0; i < cur_point; ++i) {
      line(x[i],y[i],z[i], x[i+1],y[i+1],z[i+1]);
    }
  }
  
  //if( frameCount % 2 == 0 ) {++cur_point;}
  ++cur_point;
}
  
  

