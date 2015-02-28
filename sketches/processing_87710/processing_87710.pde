
/*
Pearlyn Lii
 ID 3 - Spring 2013
 1/31/13
 */
 
//setup -----

void setup() {
  size(600, 600);
  smooth();
  strokeWeight(.5);
  colorMode(HSB, 360, 100, 100);
}

//draw -----

void draw() {
  for (int y = 30; y<400; y+=20) {
    for (int x = 20; x<60; x = x+2) {
      stroke(53, 18, 94);
      line(0, mouseX, 600, mouseY);
    }
  }

  for (int y = 2; y<400; y+=20) {
    for (int x = 40; x<20; x = x+2) {
      stroke(20, 57, 91);
      line(0, mouseX, 500, mouseY);
    }
  }

  for (int y = 70; y<400; y+=20) {
    for (int x = 45; x<60; x = x+1) {
      stroke(0, 55, 75);
      line(0, mouseX, 400, mouseY);
    }
  }


  for (int y = 200; y<600; y+=10) {
    for (int x = 90; x<120; x = x+7) {
      stroke(174, 56, 65);
      line(0, mouseX, 300, mouseY);
    }
  }

  for (int y = 50; y<width/2; y+=10) {
    for (int x = 10; x<20; x = x+7) {
      stroke(247, 27, 25);
      line(0, mouseX, 200, mouseY);
    }
  }


  }




