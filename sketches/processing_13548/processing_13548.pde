

//var for size of sketch - square - strictly speaking 
//size function should be a constant not a var...
//if this bothers you, change the setup, just be sure you keep
//the size you make your sketch a square of size s...
int s=600;

//how many pixels each cell is - square
int cellSize=12;

//probability cell is live  for initial state
int p=15;

//color to show dead cells
int dc=color(64,64,64);

//color to show live cells
int lc=color(0,255,0);

//frame rate
int rate=8;

//array of all cells
int[][] cells = new int[s/cellSize][s/cellSize];



void setup() 
{


  frameRate(rate);

  noStroke();

  //make sure a square
  size(s,s);

  background(dc);
  for (int i=0;i<s/cellSize;i++) {
    for (int j=0;j<s/cellSize;j++) {
      if (random(100)<p) {
        makeAlive(cells,i,j);
      }
      else {
        makeDead(cells,i,j);
      }
    }
  }
  reDraw();
}
void draw()
{
  int n=0;
  int[][] newCells  = new int[s/cellSize][s/cellSize];
  for (int i=0;i<s/cellSize;i++) {
    for (int j=0;j<s/cellSize;j++) {
      makeDead(newCells,i,j);
      n=howManyNeighbours(i,j);
      if (isAlive(i,j)) {
        if(n==2 || n==3) {
          makeAlive(newCells,i,j);
        }
      }
      else {
        if(n==3) {
          makeAlive(newCells,i,j);
        }
      }
    }
  }
  cells=newCells;
  reDraw();
}

void makeAlive(int[][] a,int i, int j) {

  a[i][j]=1;
}
void makeDead(int[][] a,int i, int j) {

  a[i][j]=0;
}


void reDraw() {

  for (int i=0;i<s/cellSize;i++) {
    for (int j=0;j<s/cellSize;j++) {
      if (isAlive(i,j)) {

        fill(lc);

        rect(i*cellSize,j*cellSize,cellSize,cellSize);
      }
      else {
        fill(dc);

        rect(i*cellSize,j*cellSize,cellSize,cellSize);
      }
    }
  }
}

boolean isAlive(int i, int j) {
  boolean bR;
  if (cells[i][j]==1) {
    bR=true;
  }
  else {
    bR=false;
  }
  return bR;
}

int howManyNeighbours(int i, int j) {
  int n=0;
  int o=0;
  int p=0;
  for (int k=-1;k<=1;k++) {
    for (int l=-1;l<=1;l++) {
      o=i+k;
      p=j+l;
      if(k!=0 || l!=0) {
        if (o>=0 && o<  s/cellSize && p>=0 && p< s/cellSize ) {
          n=n+cells[o][p];
        }
      }
    }
  }

  return n;
}
void keyPressed()
{
  //if ( key == 's' ) save(str(millis())+".jpg");
  if ( key == 'r' ) setup();
}


