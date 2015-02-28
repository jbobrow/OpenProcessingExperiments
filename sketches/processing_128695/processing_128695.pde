
//Rat in a Maze
final int Wall = 0;
final int Free = 1;
final int Visited = 2;
final int Path = 3;
final int Size = 7;

//class Cell
class Cell {
  int status;
  int row;
  int col;

  Cell() {
    status = Wall; 
    row = 0;
    col = 0;
  }

  void display() {
    if (status==Free || status==Visited || status==Path)
    { 
      fill(255);    
      rect(col*40, row*40, 40, 40); 
      fill(0);
    }
    else
    {  
      fill(#F2FAA4);    
      rect(col*40, row*40, 40, 40); 
      fill(255);
    }
  }
}

//Class Maze
class Maze {
  Cell[][] position;

  Maze() {
    position = new Cell[Size][Size];
    int i, j;
    for (j=0;j<=Size-1;j++)
    {
      for (i=0;i<=Size-1;i++)
      {
        position[i][j]= new Cell();
        position[i][j].row = j;
        position[i][j].col = i;
        position[i][j].status = Wall;
      }
    }
    position[1][0].status = Free;
    position[1][1].status = Free;
    position[2][1].status = Free;
    position[3][1].status = Free;
    position[3][2].status = Free;
    position[3][3].status = Free;
    position[3][0].status = Free;
    position[3][4].status = Free;
    position[1][3].status = Free;
    position[2][4].status = Free;
    position[1][4].status = Free;
    position[4][4].status = Free;
    position[5][4].status = Free;
    position[5][3].status = Free;
    position[5][2].status = Free;
    position[5][1].status = Free;
    position[1][5].status = Free;
    position[5][5].status = Free;
  }

  void display() {
    int i, j;
    for (i=0;i<=Size-1;i++)
      for (j=0;j<=Size-1;j++)
        position[i][j].display();
  }
}

//Class Rat
class Rat {
  int row;
  int col;

  Rat() {
    row = 0;
    col = 1;
  }

  void display() {
    fill(#EBFC30);
    noStroke();
    ellipse(col*40+20, row*40+20, 27, 20);
    fill(200);
    textSize(22);
    text("~:",col*40+9, row*40+24);
  }

  void remove() {
    fill(255);
    stroke(255);
    ellipse(col*40+20, row*40+20, 27, 20);
    fill(#EBFC30);
    ellipse(col*40+20, row*40+20, 5, 5);
  }

  void display2() {
    print(col + ",");
    println(row);
  }
}

//moveSouth
boolean moveSouth(Maze theMaze, Rat theRat)
{
  boolean done = false;
  if (theMaze.position[theRat.col][theRat.row+1].status == Free) {
    theMaze.position[theRat.col][theRat.row+1].status = Visited;
    theRat.remove();
    theRat.row++;
    theRat.display();
    done = true;
  }
  return done;
}

//moveWest
boolean moveWest(Maze theMaze, Rat theRat)
{
  boolean done = false;
  if (theMaze.position[theRat.col-1][theRat.row].status == Free) {
    theMaze.position[theRat.col-1][theRat.row].status = Visited;
    theRat.remove();
    theRat.col--;
    theRat.display();
    done = true;
  }
  return done;
}

//moveEast
boolean moveEast(Maze theMaze, Rat theRat)
{
  boolean done = false;
  if (theMaze.position[theRat.col+1][theRat.row].status == Free) {
    theMaze.position[theRat.col+1][theRat.row].status = Visited;
    theRat.remove();
    theRat.col++;
    theRat.display();
    done = true;
  }
  return done;
}

//moveNorth
boolean moveNorth(Maze theMaze, Rat theRat)
{
  boolean done = false;
  if (theMaze.position[theRat.col][theRat.row-1].status == Free) {
    theMaze.position[theRat.col][theRat.row-1].status = Visited;
    theRat.remove();
    theRat.row--;
    theRat.display();
    done = true;
  }
  return done;
}

//Class Stack
class Stack {
  Rat [] spot;
  int index;

  Stack () {
    spot = new Rat[30];
    index = -1;
  }

  void display() {
    int i;
    for (i=0;i<index;i++)
      spot[i].display2();
    println("Bottom");
  }

  void push(Rat thisRat) {
    Rat localRat = new Rat();
    localRat.row = thisRat.row;
    localRat.col = thisRat.col;
    index++;
    spot[index] = localRat;
  }

  Rat pop() {
    Rat thisRat = new Rat();
    thisRat.row = spot[index].row;
    thisRat.col = spot[index].col;
    index--;
    return thisRat;
  }
}



//Main Program
Maze aMaze;
Rat aRat;
Cell testCell;
boolean success;
char lastMove;
Stack ratStack;
boolean solved;


void setup() {
  size(320, 320); 
  background(255);
  smooth();
  aMaze = new Maze();
  aRat = new Rat();
  ratStack = new Stack();
  translate(20, 20);
  stroke(210);
  aMaze.display();
  solved = false;
  ratStack.push(aRat);
}
void draw() {
  frameRate(1);
  noStroke();
  translate(20, 20);

  aRat.display();
  success = moveSouth(aMaze, aRat);
  if (success) {
    lastMove = 'S';
    ratStack.push(aRat);
  }
  else {
    success = moveWest(aMaze, aRat);
    if (success) {
      lastMove = 'W';
      ratStack.push(aRat);
    }
    else {
      success = moveEast(aMaze, aRat);
      if (success) {
        lastMove = 'E';
        ratStack.push(aRat);
      }
      else {
        success = moveNorth(aMaze, aRat);
        if (success) {
          lastMove = 'N';
          ratStack.push(aRat);
        }
        else {
          aRat.remove();
          aRat = ratStack.pop();
          aRat = ratStack.pop();
          ratStack.push(aRat);
          aRat.display();
        }
      }
    }
  }
  if (aRat.row==0 && aRat.col==3) {
    solved = true;
  }
  if (solved) {
    noLoop();
    ratStack.pop();
    while (ratStack.index >= 0) {
      aRat = ratStack.pop();
      fill(0);
      ellipse(aRat.col*40+20, aRat.row*40+20, 5, 5);
    }
  }
}

