
/*Nicole Strang
  ITGM 315 -- Processing
  11/07/2012
  Final Project -- Beta
  
  Play
  The goal of this part of the project is to add images and finish the visual look of the game. The Play class stores an 
  entire puzzle.
  */



class Play{
  
  //Variables------------------------------------------------------------------------------------------------------------------------------------
  Puzzle[] pieces = new Puzzle[9];
  String photoset[][] = {
    { "lionfish01.jpg", "lionfish02.jpg", "lionfish03.jpg", "lionfish04.jpg", "lionfish05.jpg", "lionfish06.jpg", "lionfish07.jpg", "lionfish08.jpg", "lionfish09.jpg" },
    { "dragonA01.jpg", "dragonA02.jpg", "dragonA03.jpg", "dragonA04.jpg", "dragonA05.jpg", "dragonA06.jpg", "dragonA07.jpg", "dragonA08.jpg", "dragonA09.jpg" },
    { "starfish01.jpg", "starfish02.jpg", "starfish03.jpg", "starfish04.jpg", "starfish05.jpg", "starfish06.jpg", "starfish07.jpg", "starfish08.jpg", "starfish09.jpg" },
    { "whale01.jpg", "whale02.jpg", "whale03.jpg", "whale04.jpg", "whale05.jpg", "whale06.jpg", "whale07.jpg", "whale08.jpg", "whale09.jpg" }
  };
  PImage[] preview = { loadImage("lionfish00.jpg"), loadImage("dragonA00.jpg"), loadImage("starfish00.jpg"), loadImage("whale00.jpg") };
  boolean[] numSolved = {false, false, false, false, false, false, false, false, false};
  int[] location = {0, 0, 0, 0, 0, 0, 0, 0, 0};
  int[] locX = {100, 175, 250, 100, 175, 250, 100, 175, 250};
  int[] locY = {150, 150, 150, 225, 225, 225, 300, 300, 300};
  
  int i, u, o, tempX, tempY;
  
  
  
  //Constructor----------------------------------------------------------------------------------------------------------------------------------
  Play(){
    
    u = int(random(0,4)); //choose a set of images
    
    //set up puzzle

      for(i=0; i<9; i++){
        pieces[i] = new Puzzle(i, locX[i], locY[i], photoset[u][i]);
      }
      
    print(u);
    
  }
  
  
  //Shuffle Puzzle Pieces Locations--------------------------------------------------------------------------------------------------------------
  void shuffle(){
    
    u = int(random(0,4)); //choose a set of images
    
    //set up puzzle

    for(i=0; i<9; i++){
        pieces[i].changeImg(photoset[u][i]);
    }
      
    print(u);
    
    //START Position randomizer
    o = 0;
    
    //Reset "memory" for randomizer
    for(i=0; i<9; i++){
      location[i] = 0;
    }
    
    i=0;
  
    //Randomizer
    while(i<9){
        o = int(random(0,9)); //Roll a 9 sided die
        if(location[o]==0){  //if I haven't used this location yet
          pieces[i].storePos(locX[o], locY[o]); //Set the piece to this location
          location[o] = 1; //Then remember I used this location
          i++; //Scroll through the array
        }
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
    if(mouseX>=pieces[i].sendX()-24 && mouseX<=pieces[i].sendX()+24 && mouseY>=pieces[i].sendY()-24 && mouseY<=pieces[i].sendY()+24 && i!=9){
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
    
    image(preview[u], 175, 390, 100, 100);
    
  }


}


//End------------------------------------------------------------------------------------------------------------------------------------------




