
Float xpos = random (0, 400);
float ypos = random (0, 400);
float xvel = random (-5, 5);
float yvel = random (-5, 5);
float d = random (20, 50);
PImage myImage; 
boolean start = false;
PFont font;

void setup() {
  size(400, 600);
  font = loadFont("Serif-20.vlw");
  textFont(font);
  fill(0);
  background(255); 
  text("Hit Me Buddy",150,300);  
  smooth();
  myImage = loadImage("bubble-bg.png");  
  frameRate = (60);
}

void draw() {
  if (mousePressed == true) {
    start = true;
  }
  if (start == true) {

    image(myImage, 0, 0); 

    PImage  myImage = loadImage("Bubble.png");
    image (myImage, xpos, ypos, d, d);
    xpos = xpos +xvel;
    ypos = ypos +yvel;

    if (xpos < (d/2)) {
      xvel =xvel*(-1);
    }

    if (ypos < (d/2)) {
      yvel =yvel*(-1);
    }

    if (ypos >height-(d/2)) {
      yvel =yvel*(-1);
    }

    if (xpos >width-(d/2)) {
      xvel =xvel*(-1);
    }
  }
}


