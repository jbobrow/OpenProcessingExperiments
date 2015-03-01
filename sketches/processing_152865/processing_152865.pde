
int mex0 = 0;
int mey0 = 0;
int mez0 = 0;

int enx0 = -100;
int eny0 = -100;
int enz0 = 500;
int enx1 = 30;
int eny1 = 30;
int enz1 = 20;

float l = 50;

int ti = 0;

int bln = 32;
int cirn = 16;
int blr = 200;
int bld = 10;

int[][] point;
int enmn = 100;

void setup() {
  size(800, 400); 
  background(255);

  point = new int[enmn][7];
  for (int i = 0; i <= enmn-1; i ++) {    
    point[i][0] = int(random(-400, 400));   
    point[i][1] = int(random(-400, 400));  
    point[i][2] = mez0 + int(random(200, 800));   
    point[i][3] = int(random(10, 50));  
    point[i][4] = int(random(10, 50));   
    point[i][5] = int(random(10, 50));
    point[i][6] = int(random(1, 3));
  }
}

void draw() {
  background(255);
  ti++;
  stroke(200);

  mex0 = 2*(mouseX-width/2);
  mey0 = -2*(mouseY-height/2);

  if (enz0-mez0 >= -300) {
    enz0 += 1;
    mez0 += 4;
  }
  else { 
    enz0 = 500+mez0;
    enx0 = int(random(-300, 300));
    eny0 = int(random(-300, 300));
  }
  for (int i = 0; i <= bln; i++) {
    stroke(127*(1+sin(2*PI*i/cirn)), 127*(1+sin(PI*2/3.0 + 2*PI*i/cirn)), 127*(1+sin(PI*4/3.0 + 2*PI*i/cirn)));
    dblock(int(blr*sin((enz0 + i*bld)*2*PI/(cirn*bld))), int(blr*cos((enz0 + i*bld)*2*PI/(cirn*bld))), enz0 + i*bld, enx1, eny1, enz1, mex0, mey0, mez0, l);
  }

  for (int i = 0; i <= enmn-1; i ++) {    
    point[i][2] -= point[i][6];
    stroke(0);
    dblock(point[i][0], point[i][1], point[i][2], point[i][3], point[i][4], point[i][5], mex0, mey0, mez0, l);
    if (point[i][2] < (mez0 + l)) {  
      point[i][0] = int(random(-400, 400));   
      point[i][1] = int(random(-400, 400));  
      point[i][2] = mez0 + int(random(200, 800));   
      point[i][3] = int(random(10, 50));  
      point[i][4] = int(random(10, 50)); 
      point[i][5] = int(random(10, 50));
      point[i][6] = int(random(1, 3));
    }
  }

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

