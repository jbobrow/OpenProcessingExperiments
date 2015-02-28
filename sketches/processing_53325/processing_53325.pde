
class Module {
  int mx, my;
  int big;
  float x, y;
  int xdir = 95;
  int ydir = 1;
  float speed; 

  // Contructor (required)
  Module(int imx, int imy, int ix, int iy, float ispeed) {
    mx = imx;
    my = imy;
    x = ix;
    y = iy;
    speed = ispeed;
    big = unit;
  }

  // Custom method for updating the variables
  void update() {
    x = x + (speed * xdir);
    if (x >= xdir || x <= 0) {
      xdir *= -1;
      x = x + (1 * xdir);
      y = y + (1 * ydir);
    }
    if (y >= big || y <= 0) {
      ydir *= -1;
      y = y + (1 * ydir);
    }
  }

  // Custom method for drawing the object
  void draw() {

    //rotate(angle/10);

    strokeWeight(random(0, 1.4));
    
    stroke(10, random(0, 55), 0 );
    
    point(- mx -x -1/2, my);
    point(my + ydir * 100, my );
    point(- my - y / 400 , - my + y -1);
    point(my - 1, mx + y-1 / 800);
    point(mx+x-1, my+y - 1 *300);
    
    noFill();
    //rect (angle * random(800), my+y - 1 *300, .2, .2);
    
  }
  
  

}




