
class Candy {
  float x;
  float y;
  float speed;
  color c;

  Candy (color c_, float x_, float y_, float speed_) {
    c = c_;
    x = x_;
    y = y_;
    speed = speed_;
  }

  void run_game() {
    fill(c);
    ellipse (x, y, 20, 20);
    triangle (x, y, x+25, y+5, x+5, y+25);
    triangle (x, y, x-25, y-5, x-5, y-25);



    y = y + speed;
    if ( y > height) {
      y = 0;
    }

    if (y > 430) {
      if (x > pmouseX-25 && x < pmouseX+25) {
        y = 0;
        println ("yay");
        textSize (20);
        text(score++, 30, 190);
      }
      else if ( y >= 595) {
        gameState = GAME_OVER;
        show_score();
      }
    }
  }
}

void gameover() {
  if (gameState == GAME_OVER) {

    for (int i = 0; i < can.length; i++) {
      background(172, 235, 250);

      // draw the game over messge
      fill(0);
      textSize (40);
      loadFont ("SnapITC-Regular-100.vlw");
      text ("unchers", 290, 150);
      textSize(100);
      text ("M", 175, 150);
      textAlign(CENTER);
      textSize(20);
      text("Game Over", width/2, 250);
      show_score();
    }
  }
}

void show_score() {
  // draw the score
  fill(0);
  //textFont(scoreFont);
  textAlign(CENTER);
  textSize(20);
  text ("Score", width/2, 300);
  text(score, width/2, 350);
  text ("click to play again!", width/2, 400);
}
void mousePressed() {
  if (gameState == INTRO || gameState == GAME_OVER) {
    gameState = RUN_GAME; // start the game
    score = 0; // reset the score
  }
}


