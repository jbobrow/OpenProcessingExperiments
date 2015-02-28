
In the Main Class:

 boolean gameOver;

void setup(){
  textAlign(CENTER);
  fall = new RectGame(500, 500, 8, color(0));
  fall.reset();
  gameOver = false;
 
  
}

void draw(){
if(gameOver == false){
    noCursor();
    background(0);
    timer.display();
    fall.start();
    catcher.display();
}
else{ 
  fall.end();
}
  
  }   
    
In the Game Class:

 void end(){
background(0);
 //Load font for words on Game Over screen.

 fill(255);
 //Align loseDisplay font.
 textAlign(CENTER);

 //Write 'Game Over'.
 text("Game Over", width/2,height/4);
 //Write 'Score: currentScore'.
 text("Score: " + scoreBoard.score, width/2, height/2);
 text("Press any key to play again\n Press mouse to quit", width/2, 300);
   if(mousePressed == true){
    System.exit(0);
   }
   if(keyPressed == true){
     gameOver = false;
     this.reset();
     
   }
 }
