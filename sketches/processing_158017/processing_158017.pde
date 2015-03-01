
int counter;
int x = 20;
int dx = 50;
int y = 50;
int dy = 450;


void setup() {  //setup function called initially, only once
  size(400, 400);
  }

void draw() {  //draw function loops 
      ellipse(x,y, 40, 80);
      x = x + dx;
      if (x > 400)
 {
    dx = -5;  }
   if (x <0)
 {
    dx = 2;  }
      y = y + dy
      if (y > 400)
 {
    y = -5;  }
   if (y <0)
 {
    dy = 40;  }

}
