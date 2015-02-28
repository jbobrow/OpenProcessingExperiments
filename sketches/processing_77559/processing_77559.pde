
/*Nicole Strang
  ITGM 315 -- Processing
  10/15/2012
  Final Project -- Alpha
  
  Alpha
  This file streamlines the core playable code. Two new classes are completed: The Timer class to store the timer element and
  the Play class to store the gameplay elements. The Puzzle class affects specific puzzle pieces, while Play handles the entire thing.
  */

 
PFont myFont;
Play game;
Timer myTimer;

int score = 0;




void setup(){
  
  textAlign(CENTER);
  frameRate(24);
  size(350,600);
  background(255);
  rectMode(CENTER);
  
  
  myTimer = new Timer(0, 90, millis());
  
  game = new Play();
  myFont = createFont("Verdana", 24, true);
  textFont(myFont);
  
  fill(0);
  text("Score: "+score, 175, 450);
  
  
  fill(100);
  rect(175, 520, 200, 50);
  fill(255);
  text("New Puzzle", 175, 530);
  
  game.shuffle();
  
}





void draw(){
  
  //If you click on the Next Puzzle button, reset the game and timer.
   if( mousePressed==true && mouseX>=75 && mouseX<=275 && mouseY>=495 && mouseY<=545 ){
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
      fill(255);
      rect(175,450,200,50);
      fill(0);
      text("Score: "+score, 175, 450);
      game.shuffle();
      myTimer.reset(millis());
    }
    
    //If the timer runs out, reset the game and timer.
    if( myTimer.sendSeconds()<myTimer.sendMin() ){
      game.shuffle();
      myTimer.reset(millis());
    }

  
}

