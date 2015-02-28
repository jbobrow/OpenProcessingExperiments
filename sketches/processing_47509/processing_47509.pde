
void startGame() {

  noStroke();
  fill(0);
  textFont(Arcade);
  textAlign(CENTER);
  text("press spacebar", width/2, height/2 + 36);
  text("for single player", width/2, height/2 + 72);
  text("or press return", width/2, height/2 + 108);
  text("for multiplayer", width/2, height/2 + 144);
  gameWin=true;
  resetPlayers();
  resetDoors();
}


void restartGame() {
  if (keyCode==10) {
    multiPlayer=true;
  }
  resetPlayers();
  resetDoors();

  displayObjects=true;
  gameWin=false;
  loop();
}

void objectsDisplay() {
  if (displayObjects==true) {

    background(255);
    noStroke();
    fill(0);
    myDoor1.display();
    myDoor2.display();
    myDoor3.display();
    myDoor4.display();

    myPlayer1.display();
    myPlayer1.move();
    myPlayer2.display();
    myPlayer2.move();
  }
}

