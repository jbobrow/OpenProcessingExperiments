
int s;//seconds
int lastS;//lastsecond

PImage img;

int totalDuration = 3;
int counter = 0;

//position of ellipse
int x = 150;
int y = 250;

//variables relating to opacity
int minimumPercent = 20;
int currentPercent = 0;
int goalPercent = 80;

//variables relating to size
int minimumSize = 200;
float currentSize = 0;
int goalSize = 400;

int diff; //diff will be used to reset millis through each glow cycle
boolean glow = true;

color backgroundColor = color(29,30,52);

void setup() {
  img = loadImage("lightbulb.png");
  //  PROGRAM PROPERTIES
  size(300, 500);
  background(backgroundColor);
  noStroke();
  diff = millis(); //makes diff = millis once program begins to run
}
void draw() {
  smooth();
  background(backgroundColor);
  noStroke();
  glow();
  drawLightBulb();
}

void drawLightBulb() {
image(img,0,0);
}

void glow() {
  
  noStroke();
  
  //when it gets brighter
  if (glow == true) {

    if (counter < goalPercent) {
      currentPercent = round(map(millis()-diff, 0, totalDuration*1000, minimumPercent, goalPercent));

      counter = currentPercent;

      currentSize = map(millis()-diff, 0, totalDuration*1000, minimumSize, goalSize);

      fill(255, 204, 18, currentPercent);
      ellipse(x, y, currentSize, currentSize);
    }

    else {
      diff = millis();
      glow = false;
    }
  }

  //when it gets dimmer
  if (glow == false) {

    if (counter > 0) {
      currentPercent = round(map(millis()-diff, 0, totalDuration*1000, goalPercent, minimumPercent));
      counter = currentPercent;
      currentSize = map(millis()-diff, 0, totalDuration*1000, goalSize, minimumSize);

      fill(255, 204, 18, currentPercent);
      ellipse(x, y, currentSize, currentSize);
    }

    if (counter == minimumPercent) {
      diff = millis();
      glow = true;
    }
  }
}


