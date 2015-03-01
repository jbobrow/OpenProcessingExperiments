
int ti = 0;

int mex0 = 0;
int mey0 = 0;
int mez0 = 0;

int gridx = 800;
int gridy = 600;
int gridz = 150;

int numx = 100;
int numz = 100;

float l = 50;

void setup() {
  size(800, 400); 
  background(255);
}

void draw() {
  background(255);
  ti++;

  mex0 = 1*(mouseX-width/2);
  mey0 = -1*(mouseY-height/2);

  dline(100-gridx/2, -gridy/2, 100, 100+gridx/2, -gridy/2, 100, mex0, mey0, mez0, l);
  dline(100-gridx/2, -gridy/2, 100, 100-gridx/2, gridy/2, 100, mex0, mey0, mez0, l);
  dline(100-gridx/2, -gridy/2, 100, 100-gridx/2, -gridy/2, 100+gridz, mex0, mey0, mez0, l);

  for (int i = 0; i <= numx; i++) {
    for (int j = 0; j <= numz; j++) {
      dpoint(100-gridx/2 + i*gridx/numx, -gridy/2 + int(1.5*gridy*(sin(5*PI*i/numx)+1)*(cos(4*PI*j/numz)+1)*(j/float(numz))*(i/float(numx))/4), 100 + j*gridz/numz, mex0, mey0, mez0, l);
    }
  }

  //if(mousePressed) saveFrame("pic1/frame###.png");
}

void dblock(int x0, int y0, int z0, int x1, int y1, int z1, int mex, int mey, int mez, float l) {
  dline(x0, y0, z0, x0+x1, y0, z0, mex, mey, mez, l);
  dline(x0+x1, y0, z0, x0+x1, y0+y1, z0, mex, mey, mez, l);
  dline(x0, y0+y1, z0, x0+x1, y0+y1, z0, mex, mey, mez, l);
  dline(x0, y0, z0, x0, y0+y1, z0, mex, mey, mez, l);

  dline(x0, y0, z0, x0, y0, z0+z1, mex, mey, mez, l);
  dline(x0+x1, y0, z0, x0+x1, y0, z0+z1, mex, mey, mez, l);
  dline(x0, y0+y1, z0, x0, y0+y1, z0+z1, mex, mey, mez, l);
  dline(x0+x1, y0+y1, z0, x0+x1, y0+y1, z0+z1, mex, mey, mez, l);

  dline(x0, y0, z0+z1, x0+x1, y0, z0+z1, mex, mey, mez, l);
  dline(x0+x1, y0, z0+z1, x0+x1, y0+y1, z0+z1, mex, mey, mez, l);
  dline(x0, y0+y1, z0+z1, x0+x1, y0+y1, z0+z1, mex, mey, mez, l);
  dline(x0, y0, z0+z1, x0, y0+y1, z0+z1, mex, mey, mez, l);
}

void dline(int dx1, int dy1, int dz1, int dx2, int dy2, int dz2, int mex, int mey, int mez, float dl) {
  int dis = 40;
  if (dz1-(mez+dl) < 150 || dz2-(mez+dl) < 150) strokeWeight(2);
  else strokeWeight(1);
  if (dz1>(mez+dl) || dz2>(mez+dl)) line(width/4 + (dl*(dx1 - mex - dis)/(dz1 - mez)), height/2 - (dl*(dy1 - mey)/(dz1 - mez)), width/4 + (dl*(dx2 - mex - dis)/(dz2 - mez)), height/2 - (dl*(dy2 - mey)/(dz2 - mez)));
  if (dz1>(mez+dl) || dz2>(mez+dl))line(width*3/4 + (dl*(dx1 - mex + dis)/(dz1 - mez)), height/2 - (dl*(dy1 - mey)/(dz1 - mez)), width*3/4 + (dl*(dx2 - mex + dis)/(dz2 - mez)), height/2 - (dl*(dy2 - mey)/(dz2 - mez)));
}
void dpoint(int dx1, int dy1, int dz1, int mex, int mey, int mez, float dl) {
  int dis = 40;strokeWeight(1);
  //if (dz1-(mez+dl) < 150) strokeWeight(2);
  //else strokeWeight(1);
  if (dz1>(mez+dl)) point(width/4 + (dl*(dx1 - mex - dis)/(dz1 - mez)), height/2 - (dl*(dy1 - mey)/(dz1 - mez)));
  if (dz1>(mez+dl))point(width*3/4 + (dl*(dx1 - mex + dis)/(dz1 - mez)), height/2 - (dl*(dy1 - mey)/(dz1 - mez)));
}

