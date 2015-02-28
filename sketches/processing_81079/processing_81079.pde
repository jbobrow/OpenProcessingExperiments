
class Ball {
 
  int x;
  int y;
  int destinationX;
  int destinationY;
  int s;
  color c;
 
  int speed;
 
  Ball(int _x, int _y, int _s, color _c) {
    x=_x;
    y=_y;
    destinationX=x;
    destinationY=y;
    s=_s;
    c=_c;
    speed=20;
  }
 
  void display() {
    if (x<destinationX)x=min(destinationX,x+speed);
    else if (x>destinationX) x=max(destinationX,x-speed);
 
    if (y<destinationY) y=min(destinationY,y+speed);
    else if (y>destinationY) y=max(destinationY,y-speed);
    noStroke();
    fill(c);
    ellipse(x,y,s,s);
  }
 
  void resize(int _s) {
 
    s=_s;
  }
 
  void place(int _x, int _y) {
    x=_x;
    y=_y;
    destinationX=_x;
    destinationY=_y;
  }
 
  void placeTravel(int _x, int _y) {
    destinationX=_x;
    destinationY=_y;
  }
}

class Cell {
 
  int x;
  int y;
  boolean[] walls = {
    true,true,true,true
  };
  int w;
  int visited = 0;
  boolean marked=false;
 
  Cell(int _x, int _y, int _w) {
    x = _x;
    y= _y;
    w=_w;
  }
 
  void display(int _weight) {
    noStroke();
    fill(255-visited);
    rect(x+_weight/2,y+_weight/2,w-_weight,w-_weight);
    stroke(0);
    strokeWeight(_weight);
 
    if (walls[0]) line(x,y,x+w,y);
    if (walls[1]) line(x,y+w,x+w,y+w);
    if (walls[2]) line(x,y,x,y+w);
    if (walls[3]) line(x+w,y,x+w,y+w);
  }
 
  void reset() {
    for (int i = 0; i < 4; i++) {
      walls[i]=true;
    }
    visited = 0;
  }
}

PFont font;
 
int[] mazeSizes = {
  6,8,10,12,15,20
};
int mazeIndex=0;
 
Maze maze;
Ball ball;
 
boolean finished;
long timer;
 
int secretMazeSize;
 
void setup() {
  size(650,650);
  //size(screen.width,screen.height);
  font = loadFont("Osaka-60.vlw");
  //smooth();
  background(255,245,235);
 
  maze = new Maze(width/2-300,height/2-300,600,mazeSizes[0]);
 
  ball = new Ball(maze.x+maze.step/2, maze.y+maze.step/2,3*maze.step/4,color(255,127,0));
 
  finished = false;
  timer = millis();
}
 
void draw() {
 
  if (!maze.complete) {
    maze.routeStep();
  }
 
  else {
    if (!finished) {
      background(255);
      maze.display();
 
      //indicate destination cell
      fill(200,255,200);
      stroke(0,255,0);
      strokeWeight(3);
      ellipse(maze.destinationX+maze.step/2,maze.destinationY+maze.step/2,3*maze.step/4+2,3*maze.step/4+2);
 
      //show player position
      ball.display();
 
      if (ball.x>maze.destinationX && ball.y>maze.destinationY) {
        finished = true;
      }
    }
    else {
      noStroke();
      fill(127,255,127,10);
      rect(0,0,width,height);
      fill(255);
      rect(width/6,height/2-125,4*width/6,250);
      textFont(font,60);
      textAlign(CENTER,CENTER);
      fill(0);
      text("you win!\nhit space for\na new maze",width/2,height/2);
    }
  }
}
 
void keyPressed() {
 
  if (!finished) {
    boolean[] walls = maze.travelThrough(ball.x, ball.y);
 
    if (keyCode == UP) {
      if (!walls[0]) ball.place(ball.x,max(maze.step/2,ball.y-maze.step));
    }
    if (keyCode == DOWN) {
      if (!walls[1]) ball.place(ball.x,min(height-maze.step/2,ball.y+maze.step));
    }
    if (keyCode == LEFT) {
      if (!walls[2]) ball.place(max(maze.step/2,ball.x-maze.step),ball.y);
    }
    if (keyCode == RIGHT) {
      if (!walls[3]) ball.place(min(width-maze.step/2,ball.x+maze.step),ball.y);
    }
  }
  else {
    if (key == ' ') {
      background(255,245,235);
 
      mazeIndex = (mazeIndex+1) % mazeSizes.length;
      maze.reset(mazeSizes[mazeIndex]);
      ball.resize(3*maze.step/4);
      ball.place(maze.x+ maze.step/2, maze.y+maze.step/2);
    }
  }
 
  //secret maze generation
  if (key == 'n') {
    background(255,245,235);
    secretMazeSize+=10;
    maze.reset(secretMazeSize);
    ball.resize(3*maze.step/4);
    ball.place(maze.x+ maze.step/2, maze.y+maze.step/2);
  }
}

class Maze {
 
  int x;
  int y;
  int w;
  int cellsAcross;
  ArrayList cells;
 
  int destinationX;
  int destinationY;
 
  int totalCells;
  int visitedCells;
  int currentCell;
  int[] cellStack = new int[1];
  int step;
 
  boolean complete;
 
  Maze(int _x, int _y, int _w, int _ca) {
    x=_x;
    y=_y;
    w=_w;
    cellsAcross=_ca;
 
    step = w/cellsAcross;
    totalCells = cellsAcross*cellsAcross;
    visitedCells = 1;
    currentCell = totalCells-1;
    cellStack[0] = currentCell;
 
    cells = new ArrayList();
    for (int i = 0; i < cellsAcross; i++) {
      for (int j=0; j < cellsAcross; j++) {
        Cell c = new Cell(x+j*step,y+i*step,step);
        cells.add(c);
      }
    }
    complete = false;
 
    Cell lastCell=(Cell) cells.get(cells.size()-1);
    lastCell.marked=true;
 
    destinationX=x+w-step;
    destinationY=y+w-step;
  }
 
  void reset(int _ca) {
 
    cellsAcross=_ca;
    step = w/cellsAcross;
 
    for (int i = cells.size()-1; i >=0; i--) {
      cells.remove(i);
    }
 
    for (int i = 0; i < cellsAcross; i++) {
      for (int j=0; j < cellsAcross; j++) {
        Cell c = new Cell(x+j*step,y+i*step,step);
        cells.add(c);
      }
    }
 
    Cell lastCell=(Cell) cells.get(cells.size()-1);
    lastCell.marked=true;
 
    while (cellStack.length>1) {
      cellStack = shorten(cellStack);
    }
 
    totalCells = cellsAcross*cellsAcross;
    visitedCells=1;
    currentCell = totalCells-1;
    cellStack[0]=currentCell;
    destinationX=x+w-step;
    destinationY=y+w-step;
    finished = false;
    complete = false;
    randomSeed(millis());
  }
 
 
  void display() {
    for (int i = 0; i < cells.size(); i++) {
      Cell c = (Cell) cells.get(i);
      c.display(step/8);
    }
  }
 
  boolean[] travelThrough(int _x, int _y) {
 
    int index = cellsAcross*((_y-y)/step) + ((_x-x)/step);
    Cell inCell = (Cell) cells.get(index);
    inCell.visited = min(255,inCell.visited+65);
    return inCell.walls;
  }
 
  void routeStep() {
 
    //find the current cell's neighbors
    int numberOfPossibles=0;
 
    int[] neighbors = {
      currentCell-cellsAcross,currentCell+cellsAcross,currentCell-1,currentCell+1
    };
 
    //check for edges
    if (currentCell-cellsAcross<0) neighbors[0]=-1;
    if (currentCell+cellsAcross>=cellsAcross*cellsAcross) neighbors[1]=-1;
    if (currentCell%cellsAcross==0) neighbors[2]=-1;
    if (currentCell%cellsAcross==cellsAcross-1) neighbors[3]=-1;
 
    //check for previously visited cells
    for (int i = 0; i < 4; i++) {
      if (neighbors[i]!=-1) {
        Cell c = (Cell) cells.get(neighbors[i]);
        if (c.marked) neighbors[i]=-1;
        else numberOfPossibles++;
      }
    }
 
    if (numberOfPossibles>0) { 
      int chosenCell = int(random(numberOfPossibles));
      for (int i = 0; i < 4; i++) {
        if (neighbors[i]!=-1) {
          if (chosenCell==0) {
            //this is the next cell
            Cell thisCell = (Cell) cells.get(currentCell);
            Cell nextCell = (Cell) cells.get(neighbors[i]);
            // thisCell.marked=true;
            nextCell.marked=true;
            //let's knock down the 2 adjoining walls
            if (i==0) {
              thisCell.walls[0]=false;
              nextCell.walls[1]=false;
            }
            if (i==1) {
              thisCell.walls[1]=false;
              nextCell.walls[0]=false;
            }
            if (i==2) {
              thisCell.walls[2]=false;
              nextCell.walls[3]=false;
            }
            if (i==3) {
              thisCell.walls[3]=false;
              nextCell.walls[2]=false;
            }
            visitedCells++;
            if (visitedCells==totalCells) {
              complete=true;
              println(millis()-timer);
            }
            currentCell = neighbors[i];
            cellStack = append(cellStack,currentCell);
            stroke(0,0,255,5+250*thisCell.x/width);
            strokeWeight(step/2);
            int w = width/(cellsAcross*2);
            line(thisCell.x+step/2,thisCell.y+step/2,nextCell.x+step/2,nextCell.y+step/2);
            break;
          }
          else {
            chosenCell--;
          }
        }
      }
    }
    else {
      currentCell = cellStack[cellStack.length-1];
      cellStack = shorten(cellStack);
    }
  }
}



