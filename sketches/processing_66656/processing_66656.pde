
PImage rocketship;
//Planet Color Change Setup
int circleX;
int circleY;
boolean isLanded;

void setup () {
  size (500, 500);
  smooth ();
  noCursor ();
  rocketship = loadImage ("rocketship.png");
  circleX = 0;
  circleY = 0;
  isLanded = false;
}


void draw () {
  frameRate (10);
  noStroke ();
  background(0);

  for (int i = 0; i < 50; i++) { //White Meteorites
    fill (random (255));
  }
  for (int i = 0; i < 15; i++) { //Random Size Ellipses
    ellipse (random(0, width), random(0, height), i, i);
  }
  for (int i = 1 ; i < width; i++) { //Planet Rings
    drawCircle(0, 0, i*i);
  }
  
  if (isLanded == false) { //
    fill(200, 0, 0);
  } else {
    fill(random(0,255), random(0,255), random(0,255));
  }

  ellipse(circleX, circleY, 110, 110);

  
  imageMode (CENTER); // Rocket Mouse
  image (rocketship, mouseX, mouseY);
  
  fill(255);
  if (mouseX < width/2 && mouseY < height/2) {
  text("Click on the Planet", mouseX+20, mouseY+20);
  }
}

void drawCircle(float circX, float circY, int diameter) { // Planet Rings
  noFill();
  stroke(random(255));
  ellipse(circX, circY, diameter, diameter);
}

void mouseReleased() {
    if (dist(mouseX, mouseY, circleX, circleY) < 50) {
    isLanded = !isLanded;
  } 
}

