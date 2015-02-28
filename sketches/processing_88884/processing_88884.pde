

PShape a, b, c, d, e;
float size;
float speed = 5;
float sX = size;
float sY = size;
String direction = "a";

void setup() {
  size(500, 500);
  // The file "bot.svg" must be in the data folder
  // of the current sketch to load successfully

  a = loadShape("up.svg");
  b = loadShape("left.svg");
  c = loadShape("right.svg");
  d = loadShape("down.svg");
  e = loadShape("down.svg");
}

void draw() {

  background(200, 24, 125);
  shape(e, sX, sY, 30, 30);
  move();
  noCursor();
}

void move() {
  if (keyPressed) {
    if (key == 'w') {
      sY -= speed;
      e = a;
    }
    else if (key == 'a') {
      sX -= speed;
      e = b;
    }
    else if (key == 'd') {
      sX += speed;
      e = c;
    }
    else if (key == 's') {
      sY += speed;
      e = d;
    }
  }
}


