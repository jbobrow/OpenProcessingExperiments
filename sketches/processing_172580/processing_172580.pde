
int n;
float t;
float x,y,px,py;
float a;
float scale;

void setup() {
  size(500, 500);
  background(255);
  scale = 2;
  t = 0;
  x = 0;
  y = 0;
  a = sqrt(2);
  for(n=0;n<10000;n++) {
    px = x;
    py = y;
    t += n*2*PI*a;
    x += cos(t);
    y += sin(t);
    line(width/2 + scale*px, height/2 - scale*py, width/2 + scale*x, height/2 - scale*y);
  }
}
