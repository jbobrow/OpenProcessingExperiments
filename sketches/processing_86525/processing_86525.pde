
PVector pacman;
float mouth=0;

void setup() {

  size(512, 512);
  pacman = new PVector(256, 256);
  smooth();
  noStroke();
  frameRate(30);
}

void draw() {
  background(192);

  translate(pacman.x, pacman.y);

  fill(256, 256, 0);
  ellipse(0, 0, 64, 64);

  fill(192);
  rotate(atan2(mouseY-pacman.y, mouseX-pacman.x));
  triangle(0, 0, 128, -64*cos(radians(mouth*6)), 128, 64*cos(radians(mouth*6)));
  mouth++;

  fill(0);
  ellipse(0, 16, 16, 16);


  if (((mouseX-pacman.x)*(mouseX-pacman.x))>64||((mouseY-pacman.y)*(mouseY-pacman.y))>64) {

    cursor();
    pacman.x+=8*cos(atan2(mouseY-pacman.y, mouseX-pacman.x));
    pacman.y+=8*sin(atan2(mouseY-pacman.y, mouseX-pacman.x));
  }
  else {

    noCursor();
  }
}



