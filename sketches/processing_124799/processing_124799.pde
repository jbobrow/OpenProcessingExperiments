
import java.util.Vector;

public static class globals{
  static boolean visited[][];
  static point2d knightPosition;
  static int attempts = 0;
}

void setup(){
  size(800,800);
  rectMode(CORNER);
//  frameRate(0);
  new movementThread().start();
}

void draw(){
  for(int i=0; i<8; i++)
    for(int j=0; j<8; j++){
      if (globals.visited[i][j] == true)
        fill(0,200,200);
      else if ((i%2 == 1 && j%2 == 0) || (i%2 == 0 && j%2 == 1))
        fill(100);
      else
        fill(255);
      rect(i*100,j*100,100,100);
    }
}

class movementThread extends Thread{
  
  movementThread(){
    globals.visited = new boolean[8][8];
    moveKnight(new point2d((int)random(8),(int)random(8)));
  }
  
  void run(){
    while(true){
      Vector<point2d> availableMoves = getAvailableMoves();
      if (visitedAll() == true){
        println("Attempts: " + (globals.attempts++));
        println("Solution found!");
        delay(9999999);
      }
      else if (availableMoves.size() == 0){
        globals.visited = new boolean[8][8];
        moveKnight(new point2d((int)random(8),(int)random(8)));
        availableMoves = getAvailableMoves();
        println(globals.attempts++);
      }
      moveKnight(availableMoves.elementAt((int)random(availableMoves.size()-1)));
    }
  }
 
  boolean visitedAll(){
     for(int i=0; i<8; i++)
      for(int j=0; j<8; j++)
       if (globals.visited[i][j] == false)
        return false;
      return true; 
  }

  void moveKnight(point2d position){
    globals.knightPosition = position;
    globals.visited[position.x][position.y] = true;
  }

  Vector<point2d> getAvailableMoves(){
    Vector<point2d> availableMoves = new Vector();
    
    point2d possibleMoves[] = new point2d[8];
    possibleMoves[0] = new point2d(1,-2);
    possibleMoves[1] = new point2d(2,-1);
    possibleMoves[2] = new point2d(2,1);
    possibleMoves[3] = new point2d(1,2);
    possibleMoves[4] = new point2d(-1,2);
    possibleMoves[5] = new point2d(-2,1);
    possibleMoves[6] = new point2d(-2,-1);
    possibleMoves[7] = new point2d(-1,-2);
    
    for(int i=0; i < possibleMoves.length; i++){
    
      point2d potentialMove = new point2d(globals.knightPosition.x+possibleMoves[i].x,globals.knightPosition.y+possibleMoves[i].y);
    
      if (potentialMove.x >= 0 && potentialMove.y >= 0 && potentialMove.x < 8 && potentialMove.y < 8)
        if (globals.visited[potentialMove.x][potentialMove.y] == false)
          availableMoves.addElement(potentialMove);
    }
      
    return availableMoves;
  }
  
}

class point2d{
  int x,y;
  point2d(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  String toString(){
    return "point2d "+System.identityHashCode(this)+", x: "+this.x+", y: "+this.y;
  }
}

