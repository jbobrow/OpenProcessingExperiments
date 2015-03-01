

float[][] grid;
float zoomamt=0;
int moveleft=0, moveup=0;


void setup() {
  size(640, 360);
  frameRate(24);
  grid = new float[width][height];
  reset();
}

void draw() {
  blur(4);
  sharpen();
  display();
  zoom();
  move();
}

void reset() {
  background(0);
  noFill();
  stroke(255);
  strokeWeight(6);
  ellipse(width/2, height/2, height/2, height/2);
  zoomamt=0;
  moveleft=0;
  moveup=0;
  loadPixels();
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) { 
      grid[i][j] = brightness(pixels[i+j*width]);
    }
  }
}

void blur(int times) {
  float[][] newgrid = new float[width][height];
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) { 
      float total = 0;
      for (int x=-1; x<2; x++) {
        for (int y=-1; y<2; y++) {
          total += grid[(i+x+width)%width][(j+y+height)%height];
        }
      }
      total = total/9;
      newgrid[i][j] = total;
    }
  }
  grid = newgrid;
  times--;
  if (times>0) blur(times);
}

void sharpen() {
  float[][] newgrid = new float[width][height];
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) { 
      float total = 0;
      for (int x=-1; x<2; x++) {
        for (int y=-1; y<2; y++) {
          if (x==0 && y==0) total += 9*grid[i][j];
          else total -= grid[(i+x+width)%width][(j+y+height)%height];
        }
      }
      total = constrain(total, 0, 255);
      newgrid[i][j] = total;
    }
  }
  grid = newgrid;
}

void display() {
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      pixels[i+j*width] = color(grid[i][j]);
    }
  }
  updatePixels();
}

void zoom() {
  float[][] newgrid = new float[width][height];
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) { 
      int newx = round(map(i, 0, width, zoomamt, width-zoomamt));
      int newy = round(map(j, 0, height, zoomamt*height/width, height-zoomamt*height/width));
      newgrid[i][j] = grid[newx][newy];
    }
  }
  grid = newgrid;
}

void move() {
  float[][] newgrid = new float[width][height];
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) { 

      newgrid[i][j] = grid[(i+moveleft+width)%width][(j+moveup+height)%height];
    }
  }
  grid = newgrid;
}

void keyPressed() {
  if (key=='1') zoomamt+=0.5;
  if (key=='0' && zoomamt>0) zoomamt-=0.5;
  if (key=='r') reset();
  if (key == CODED) {
    if (keyCode==LEFT) {
      moveleft++;
    }
    if (keyCode==RIGHT) {
      moveleft--;
    }
    if (keyCode==DOWN) {
      moveup--;
    }
    if (keyCode==UP) {
      moveup++;
    }
  }
}



