
int[][] angles = { { 0, 1 }, { 1, 1 }, { 1, 0 }, { 1,-1 },
                   { 0,-1 }, {-1,-1 }, {-1, 0 }, {-1, 1 } };
int numAngles = angles.length;
int x1, y1, nx1, ny1, dir1; //termite 1
int x2, y2, nx2, ny2, dir2; //termite 2

color black = color(0);
color white = color(255);

void setup() {
  size(100, 100);
  background(255);
  x1 = width / 2;
  nx1 = x1;
  y1 = height / 2;
  ny1 = y1;
  x2 = width / 2;
  nx2 = x2;
  y2 = height / 2;
  ny2 = y2; 
  float woodDensity = width * height * 0.5;
  for (int i = 0; i < woodDensity; i++) {
    int rx = int(random(width));
    int ry = int(random(height));
    set(rx, ry, black);
  }
  dir1=0;
  dir2=0;
}

void draw() {
  int crand = int(abs(random(-1, 2)));  
  //moveTermite(dir1, x1, y1, nx1, ny1);
  moveTermite1(crand);
  moveTermite2(crand);
  //moveTermite(dir2, x2, y2, nx2, ny2);  
}

//void moveTermite(int dir, int x, int y, int nx, int ny)
void moveTermite1(int rand)
{
  dir1 = (dir1 + rand + numAngles) % numAngles;
  
  nx1 = (nx1 + angles[dir1][0] + width) % width;
  ny1 = (ny1 + angles[dir1][1] + height) % height;
  if ((get(x1, y1) == black) && (get(nx1, ny1) == white)) {
// Move the chip one space
    set(x1, y1, white);
    set(nx1, ny1, black);
    x1 = nx1;
    y1 = ny1;
  }
  else if ((get(x1, y1) == black) && (get(nx1, ny1) == black)) {
// Move in the opposite direction
    dir1 = (dir1 + (numAngles / 2)) % numAngles;
    x1 = (x1 + angles[dir1][0] + width) % width;
    y1 = (y1 + angles[dir1][1] + height) % height;
  }
  else {
// Not carrying
    x1 = nx1;
    y1 = ny1;
  }
  nx1 = x1; // Save the current position
  ny1 = y1;
}

void moveTermite2(int rand)
{
  dir2 = (-dir2 + rand + numAngles) % numAngles;
  
  nx2 = (nx2 + angles[dir2][0] + width) % width;
  ny2 = (ny2 + angles[dir2][1] + height) % height;
  if ((get(x2, y2) == black) && (get(nx2, ny2) == white)) {
// Move the chip one space
    set(x2, y2, white);
    set(nx2, ny2, black);
    x2 = nx2;
    y2 = ny2;
  }
  else if ((get(x2, y2) == black) && (get(nx2, ny2) == black)) {
// Move in the opposite direction
    dir2 = (dir2 + (numAngles / 2)) % numAngles;
    x2 = (x2 + angles[dir1][0] + width) % width;
    y2 = (y2 + angles[dir1][1] + height) % height;
  }
  else {
// Not carrying
    x2 = nx2;
    y2 = ny2;
  }
  nx2 = x2; // Save the current position
  ny2 = y2;
}


