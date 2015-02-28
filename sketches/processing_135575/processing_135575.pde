
/*Tomas de Camino
 para el taller de rogramacion de MDI veritas
 Base para armar un automata celular.
 */

//construye el arreglo para el automata celular
int spaceSize = 50;
float rectSize;
int nStates =5;
Cell[][] cellSpace = new Cell[spaceSize][spaceSize];

void setup() {
  size(600, 600);
  //cell creation and inicialization
  for (int i =0; i < spaceSize; i++) {
    for (int j =0; j < spaceSize; j++) {
      cellSpace[i][j] = new Cell(i, j, 0);
    }
  }
  cellSpace[spaceSize/2][spaceSize/2].newState(1);
  rectSize = width / spaceSize; //calculate size to fill canvas
  background(255);
  ellipseMode(CENTER);
  colorMode(HSB, nStates, 255, 255);
}

void draw() {
  frameRate(3);
  noStroke();
  smooth(8);
  storePrevious();
  //draw each cell and apply rule
  for (int i =1; i < spaceSize-1; i++) {
    for (int j =1; j < spaceSize-1; j++) {
      cellSpace[i][j].display(rectSize);//draw
      //apply rule here
      cellSpace[i][j].newState(applyRule(i, j));
    }
  }
}

void storePrevious() {
  for (int i =1; i < spaceSize-1; i++) {
    for (int j =1; j < spaceSize-1; j++) {
      cellSpace[i][j].oldState();
    }
  }
}

int applyRule(int x, int y) {
  int r=1;//range size
  int newState =cellSpace[x][y].previous;
  if (random(1)>0) {
    if (cellSpace[x][y].previous==0) {
      int sum=0;
      for (int i =-r; i <=r; i++) {
        for (int j =-r; j <=r; j++) {
          sum+=cellSpace[x+i][y+j].previous;
        }
        if (sum==2) newState = 1;
      }
    }
    else {
      newState = (cellSpace[x][y].previous+1)%nStates;
    }
  }
  return newState;
}

/***************************************
 This class contains an individual cell
 ****************************************/

class Cell {
  float x, y;
  int state;
  int previous; 

  Cell(float x_, float y_, int nStates) {
    x=x_;
    y=y_;
    state = (int)random(nStates);
    previous = state;
  } 

  void newState(int s) {
    state = s;
  }

  void oldState() {
    previous= state;
  }

  void display(float size) {
    //noFill();
    strokeWeight(1);
    fill(previous,255,255, 150);
    if (previous >0) {
      rect(x*size, y*size, size*random(1), size*1);
    }
  }
}

