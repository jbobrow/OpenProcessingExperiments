
int grid = 40;
int colR, colG, colB;
int x1, y1, x2, y2;
int dx1, dy1, dx2, dy2;
boolean _paused=false;

void setup() {
  size (640, 360);
  colorSet();
  x1 = round(random(0,width));
  y1 = round(random(0,width));
  x2 = round(random(0,height));
  y2 = round(random(0,height));
  speedSet();
  background(0);
  
}

void draw() {
  if (x1 >= width || x1 <= 0) {
    dx1 *= -1;
    colorSet();
    if (dx1 <= 0)
      x1 = width;
    else
      x1 = 0;
  }
  if (y1 >= height || y1 <= 0){
    dy1 *= -1;
    colorSet();
    if (dy1 <= 0)
      y1 = height;
    else
      y1 = 0;
  }
  if (x2 >= width || x2 <= 0) {
    dx2 *= -1;
    colorSet();
    if (dx2 <= 0)
      x2 = width;
    else
      x2 = 0;
  }
  if (y2 >= height || y2 <= 0) {
    dy2 *= -1;
    colorSet();
    if (dy2 <= 0)
      y2 = height;
    else
      y2 = 0;
  }
  line(x1, y1, x2, y2);
  x1 += dx1;
  y1 += dy1;
  x2 += dx2;
  y2 += dy2;
  
}

void mousePressed() {
  speedSet();
}

void mouseReleased() {
}

void colorSet() {
  colR = (int)random(0,255);
  colG = (int)random(0,255);
  colB = (int)random(0,255);
  stroke(colR, colG, colB);
}
void speedSet() {
  dx1 = (int)random(1,width/grid);
  dy1 = (int)random(1,height/grid);
  dx2 = (int)random(1,width/grid);
  dy2 = (int)random(1,height/grid);
  println(dx1, dy1, dx2, dy2);
  println(x1, y1, x2, y2);
}

void keyPressed() {
  if (key==' ') { // pause
    _paused = !_paused;
  }
  else if (key=='c' || key=='C') { // clear
    background(0);
  }
  if (!_paused)
    loop();
  else
    noLoop();
}
  


