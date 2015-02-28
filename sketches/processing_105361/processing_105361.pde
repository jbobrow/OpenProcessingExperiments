
void setup() {
  size(500, 500);
  background(0);
}

int x = 100;
int y = 250;
int xdelta = 8;
int ydelta = 7;
int xdelta1 = 9;
int ydelta1 = 6;
int radius = 25;

int x0 =int(random(50, 450));
int y0= int(random(50, 450));

int x1 = int(random(50, 450));
int y1 = int(random(50, 450));


void draw() {

  background(0);
  ellipse(x0, y0, 50, 50);
  ellipse(x1, y1, 50, 50);

  x0 = x0+xdelta;
  y0 = y0+ydelta;
  x1 = x1 + xdelta1;
  y1 = y1 + ydelta1;
  int distance = (x0-x1)*(x0-x1)+(y0-y1)*(y0-y1);


  if (x0<0 + radius) {
    xdelta = -xdelta;
  }
  else if (x0 >500-radius) {
    xdelta = -xdelta;
  }
  else if (y0 >500-radius) {
    ydelta = -ydelta;
  } 
  else if (y0<0 + radius) {
    ydelta = -ydelta;
  } 
  if (x1<0 + radius) {
    xdelta1 = -xdelta1;
  }
  else if (x1 >500-radius) {
    xdelta1 = -xdelta1;
  }
  else if (y1 >500-radius) {
    ydelta1 = -ydelta1;
  } 
  else if (y1 <0 + radius) {
    ydelta1 = -ydelta1;
  }
  if (distance < 4*radius*radius) {
    if (xdelta * xdelta1 < 0) {
      xdelta = -xdelta;
      xdelta1 = -xdelta1;
    }
    if (ydelta * ydelta1 < 0) {
      ydelta = -ydelta;
      ydelta1 = -ydelta1;
    }
  }
}



