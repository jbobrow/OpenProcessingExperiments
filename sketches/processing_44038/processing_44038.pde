
size (300,300);
background (0);
stroke(255,80);
strokeWeight (2);
smooth ();

int step = 10;
float lastx = -999;
float lasty = -999;
float y = 50;
float border = 20;
int borderx = 10;
int bordery = 10;
for (float x=border; x<=width-border;
x+=step) {
    y = bordery+random(height-2*bordery);
  if (lastx > -999) {
    line (x,y, lastx, lasty);
    line(y, x, lasty, lastx);
  }
  lastx = x;
  lasty = y;
}


