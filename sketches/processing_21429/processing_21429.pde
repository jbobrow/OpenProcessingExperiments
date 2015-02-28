
class Creature {
  int currentX, currentY;
  int lastX, lastY;

  // creature width
  // creature height
  // number of eyes, 
  // color of feet,
  // 

  int creatureTypeA = 'a';
  int creatureTypeB = 'b';
  int creatureTypeC = 'c';
  int creatureTypeD = 'd';
  int creatureTypeE = 'e';
  float stepRange = 3;
  color fillColor;

  //
  public Creature() {
    this(0,0);
  }

  public Creature(int x, int y) {
    this(x,y,3,1);
  }

  // a class / object construtor, 
  // this gets automatically called when 
  // a new class is created.
  public Creature(int x, int y, float stepRange,color fillColor) {
    currentX = lastX = x;
    currentY = lastY = y;
    this.stepRange = stepRange;
    this.creatureTypeA = creatureTypeA;
    this.creatureTypeB = creatureTypeB;
    this.creatureTypeB = creatureTypeC;
    this.creatureTypeB = creatureTypeD;
    this.creatureTypeB = creatureTypeE;
    this.fillColor = fillColor;
  }

  public void update() {
    lastX = currentX;
    lastY = currentY;

    // add a random increment to x and y
    currentX += int(random(-stepRange, stepRange));
    currentY += int(random(-stepRange, stepRange));

    // make sure that the position never leaves the screen
    currentX = constrain(currentX, 0, width);
    currentY = constrain(currentY, 0, height);
  }

  public void creatureTypeA() {
    fill(fillColor);
    ellipse(currentX-5, currentY- 5, 5,5);
    ellipse(currentX+5, currentY-5, 8,8);
    // fill(0);
    int radius = 20;
    for(int deg = 0; deg < 360; deg +=20) {
      float angle = radians(deg);
      float x = currentX + (cos(angle) * radius);
      float y = currentY + (sin(angle) * radius);
      ellipse(x,y,5,5);
    }
    for(int i = currentX - 8; i <= currentX + 9; i += 4) {
      ellipse(i, currentY+5, 5, 5);
    }
  }

  public void creatureTypeB() {
    fill(fillColor);
    rectMode(CENTER);
    rect(currentX-5, currentY- 5, 5,5);
    rect(currentX+5, currentY-5, 5,5);
    rectMode(CORNER);
    for(int i = currentX - 9; i <= currentX + 9; i += 4) {
      rect(i, currentY+2, 3, 10);
    }
    int radius = 20;
    for(int deg = 0; deg < 360; deg +=20) {
      float angle = radians(deg);
      float x = currentX + (cos(angle) * radius);
      float y = currentY + (sin(angle) * radius);
      ellipse(x,y,5,5);
    }
  }

  public void creatureTypeC() {
    fill(fillColor);
    ellipse(currentX-5, currentY- 5, 5,5);
    ellipse(currentX+5, currentY-5, 5,5);
    rect(currentX-11, currentY+2, 3, 10);
    rect(currentX-7, currentY+3, 3, 10);
    rect(currentX-3, currentY+4, 3, 10);
    rect(currentX+1, currentY+4, 3, 10);
    rect(currentX+5, currentY+3, 3, 10);
    rect(currentX+9, currentY+2, 3, 10);
    int radius = 20;
    for(int deg = 0; deg < 360; deg +=20) {
      float angle = radians(deg);
      float x = currentX + (cos(angle) * radius);
      float y = currentY + (sin(angle) * radius);
      ellipse(x,y,5,5);
    }
  }

  public void creatureTypeD() {
    fill(fillColor);
    ellipse(currentX-5, currentY- 5, 5,5);
    ellipse(currentX+5, currentY-5, 5,5);
    ellipseMode(CORNER);
    ellipse(currentX-11, currentY+2, 3, 3);
    ellipse(currentX-7, currentY+3, 3, 3);
    ellipse(currentX-3, currentY+4, 3, 3);
    ellipse(currentX+1, currentY+4, 3, 3);
    ellipse(currentX+5, currentY+3, 3, 3);
    ellipse(currentX+9, currentY+2, 3, 3);
    int radius = 20;
    ellipseMode(CENTER);
    for(int deg = 0; deg < 360; deg +=20) {
      float angle = radians(deg);
      float x = currentX + (cos(angle) * radius);
      float y = currentY + (sin(angle) * radius);
      ellipse(x,y,5,5);
    }
  }
  public void creatureTypeE() {
    fill(fillColor);
    rectMode(CENTER);
    rect(currentX-5, currentY- 5, 5,5);
    rect(currentX+7, currentY-5, 10,10);
    rectMode(CORNER);
    for(int i = currentX - 7; i <= currentX + 9; i += 4) {
      rect(i, currentY+2, 2, 10);
    }
    int radius = 20;
    for(int deg = 0; deg < 360; deg +=20) {
      float angle = radians(deg);
      float x = currentX + (cos(angle) * radius);
      float y = currentY + (sin(angle) * radius);
      rect(x,y,5,5);
    }
  }
}


