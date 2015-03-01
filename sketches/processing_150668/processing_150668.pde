
int t = 0;
float dx = 0.05;
int di = 10;
int dh = 10;
void setup() {
  size(600, 140 /* 14*dh */);
}
void draw() {
  background(0);
  stroke(55, 144, 136);
  strokeWeight(4);
  line(0, dh, width, dh);
  line(0, height-dh, width, height-dh);
  strokeWeight(6);
  for (int row=1; row<=11; row++)
    for (int i=0; i<=width; i+=di) {
      int x0 = int(t*speed(row)*dx%di);
      line(x0+i, row*dh, x0+i, (row+2)*dh);
    }
  t++;
}
int speed(int row) {
  switch(row) {
  case 2:
    return 1;
  case 3:
    return 2;
  case 4:
    return 3;
  case 5:
    return 4;
  case 6:
    return 4;
  case 7: 
    return 4;
  case 8:
    return 3;
  case 9:
    return 2;
  case 10:
    return 1;
  default:
    return 0;
  }
}
void mousePressed() {
  float dxOld = dx;
  dx = 0.1 * (mouseX-width/2)/200.0;
  t = int(t*dxOld/dx+0.5);
}



