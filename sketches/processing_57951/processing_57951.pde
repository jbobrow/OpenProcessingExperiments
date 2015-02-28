
void gameFinished(){
  background(100); 
  fill(255);
  
  text("Game Over", startButtonX, startButtonY-280);
  text("Total Questions: " + counter, startButtonX, startButtonY-200);
  
  text("Right answers: " + score, startButtonX, startButtonY-150);
  text("Wrong answers: " + (counter - score), startButtonX, startButtonY-100);
  gameStage = 0; 
  resetGame();
}

