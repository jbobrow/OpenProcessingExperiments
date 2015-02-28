
PImage monster;
PImage cola;
PImage pineapple;


void setup() {
  size(500, 500);
  noStroke();
  frameRate(200);
  background ( 140);
  monster = loadImage ("monster.png");
  cola = loadImage ("cola.png");
  pineapple = loadImage ("pineapple.png");
}

void draw() {
}

void mouseDragged() {
  if (key == '1') {
    ellipse( mouseX, mouseY, 10, 10);
  }
  else if (key == '2') {
    image (cola, mouseX-25, mouseY-60);
  } 
  else if (key == '3') {
    image (monster, mouseX-30, mouseY-50);
  }
  else if (key == 'j') {
    image (pineapple, mouseX-35, mouseY-80);
  } 
  else {
    ellipse( mouseX, mouseY, 10, 10);
  }
}

void mousePressed() {
  if (key == '1') {
    ellipse( mouseX, mouseY, 10, 10);
  }
  else if (key == '2') {
    image (cola, mouseX-25, mouseY-60);
  } 
  else if (key == '3') {
    image (monster, mouseX-30, mouseY-50);
  }
  else if (key == 'j') {
    image (pineapple, mouseX-35, mouseY-80);
  } 
  else {
    ellipse( mouseX, mouseY, 10, 10);
  }
}

void keyPressed() {
  if (key == 'n') {
    background (140);
  }
  if (key == '0') {
    fill (255, 0, 0);
  }
  if (key == '9') {
    fill (0, 255, 0);
  }
  if (key == '8') {
    fill (0, 0, 255);
  }
  if (key == 'r') {
    fill (random(256), random(256), random(256));
  }
}



