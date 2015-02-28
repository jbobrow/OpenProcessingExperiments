
int numcells = 0;
int maxcells = 6700;
Cell [] cells = new Cell[maxcells];
int runs_per_loop = 10000;
color spore_color = color(255, 200, 28);
color black = color(0);


void setup() {
 size(200, 540);
 frameRate(24);
 
 reset();
 
}

void draw() {
  for (int i = 0; i < runs_per_loop; i++){
    int selected = floor(random(0, numcells));
    cells[selected].run();
  }
}


void seed() {
  for (int i = 0; i < maxcells; i++) {
    int cx = floor(random(0, width));
    int cy = floor(random(0, height));
   
   //wrapping the cells to a torus
   PVector toroVector = toro(cx, cy);
   int toroX = floor(toroVector.x);
   int toroY = floor(toroVector.y);
   
   color cellColor = get(toroX, toroY);
   if(cellColor == black) {
     //change color of cell
     set(toroX, toroY, spore_color);
     cells[numcells] = new Cell(cx, cy);
     numcells++;
   }
  }
}
  
void reset() {
  background(0);
  numcells = 0;
  seed();
}

void mousePressed() {
 reset(); 
}


class Cell {
  int x, y;
  
  Cell( int ax, int ay) {
    x = ax;
    y = ay;
  }
  
  void run() {
    PVector toroVector = toro(x, y);
    x = floor(toroVector.x);
    y = floor(toroVector.y);
    
    //if cell to the right is black, move down
    if(get(x+1, y) == black) {
      move(0, 1);
    }
    //else if spaces are black above or below, move randomly between 0 and 5 spots
    else if (get(x, y-1) != black && get(x, y+1) != black) {
      move(floor(random(0, 5)), floor(random(0, 5)));
    }
  }
  
  void move(int dx, int dy) {
   //if the new spot is black, move there
  PVector toroVector = toro(x + dx, y +dy);
  int newX = floor(toroVector.x);
  int newY = floor(toroVector.y);
  if (get(newX, newY) == black) {
    set(x,y, black);
    set(newX, newY, spore_color);
    x += dx;
    y += dy;
  }
  }
}

//wrap around screen
PVector toro(int x, int y) {
  x %= width;
  y %= height;
  if (x < 0) x += width;
  if (x < 0) y += height;
  return new PVector(x, y);
}



