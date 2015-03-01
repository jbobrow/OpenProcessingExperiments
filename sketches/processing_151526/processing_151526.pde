
PImage bomb;
PImage friend;
PImage player;
PFont font;
int bombLimit = 25;
//int friendsSaved = 0;
int lives = 10;
boolean menu = true;
boolean gameOn = false;

void setup() {
  size(500, 500);
  noStroke();
  noCursor();
  smooth();

  bomb = loadImage("bomb.png");
  friend = loadImage("friend.png");
  player = loadImage("player.png");
  font = createFont("CalistoMT-Italic-30.vlw", 30);

  for (int i = 0; i < bombLimit; i++) {
    bomb[i] = new Bomb(random(500), random(-3000, 0), 5);
  }

  for (int i = 0; i <= 14; i++) {
    friend[i] = new Friend(random(400), random(400));
  }

  for (int i = 0; i != 1; i++) {
    player[i] = new Player(mouseX, mouseY);
  }
}

void draw() {
  if (menu == true) {
    background(0);
    fill(255);
    textFont(font);
    textAlign(CENTER);
    text("Avoid the bombs while", width/2, 50); 
    text("saving your friends.", width/2, 100);
    text("The screen will flash", width/2, 150);
    text("green when you save a friend", width/2, 200);
    text("The game is over if", width/2, 250);
    text("you hit one bomb.", width/2, 300); 
    text("Press spacebar to begin", width/2, 350);
  }
  if (keyCode == ' ') {
    menu = false;
    gameOn = true;
    game();
  }
}

void game() {
  if (gameOn == true) {
    background(204);

    for (int i = 0; i != 1; i++) {
      player[i].create();
    }
    for (int i = 0; i < bombLimit; i++) {
      bomb[i].create();
      bomb[i].drop();
    }
    for (int i = 0; i <= 14; i++) {
      friend[i].create();
    }
  }
  if (lives < 0) {
    background(255, 0, 0);
    gameOn = false;
    textSize(70);
    text("Game over!", width/2, height/2);
  }
  
  if (friend[0].show  == false && friend[1].show  == false && 
      friend[2].show  == false && friend[3].show  == false && 
      friend[4].show  == false && friend[5].show  == false && 
      friend[6].show  == false && friend[7].show  == false && 
      friend[8].show  == false && friend[9].show  == false && 
      friend[10].show == false && friend[11].show == false && 
      friend[12].show == false && friend[13].show == false && 
      friend[14].show == false) {
    background(0, 0, 255);
    gameOn = false;
    textSize(70);
    text("You win!", width/2, height/2);
  }
}

class Bomb {
  int x, y, ySpeed;

  Bomb (int xpos, int ypos, float YSpeed) {
    x = xpos;
    y = ypos;
    ySpeed = YSpeed;
  }

  void create() {
    image(bomb, x, y);

    for (int i = 0; i < bombLimit; i++) {
      if (dist(x, y, mouseX, mouseY) < 20) {
        lives--;
      }
    }
  }

  void drop() {
    if (y >= 500) {
      y = random(-1000, 0);
    }
    y += ySpeed;
  }
}

class Friend {
  int x, y;
  boolean show = true;

  Friend (int xpos, int ypos) {
    x = xpos;
    y = ypos;
  }

  void create() {
    if (show == true) {
      image(friend, x, y);
    }

    for (int i = 0; i <= 14; i++) {
      if (dist(x, y, mouseX, mouseY) < 20 && friend[i].show == true) {
        x = -100;
        y = -100;
        background(0, 255, 0);
        show = false;
      }
    }
  }
}

class Player {
  int x, y;

  Player (int xpos, int ypos) {
    x = xpos;
    y = ypos;
  }

  void create() {
    image(player, mouseX, mouseY);
  }
}



