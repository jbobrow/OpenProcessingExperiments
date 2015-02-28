
Piece[][] grid;
BoardBuilder build;
Manager manager;
boolean canDoThing;
boolean canPlacePieces = true;

  void keyReleased(){
    canDoThing = true;
  }    

void setup(){
  build = new BoardBuilder();
  grid = new Piece[build.boardSize][build.boardSize];
  manager = new Manager();
  canDoThing = true;
  

  
  size(450,450);
  
  background(255);  
  build.drawXLines();
  build.drawYLines();  
  
  for (int i = 0; i < build.boardSize; i++) {
  for (int j = 0; j < build.boardSize; j++) {
    grid[i][j] = new Piece(
    (build.xIncrement/2)+(i * build.xIncrement),
    (build.yIncrement/2)+(j * build.yIncrement),
    (build.xIncrement/10)*8,
    (build.yIncrement/10)*8,
    false);
    }
  }  
}

  
void draw(){
  if (keyPressed == true && canDoThing == true){
    //canPlacePieces = false;
    canDoThing = false;    
      for (int i = 0; i < build.boardSize; i++) {
        for (int j = 0; j < build.boardSize; j++) {
          grid[i][j].show();
                    
    }
  }
  manager.check(grid);  
  } 

}

  void mousePressed(){ 
    if (canPlacePieces == true){
    for (int i = 0; i < build.boardSize; i++) {
      for (int j = 0; j < build.boardSize; j++) { 
        if (
        mouseX >= (grid[i][j].x - (grid[i][j].xSize/2)) &&
        mouseX <= (grid[i][j].x + (grid[i][j].xSize/2)) &&
        mouseY >= (grid[i][j].y - (grid[i][j].ySize/2)) &&
        mouseY <= (grid[i][j].y + (grid[i][j].ySize/2))){
          if (grid[i][j].alive == true){
            grid[i][j].alive = false;
            grid[i][j].show();            
          } else {
          grid[i][j].alive = true;
          grid[i][j].show();
          }
        }
      }
      }
    }
  }
class BoardBuilder{
  
//int high = 450;
//int wide = 450;

int boardSize = 3;

int xIncrement = 450 / boardSize;
int yIncrement = 450 / boardSize;
int linesNeeded = boardSize - 1;

void drawXLines(){
  int linesDrawn = 0;
  int lineDrawingX = 0;
  while (linesDrawn <= linesNeeded){
    lineDrawingX = lineDrawingX + xIncrement;
    line(lineDrawingX,0,lineDrawingX,450);
    linesDrawn ++;
    
    }
    
  }
  
  void drawYLines(){
  int linesDrawn = 0;
  int lineDrawingY = 0;
  while (linesDrawn <= linesNeeded){
    lineDrawingY = lineDrawingY + yIncrement;
    line(0,lineDrawingY,450,lineDrawingY);
    linesDrawn ++;
    
    }
    
  }

}
class Coordinates{
  int xCoord;
  int yCoord;
  boolean scopeAlive;
  
  Coordinates(int tempXCoord, int tempYCoord){
    
    xCoord = tempXCoord;
    yCoord = tempYCoord;
    
  }
  
  void getAlive(boolean aliveToCheck){
    scopeAlive = aliveToCheck;
  }
  
  int getXCoord(){
    return xCoord;
  }
  
  int getYCoord(){
    return yCoord;
  }
  
}
    
class Manager{
  
  Piece[][] toCheck;
  int arrayMax;
  Coordinates[][] inScope;
  
  void check(Piece[][] tempArray){
    int living = 0;
    toCheck = tempArray;
    
    inScope = new Coordinates[3][3];
    
    for (int i = 0; i < build.boardSize; i++) {
      for (int j = 0; j < build.boardSize; j++) {      
        inScope[0][0] = new Coordinates(i-1,j-1); inScope[1][0] = new Coordinates(i,j-1); inScope[2][0] = new Coordinates(i+1,j-1);
        inScope[0][1] = new Coordinates(i-1,j);   inScope[1][1] = new Coordinates(i,j);   inScope[2][1] = new Coordinates(i+1,j);
        inScope[0][2] = new Coordinates(i-1,j+1); inScope[1][2] = new Coordinates(i,j+1); inScope[2][2] = new Coordinates(i+1,j+1);
          for (int k = 0; k < 3; k++){//println(k);
            for (int m = 0; m < 3; m++){ //println(k + " " + m); 
            //println(m);
              //println(k + " " + m);
               //println("before 1st if" + " " + i + " " + j + " " + k + " " + m + " " + inScope[k][m].xCoord + " " + inScope[k][m].yCoord + " " + inScope[k][m].scopeAlive);
               //println("End loop" +" " + i + " " + j + " " + k + " " + m + " ");
               //println(inScope[1][2].xCoord + " " + inScope[1][2].yCoord);
             if(k == 1 && m == 1){
             } else {
              //println(k + " " + m);         
               //println("Before 2nd if" + " " + i + " " + j + " " + k + " " + l + " " + inScope[k][l].xCoord + " " + inScope[k][l].yCoord + " " + inScope[k][l].scopeAlive); 
               //println("End loop" +" " + i + " " + j + " " + k + " " + m + " ");
              if (inScope[k][m].xCoord >= 0 && inScope[k][m].xCoord < build.boardSize && inScope[k][m].yCoord >= 0 && inScope[k][m].yCoord < build.boardSize)
              {  inScope[k][m].getAlive(toCheck[inScope[k][m].getXCoord()][inScope[k][m].getYCoord()].alive);
               //println("Before 3rd if" + " " + i + " " + j + " " + k + " " + l + " " + inScope[k][l].xCoord + " " + inScope[k][l].yCoord + " " + inScope[k][l].scopeAlive);               
                  //println("End loop" +" " + i + " " + j + " " + k + " " + m + " ");
                  if (inScope[k][m].scopeAlive == true){  
                   living++;   
                 //println("End loop" +" " + i + " " + j + " " + k + " " + m + " "); 
                }
              }
            }
          }
        }
      }
    } println(living);
        //for (int i = 0; i < build.boardSize; i++) {
      //for (int j = 0; j < build.boardSize; j++) { 
        //println("Final Chech" + " " + toCheck[i][j].alive);
        //println(living);
      //}
        //}
  }
}
class Piece{
  
  int x;
  int y;
  int xSize;
  int ySize;
  boolean alive;
  
  Piece(int tempX, int tempY, int tempXSize, int tempYSize, boolean tempAlive){
    x = tempX;
    y = tempY;
    xSize = tempXSize;
    ySize = tempYSize;
    alive = tempAlive;    
  }
  
  void show(){
  if (alive == true){
  fill(0);
  noStroke();
  ellipse (x, y, xSize, ySize);
    } else {
        fill(255);
        noStroke();
        ellipse (x, y, xSize, ySize);
    }
    
  }  
}


