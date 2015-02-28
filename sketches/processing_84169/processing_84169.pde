
int w = 64;
int h = 64;
int bx;
int by;
boolean[][] grid = new boolean[w][h];
boolean[][] tempgrid = new boolean[w][h];
boolean[] rules = {false, false, true, true, false, false, false, true, true};
int dir;
int it;
void setup() {
  PFont font = loadFont("CourierNewPSMT-14.vlw");
  textFont(font, 14);
  background(0);
  size(640, 512, P2D);
  for(int x = 0; x < w; x++) {
    for(int y = 0; y < h; y++) {
      if(random(1)>0.5)
        grid[x][y] = true;
      else
        grid[x][y] = false;
    }
  }
  frameRate(55555);
  bx = width/2+(int)random(-100, 100);
  by = height/2+(int)random(-100, 100);
}
void keyPressed() {
  if(key != 'p') {
  background(0);
  for(int n = 0; n < rules.length; n++) {
    if(random(1000)>500)
    rules[n] = true;
    else
    rules[n] = false;
  }
  for(int x = 0; x < w; x++) {
    for(int y = 0; y < h; y++) {
      if(random(1)>0.5)
        grid[x][y] = true;
      else
        grid[x][y] = false;
    }
  }
  bx = width/2+(int)random(-100, 100);
  by = height/2+(int)random(-100, 100);
  dir = 0;
  }else{
    saveFrame("Out.png");
  }
}
void draw() {
  if(mousePressed&&mouseButton==LEFT)
  it = 100;
  else
  it = 1;
  if(mousePressed&&mouseButton==RIGHT)
  frameRate(4);
  else
  frameRate(55555);
  for(int i = 0; i < it; i++) {
  gogan();
  if(grid[int(60*float(bx)/width)][int(60*float(by)/height)])
  dir++;
  if(dir%4==0)
  bx++;
  if(dir%4==1)
  by++;
  if(dir%4==2)
  bx--;
  if(dir%4==3)
  by--;
  if(bx<0)
  bx=width;
  if(by<0)
  by=height;
  if(bx>width)
  bx=0;
  if(by>height)
  by=0;
  stroke(0, 229, 252, 60);
  point(bx, by);
  }
  displayValues(2, 2);
  fill(255, 255, 255, 10);
  noStroke();
  text("Greg Lastowka", 140, 15);
}
void displayValues(float q, float u) {
  noStroke();
  for(int x = 0; x < w; x++) {
    for(int y = 0; y < h; y++) {
      if(grid[x][y])
        fill(255, 255, 255, 600);
      else
        fill(0, 0, 0, 600);
      rect(x*q, y*u, q, u);
    }
  }
  noFill();
  stroke(0, 229, 252, 60);
  rect(0, 0, q*w, u*h);
}
void gogan() {
  for(int x = 1; x < w-1; x++) {
    for(int y = 1; y < h-1; y++) {
      if(rool(x, y))
        tempgrid[x][y] = true;
      else
        tempgrid[x][y] = false;
    }
  }
  grid = tempgrid;
}
boolean rool(int x, int y) {
  int goo = 0;
      if(grid[x+1][y])
        goo++;
      if(grid[x][y+1])
        goo++;
      if(grid[x-1][y])
        goo++;
      if(grid[x][y-1])
        goo++;
      if(grid[x+1][y+1])
        goo++;
      if(grid[x-1][y-1])
        goo++;
      if(grid[x+1][y-1])
        goo++;
      if(grid[x-1][y+1])
        goo++;
      switch(goo) {
        case 0:
          return rules[0];
        case 1:
          return rules[1];
        case 2:
          return rules[2];
        case 3:
          return rules[3];
        case 4:
          return rules[4];
        case 5:
          return rules[5];
        case 6:
          return rules[6];
        case 7:
          return rules[7];
        case 8:
          return rules[8];
        default:
          return false;
      }
}

