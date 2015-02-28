
// Yet another cellular automata
// by Steven Kay
// based on a C# demo I did a few years ago, based on the idea of 'excitable media'
// now in 3D :-)
// cite: http://en.wikipedia.org/wiki/Excitable_medium
//
// cell can be in one of 3 states
// quiet (0) - black
// ignited (-1) - yellow
// recovering (>1) - a shade of red
//
// to begin with..
// all cells are quiet
// some cells (p>1.0-PERCENT) are ignited
//
// when running, following rules apply:-
//
// a recovering cell has its value decreased until quiet (0)
// a quiet cell will ignite if ANY 8-way orthogonal neighbour is ignited 
// an ignited cell goes into recovery mode the next generation (set to value of RECOVERY)
// cells are also ignited at random to add some peturbation (p>PERTURB)
//

int SZ = 64; // size of grid
float PERCENT = .0150; //area seeded in first gen
float PERTURB = .99; // probability of random ignition
int RECOVERY = 6; //4
int mode=0;
int gen = 0;
float DEP=9; // box height
        
int[][] currworld; // current displayed generation
int[][] nextworld; // buffer for next generation
color[] palette; // colour gradient for 'recovering' cells

void setup() {
  size(512,512,P3D);
  //frameRate(1); // to see what's going on...
  reset();
}

void reset() {
  // reset world to a few random ignited cells
  gen=0;
  currworld=new int[SZ][SZ];
  nextworld=new int[SZ][SZ];
  float prob = 1.0 - (PERCENT/100.0);
  for (int y = 0; y < SZ; y++)
  {
      for (int x = 0; x < SZ; x++)
      {
          // ignite random cells
          currworld[y][x] = 0;
          nextworld[y][x] = 0;
          if (random(0,1) > prob) currworld[y][x] = -1;
      }
  }
  // create a colour palette gradient
  palette=new color[RECOVERY];
  for (int i=0; i<RECOVERY;i++) {
    float x=255.0*(i*(1.0/RECOVERY));
    palette[i]=color(x,0,0);
  }
}

void doGen() {
  // do one generation
  for (int y = 0; y < SZ; y++) {
    // for each row
    int down = (y == SZ - 1 ? 0 : y + 1);
    int up = (y == 0 ? SZ-1 : y - 1);
    for (int x = 0; x < SZ; x++) {
      // for each column in row
      int right = (x == SZ - 1 ? 0 : x + 1);
      int left = (x == 0 ? SZ - 1 : x - 1);
      if (currworld[y][x] > 0){
        // recovery period
        nextworld[y][x]=currworld[y][x]-1;
      } else if (currworld[y][x]==0){
        // resting, check for ingition by neighbour
        if (currworld[up][left]==-1 ||
            currworld[up][x]==-1||
            currworld[up][right]==-1||
            currworld[y][left]==-1||
            currworld[y][right]==-1||
            currworld[down][left]==-1 ||
            currworld[down][x]==-1||
            currworld[down][right]==-1) 
            {
              nextworld[y][x]=-1; // ignite!
            } 
      } else {
        // ignited last generation, so go into recovery...
        nextworld[y][x]=RECOVERY;
      }
      // random perturb
      if (random(0,1)>PERTURB) {
        nextworld[(int)random(0,SZ)][(int)random(0,SZ)]=-1;
      }
    }
  }
  // copy generation into draw buffer              
  for (int y = 0; y < SZ; y++) {
    for (int x = 0; x < SZ; x++) {
      currworld[y][x]=nextworld[y][x];
    }
  }
}

void mousePressed() {
  reset();
}

void draw() {
  // draw current world
  doGen();
  background(0);
  camera(256,256,-500,256,256,0,0,1,0);
  for (int y = 0; y < SZ; y++)
  {
      for (int x = 0; x < SZ; x++)
      {
          pushMatrix();
          translate(x*8,y*8,0);
          if (currworld[y][x] == 0) {
            ;
          } else if (currworld[y][x]==-1) {
            fill(255,255,0);
            box(8,8,DEP*RECOVERY-1);
          }else{
            fill(palette[currworld[y][x]-1]);
            box(8,8,DEP*currworld[y][x]);
          }
          popMatrix();
      }
  }
}

