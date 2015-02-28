
// new maze, fog of war with paths
PImage bg;
boolean flag = false;
float ssize = 30;
int[][]  grid = {{0,0,0,0,0,0,0,0,0,0},
                 {0,1,0,0,0,0,0,0,0,0},
                 {0,1,0,0,0,0,1,1,1,0},
                 {0,1,1,1,0,0,1,0,0,0},
                 {0,0,0,1,0,0,1,0,0,0},
                 {0,0,0,1,0,0,1,1,1,1},
                 {0,0,0,1,0,0,1,0,0,0},
                 {0,0,0,1,0,0,1,1,0,0},
                 {0,0,1,1,0,0,0,1,0,0},
                 {0,0,1,0,0,0,0,1,0,0},
                 {0,0,1,0,0,0,0,1,0,0},
                 {0,1,1,1,1,1,1,1,0,0},
                 {0,1,0,0,0,0,0,1,0,0},
                 {0,1,0,0,0,1,1,1,0,0},
                 {0,0,0,0,0,0,0,0,0,0}};
//int[][]  number = {{0,0,0,0,0,0,0,0,0,0},
//                 {0,1,0,0,0,0,0,0,0,0},
//                 {0,0,0,0,0,0,0,2,0,0},
//                 {0,2,0,3,0,0,0,0,0,0},
//                 {0,0,0,0,0,0,1,0,0,0},
//                 {0,0,0,4,0,0,0,0,11,0},
//                 {0,0,0,0,0,0,10,0,0,0},
//                 {0,0,0,0,0,0,0,0,0,0},
//                 {0,0,0,5,0,0,0,9,0,0},
//                 {0,0,0,0,0,0,0,0,0,0},
//                 {0,0,6,0,0,0,0,0,0,0},
//                 {0,9,0,0,7,0,0,8,0,0},
//                 {0,0,0,0,0,0,0,11,0,0},
//                 {0,10,0,0,0,12,0,0,0,0},
//                 {0,0,0,0,0,0,0,0,0,0}};
 
ArrayList<PVector> numbers = new ArrayList<PVector>();
ArrayList<PVector> gotNums = new ArrayList<PVector>();
ArrayList<PVector> shadows = new ArrayList<PVector>();
int lastnum = 0;
int[][] visible;
int gridX, gridY;
float gridSX, gridSY, gridSize;
 
PVector pos;
PVector opos;
 
PImage cover;
 
void setup() {
  size(640,480);
  smooth();
   
  bg = loadImage("bg.png");
  cover = createImage(width,height,ARGB);
   
  gridX = 15;
  gridY = 10;
  gridSX = 20;
  gridSY = 20;
  gridSize = 40;
   
  visible = new int[width][height];
  cover.loadPixels();
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      visible[x][y] = 255;
      cover.pixels[y*width+x] = color(0);
    }
  }
  cover.updatePixels();
   
  pos = new PVector(80,80);
  textAlign(CENTER,CENTER);
  textSize(20);
   
  PVector num = new PVector(80,80,1);
  numbers.add(num);
  num = new PVector(230,160,2);
  numbers.add(num);
  num = new PVector(360,120,3);
  numbers.add(num);
  num = new PVector(480,240,4);
  numbers.add(num);
  num = new PVector(360,320,5);
  numbers.add(num);
  num = new PVector(240,400,6);
  numbers.add(num);
   
  num = new PVector(560,80,8);
  numbers.add(num);
  num = new PVector(560,240,11);
  numbers.add(num);
  num = new PVector(120,280,4);
  numbers.add(num);
   
//  for(int i = 0; i < 2000; i++) {
//    PVector pv = new PVector(random(width), random(height),255);
//    shadows.add(pv);
//  }
  for(float x = 0; x < width; x+=ssize) {
    for(float y = 0; y < height; y+= ssize) {
      PVector pv = new PVector(x, y,255);
      shadows.add(pv);
    }
  }
  
}
 
void draw() {
  background(0);
  for(int x = 0; x < gridX; x++) {
    for(int y = 0; y < gridY; y++) {
      noStroke();
      fill(120);
      if(grid[x][y] == 1) {
        fill(60);
      }
      rect(gridSX + x*gridSize, gridSY + y*gridSize, gridSize, gridSize);
//      if(number[x][y] > 0) {
//        fill(255);
//        text(str(number[x][y]),gridSX + x*gridSize+gridSize/2, gridSY + y*gridSize + gridSize/2);
//      }
    }
  }
 
//  image(bg,0,0);
   
  if(flag) {
    float range = 75;
    for(float x = max(pos.x-range,0); x < min(pos.x+range,width); x++) {
      for(float y = max(pos.y-range,0); y < min(pos.y+range,height); y++) {
        if(visible[int(x)][int(y)]!=0) {
          PVector p = new PVector(x,y);
          //if(p.dist(pos) < 100) visible[int(x)][int(y)] = true;
          float d = p.dist(pos);
          d = min(255,d);
          d-=20;
          d/=(range-20);;
          d*=255;
          if(visible[int(x)][int(y)] > d) visible[int(x)][int(y)] = int(d);
        }
      }
    }
  }
   
//  println(str(int(pos.x)) + " " + str(int(pos.y)));
   
  if(flag) {
    cover.loadPixels();
    for (int i = 0; i < width*height; i++) {
      int x = i%width;
      int y = floor(i/width);
      cover.pixels[i] = color(0,visible[x][y]);
    }
    cover.updatePixels();
    image(cover,0,0);
  } else {
    for(PVector pv: shadows) {
      PVector pp = new PVector(pv.x,pv.y);
      float d = pp.dist(pos);
      float range = 100;
      if(d < range) {
          d = min(255,d);
          d-=20;
          d/=(range-20);;
          d*=255;
          pv.z = min(pv.z,d);
      }
      fill(0,pv.z);
//      ellipse(pv.x,pv.y,30,30);
      rect(pv.x,pv.y,ssize, ssize);
    }
  }
   
  for(PVector pv : numbers) {
    //
    float d = pos.dist(new PVector(pv.x,pv.y));
    if(d < 170) {
      fill(255,170-d);
      text(str(int(pv.z)),pv.x,pv.y);
    }
    if(d < gridSize/2) {
      if(int(pv.z) == lastnum+1) {
        gotNums.add(pv.get());
        lastnum++;
      }
    }
  }
  fill(255);
  for(PVector pv : gotNums) {
    text(str(int(pv.z)),pv.x,pv.y);
  }
   
  opos = pos.get();
  int opx = int((pos.x - gridSX)/gridSize);
  int opy = int((pos.y - gridSY)/gridSize);
  PVector vel = new PVector(mouseX,mouseY);
  vel.sub(pos);
  vel.normalize();
  vel.mult(2);
  if(mousePressed) pos.add(vel);
   
  int px = int((pos.x - gridSX)/gridSize);
  int py = int((pos.y - gridSY)/gridSize);
  if(grid[px][py] == 0) {
    if(opy!=py) pos.y = opos.y;
    if(opx!=px) pos.x = opos.x;
  }
   
   
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(pos.x, pos.y, 20,20);
}
