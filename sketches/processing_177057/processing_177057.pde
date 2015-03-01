
int gameState = 0;
PImage splashScreen, maze1, maze2,level2;
void setup() {
  size(600, 600); 
  splashScreen = loadImage("splashscreen.jpg");
  splashScreen.resize(600,600);
  maze1 = loadImage("maze1.jpg");
  maze1.resize(600, 500);
  maze2 = loadImage("maze2.jpg");
  maze2.resize(600, 500);
  level2 = loadImage("level2.jpg");
}
void draw() {
  background(0, 50, 200);
  fill(0);
  textSize(40);
  if (gameState ==0) {
    image(splashScreen, 0,0);
  } else if (gameState == 1) {
    image(maze1, 0, 50);
  } else if (gameState == 2) {
    image(level2, 100, 50);
  }
  else if (gameState == 3) {
    image(maze2, 0, 50);
  }
}
void keyPressed() {
  if (gameState==0) gameState = 1;
  else if (gameState ==1) gameState = 2;
  else if (gameState ==2) gameState = 3;
}



