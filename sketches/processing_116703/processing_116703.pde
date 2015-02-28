
//Kairavi Chahal | kchahal
//Homework 8 | October 22, 2013
 
//Copyright Kairavi Chahal | 2013 | Carnegie Mellon University
//All rights reserved.

//MINESWEEPER 2.0
//OBJECTIVE: Avoid hitting the mines. You have 3 lives.
//           Lives keeps tracks of collisions.
//           Level increases after 3000 frames - speed of mines increases.
//CONTROLS:  Click+drag mouse to change direction of player.
//           Player has inertial motion.
//           Spacebar to restart (only after the game is over).
//SCORE:     Score keeps track of how long you have been playing.
//           Also keeps track of high score.
//MOTION:    Mines bounce off edges, player wraps. Player and mine swap
//           speed and direction upon collision.
//CREDITS:   Images from http://www.personal.kent.edu/~bherzog/tao.html

float px, py;
int pdx, pdy;
int lives, level;
int startScore, endScore, currScore, highScore;
boolean gameOver, pause;

PImage player, hit, dead, boom, mine;
Mine m1, m2, m3, m4, m5, m6, m7, m8;

void setup() {
  size(600, 600);
  background(200);
  imageMode(CENTER);
  
  px = width/2;
  py = height/2;
  pdx = pdy = 0;
  
  gameOver = pause = false;
  lives = 3; level = 1;
  highScore = 0;
  
  player = loadImage("data/player.png");
  hit = loadImage("data/hit.png");
  dead = loadImage("data/dead.png");
  boom = loadImage("data/boom.png");
  mine = loadImage("data/mine.png");

  m1 = new Mine();
  m2 = new Mine();
  m3 = new Mine();
  m4 = new Mine();
  m5 = new Mine();
  m6 = new Mine();
  m7 = new Mine();
  m8 = new Mine();
  
  startScore = int(millis()/100);
}

void draw() {
  screen();
  
  movePlayer();
  drawPlayer();
  
  updateMine(m1);
  updateMine(m2);
  updateMine(m3);
  updateMine(m4);
  updateMine(m5);
  updateMine(m6);
  updateMine(m7);
  updateMine(m8);
  
  gameOver();
  if (frameCount % 2000 == 0) {levelUp();}
  currScore = int(millis()/100) - startScore;
  
//  if (frameCount % 5 == 0) {saveFrame();}
}

void drawPlayer() {
  if (lives == 3) {
    image(player, px, py);
  } else if (lives == 0 || lives == 1 || lives == 2) {
    image(hit, px, py);
  } else {
    image(dead, px, py);
  }
}

void movePlayer() {
  px += pdx; py += pdy;
  if (px < 0) {
    px = width;
  }
  if (px > width) {
    px = 0;
  }
  if (py < 0) {
    py = height;
  }
  if (py > height) {
    py = 0;
  }
}

void updateMine(Mine mine) {
  mine.move();
  mine.detectHit();
  mine.draw();
}

class Mine {
  int xpos, ypos, dx, dy;
  
  Mine() {
    int[] deltas = {-5, -4, -3, -2, -1, 1, 2, 3, 4, 5};
    xpos = int(random(width));
    ypos = int(random(height));
    dx = deltas[int(random(deltas.length))];
    dy = deltas[int(random(deltas.length))];
  }
  
  void draw() {
    image(mine, xpos, ypos);
  }
  
  void move() {
    xpos += dx;
    ypos += dy;
    if (xpos < 16 || xpos > width-16) {
      dx = -dx;
    }
    if (ypos < 16 || ypos > height-16) {
      dy = -dy;
    }
  }
  
  void detectHit() {
    float d = dist(xpos, ypos, px, py);
    //33 px because player has radius of 17 px, and mines have radius of 16 px.
    if (floor(d) <= 33) {
      image(boom, px, py); image(hit, px, py);
      swap();
      lives--;
    }
  }
  
  void swap() {
    int tempx = pdx;
    pdx = dx;
    dx = tempx;
    
    int tempy = pdy;
    pdy = dy;
    dy = tempy;
  }
  
  void levelUp() {
    if (dx >= 0) {
      dx++;
    } else {
      dx--;
    }
    if (dy >= 0) {
      dy++;
    } else {
      dy--;
    }
  }
}

void levelUp() {
  level++;
  m1.levelUp();
  m2.levelUp();
  m3.levelUp();
  m4.levelUp();
  m5.levelUp();
  m6.levelUp();
  m7.levelUp();
  m8.levelUp();
}

void gameOver() {
  if (lives < 0) {
    gameOver = true;
    endScore = currScore;
    image(boom, px, py); image(dead, px, py);
    textAlign(CENTER); textSize(72); fill(0, 200, 0);
    text("GAME OVER", width/2, height/2);
    textSize(24);
    if (endScore > highScore) {
      fill(200, 0, 200);
      highScore = endScore;
      text("New High Score!", width/2, height/2+50);
    }
    fill(200, 0, 200);
    text("\nPress spacebar to restart.", width/2, height/2+50); 
    noLoop();
  }
}

void mouseDragged() {
  if (pmouseX < mouseX) {
    pdx = 2;
  } else if  (pmouseX > mouseX) {
    pdx = -2;
  } else {
    pdx = 0;
  }
  if (pmouseY < mouseY) {
    pdy = 2;
  } else if  (pmouseY > mouseY) {
    pdy = -2;
  } else {
    pdy = 0;
  }
}

void keyPressed() {
  if (gameOver && key == ' ') {
    reset();
  }
  if (!gameOver && (key == 'p' || key == 'P')) {
    if (pause) {
      loop();
      pause = false;
    } else {
      noLoop();
      textAlign(CENTER); textSize(72); fill(0, 0, 200);
      text("PAUSED", width/2, height/2);
      pause = true;
    }
  }
}

void reset() {
  loop();
  background(200);
  
  px = width/2;
  py = height/2;
  pdx = pdy = 0;
  gameOver = false;
  lives = 3;
  level = 1;

  m1 = new Mine();
  m2 = new Mine();
  m3 = new Mine();
  m4 = new Mine();
  m5 = new Mine();
  m6 = new Mine();
  m7 = new Mine();
  m8 = new Mine();
  
  startScore = int(millis()/100);
}

void screen() {
  background(200);
  
  textSize(24);
  textAlign(CENTER);
  text("MINESWEEPER 2.0", width/2, 30);
  fill(255); textSize(18);
  
  textAlign(LEFT);
  text("Level: " + level, 15, height-15);
  text("Lives left: " + lives, width/4, height-15);
  text("Score: " +  currScore, width/2, height-15);
  text("High Score: " +  highScore, 3*width/4, height-15);
}

//TO DO:     Currently pause button works, but score keeps increasing while paused.


