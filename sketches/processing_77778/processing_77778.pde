
//Martin C, CP1, Mods 4-5
//Tron

int x = 250;
int y = 50;
int dir = DOWN;
int cx = 250;
int cy = 450;
int cdir = UP;
int[] rectx = new int[20];
int[] recty = new int[20];
boolean gameOverComp = false;
boolean gameOverPlayer = false;

void setup() {
  frameRate(120);
  size(501, 501);
  background(0);
  //border
  stroke(255, 0, 255);
  noFill();
  strokeWeight(1); 
  rect(0,0,500,500);
  rect(213, 324, 30, 20);
  rect(322, 201, 30, 20);
  rect(384, 387, 30, 20);
  rect(375, 228, 30, 20);
  rect(13, 287, 30, 20);
  rect(132, 138, 30, 20);
  rect(2, 444, 30, 20);
  rect(38, 161, 30, 20);
  rect(387, 76, 30, 20);
  rect(449, 125, 30, 20);
  rect(38, 378, 30, 20);
  rect(298, 498, 30, 20);
  rect(140, 276, 30, 20);
  rect(264, 68, 30, 20);
  rect(285, 11, 30, 20);
  rect(426, 474, 30, 20);
  rect(266, 143, 30, 20);
  rect(256, 207, 30, 20);
  rect(63, 457, 30, 20);
  rect(60, 248, 30, 20);
  //preload font
  text("load", -500, -500);
  stroke(0);
  point(240, 200);
}

void draw() {
  if (gameOverComp) {
    text("YOU WIN, CLICK TO PLAY AGAIN", 250, 190);
    if (mousePressed) {
      gameOverComp = false;
      x = 250;
      y = 50;
      dir = DOWN;
      cx = 250;
      cy = 450;
      cdir = UP;
      setup();
    }
  } 
  else if (gameOverPlayer) {
    text("YOU LOSE, CLICK TO PLAY AGAIN", 250, 190);
    if (mousePressed) {
      gameOverPlayer = false;
      x = 250;
      y = 50;
      dir = DOWN;
      cx = 250;
      cy = 450;
      cdir = UP;
      setup();
    }
  } 
  else {
    human();
    ai();
    computer();
  }
}

void human() {
  if (dir == UP) {
    y--;
  } 
  else if (dir == DOWN) {
    y++;
  } 
  else if (dir == LEFT) {
    x--;
  } 
  else if (dir == RIGHT) {
    x++;
  } 
  if (get(x, y) != color(0)) {
    gameOverPlayer = true;
  }  
  strokeWeight(1);
  stroke(255, 0, 0);
  point(x, y);
}

void keyPressed() {
  if (key == 'w' && dir != DOWN) {
    dir = UP;
  }
  else if (key == 's' && dir != UP) {
    dir = DOWN;
  }
  else if (key == 'a' && dir != RIGHT) {
    dir = LEFT;
  }
  else if (key == 'd' && dir != LEFT) {
    dir = RIGHT;
  }
}

void computer() {
  if (cdir == UP) {
    cy--;
  } 
  else if (cdir == DOWN) {
    cy++;
  } 
  else if (cdir == LEFT) {
    cx--;
  } 
  else if (cdir == RIGHT) {
    cx++;
  } 
  if (get(cx, cy) != color(0)) {
    gameOverComp = true;
  }  
  strokeWeight(1);
  stroke(0, 255, 0);
  point(cx, cy);
}

int time = 0;

void ai() {

  int rand = int(random(4));

  if (get(cx+1, cy) != color(0) && cdir == RIGHT) {
    cdir = DOWN;
  }
  else if (get(cx-1, cy) != color(0) && cdir == LEFT) {
    cdir = UP;
  }
  else if (get(cx, cy-1) != color(0) && cdir == UP) {
    cdir = RIGHT;
  }
  else if (get(cx, cy+1) != color(0) && cdir == DOWN) {
    cdir = LEFT;
  }

  else if (time > 100) {
    if (rand == 0 && cdir != DOWN && get(cx, cy-1) == color(0)) {
      cdir = UP;
    }
    if (rand == 1 && cdir != UP && get(cx, cy+1) == color(0)) {
      cdir = DOWN;
    }
    if (rand == 2 && cdir != RIGHT && get(cx-1, cy) == color(0)) {
      cdir = LEFT;
    }
    if (rand == 3 && cdir != LEFT && get(cx+1, cy) == color(0)) {
      cdir = RIGHT;
    }
    time = 0;
  }

  time++;
}
