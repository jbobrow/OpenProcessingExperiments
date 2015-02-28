

int tileCount = 20;
int actRandomSeed = 0;
int actStrokeCap = ROUND;
color colorLeft = color(197, 0, 123);


void setup() {
  size(780, 640);
}


void draw() {

  background(255);
  smooth();
  noFill();
  strokeCap(actStrokeCap);

  randomSeed(actRandomSeed);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      int posX = width/tileCount*gridX;
      int posY = height/tileCount*gridY;

      int toggle = (int) random(0,3);

      if (toggle == 0) {
        strokeWeight(mouseX/30);
        line(posX, posY, posX+width/tileCount, posY+height/tileCount);
      }
      if (toggle == 1) {
        strokeWeight(mouseY/30);
        line(posX, posY+width/tileCount, posX+height/tileCount, posY);
      }
    }
    
  }
}


void mousePressed() {
  actRandomSeed = (int) random(20000);
}











