
// Averaging
// Each cell becomes the average of its neighbours, with a value between 0 and 1, and is coloured as such.
// So this is a bit like a slow guassian blur with radius 1.
// Some perturbation is added by setting a few cells to 1 at random using the 'chaos' variable.
// 
// By Steven Kay, Jan 2010

float[][] world;
float[][] newworld; // next generation buffered in here
color[] palette; // random colour palette

// probability of cell not mutating. This has to be *VERY* close to 1 :)
// if you set it to 1.0, the system eventually settles into gray.
float chaos=0.99999; 


void setup(){
  size(512,512,P3D);
  world=new float[128][128];
  newworld=new float[128][128];
  reset();
  noStroke();
  palette=new color[1000];
  for (int i=0;i<1000;i++) {
    palette[i]=color(random(255),random(255),random(255));
  }
}

void draw() {
  doGen();
  for (int y=0;y<128;y++){
    for (int x=0;x<128;x++){
      fill(palette[int(world[y][x]*999.0)]);
      rect(x*4,y*4,4,4);
    }
  }
}

void mousePressed() {
  reset();
}

void doGen() {
  // do next generation
  for (int y=0;y<128;y++){ 
    int up = (y != 0 ? y - 1 : 127);
    int down = (y != 127 ? y + 1 : 0);
    for (int x=0;x<128;x++){
      int left = (x != 0 ? x - 1 : 127);
      int right = (x != 127 ? x + 1 : 0);
      float s=world[up][left] +
              world[up][x] +
              world[up][right] +
              world[y][left] +
              world[y][right] +
              world[down][left] +
              world[down][x] +
              world[down][right];
      newworld[y][x]=s/8.0;
      if (random(0,1)>chaos) newworld[y][x]=1.0; // random perturbation
    }
  }
  world=newworld;
}

void reset() {
  // clear grid to random config
  for (int y=0;y<128;y++){
    for (int x=0;x<128;x++){
      world[y][x]=random(0,1.0);
    }
  }
}

