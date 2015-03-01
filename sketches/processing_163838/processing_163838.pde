
boolean leftArrow = false;
boolean rightArrow = false;
boolean upArrow = false;
boolean downArrow = false;
int x = 0;
int y = 400;
int speed1 = 6;
int speed2 = 5;
int speed3 = 4;
int speed4 = 3;
int speed5 = 2;
int speed6 = 1;
int speed7 = 0;
int boxX= 60;
int boxY= 400;


int brickX = 40;
int brickY = 20;

int[] box = new int[20];
PImage img;
PImage img2;
PImage img3;
PImage img4;
// PImage img5;
// PImage img6;






void setup() {
  size(1000, 500);
  img = loadImage("Mario1.png");
  img2 = loadImage("mario2.png");
  img3 = loadImage("mario3.png");
  img4 = loadImage("Mario1L.png");
  // img5 = loadImage("Mario2L.png");
  // img6 = loadImage("Mario3L.png");
}

void draw() { 
  background(0);


  for (int h= 0; h<width+brickX; h+=40) {
    bricksW(h, 0);
    bricksW((h-brickX/2), brickY);
    bricksW(h, brickY*2);
  }
  MarioDir();
  
  

  
  // if (upArrow && y==y) {
  //   y=y-speed1;
  // } 
  // else if (upArrow && y>=300) {
  //   speed1=-speed1;
  // }
  // } else if (y>=y){
  //   speed1=speed7;
  // }
  
  // if (y==309) {
  //   speedY=speedY-4;
  // }
  // if (y==289) {
  //   speedY=speedY-3;
  // }
  // if (y==269) {
  //   speedY=speedY-2;
  // }
  // if (y==249) {
  //   speedY=speedY-1;
  // }
  // if (y==229) {
  //   speedY=0;
  // }
}


/*

 if (rightArrow)x=x+3;
 if  (leftArrow) x=x-3;
 if  (upArrow) y=y-8;
 if  (downArrow) y=y+8;
 }
 */
void keyPressed() {
  if  (keyCode == 39) rightArrow = true;
  if  (keyCode == 37) leftArrow = true;
  if  (keyCode == 38) upArrow = true;
  if  (keyCode == 40) downArrow = true;
}

void keyReleased() {
  if (keyCode == 39) rightArrow = false;
  if (keyCode == 37) leftArrow = false;
  if (keyCode == 38) upArrow = false;
  if (keyCode == 40) downArrow = false;
}

void MarioDir() {
  if (keyPressed) {
    if (rightArrow) {
      x=x+6;
      image(img, x, y, 100, 124);
    } else if (leftArrow) {
      x=x-6;
      image(img4, x, y, 100, 124);
    } else if (upArrow) {
      y=y-6;
      image(img3, x, y, 100, 124);
    } else if (downArrow) {
      image(img3, x, y, 100, 124);
      y=y+6;
    }
  } else {
    x = x;
    y = y;
    image(img2, x, y, 100, 124);
  }
}



//BRICKS
void bricksW(int xPos, int yPos) {
  stroke(255);
  fill(255, 0, 0);
  rect(xPos, yPos, brickX, brickY);
}


