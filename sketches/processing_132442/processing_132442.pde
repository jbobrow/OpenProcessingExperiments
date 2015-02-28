
//speler
int catcherHeight;
int posX;
int posY;
int catcherWidth;

//BLOKJE

blokjesregen blokjesregen1;
blokjesregen blokjesregen2;
blokjesregen blokjesregen3;
blokjesregen blokjesregen4;
blokjesregen blokjesregen5;

boolean veldaf;

int score;

PFont f;

void setup() {

  size(600, 600);
background(255);
  posX = mouseX;
  posY = 560;
  catcherHeight = 40;
  blokjesregen1 = new blokjesregen();
  blokjesregen2 = new blokjesregen();
  blokjesregen3 = new blokjesregen();
  blokjesregen4 = new blokjesregen();
  blokjesregen5 = new blokjesregen();

  f = createFont("Arial", 20, true);

  score = 0;

  veldaf = false;
  catcherWidth = 200;
}

void draw() {
  size(600, 600);
  drawcatcher();
  println(score);
  noCursor();


  blokjesregen1.drawrect();
  blokjesregen1.rectmovement();
  blokjesregen1.collision();

  blokjesregen2.drawrect();
  blokjesregen2.rectmovement();
  blokjesregen2.collision();

  blokjesregen3.drawrect();
  blokjesregen3.rectmovement();
  blokjesregen3.collision();

  blokjesregen4.drawrect();
  blokjesregen4.rectmovement();
  blokjesregen4.collision();

  blokjesregen5.drawrect();
  blokjesregen5.rectmovement();
  blokjesregen5.collision();

  textFont(f, 30);
  fill(180, 0, 0);
  text(score, 20, 40);
}

void drawcatcher() { //De functie voor de catcher
  fill(0);
  strokeWeight(2);
  stroke(139, 1, 1);
  rectMode(CENTER);
  rect(posX, posY, catcherWidth, catcherHeight, 5);
  if (mouseX<width-catcherHeight*2 || mouseX>0+catcherHeight*2) {
    posX = mouseX;
  }
}



class blokjesregen {

  float rectCollisionY;

  float rectPositieX;
  float rectPositieY;
  float rectSizeX;
  float rectSizeY;
  float rectSpeedY;


  float strokeW;

  blokjesregen() {
    rectSizeX = random(10, 75);
    rectSizeY = random(10, 75);
    rectSpeedY = random(3, 6);

    strokeW = random(1, 3);
    rectPositieY = 0;
    rectPositieX = random(width);
    rectCollisionY = 560 - rectSizeY;
  }

  void drawrect() { //De random rect draw functie 
    strokeWeight(strokeW);
    stroke(0);
    fill(random(255), random(255), random(255));
    rect(rectPositieX, rectPositieY, rectSizeX, rectSizeY);
    if ( rectPositieY> height) {
      rectPositieY = random(0, -50);
      rectPositieX = random(width);
      rectSpeedY = random(1, 4);
      rectSizeX = random(10, 75);
      rectSizeY = random(10, 75);
    }
  }

  void rectmovement() { //De rect movement VIJAND
    rectPositieY = rectPositieY + rectSpeedY;
  }

  void collision() { //het vangen van de rect op de catcher
    if ( rectPositieY > posY - rectSizeY && rectPositieX > posX-catcherWidth/2  && rectPositieX < posX+catcherWidth/2) {
      rectPositieY = random(0, -50);
      rectPositieX = random(width);
      rectSpeedY = random(1, 4);
      rectSizeX = random(10, 75);
      rectSizeY = random(10, 75);
      score = score + 1;
    }
  }
}

