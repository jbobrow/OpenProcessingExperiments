
int[][] angles = {{ 0, 1 }, { 1, 1 }, { 1, 0 }, { 1,-1 },
                 { 0,-1 }, {-1,-1 }, {-1, 0 }, {-1, 1 }};

int numAngles = angles.length;
int x, y, nx, ny, xx, yy, nxx, nyy, xxx, yyy, nxxx, nyyy;
int dir = 0;
color black = color(0);
color white = color(255);

void setup() {
  size(100, 100);
  background(255);
  x = width/4;
  nx = x;
  y = height/4;
  ny = y;
  
  xx = width/2;
  nxx = xx;
  yy = height/2;
  nyy = yy;
  
  xxx = width/3;
  nxxx = xxx;
  yyy = height/3;
  nyyy = yyy;
  
  float woodDensity = width * height * 0.5;
  for (int i = 0; i < woodDensity; i++) {
    int rx = int(random(width));
    int ry = int(random(height));
    
    int rxx = int(random(width));
    int ryy = int(random(height));
    
    int rxxx = int(random(width));
    int ryyy = int(random(height));
    set(rx, ry, black);
    set(rxx, ryy, white);
    set(rxxx, ryyy, black);
  }
}

void draw() {
  int rand = int(abs(random(-1, 2)));
  dir = (dir + rand + numAngles) % numAngles;
  
  nx = (nx + angles[dir][0] + width) % width;
  ny = (ny + angles[dir][1] + height) % height;
  if ((get(x,y) == black) && (get(nx,ny) == white)) {
    // Move the chip one space
    set(x, y, white);
    set(nx, ny, black);
    x = nx;
    y = ny;
  } else if ((get(x,y) == black) && (get(nx,ny) == black)) {
    // Move in the opposite direction
    dir = (dir + (numAngles/2)) % numAngles;
    x = (x + angles[dir][0] + width) % width;
    y = (y + angles[dir][1] + height) % height;
  } else {
    // Not carrying
    x = nx;
    y = ny;
  }
  nx = x; // Save the current position
  ny = y;
  
  nxx = (nxx + angles[dir][0] + width) % width;
  nyy = (nyy + angles[dir][1] + height) % height;
  if ((get(xx,yy) == white) && (get(nxx,nyy) == black)) {
    // Move the chip one space
    set(xx, yy, white);
    set(nxx, nyy, black);
    xx = nxx;
    yy = nyy;
  } else if ((get(xx,yy) == white) && (get(nxx,nyy) == white)) {
    // Move in the opposite direction
    dir = (dir + (numAngles/2)) % numAngles;
    xx = (xx + angles[dir][0] + width) % width;
    yy = (yy + angles[dir][1] + height) % height;
  } else {
    // Not carrying
    xx = nxx;
    yy = nyy;
  }
  nxx = xx; // Save the current position
  nyy = yy;
  
  nxxx = (nxxx + angles[dir][0] + width) % width;
  nyyy = (nyyy + angles[dir][1] + height) % height;
  if ((get(xxx,yyy) == black) && (get(nxxx,nyyy) == white)) {
    // Move the chip one space
    set(xxx, yyy, white);
    set(nxxx, nyyy, black);
    xxx = nxxx;
    yyy = nyyy;
  } else if ((get(xxx,yyy) == black) && (get(nxxx,nyyy) == black)) {
    // Move in the opposite direction
    dir = (dir + (numAngles/2)) % numAngles;
    xxx = (xxx + angles[dir][0] + width) % width;
    yyy = (yyy + angles[dir][1] + height) % height;
  } else {
    // Not carrying
    xxx = nxxx;
    yyy = nyyy;
  }
  nxxx = xxx; // Save the current position
  nyyy = yyy;
  
}


