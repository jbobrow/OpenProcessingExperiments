
float[] x,y;
float[] last_x, last_y;
float speed = 1.0;

float time;
float last_millis;

int num_points = 49;

float radius = 300;

void setup()
{
  //radius = min(screen.height,screen.width)/2.0;
  //size( screen.width, screen.height, JAVA2D );
  size(600,600,JAVA2D);
  doSetup();
}

void doSetup()
{
  time = 0;
  last_millis = millis()/1000.0;
  x = new float[num_points];
  y = new float[num_points];
  for(int i = 0; i < num_points; ++i) {
    float theta = (TWO_PI*i)/num_points;
    float r = random(0.1,0.9)*radius;
    x[i] = width/2.0 + r*cos( theta );
    y[i] = height/2.0 + r*sin( theta );
  }
  last_x = new float[3];
  last_y = new float[3];
  for(int i = 0; i < 3; ++i) {
    float m = time + ((3-i)/3.0);
    float t = m % 1.0;
    int j = round( m - t );
    int k_0 = (3*j + i) % num_points;
    int k_1 = (3*j + i + 1) % num_points;
    int k_2 = (3*j + i + 2) % num_points;
    int k_3 = (3*j + i + 3) % num_points;
    float cur_x = bezierPoint(x[k_0], x[k_1], x[k_2], x[k_3], t);
    float cur_y = bezierPoint(y[k_0], y[k_1], y[k_2], y[k_3], t);
    last_x[i] = cur_x;
    last_y[i] = cur_y;
  }
  smooth();
  background(0);
}

void mousePressed()
{
  doSetup();
}

void draw()
{
  speed = map( mouseY, 0, height, 0.5, 2.5);
  strokeWeight( map( mouseX, 0, width, 1.0, 4.0) );
  if( frameCount % 4 == 0 ) {
    noStroke();
    fill(0,0,0,3);
    rect(0,0,width,height);
  }
  float cur_millis = millis()/1000.0;
  float delta = cur_millis - last_millis;
  last_millis = cur_millis;
  time += speed*delta;
  stroke(255);
  for(int i = 0; i < 3; ++i) {
    float m = time + ((3-i)/3.0);
    float t = m % 1.0;
    int j = round( m - t );
    int k_0 = (3*j + i) % num_points;
    int k_1 = (3*j + i + 1) % num_points;
    int k_2 = (3*j + i + 2) % num_points;
    int k_3 = (3*j + i + 3) % num_points;
    float cur_x = bezierPoint(x[k_0], x[k_1], x[k_2], x[k_3], t);
    float cur_y = bezierPoint(y[k_0], y[k_1], y[k_2], y[k_3], t);
    line(last_x[i],last_y[i],cur_x,cur_y);
    last_x[i] = cur_x;
    last_y[i] = cur_y;
  }
} 

