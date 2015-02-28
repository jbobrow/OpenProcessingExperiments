
int SCREEN_SIZE = 600;

float CURSOR_COUNT = 4;
float CURSOR_THETA = 2 * PI / CURSOR_COUNT;
float COS_THETA = cos(CURSOR_THETA);
float SIN_THETA = sin(CURSOR_THETA);

boolean bdraw = false;

void mousePressed() {
  bdraw = true;
}

void mouseReleased() {
  bdraw = false;
}

void keyPressed() {
  int ikey = int(key);
  if (ikey >=49 && ikey <=56 && ikey % 2 == 0) {
    CURSOR_COUNT = ikey - 48;
  }
} 
    
float get_dist(float mx, float my) {
  float dx = width / 2;
  float dy = height / 2;
  dx -= mx; dy -= my;
  dx = pow(dx, 2);
  dy = pow(dy, 2);
  return sqrt(dx + dy);
}

float[] rot_point(float[] a, float[] b, float t) {
  float x_off = (a[0] + (b[0] * -1));
  float y_off = (a[1] + (b[1] * -1));
  
  x_off = x_off * (PI / 180);
  y_off = y_off * (PI / 180);
  float rot_rad = t * (PI / 180);
  
  float r = sqrt(pow(x_off, 2) + pow(y_off, 2));
  float theta = atan(x_off / y_off);
  float t_off = theta + rot_rad;
  float rot_x = r * cos(-t_off);
  float rot_y = r * sin(-t_off);
  rot_x = rot_x * (180 / PI);
  rot_y = rot_y * (180 / PI);
  rot_x = (rot_x + a[0]);
  rot_y = (rot_y + a[1]);
  float[] result = {rot_x, rot_y};
  return result;
}

void setup() {
  size(SCREEN_SIZE, SCREEN_SIZE);
  background(0);
  smooth();
  fill(0);
}

void draw() {
  if (bdraw == false) { return; }
  float sz = get_dist(mouseX, mouseY);
  stroke(255 - sz * 2.5, sz, sz);
  float [] A = {mouseX, mouseY};
  float [] B = {width / 2, height / 2};
  for( int j=0; j<360; j+=360/CURSOR_COUNT) {
    float [] pts = rot_point(B, A, j);
    ellipse(pts[0], pts[1], sz, sz);
  }
}


