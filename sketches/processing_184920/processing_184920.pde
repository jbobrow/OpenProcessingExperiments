
int radius = 350;
int sx = 600;
int sy = 500; 
int cx, cy;

void setup() {
  size(sx, sy);
  cx = width / 2;
  cy = height / 2;
  
   smooth();
}
 
void draw() {
  strokeWeight(1);
  
  stroke(0);
  noFill();
  ellipse(cx, cy, radius, radius);
  //stroke(0, 0, 255);
  float h, m, s, r, g, b;
  h = hour();
  m = minute();
  s = second();
  r = hour()*11.08;
  g = minute()*4.322;
  b = second()*4.322;

//background(h*11.08,m*4.322,s*4.322);
background(r,g,b);
  
  
  // draw clock
  for (int i = 0; i < 12; i ++) {
      float ang = i * 30 * PI / 180;
      float sina = sin(ang);
      float cosa = cos(ang);
      int x1 = (int)(cx + (radius / 2 - 25) * sina);
      int y1 = (int)(cy + (radius / 2 - 25) * cosa);
      int x2 = (int)(cx + radius / 2 * sina);
      int y2 = (int)(cy + radius / 2 * cosa);
      line(x1, y1, x2, y2);
  }
  fill(0);
  strokeWeight(2);
  rect(0,0,width,50);
  rect(width,height,-width,-50);
  
  fill(100);

  rect(290,height,240,-50);
  
  textSize(32);
  fill(255);
  text("Time: " + (int)h + ":" + (int)m + ":" + (int)s, 10, height-14);
  textSize(24);
  fill(r,0,0);
  text("("+(int)r +")", 300,height-17);
  fill(0,g,0);
  text("("+(int)g +")", 380,height-17);
  fill(0,0,b);
  text("("+(int)b +")", 460,height-17);
 
  
  
  // draw second
  float ang = (30 - s) * 6 * PI / 180;
  float sina = sin(ang);
  float cosa = cos(ang);  
  int sx = (int)(cx + radius / 2.3 * sina);
  int sy = (int)(cy + radius / 2.3 * cosa);
  line(cx, cy, sx, sy);  
  strokeWeight(3);
  // draw minute
  m += (s / 60.0);
  ang = (30 - m) * 6 * PI / 180;
  sina = sin(ang);
  cosa = cos(ang);
  int mx = (int)(cx + radius / 2.5 * sina);
  int my = (int)(cy + radius / 2.5 * cosa);  
  line(cx, cy, mx, my);
  strokeWeight(4);
  // draw hour
  h += (m / 60.0);  
  ang = (30 - h) * 30 * PI / 180;
  sina = sin(ang);
  cosa = cos(ang);
  int hx = (int)(cx + radius / 3 * sina);
  int hy = (int)(cy + radius / 3 * cosa);  
  line(cx, cy, hx, hy);
}
