
Cell [] cells = new Cell [5000];

int singleCell = 0;

void setup() {
  size(300, 300);
  for (int i=0; i<cells.length; i++) {
    cells[i] = new Cell((i%30)*10,(i/30)*10);
  }
}

void draw() {
  background(0);

  for (int i=0; i<singleCell; i++) {
    cells[i].display();
    cells[i].grow();
    cells[i].move();
    cells[i].decay();
  }


  float r  = random(100);
  if (r < 5) {
    singleCell = singleCell + 1;
  }
  if (singleCell > cells.length - 1) {
    singleCell = cells.length - 1;
  }
}


class Cell {

  float x;
  float y;
  float xPos;
  float yPos;
  float d1;
  float d2;
  float fillTrans;
  float strokeTrans;
  
  /*int [] xpos = new int[50];
  int [] ypos = new int[50];*/

  //Constructor
  Cell(float tempX, float tempY) {
    smooth();
    xPos = tempX;
    yPos = tempY;
    d1 = 10;
    d2 = 5;
    fillTrans = 200;
    strokeTrans = 100;
    
    /*for(int i=0; i<15; i++) {
      xpos[i] = 0;
      ypos[i] = 0;*/
  }

  void display() {

    stroke(255, 0, 0, strokeTrans);
    fill(255, 228, 225, fillTrans);
    ellipse(xPos, yPos, d1, d1);
    ellipse(xPos, yPos, d2, d2);
  }

  void grow() {
    if (frameCount % 30 == 0) {
      d1 = d1 + 1;
      d2 = d2 + 1;
    }
  }

  void move() {
    xPos = xPos + random(-.5, .5);
    yPos = yPos + random(-.5, .5);
  }

  void decay() {
  if (d2 > 20) {
    strokeTrans = strokeTrans - .5;
    fillTrans = fillTrans - .5;
  }
  }
}



