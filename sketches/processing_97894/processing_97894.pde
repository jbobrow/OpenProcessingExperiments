
int start;

PImage bear;
PImage maze1;
PImage book;

int x = 250;
int y = 410;

float bearwidth = 25; 
float bearheight = 25; 

int a = 75;
int b = 8;

int c = 15;
int d = 435;

void setup(){
  size(700,500);
  smooth();
  textFont(createFont("Arial", 35));
  bear = loadImage("bear.png");
  maze1 = loadImage("maze1.png");
  start = millis();
  frameRate(60);
}

void draw(){
  background(255);
  image(maze1,0,0);
  //Collider Script - Based on color check in image.
  checkPoint(x + 10, y + 10);
  //Timer 
  int timer = millis()-start;
  text(timer/1000, 140, 150);
  textSize(35);
  fill(255);
  text("Timer:",30,150);
  //Player 
  image(bear, x, y, bearwidth, bearheight);
}

//Controls
void checkPoint(int cx, int cy) {

  if (keyPressed) {  // UP
   if (key == 'w')
    if (red(get(cx, cy-1)) != 0) {
      y--;
    }
  }
 if (keyPressed) {  // DOWN
    if (key == 's')
    if (red(get(cx, cy+1)) != 0) {
      y++;
    }
  }
 if (keyPressed) {  // LEFT
    if (key == 'a')
    if (red(get(cx-1, cy)) != 0) {
      x--;
    }
  }
  if (keyPressed) {  // RIGHT
    if (key == 'd')
    if (red(get(cx+1, cy)) != 0) {
      x++;
    }
  }
}




