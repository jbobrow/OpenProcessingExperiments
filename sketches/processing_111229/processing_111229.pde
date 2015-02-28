
void setup(){
  size(500, 500);
}

int diameter = 25;
int positionx = 250;
int speedx = 5;
int directionx = 1;
int positiony = 0;
int speedy = 5;
int directiony = 1;
int lpaddle = 250;
int rpaddle = 250;
boolean lpaddleup = false;
boolean rpaddleup = true;
int rpoints = 0;
int lpoints = 0;


void draw() {
  background(255);
  fill(0);
  textSize(32);
  text(lpoints, width/2 - 25, 50);
  text(rpoints, width/2 + 25, 50);
  noFill();
  rectMode(CENTER);
  rect(20, lpaddle, 10, 50);
  rect(width - 20, rpaddle, 10, 50);
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      if (lpaddle >= 25) {
        lpaddle = lpaddle - 5;
      }
    }
    if (key == 's' || key == 'S') {
      if (lpaddle <= height - 25) {
        lpaddle = lpaddle + 5;
      }
    }
  }
  if (mousePressed && (mouseButton == LEFT)) {
    if (rpaddle >= 25) {
      rpaddle = rpaddle - 5;
    }
  }
  if (mousePressed && (mouseButton == RIGHT)) {
    if (rpaddle <= height - 25) {
      rpaddle = rpaddle + 5;
    }
  }
  ellipse(positionx, positiony, diameter, diameter);
  positionx = positionx + speedx*directionx;
  positiony = positiony + speedy*directiony;
  if (positiony >= height) {
    directiony = -directiony;
  }
  else if (positiony <= 0) {
    directiony = -directiony;
  }
  if (positionx >= width) {
    lpoints = lpoints + 1;
    positionx = 250;
    positiony = diameter;
  }
  else if (positionx <= 0) {
    rpoints = rpoints + 1;
    positionx = 250;
    positiony = diameter;
  }
  if ((positiony >= lpaddle - 25 - diameter/2) && (positiony <= lpaddle + 25 + diameter/2) && (positionx <= 20 + diameter)) {
    directionx = -directionx;
  }
  if (positiony >= rpaddle - 25 -diameter/2 && positiony <= rpaddle + 25+diameter/2 && positionx >= width - 20 - diameter) {
    directionx = -directionx;
  }
  if ((positionx >= 15) && (positionx <= 25) && (positiony <= lpaddle - 25 - diameter)) {
    directiony = -directiony;
  }
  if (positionx >= width - 25 && positionx <= width - 15 && positiony >= rpaddle - 25 - diameter) {
    directiony = -directiony;
  }
  if ((positionx >= 15) && (positionx <= 25) && (positiony <= lpaddle + 25 + diameter)) {
    directiony = -directiony;
  }
  if (positionx >= width - 25 && positionx <= width - 15 && positiony >= rpaddle + 25 + diameter) {
    directiony = -directiony;
  }
}
