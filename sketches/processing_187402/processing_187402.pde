
//Written by Evan Gorski - Do not delete
//Due to not being able to resize the window it doesnt work inside openprocessing.org, copy and paste the code into processing for it to work
//to play just drag the pieces


Cell[][] grid;
int rows = 8;
int cols = 8;
int i = 0;
int j = 0;
int _i = 0;
int _j = 0;
int[][] boardArray = {
  {5,-1,5,-1,5,-1,5,-1},
  {-1,5,-1,5,-1,5,-1,5},
  {5,-1,5,-1,5,-1,5,-1},
  {0,5,0,5,0,5,0,5},
  {5,0,5,0,5,0,5,0},
  {1,5,1,5,1,5,1,5},
  {5,1,5,1,5,1,5,1},
  {1,5,1,5,1,5,1,5},
  };

void setup(){
  size(800,800);
  background(255);
  
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i*100,j*100,100,100);
    }
  }
  //board lines
  for(int i = 0; i<800; i = i+100){
  line(i,0,i,800);
  }
  for(int i = 0; i<800; i = i+100){
  line(0,i,800,i);
  }
}

void draw(){  

  //draw checkers
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (boardArray[i][j]==1){
        //draw red peice
        grid[i][j].displayRed();
      }
      else if (boardArray[i][j] == 2){
        grid[i][j].displayRedKing();
      }
      else if (boardArray[i][j] == -1){
        //draw black peice
        grid[i][j].displayBlack();
      }
      else if (boardArray[i][j] == -2){
        grid[i][j].displayBlackKing();
      }
      else{
        grid[i][j].displayBoard();
      }
    }
  }
  //check for red king
  for (int i = 0; i < cols; i++){
    if (boardArray[0][i]==1){
      boardArray[0][i]=2;
    }
  }
  //check for black king
  for (int i = 0; i < cols; i++){
    if (boardArray[7][i]==-1){
      boardArray[7][i]=-2;
    }
  }
}

  void mousePressed(){
    //get i
    i = mouseX;
    i = i/100;
    
    //get j
    j = mouseY;
    j = j/100;
  }
  void mouseReleased(){
    //get i
    _i = mouseX;
    _i = _i/100;
    
    //get j
    _j = mouseY;
    _j = _j/100;
    println(i,j,_i,_j);
    grid[i][j].move(_i,_j);
    }
    
    
    
    
    //Cell.pde
    //Written by Evan Gorski - Do not delete

class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  } 
  void displayBlack() {
    fill(0);
    ellipse(x+50,y+50,w-10,h-10);
  }
  
  void displayBlackKing(){
    fill(50);
    ellipse(x+50,y+50,w-10,h-10);
  }
  
  void displayRed(){
    colorMode(RGB);
    fill(255,20,20);
    ellipse(x+50,y+50,w-10,h-10);
  }
  
  void displayRedKing(){
    fill(200);
    ellipse(x+50,y+50,w-10,h-10);
  }
  
  void displayBoard(){
    fill(255);
    rect(x,y,w,h);
  }
  
  void move(int _i,int _j){
    
    //move red
    if(boardArray[i][j]==1){
      // out of bounds
      if(_j<=-1){
        boardArray[i][j]=0;
      }
      else if(_i>=8){
        boardArray[i][j]=0;
      }
      else if(_j>=8){
        boardArray[i][j]=0;
      }
      else if(_i<=-1){
        boardArray[i][j]=0;
      }
      
     //other restricters 
      else if(boardArray[_i][_j]==5){
        
      }
      else if(boardArray[_i][_j]==-1){
      
      }
      else if(boardArray[_i][_j]==1){
      
      }
      else if(boardArray[_i][_j]==-2){
      
      }
      else if(boardArray[_i][_j]==2){
      
      }
      //else move
      else{
        boardArray[i][j]=0;
        boardArray[_i][_j]=1;
      }
    }

    
    
    
    //move black
    if(boardArray[i][j]==-1){
       // out of bounds
      if(_j<=-1){
        boardArray[i][j]=0;
      }
      else if(_i>=8){
        boardArray[i][j]=0;
      }
      else if(_j>=8){
        boardArray[i][j]=0;
      }
      else if(_i<=-1){
        boardArray[i][j]=0;
      }
      
      //other restricters
      else if(boardArray[_i][_j]==5){
      
      }
      else if(boardArray[_i][_j]==-1){
      
      }
      else if(boardArray[_i][_j]==1){
      
      }
      else if(boardArray[_i][_j]==-2){
      
      }
      else if(boardArray[_i][_j]==2){
      
      }
      //else, move
      else{
        boardArray[i][j]=0;
        boardArray[_i][_j]=-1;
      }
    }
    
    //move black king
    if(boardArray[i][j]==-2){
       // out of bounds
      if(_j<=-1){
        boardArray[i][j]=0;
      }
      else if(_i>=8){
        boardArray[i][j]=0;
      }
      else if(_j>=8){
        boardArray[i][j]=0;
      }
      else if(_i<=-1){
        boardArray[i][j]=0;
      }
      
      // other restricters 
      else if(boardArray[_i][_j]==5){
      
      }
      else if(boardArray[_i][_j]==-1){
      
      }
      else if(boardArray[_i][_j]==1){
      
      }
      else if(boardArray[_i][_j]==-2){
      
      }
      else if(boardArray[_i][_j]==2){
      
      }
      //else, move
      else{
        boardArray[i][j]=0;
        boardArray[_i][_j]=-2;
      }
    }
      
      
      //move red king
    if(boardArray[i][j]==2){
       // out of bounds
      if(_j<=-1){
        boardArray[i][j]=0;
      }
      else if(_i>=8){
        boardArray[i][j]=0;
      }
      else if(_j>=8){
        boardArray[i][j]=0;
      }
      else if(_i<=-1){
        boardArray[i][j]=0;
      }
      
      //other restricters 
      else if(boardArray[_i][_j]==5){
      
      }
      else if(boardArray[_i][_j]==-1){
      
      }
      else if(boardArray[_i][_j]==1){
      
      }
      else if(boardArray[_i][_j]==-2){
      
      }
      else if(boardArray[_i][_j]==2){
      
      }
      //else, move
      else{
        boardArray[i][j]=0;
        boardArray[_i][_j]=2;
      }
      
      
    }
    else{
    //pass
    }
  }
}
    
    
