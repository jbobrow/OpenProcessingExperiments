
/*Nicole Strang
  ITGM 315 -- Processing
  11/06/2012
  Final Project -- Alpha 1.5
  
  Play
  The goal of this part of the project is to streamline the core playable code and add classes. Alpha handles draw(). The Play class stores an 
  entire puzzle.
  */




class Play{
  
  //Variables------------------------------------------------------------------------------------------------------------------------------------
  Puzzle[] pieces = new Puzzle[9];
  color[] cVal = {color(255,0,55), color(223,0,83), color(195,0,111), color(167,0,139), color(139,0,167), color(111,0,195), color(83,0,223), color(55,0,255), color(255,255,255)};
  boolean[] numSolved = {false, false, false, false, false, false, false, false, false};
  int[] location = {0, 0, 0, 0, 0, 0, 0, 0, 0};
  int[] locX = {100, 175, 250, 100, 175, 250, 100, 175, 250};
  int[] locY = {150, 150, 150, 225, 225, 225, 300, 300, 300};
  
  int i, u, o, tempX, tempY;
  
  
  
  //Constructor----------------------------------------------------------------------------------------------------------------------------------
  Play(){
    
    
    //Set up Puzzle
    for(i=0; i<9; i++){
      pieces[i] = new Puzzle(i, locX[i], locY[i], 72, 72, cVal[i]);
      pieces[i].create();
    }
    
  }
  
  
  //Shuffle Puzzle Pieces Locations--------------------------------------------------------------------------------------------------------------
  void shuffle(){
    u = 0;
  
    for(i=0; i<9; i++){
      location[i] = 0;
    }
    
    i=0;
  
    //Randomizer
    while(i<9){
        u = int(random(0,9));
        if(location[u]==0){
          pieces[i].storePos(locX[u], locY[u]);
          location[u] = 1;
          i++;
        }
      }
      
    //Reset
    for(i=0; i<9; i++){
      pieces[i].create();
    }
  }
  
  
  //Move a piece--------------------------------------------------------------------------------------------------------------------------------
  void movePiece(int i){
    if( checkMove(pieces[8].sendX(), pieces[8].sendY(), pieces[i].sendX(), pieces[i].sendY() ) ){
          
          tempX = pieces[8].sendX();
          tempY = pieces[8].sendY();
          pieces[8].storePos(pieces[i].sendX(), pieces[i].sendY());
          pieces[i].storePos(tempX, tempY);
          pieces[8].create();
          pieces[i].create();
          
        }
  }
  
  
  //Check if the puzzle is solved----------------------------------------------------------------------------------------------------------------
  boolean checkSolved(){
    int u=0;
    for(int i=0; i<9; i++){
      if( pieces[i].sendX()==locX[i] && pieces[i].sendY()==locY[i] ){
        numSolved[i]=true;
        u++;
      }
    }
    if(u==9){
      return true;
    }
    else{
      return false;
    }
  }
  
  
  //Check if a piece can move--------------------------------------------------------------------------------------------------------------------
  boolean checkMove(int x8, int y8, int xi, int yi){
    if( xi==x8 && ( (yi-75)==y8 || (yi+75==y8) ) ){
      return true;
    }
    else if( yi==y8 && ( (xi-75)==x8 || (xi+75==x8) ) ){
      return true;
    }
    else{
      return false;
    }
  }
  
  
  //Check if the cursor is over a piece----------------------------------------------------------------------------------------------------------
  boolean checkMouse(int i){
    if(mouseX>=pieces[i].sendX()-24 && mouseX<=pieces[i].sendX()+24 && mouseY>=pieces[i].sendY()-24 && mouseY<=pieces[i].sendY()+24 && cVal[i]!=color(255,255,255)){
      return true;
    }
    else{
      return false;
    }
  }
  
  
  //Show Pieces
  void showPieces(){
    for(i=0; i<9; i++){
      pieces[i].create();
    }
  }


}


//End------------------------------------------------------------------------------------------------------------------------------------------




