
/*
Elizabeth Umbrino
 Final Code Project
 August 16, 2011
 */

PImage sketch;
float xPos;
float yPos;
float lastXPos;
float lastYPos;
int speed = 10;
boolean clearOff = false;

void setup() {
  size(600, 400);
  smooth();
  stroke(0);
  strokeWeight(1);
  sketch = loadImage("final.png");
  imageMode(CENTER);
  image(sketch, width/2, height/2);
  xPos = 100;
  yPos = 100;
  lastXPos = 100;
  lastYPos = 100;
}

void draw() {
  if(clearOff){
    image(sketch, width/2, height/2);
    clearOff = false;
  }
  fill(0);
  line(xPos, yPos, lastXPos, lastYPos);
  point(xPos, yPos);
  lastYPos = yPos;
  lastXPos = xPos;

}

void keyPressed() {


  if (key == CODED) {
    if (keyCode == UP) {
      yPos-=speed;
    }

    if (keyCode == DOWN) {
      yPos+=speed;
    }

    if (keyCode == LEFT) {
      xPos-=speed;
    }

    if (keyCode == RIGHT) {
      xPos+=speed;
    }
  }
}

void mouseDragged(){
  clearOff= true;
}


