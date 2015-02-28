
Nuke myNuke;
PImage worldMap; //image from outline-world-map.com 
float dayCount = 197; //day # of the current year.  Starts at 197 for July 16th    
float yearCount = 45; //year #.  Starts at 45 for 1945
float nukeSize = 40;
color usaColor = color(255, 0, 0);


void setup() 
{
  worldMap = loadImage("worldMap.png"); //find the image
  size(1357, 628);
  //background(175, 238, 238);
  frameRate(60); //lock frame rate
  myNuke = new Nuke(10, 250, 250, usaColor);
}

void draw()
{
  background(175, 238, 238);
  image(worldMap, 0, 0); // draw the map
  count();

  if (myNuke.r < nukeSize) {
    myNuke.grow();
    myNuke.display();
  }

  else {
    myNuke.reset();
  }

  println (dayCount);
  println (yearCount);
}

void count()
{
  dayCount += 2; //constantly add to dayCount
  if (dayCount == 365) {
    yearCount ++;
    dayCount = 1;
    // fill(0);
    //  ellipse(250, 250, 30, 30);
  }
}

class Nuke {
  float r;
  float xpos;
  float ypos;
  color c;

  Nuke(float tempR, float tempXpos, float tempYpos, color tempC) {
    r = tempR;
    xpos = tempXpos;
    ypos = tempYpos;
    c = tempC;
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(xpos, ypos, r, r);
  }

  void grow() {
    r ++;
  }

  void reset() {
    r = 0;
    xpos = random(0, width);
    ypos = random(0, height);
  }
}



