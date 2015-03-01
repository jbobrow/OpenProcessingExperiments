

float x, y;
int r, g, b, o;
float xspeed = 1;
float yspeed = 1;
int rspeed = 1;
int gspeed = 1;
int bspeed = 1;
int ospeed = 1;

void setup() {
  background(0); 
  size(510, 510);
}


void draw() {


  x = x + xspeed;

  if (x > width || x < 0) {
    xspeed = xspeed*-1;
  }

  y = y + yspeed;

  if (y > height || y < 0) {
    yspeed = yspeed*-1;
  }

  r = r + rspeed;

  if (r > 255 || r < 0) {
    rspeed = rspeed*-1;
  }

  g = g + gspeed;

  if (g > 255 || g < 0) {
    gspeed = gspeed*-2;
  }

  b =  b + bspeed;

  if (b > 255 || b < 0) {
    bspeed = bspeed*-3;
  }

 o = o + ospeed;

  if (o > 255 || o < 0) {
    ospeed = ospeed*-1;
  }

  stroke(r, g, b, o);

  line(0, y, width, y);
  line(width-x, 0, width-x, height);
  line(x, 0, x, height);
  line(0, height-y, width, height - y);
}

