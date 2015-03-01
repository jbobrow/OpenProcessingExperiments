
int posX;
int posY;

int r;
int g;
int b;

int sizeX;
int sizeY;


//IMAGES
PImage bg;
PImage treasureMap;
PImage arrows;
PImage rect;
PImage left;
PImage right;
PImage up;
PImage down;

PFont font;

void setup() {
  bg = loadImage("background.jpg");
  treasureMap = loadImage("schatkaart.png");
  font = loadFont("piratefont.vlw");
  arrows = loadImage("arrows.png");
  rect = loadImage("rect.png");
  left = loadImage("left.png");
  up = loadImage("up.png");
  right = loadImage("right.png");
  down = loadImage("down.png");
  


  size(800, 800);
  r = 100;
  g = 100;
  b = 100;
  posX = 500;
  posY = 500;
  sizeX = 50;
  sizeY = 50;
}

void draw() {
  image(bg, 0, 0, 800, 800);
    fill(50,50,50,150);
  rect(0,0,width,height);
  noStroke();
  //VELD

  image(treasureMap, 150, 250, 500, 500);


  //Gevulde ding
  rectMode(CENTER);

  fill(r, g, b);
  rect(posX, posY, sizeX, sizeY);
  image(rect, posX-25, posY-25, sizeX, sizeY);
  fill(200);
  text((posX-150)/5, posX-40,posY+50);
  text((posY-250)/5, posX,posY+50);

  rectMode(CORNER);
  //R
  fill(r, 0, 0);
  triangle(40, 100, 90, 50, 90, 150);
  triangle(260, 100, 210, 50, 210, 150);
  rect(100, 50, 100, 100);
  image(arrows, 40, 50, 220, 100);
  fill(0);
  textFont(font, 32);
  text(r, 135, 115);

  //G
  fill(50, g, 0);
  triangle(290, 100, 340, 50, 340, 150);
  triangle(510, 100, 460, 50, 460, 150);
  rect(350, 50, 100, 100);
  image(arrows, 290, 50, 220, 100);
  fill(50);
  textFont(font, 32);
  text(g, 385, 115);

  //B
  fill(0, 0, b);
  triangle(540, 100, 590, 50, 590, 150);
  triangle(760, 100, 710, 50, 710, 150);
  rect(600, 50, 100, 100);
  image(arrows, 540, 50, 220, 100);
  fill(50);
  textFont(font, 32);
  text(b, 635, 115);

  //Y
  fill(100);
  rect(75, 250, 50, 50);
  rect(75, 325, 50, 50);
  textFont(font, 32);


  image(up, 75, 250, 50, 50);
  image(down, 75, 325, 50, 50);


  //X
  fill(100);
  rect(150, 175, 50, 50);
  rect(225, 175, 50, 50);
  image(left, 150, 175, 50, 50);
  image(right, 225, 175, 50, 50);

  println(r, g, b, posX, posY);
}

void mouseClicked() {

  //R
  if (r > 0) {
    if (mouseX >=40 && mouseX < 90 && mouseY >= 50 && mouseY < 150) { 
      r = r-5;
    }
  }
  if (r < 245) {
    if (mouseX >=210 && mouseX < 260 && mouseY >= 50 && mouseY < 150) { 
      r = r+5;
    }
  }

  //G
  if (g > 0) {
    if (mouseX >=290 && mouseX < 340 && mouseY >= 50 && mouseY < 150) { 
      g = g-5;
    }
  }
  if (g < 255) {
    if (mouseX >=460 && mouseX < 510 && mouseY >= 50 && mouseY < 150) { 
      g = g+5;
    }
  }

  //R
  if (b > 0) {
    if (mouseX >=540 && mouseX < 590 && mouseY >= 50 && mouseY < 150) { 
      b = b-5;
    }
  }
  if (b < 255) {
    if (mouseX >=710 && mouseX < 760 && mouseY >= 50 && mouseY < 150) { 
      b = b+5;
    }
  }


  //POS X
  if (posX > 200 && posX < 700) {
    if (mouseX >=150 && mouseX < 200 && mouseY >= 175 && mouseY < 225) { 
      posX = posX-5;
    }
  }

  if (posX >=150 && posX <= 600) {
    if (mouseX >=225 && mouseX < 275 && mouseY >= 175 && mouseY < 225) { 
      posX = posX+5;
    }
  }

  if (posY > 320 && posY <= 710) {
    if (mouseX >= 75 && mouseX < 125 && mouseY >= 250 && mouseY < 300 ) {
      posY = posY -5;
    }
  }

  if (posY > 310 && posY <= 700) {
    if (mouseX >= 75 && mouseX < 125 && mouseY >= 325 && mouseY < 375 ) {
      posY = posY +5;
    }
  }
}



