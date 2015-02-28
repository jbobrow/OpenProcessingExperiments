
/*Steven Ko
 suyunk@andrew.cmu.edu
 copyright ©  Steven Ko || OCT 2012 Pittsburgh PA 15213 All Rights Reserved
 */

//press UP, DOWN, LEFT, RIGHT to deform initial polygons
//mouse click to change colors!
//space buttom to reset

float a, b, c, d;
int e;
int ma, cy, dg, lg;
float j, k;

void setup() {
  size(600, 600);
  noCursor();
  smooth();

  a = 10;      //shortcut variables
  b = 20;
  c = 30;
  d = 40;

  e = 5;       //variable for incremental deformation

  ma = color(255, 0, 255);      //initial colors
  cy = color(0, 255, 255);
  dg = color(75);
  lg = color(155);

  j = d;
  k = b+d;
}

void draw() {   

  //top
  fill(ma);
  for (int x = 0; x <= width; x+=j) {
    for (int y = 0; y <= height; y+=k) {
      quad(x, y-c, x+b, y-b, x, y-a, x-b, y-b);
    }
  }

  //left
  fill(cy);
  for (int x = 0; x <= width; x+=j) {
    for (int y = 0; y <= height; y+=k) {
      quad(x-b, y-b, x, y-a, x, y+a, x-b, y);
    }
  }

  //right
  fill(lg);
  for (int x = 0; x <= width; x+=j) {
    for (int y = 0; y <= height; y+=k) {
      quad(x+b, y-b, x+b, y, x, y+a, x, y-a);
    }
  }

  //top-2nd row 
  fill(ma);
  for (int x = 0; x <= width; x+=j) {
    for (int y = 0; y <= height; y+=k) {
      quad(x+b, y, x+d, y+a, x+b, y+b, x, y+a);
    }
  }

  //left-2nd row 
  fill(cy);
  for (int x = 0; x <= width; x+=j) {
    for (int y = 0; y <= height; y+=k) {
      quad(x+d, y+a, x+d, y+c, x+b, y+d, x+b, y+b);
    }
  }

  //right-2nd row 
  fill(dg);
  for (int x = 0; x <= width; x+=j) {
    for (int y = 0; y <= height; y+=k) {
      quad(x, y+a, x+b, y+b, x+b, y+d, x, y+c);
    }
  }
}
void mouseClicked() {                                  //change colors
 ma = color(random(150,255), 0, random(150, 255));
 cy = color(0, random(150, 255), random(150, 255));
 dg = color(random(25, 125));
 lg = color(random(105, 205));
}

void keyPressed () {      //reset
  if (key == ' '){
    setup();
  }
  if (key ==CODED) {            //distort polygons by moving points
    if (keyCode == UP) {
      a+=e;
      c+=e;
    }
    if (keyCode == DOWN) {
      a-=e;
      c-=e;
    }
    if (keyCode == LEFT) {
      b+=e;
      d+=e;
    }
    if (keyCode == RIGHT) {
      b-=e;
      d-=e;
    }
  }
}


