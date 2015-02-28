
int h;
int w;
int l;
float t;
//theta
float q;
//alpha
float t2;
// theta 2
float q2;
// alpha 2
float sx;
// start x
float sy;
// strat y

float ax;
float ay;
float bx;
float by;
float cx;
float cy;
float dx;
float dy;
float ex;
float ey;
float fx;
float fy;
float gx;
float gy;

int r = 255;
int g = 255;
int b = 255;
//colour

int on;

void setup(){
  size(510, 510);
  smooth();
  background(255);  
  on = 1;
  stroke(255);
}

void draw(){
  if(on == 1){
  stroke (r, g, b);
  if(r > 255){
    r = 255;
  }
  r = mouseX/2;
  g = mouseY/2;
  b = (r+g)/2;
  h = 30;
  w = 80;
  l = 150;
  t = t+.01;
  t2 = (PI/2)-t;
  q = (PI/8);
  q2 = (PI/2-q);
  sx = 255;
  sy = 255;
  ax = sx;
  ay = sy;
  bx = ax+w*cos(t);
  by = ay+w*sin(t);
  cx = ax+l*cos(t2);
  cy = ay+l*sin(t2);
  dx = ax+(l*cos(t2)+w*cos(t));
  dy = ay+(l*sin(t2)+w*sin(t));
  ex = ax+(l*cos(t2)+h*cos(q2));
  ey = ay+(l*sin(t2)+h*sin(q2));
  fx = ax+(l*cos(t2)+h*cos(q2)+w*cos(t));
  fy = ay+(l*sin(t2)+h*sin(q2)+w*sin(t));
  gx = ax+(cos(t2)+cos(t2)+h*cos(q2)+w*cos(t));
  gy = ay+(+h*sin(q2)+w*sin(t));
  
  line (ax,ay, bx,by);
  line (ax,ay, cx, cy);
  line (bx, by, gx, gy);
  line (bx, by, dx, dy);
  line (cx, cy, ex, ey);
  line (cx, cy, dx, dy);
  line (dx, dy, fx, fy);
  line (ex, ey, fx, fy);
  line (fx, fy, gx, gy);
  
  print(t);
  
  }
  
}

void mousePressed(){
  if(on == 1){
    on = 0;
    
  }else{
    on = 1;
  }
  
}


