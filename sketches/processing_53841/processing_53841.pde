
  /*****************************************
 * Assignment #4
 * Name:         Amanda Guadalupe
 * E-mail:       aguadalupe@brynmawr.edu
 * Course:       CS 110 - Section #2
 * Submitted:    2/28/2012
 * 
 * My sketch is of a bottle in front of a starry sky, where when you click a star will fall! 
 * The idea is to click in the bottle so that you can save them and "keep your wishes safe and sound"!
 * Your wish will not be ganted if the star falls outside the bottle! you have up to 20 wishes!
 * I referenced many codes from class disussions and mentioned when necessary.
 ***********************************************/ 

int w, h;
float x, y;
float spdX, spdY;
float gravity, damping;
float friction;
int vs;

int count = 800;
skyStars[] ss = new skyStars[count];
float[] spdXs = new float[count];
float[] spdYs = new float[count];


int maxNum = 20;
Wish[] myStar = new Wish[maxNum];
int newObject = 0;

PImage image;

void setup () {
  size(500, 500);  
  smooth();
  noStroke();
  
  image = loadImage("wishes.png"); //background I made
  
  for (int i=0; i<count; i++) {
    ss[i] = new skyStars(2, 20);
    spdXs[i] = random(-1, 1);
    spdYs[i] = random(-1, 1);
    ss[i].setSpeed(spdXs[i], spdYs[i]);
  }
}


void draw() {

  fill(255);
  image(image, 0, 0);

  for (int i=0; i<count; i++) { //calls the floating stars
    ss[i].move();
    ss[i].display();
  }

  drawBottle(width/2, height/2+7);

  for (int i=0; i<maxNum; i++) { //calls the stars that fall
    if (myStar[i] != null) {
      myStar[i].display();
      myStar[i].move();
    }
  }
}

  void mousePressed() { //up to 20 stars will fall when clicked!
    myStar[newObject] = new Wish(mouseX, mouseY);
    newObject = (newObject+1) % maxNum;
  }

  void drawBottle(float xs, float ys) {
    stroke(3);
    noFill();
    smooth();
    strokeWeight(3);
    fill(133, 250, 183, 150);
    ellipse(xs, ys+210, 300, 80);
    ellipse(xs, ys+10, 300, 80);
    fill(133, 250, 183, 150);
    ellipse(xs, ys+110, 370, 280);
    ellipse(xs, ys, 300, 60);
  }


