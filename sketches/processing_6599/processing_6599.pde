
/**
  Emergent system
  by Steven Kay
  a simple cellular automaton consisting of two 'tribes', red and blue, scattered at random.
  cells are influenced to join the opposite tribe if the majority of their neighbours are of a different tribe
  eventually, cells coalesce into clumps of similar type.
**/

int EMPTY=0;
int RED=1;
int BLUE=2;

int SIZE=40; // number of cells on each axis
int WIDTH=400; // width of applet in pixels
int CELLSIZE=WIDTH/SIZE;
int TOTALSIZE=SIZE*SIZE;

// the following two values, feel free to tweak these

float THRESHOLDVALUE=0.9; // change to tweak convergence speed
float SPEED=1.2; // lower this to slow down animation

int[][]world; //current generation
int[][]newworld; // next goes in here (then moved to world to do next gen)


void setup() {
  size(WIDTH,WIDTH);
  reset();
  
}

void reset() {
  world=new int[SIZE][SIZE];
  for (int i=0;i<TOTALSIZE;i++) {
    world[i/SIZE][i%SIZE]=1+int(random(2));
  }
  newworld=world.clone();
}

float fitness(int colorcell,int row,int col) {
  // works out, for a given cell, how 'comfortable' it is/would be in that location
  // e.g. a red cell has 8 neighbours. If 4 are blank, 3 are blue and 1 is red, then
  // fitness is 1/3. The lower the fitness, the more 'isolated' the piece feels, and
  // the more likely it is to want to change
  int up=(row==0?SIZE-1:row-1);
  int down=(row==SIZE-1?0:row+1);
  int left=(col==0?SIZE-1:col-1);
  int right=(col==SIZE-1?0:col+1);
  int redsum=0;
  int blusum=0;
  if (world[up][left]==RED) redsum++;
  if (world[up][col]==RED) redsum++;
  if (world[up][right]==RED) redsum++;
  if (world[row][left]==RED) redsum++;
  if (world[row][right]==RED) redsum++;
  if (world[down][left]==RED) redsum++;
  if (world[down][col]==RED) redsum++;
  if (world[down][right]==RED) redsum++;
  if (world[up][left]==BLUE) blusum++;
  if (world[up][col]==BLUE) blusum++;
  if (world[up][right]==BLUE) blusum++;
  if (world[row][left]==BLUE) blusum++;
  if (world[row][right]==BLUE) blusum++;
  if (world[down][left]==BLUE) blusum++;
  if (world[down][col]==BLUE) blusum++;
  if (world[down][right]==BLUE) blusum++;
  if (colorcell==BLUE) return (float)blusum/(float)redsum+0.001;
  if (colorcell==RED) return (float)redsum/(float)blusum+0.001;
  return 0.0f;
}

void doMove() {
  world=newworld;
  newworld=new int[SIZE][SIZE];
  for (int i=0;i<TOTALSIZE;i++) {
    int cell=world[i/SIZE][i%SIZE];
    float fit=fitness(cell,i/SIZE,i%SIZE);
    newworld[i/SIZE][i%SIZE]=cell;
    if (cell>0 && fit<THRESHOLDVALUE && random(1)<SPEED) {
      if (cell==RED) {newworld[i/SIZE][i%SIZE]=BLUE;};
      if (cell==BLUE) {newworld[i/SIZE][i%SIZE]=RED;};
    }
  }
}

int fc=0; // framecount, used for animation

void draw() {
  
  background(0);
  noStroke();
  ellipseMode(CORNER);
  for (int i=0;i<TOTALSIZE;i++) {
    int oldcell=world[i/SIZE][i%SIZE];
    int cell=newworld[i/SIZE][i%SIZE];
    int x=CELLSIZE*(i%SIZE);
    int y=CELLSIZE*(i/SIZE);
    fill(0);
    color from=color(0);
    color to=color(0);
    if (oldcell==RED) from=color(255,0,0,255);
    if (cell==RED) to=color(255,0,0,255);   
    if (oldcell==BLUE) from=color(0,0,255,255);
    if (cell==BLUE) to=color(0,0,255,255);
    if (oldcell==EMPTY) from=color(0);
    if (cell==EMPTY) to=color(0);
    fill(lerpColor(from,to,(float)(fc/100.0)));
    ellipse(x,y,CELLSIZE,CELLSIZE);
  }
  fc++;
  if (fc%100==0) {
    doMove();
    fc=0;
  }
}

void mousePressed() {
  reset();
}

