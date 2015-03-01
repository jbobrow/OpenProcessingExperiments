
Creature[] myCreatures = new Creature[200];

void setup() {
  size(800, 800);
  for (int i = 0; i < myCreatures.length; i++) {
    myCreatures[i] = new Creature(random(width), random(height), random(-1, 1), random(-1, 1), 1, .5, 2, 
    20, 2, 80, random(6), random(1), color(random(255), random(255), random(255)));
  }
  smooth(8);
  background(0);
}

void draw() {
  fill(0, 120);
  rect(0, 0, width, height);
  //background(0);
  noStroke();

  for (int i = 0; i < myCreatures.length; i++) {
    myCreatures[i].display();
    myCreatures[i].morph();
    myCreatures[i].move();
  }
}

class Creature {
  float posX, posY, spdX, spdY, wid, widMin, widMax, hei, heiMin, heiMax, wROG, hROG;
  color theColor;
  float rot = random(360);

  float offsetX = random(100);
  float offsetY = random(100);
  float offsetS = random(100);

  Creature(float x, float y, float sX, float sY, float w, float wmn, float wmx, float h, float hmn, float hmx, float wrog, float hrog, color c) {
    posX = x;
    posY = y;
    spdX = sX;
    spdY = sY;
    wid = w;
    widMin = wmn;
    widMax = wmx;
    hei = h;
    heiMin = hmn;
    heiMax = hmx;
    wROG = wrog;
    hROG = hrog;
    theColor = c;
  }

  void display() {
    fill(theColor, 100);
    rot+=.1;



    pushMatrix();
    translate(posX, posY);

    pushMatrix();
    rotate(radians(rot));
    ellipse(0, 0, wid, hei);
    popMatrix();

    popMatrix();


    pushMatrix();
    translate(posX, posY);
    rotate(radians(90));

    pushMatrix();
    rotate(radians(rot));
    ellipse(0, 0, wid, hei);
    popMatrix();

    popMatrix();
  }

  void morph() {
    wid += wROG;
    hei += hROG;
    if (wid > widMax || wid < widMin) {
      wROG *= -1;
    }
    if (hei > heiMax || hei < heiMin) {
      hROG *= -1;
    }
  }


  void move() {
    float xMult = noise(offsetX);
    float yMult = noise(offsetY);
    posX = width * xMult;
    posY = height * yMult;
    offsetX += .01;
    offsetY += .01;
  }
}



