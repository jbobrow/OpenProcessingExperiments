
int gridsize = 40;
int gridsize2 = 5*gridsize;
int trisize = 60;
int[] randx = new int[trisize];
int[] randy = new int[trisize];

int[] rand2x = new int[trisize];
int[] rand2y = new int[trisize];

int[] rand3x = new int[trisize];
int[] rand3y = new int[trisize];

int[] rand4x = new int[trisize];
int[] rand4y = new int[trisize];


void setup() {
  size(480, 800);
  background(0);
  smooth();
  randomize();
}

void draw() {

  background(0);
  for (int i=0; i<trisize; i++) {
    drawtriangle(randx[i], randy[i]);
    drawtriangle(rand3x[i], rand3y[i]);
    drawtriangle2(rand2x[i], rand2y[i]);
    drawtriangle2(rand4x[i], rand4y[i]);
  }

  drawgrid();

   addrandom();

}
void drawgrid() {
  stroke(0, 0, 255);
  for (int i=gridsize; i<height; i=i+gridsize) {
    line(0, i, width, i);
  }
  for (int i=gridsize/2; i<width; i=i+gridsize/2) {
    line(i, 0, i+gridsize2, height);
    line(i, 0, i-gridsize2, height);
  }
}
void keyPressed() {
  if (key == 'q')gridsize2=gridsize2-1;
  if (key == 'w')gridsize2=gridsize2+1;
  // println(gridsize2);

  if (key == 'z')randomize();
  if (key == 'p')addrandom();
}

void drawtriangle(int x, int y) {
  noStroke();
  fill(0, 0, 255);
  triangle(x, y, x+gridsize/2, y, x+gridsize/4, y+gridsize);
}

void drawtriangle2(int x, int y) {
  fill(0, 0, 255);
  triangle(x+gridsize/4, y, x, y+gridsize, x+gridsize/2, y+gridsize);
}

void randomize() {
  for (int i=0; i<trisize; i++) {
    randx[i]=(int(random(0, 12))*2)*gridsize/2+gridsize/4;
    randy[i]=(int(random(0, 10))*2)*gridsize+gridsize;

    rand2x[i]=int(random(0, 12))*2*gridsize/2+gridsize/4;
    rand2y[i]=int(random(0, 10))*2*gridsize;

    rand3x[i]=(int(random(0, 12))*2)*gridsize/2;
    rand3y[i]=((int(random(0, 10))*2)+1)*gridsize+gridsize;

    rand4x[i]=int(random(0, 12))*2*gridsize/2;
    rand4y[i]=((int(random(0, 10))*2)+1)*gridsize;
  }
}

void addrandom() {
  int[] rand = new int[8];
  int[] randz = new int[8];
  for (int i=0; i<8; i++) {
    rand[i]=int(random(-2, 2));
    randz[i]=int(random(0, trisize));
    // println(rand[i]);
  }


  randx[randz[1]] =  randx[randz[1]]+gridsize/2*rand[1];
  rand2x[randz[1]] =  rand2x[randz[1]]+gridsize/2*rand[1];
  rand3x[randz[1]] =  rand3x[randz[1]]+gridsize/2*rand[1];
  rand4x[randz[1]] =  rand4x[randz[1]]+gridsize/2*rand[1];
  
  randy[randz[1]] =  randy[randz[1]]+gridsize*2*rand[1];
  rand2y[randz[1]] =  rand2y[randz[1]]+gridsize*2*rand[1];
  rand3y[randz[1]] =  rand3y[randz[1]]+gridsize*2*rand[1];
  rand4y[randz[1]] =  rand4y[randz[1]]+gridsize*2*rand[1];
}

