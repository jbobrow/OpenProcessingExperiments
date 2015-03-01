
PImage maze;
PImage photo;
PImage paul;
PImage win;
PImage lose;
PImage info;
int i =0;
int START_SCREEN = 0;
int INSTRUCTIONS = 1;
int MAZE = 2;
int WIN = 3;
int LOSE = 4;
int gameState = 0;
int x, y;


void setup() {
  maze = loadImage("maze.jpg");
  photo=loadImage("GAME_SPLASH_SCREEN.png");
  paul = loadImage("paul.png");
  win = loadImage("win.jpg");
  lose = loadImage("lose.jpg");
  info = loadImage("info.jpg");
  size(800,600);
  x = width/2-50; 
  y = 10;
}

void draw() {
  maze.resize(800,600);
  image(maze, 0, 0);
  fill(255, 255, 0);
  paul.resize(10, 10);
  image(paul, x, y);
  if (gameState == START_SCREEN) {
    drawSplashScreen();
  } else if (gameState == INSTRUCTIONS) {
    //game[Maze].display();
    image(info, 0, 0);
  } else if (gameState == WIN) {
    drawWinScreen();
  } else if (gameState == LOSE) {
    drawGameOverScreen();
  }
}




boolean keepMoving(int nx, int ny) {
  loadPixels(); 
  int i = nx + (maze.width * ny);
  color c = pixels[i];
  float brightness = brightness(c);
  if (brightness > 250)return true;
  else return false;
}

void keyPressed() {
  if (gameState== START_SCREEN) {
    gameState = INSTRUCTIONS;
  } else if (gameState ==INSTRUCTIONS) {
        gameState = MAZE;
  } else if (gameState == MAZE) {
    int newX = x;
    int newY = y;
    if (key == 'a') {
      newX = x - 10;
    }
    if (key =='d') {
      newX = x + 10;
    }
    if (key == 'w') {
      newY = y-10;
    }
    if (key =='s') {
      newY = y+10;
    }
    if (keepMoving(newX, newY)) {
      x = newX; 
      y = newY;
    } else {
      println("BLOCKED!!!");
    }
  } else if (gameState == 3) {
    i = 0;
    gameState = 0;
  }
}


void drawSplashScreen() {
  photo.resize(maze.width, maze.height);
  image(photo,0,0);
  textAlign(CENTER);
  fill(255);
  textSize(20);
  text("Press [Spacebar] to Start", width/2, height-230);
  text("Press [I] for Instruction", width/2, height-205);
  fill(255);
  textSize(10);
  text("@ 2014-2015 Harrison Trachman, Daniel Levy, Amanda Karimi, and Will Stern", width/2, height-20);
}

void drawWinScreen () {
  win.resize(800,600);
  image(win, 0, 0);
  
}

void drawGameOverScreen() {
  lose.resize(800,600);
  image(lose, 0, 0);
}

void drawInstructions() {
  info.resize(800,600);
  image(info, 0, 0);
}



