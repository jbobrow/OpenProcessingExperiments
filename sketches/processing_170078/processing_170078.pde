
/* Jesús C González
 Práctica Bucles
 Raving
 2014 */
 /* @pjs preload="rave-clothing.png"; */

float mouseX = 0;
float mouseY = 0;
PImage ravers; 

void setup() {
  size(700, 500);
  noCursor();
  ravers= loadImage ("rave-clothing.png");
}

void draw() {
  background(random(255), 0, random(255));
  mouseX= random(0, width);
  mouseY = random(0, height);

  for ( int i = 0; i<width; i+=7) {
    stroke(0, 255, 0);
    line ( mouseX, mouseY, width, i);
    stroke(0, 255, 0);
    line ( mouseX, mouseY, i, 0);
    stroke(0, 255, 0);
    line ( mouseX, mouseY, 0, i);
    stroke(0, 255, 0);
    line ( mouseX, mouseY, i, height);
  }
  for ( int i = 0; i<width; i+=7) {
    stroke(0, 255, 0);
    line ( mouseX/2, mouseY/2, random(0,width), i);
    stroke(0, 255, 0);
    line ( mouseX/2, mouseY/2, i, 0);
    stroke(0, 255, 0);
    line ( mouseX/2, mouseY/2, 0, i);
    stroke(0, 255, 0);
    line ( mouseX/2, mouseY/2, i, random(0,height));
  }
  imageMode(CENTER);
  image (ravers, width/2, height/1.78, 500, 440);
}



