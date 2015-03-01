
PImage star;
int posX;
int posY;
PFont f;

void setup() {
  size (400, 400);
  background(255);

  fill(0);
  rect (100, 0, 300, 100);
  rect(200, 100, 100, 100);
  rect(200, 200, 100, 100);
  rect(0, 200, 100, 200); 

  star = loadImage("star.png");

  posX = 0;
  posY = 0;

  f = createFont("Arial", 100, true);
}

void draw() {
  background (255);
  fill(0);
  rect (100, 0, 300, 100);
  rect(200, 100, 100, 100);
  rect(200, 200, 100, 100);
  rect(0, 200, 100, 200); 

//  image(star, 100, 100);
//  image(star, 200, 300);
  image(star, 300, 100);

  if (posX == 100 && posY == 0 || posX == 300 && posY == 0 || posX == 200 && posY == 200) {
    posX = 0;
    textFont(f, 100);
    textAlign(CENTER);
    fill(255,0,0);
    text("NO", 200, 200);}
  if (posX == 200 && posY == 100 || posX == 0 && posY == 200 || posX == 0 && posY == 300) {
    posX = 0;
    posY = 0;
    textFont(f, 100);
    textAlign(CENTER);
    fill(255,0,0);
    text("NO", 200, 200);}
    
  if (posX == 300 && posY == 100) {
    textFont(f, 50);
    textAlign(CENTER);
    fill(255,0,0);
    text("YOU WIN", 200, 100);}

  ellipseMode(CORNER);
  fill(0, 255, 0);
  noStroke();
  ellipse(posX, posY, 100, 100);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      posY = posY - 100;
    } else if (keyCode == DOWN) {
      posY = posY + 100;
    } else if (keyCode == RIGHT) {
      posX = posX + 100;
    } else if (keyCode == LEFT) {
      posX = posX - 100;
    }
  }
}



