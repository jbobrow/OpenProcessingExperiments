
int x = 200;
int y = 20;
int xspeed = 3;
int yspeed = 3;
int inc = 0;
int sz = 60;
int max = 301;

void setup() {
  size(800, 600);

}

void draw() {
  background(255);

    if ((x > width-max) || x < 0) { // left and right walls
      xspeed = -xspeed; // go the other way
      if (sz > 0 )
      {
        sz = sz-10;
      }
    }
    if (y > height || y < 0) { // top and bottom walls
      yspeed = -yspeed; // go the other way
      if (sz > 0 )
      {
        sz = sz-10;
      } 
    }
    while (inc < max)
    {
      ellipse(x + inc, y, sz, sz);
      inc = inc + 100;
    }
    inc = 0;
        x+=xspeed; // this effectively moves them
        y+=yspeed;
}



