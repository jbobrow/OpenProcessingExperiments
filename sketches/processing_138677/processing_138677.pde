
/* 
Jenny Hsu
Benjamin Bacon
Creative Computing Section B
6 March 2014

Week 4 - Motion B
*/

PImage dazed;
PImage confused;
float a;
float b;


void setup() {
  size (600, 600);
  smooth();
}

void draw () {
  background(0, 0, 0, 40);

  //  display 'dazed' on screen
  if (keyPressed) {
    if (key == 'a') {
      dazed = loadImage("dazed.png");
      image (dazed, random(0, 50), b);
      frameRate(20);
    }
    
    // display 'confused' on screen
    if (key == 's') { 
      confused = loadImage("confused.png");
      image (confused, a, b);
    }
  }
}



