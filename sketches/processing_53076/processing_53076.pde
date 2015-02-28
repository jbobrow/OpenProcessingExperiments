
//Program by Sarah Keeling, 2/18/12
//Jim Robert's Processing for the Arts @ CMU 
//Change in speed code borrowed from class examples
//Copyright 2012


//HOW TO PLAY: The player controls the potato in a ballerina skirt, the target is the potato masher. You can 
//control the movement of the potato by pressing and dragging the mouse to change it's speed.
//The object is to get as many collisions as possible in the shortest amount of time to make some mashed potatoes. 

// Comments: The commented out code is for the version that uses ellipses for the game characters. This setting 
//works better in collision detection.


float bounceX, bounceY, r, bounceSpeedX, bounceSpeedY;
float wrapX, wrapY, wrapSpeedX, wrapSpeedY;
int eventCount;

PImage potato, masher, mashedPotates;

void setup () {
  size (500, 500);
  smooth();
  background (0);
  bounceX = random (0, width);
  bounceY = random (0, height);
  r = 50;
  bounceSpeedX = 3;
  bounceSpeedY = 3;

  wrapX = random (width);
  wrapY = random (0, height);
  wrapSpeedX = 1;
  wrapSpeedY = 1;

  eventCount = 0;
  
 potato = loadImage ("potato.png");
 masher = loadImage ("potatoMasher.png");
 mashedPotates = loadImage ("supriseMashedPotatoes.png");
}

void draw () {
  prepWindow ();
  textTracking ();

  drawBounceObject();
  moveBounceObject ();

  moveWrapObject ();
  drawWrapObject (wrapX, wrapY);
  collisionDetected ();
}


void prepWindow () {
  fill (0, 0, 240, 70);
  rect (0, 0, width, height);

 
}

void textTracking () {

  fill (255);
  textSize (12);
  text ("Number of Collisions: " + eventCount, 10, 10);
  text ( "Time:" + frameCount, 10, 30);
}
void drawBounceObject () {
  fill (255);
  noStroke ();
  //ellipse (bounceX, bounceY, r, r);
  image (masher, bounceX, bounceY);
}

void moveBounceObject () {
  bounceX = bounceX + bounceSpeedX;
  bounceY = bounceY + bounceSpeedY;
  if (bounceX >= width) {
    bounceSpeedX = -bounceSpeedX;
  }
  else if
    (bounceX <= 0) {
    bounceSpeedX = -bounceSpeedX;
  }

  if (bounceY >= height) {

    bounceSpeedY = -bounceSpeedY;
  }
  else if (bounceY <= 0) {
    bounceSpeedY = -bounceSpeedY;
  }
}

void drawWrapObject (float x, float y) {

  fill (255, 200, 200);
  //ellipse (x, y, r/2, r/2);
  pushMatrix ();
  scale (.5);
  image (potato, x, y);
  popMatrix ();
}

void moveWrapObject () {

  wrapX = wrapX + wrapSpeedX;
  wrapY = wrapY + wrapSpeedY;

  if (wrapX > width) {
    wrapX = 0;
  }
  else if (wrapX < 0) {
    wrapX = width;
  }

  if (wrapY > height) {

    wrapY = 0;
  }
  else if (wrapY < 0) {
    wrapY = height;
  }
}

void mouseDragged () {

  if (mouseX > pmouseX) {
    wrapSpeedX = wrapSpeedX + 1;
  }
  else if (mouseX < pmouseX) {
    wrapSpeedX = wrapSpeedX - 1;
  }
  if (mouseY > pmouseY) {
    wrapSpeedY = wrapSpeedY + 1;
  }
  else if (mouseY < pmouseY) {
    wrapSpeedY = wrapSpeedY - 1;
  }
}

void collisionDetected () {
  float bam = dist (bounceX, bounceY, wrapX, wrapY);

  //if (bam < 40) {
    if (bam < 50) {
    wrapSpeedY = random (0, 3);
    wrapSpeedX = random (0, 3);
    bounceSpeedX =random (0, 3);
    bounceSpeedY = random (0, 3);
    wrapX = random (width);
    pushMatrix ();
    scale (1.2);
    image (mashedPotates, 0,0);
    popMatrix ();
    textSize (60);
   // fill (0);
   // rect (0, 0, width, height);
    fill (random (255), random (255), random (255));
    text ("Mashed Potato!", 100, height/2);

    eventCount = eventCount +1;
  }
}


void mouseReleased () {
  wrapSpeedY = 1;
  wrapSpeedX = 1;
  bounceSpeedX = 3;
  bounceSpeedY = 3;
}




