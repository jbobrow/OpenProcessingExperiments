
int[][] angles = { { 0, 1 }, { 1, 1 }, { 1, 0 }, { 1,-1 },
                   { 0,-1 }, {-1,-1 }, {-1, 0 }, {-1, 1 } };
int numAngles = angles.length;
int maxcells =10000;
int numcells;
Cell[] cells = new Cell[maxcells];
int x, y, nx, ny;
int dir = 0;
int n;
float a,b,c;
color black = color(0);
color white = color(255);
color red = color(255,0,0);

void setup() {
  size(400, 400);
  background(255);
  float woodDensity = width * height * 0.1;
  for (int i = 0; i < woodDensity; i+=27) {
    for(int j = 0; j < woodDensity; j+=27) {
      a=random(0,10);
      if(a<9){
    //int rx = int(random(width));
   // int ry = int(random(height));
    //noStroke();
    fill(0);
    rect(i, j, random(15,40),random(15,40));
      }
    }
  }
  for(int n=0;n<maxcells;n++){
    cells[n]= new Cell();
  }
}

void draw() {
x=mouseX;
y=mouseY;
 for(int n=0;n<maxcells;n++){
cells[n].draw();
 }
}

void mousePressed(){
  setup();
}

class Cell{

Cell(){
}
void draw(){
int rand = int(abs(random(-1, 2)));

  dir = (dir + rand + numAngles) % numAngles;
  nx = (nx + angles[dir][0] + width) % width;
  ny = (ny + angles[dir][1] + height) % height;
  if ((get(x, y) == black) && (get(nx, ny) == white)) {
// Move the chip one space
    set(x, y, white);
    set(nx, ny, red);
    x = nx;
    y = ny;
  }
  else if ((get(x, y) == black) && (get(nx, ny) == black)) {
// Move in the opposite direction
    dir = (dir + (numAngles / 2)) % numAngles;
    x = (x + angles[dir][0] + width) % width;
    y = (y + angles[dir][1] + height) % height;
  }
  else {
// Not carrying
    x = nx;
    y = ny;
  }
  nx = x; // Save the current position
  ny = y;
}
}

