
/*
  Beta
  The goal of this part of the project is to add images and finish the visual look of the game.
  */


//Variables------------------------------------------------------------------------------------------------------------------------------------- 
PFont myFont;
Screens newScreen;
int state;

final int ShowStart = 1;
final int ShowGame = 2;
final int ShowEnd = 3;




//Setup----------------------------------------------------------------------------------------------------------------------------------------
void setup(){
  
  textAlign(CENTER);
  frameRate(24);
  size(350,600);
  background(255);
  rectMode(CENTER);
  imageMode(CENTER);
  
  state = ShowStart;
  
  newScreen = new Screens();
  
  myFont = createFont("Verdana", 24, true);
  textFont(myFont);
  
  
  
}




//Draw-----------------------------------------------------------------------------------------------------------------------------------------
void draw(){
  
  switch(state){
    
    case ShowStart:
      newScreen.showStart();
      if( mousePressed==true && mouseButton==LEFT ){
        state = ShowGame;
      }
      break;
    
    case ShowGame:
      newScreen.showGame();
      if( mousePressed==true && mouseX>=75 && mouseX<=275 && mouseY>=515 && mouseY<=565 ){
        state = ShowEnd;
      }
      break;
    
    case ShowEnd:
      newScreen.showEnd();
      if( mousePressed==true && mouseButton==RIGHT ){
        state = ShowStart;
      }
      break;
    
  }

  
}





//End------------------------------------------------------------------------------------------------------------------------------------------





class Play{
  
  //Variables------------------------------------------------------------------------------------------------------------------------------------
  Puzzle[] pieces = new Puzzle[9];
  String photoset[][] = {
    { "aban01.jpg", "aban02.jpg", "aban03.jpg", "aban04.jpg", "aban05.jpg", "aban06.jpg", "aban07.jpg", "aban08.jpg", "aban09.jpg" },
    { "rayanA01.jpg", "rayanA02.jpg", "rayanA03.jpg", "rayanA04.jpg", "rayanA05.jpg", "rayanA06.jpg", "rayanA07.jpg", "rayanA08.jpg", "rayanA09.jpg" },
    { "kareeman01.jpg", "kareeman02.jpg", "kareeman03.jpg", "kareeman04.jpg", "kareeman05.jpg", "kareeman06.jpg", "kareeman07.jpg", "kareeman08.jpg", "kareeman09.jpg" },
    { "kenan01.jpg", "kenan02.jpg", "kenan03.jpg", "kenan04.jpg", "kenan05.jpg", "kenan06.jpg", "kenan07.jpg", "kenan08.jpg", "kenan09.jpg" }
  };
  PImage[] preview = { loadImage("aban00.jpg"), loadImage("rayanA00.jpg"), loadImage("kareeman00.jpg"), loadImage("kenan00.jpg") };
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



/*
  Puzzle
  The goal of this part of the project is to add images and finish the visual look of the game. The Puzzle class affects specific puzzle pieces.
  */

class Puzzle{
  
  
  //Variables------------------------------------------------------------------------------------------------------------------------------------
  int value, xpos, ypos;
  PImage img;
 
 
 //Constructor----------------------------------------------------------------------------------------------------------------------------------
 Puzzle(int val, int xval, int yval, String name){
  value = val;
  xpos = xval;
  ypos = yval;
  img = loadImage(name);
 }

  
  //Give the piece a new position---------------------------------------------------------------------------------------------------------------
  void storePos(int xval, int yval){
    xpos = xval;
    ypos = yval;
  }
  
  //Give the piece a new image------------------------------------------------------------------------------------------------------------------
  void changeImg( String name ){
    img = loadImage(name);
  }
  
  
  //Send the piece's X value--------------------------------------------------------------------------------------------------------------------
  int sendX(){
    return xpos;
  }
  
  
  //Send the piece's Y value--------------------------------------------------------------------------------------------------------------------
  int sendY(){
    return ypos;
  }
  
  
  //Draw the piece------------------------------------------------------------------------------------------------------------------------------
  void create(){
    image(img, xpos, ypos);
    //fill(255);
    //text(value+1, xpos, ypos);
  }
  
}



//End------------------------------------------------------------------------------------------------------------------------------------------



/*
  Screens
  The goal of this part of the project is to add images and finish the visual look of the game. Screens holds visuals and the game itself.
  
  */
////////



import pogg.*;

TheoraMovie myMovie;

int BUTTONS_HEIGHT = 30;
int MARGIN = 3;

int BUTTON_NONE = -1;
int BUTTON_PLAY = 0;
int BUTTON_STOP = 1;
int BUTTON_SLOW = 2;
int BUTTON_SCROLL = 3;
int BUTTON_FAST = 4;
int BUTTON_CLOCK = 5;

int overButton = BUTTON_NONE;
int[] buttonX;
int[] buttonW;

double speed = 1;

int btop;
int bdown;

//pause -> play = false; stop = false;
boolean play = true;
boolean stop = false;
PFont font;


//////////

class Screens{
  
  
  //Variables------------------------------------------------------------------------------------------------------------------------------------
  Play game;
  Timer myTimer;
  int score, bestScore;
  boolean init;
  PImage end, start;
  
  
  //Constructor----------------------------------------------------------------------------------------------------------------------------------
  Screens(){
    myTimer = new Timer(0, 300, millis());
    game = new Play();
    score = 0;
    bestScore = 0;
    init = true;
    noStroke();
    
    end = loadImage("endScreen.jpg");
    
    start = loadImage("startScreen.jpg");
    
    game.shuffle();
  }
  
  //Show Start Screen----------------------------------------------------------------------------------------------------------------------------
  void showStart(){
    
    score = 0;
    image(start, width/2, height/2);
    
  }
  
  
    //Show End Screen-----------------------------------------------------------------------------------------------------------------------------
  void showEnd(){
    init = true;
    
    image(end, width/2, height/2);
   // drawBlank();
    //fill(0);
    text("Score: " +score+ "\nHigh Score: " +bestScore, width/2, 300);
  }
  
  
  //Show Game Screen-----------------------------------------------------------------------------------------------------------------------------
  void showGame(){
    
    if( init == true ){
      init = false;
      newScreen.drawBlank();
      game.shuffle();
    }
    
    //Show Pieces
    game.showPieces();
    
    //draw over score button
    fill(255);
    rect(175, 100, 500, 50);
    
    //draw score
    fill(0);
    text("Score: "+score, 175, 100);
    
    //draw new puzzle button
    fill(100);
    rect(175, 470, 200, 50);
    fill(255);
    text("New Puzzle", 175, 480);
    
    //draw end game button
    fill(100);
    rect(175, 540, 200, 50);
    fill(255);
    text("End Game", 175, 550);
    
   //If you click on the Next Puzzle button, reset the game and timer.
   if( mousePressed==true && mouseX>=75 && mouseX<=275 && mouseY>=445 && mouseY<=495 ){
     game.shuffle();
     myTimer.reset(millis());
   }
  
  //If the puzzle is not solved, allow the timer to run and the pieces to move.
   if( game.checkSolved()==false ){
    myTimer.counter(millis()); 
     
    for(int i=0; i<9; i++){
      if( mousePressed==true && game.checkMouse(i)==true ){
        game.movePiece(i);
      } 
     } 
    }
    
    //If the puzzle is solved, update the score and reset the game and timer.
    else if( game.checkSolved()==true ){
      score+=1;
      
      if( score>=bestScore ){
        bestScore = score;
      }
      
      fill(255);
      rect(175,100,200,50);
      fill(0);
      text("Score: "+score, 175, 100);
      game.shuffle();
      myTimer.reset(millis());
    }
    
    //If the timer runs out, reset the game and timer.
    if( myTimer.sendSeconds()<myTimer.sendMin() ){
      game.shuffle();
      myTimer.reset(millis());
      score = 0;
    }
  }
  
  
  //sendScore-----------------------------------------------------------------------------------------------------------------------------------
  int sendScore(){
    return score;
  }
  
  
  //sendBestScore-------------------------------------------------------------------------------------------------------------------------------
  int sendBestScore(){
    return bestScore;
  }

  
  //draws a white background
  void drawBlank(){
    fill(255);
    rect(width/2, height/2, width, height);
  }
  
  
  
  
}



//End------------------------------------------------------------------------------------------------------------------------------------------



/*
  
  Timer
  The goal of this part of the project is to add images and finish the visual look of the game. The Timer class stores the timer element.
  */


class Timer{
  
  
  //Variables------------------------------------------------------------------------------------------------------------------------------------
  int seconds, secMax, secMin, savedMS, currentMS;
  
  
  //Constructor----------------------------------------------------------------------------------------------------------------------------------
  Timer(int minimum, int maximum, int saveBit){
    secMin = minimum;
    secMax = maximum;
    savedMS = saveBit;
  }
  
  
  //Counts down the time-------------------------------------------------------------------------------------------------------------------------
  void counter(int currentTime){
    
  currentMS = currentTime;
  seconds = secMax-(currentMS - savedMS)/1000;
  
  textAlign(CENTER);
  noStroke();
  fill(255);
  rect(175, 50, 300, 50);
  fill(0);
  text("Time Left: "+seconds, 175, 50);
  
  }
  
  
  //Resets the timer----------------------------------------------------------------------------------------------------------------------------
  void reset(int currentTime){
    seconds = secMax;
    savedMS = currentTime;
  }
  
  
  //Sends the current second--------------------------------------------------------------------------------------------------------------------
  int sendSeconds(){
    return seconds;
  }
  
  
  //Sends the minimum required seconds----------------------------------------------------------------------------------------------------------
  int sendMin(){
    return secMin;
  }
  
}



//End------------------------------------------------------------------------------------------------------------------------------------------





