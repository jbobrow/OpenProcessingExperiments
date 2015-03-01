
PImage bg;
PImage[] button;
int y = 515;
int x = 70;
int selButton = 0;
/* @pjs preload="1.png"; */

void setup() {
  size(600, 600);
  bg = loadImage("1.png");
  image(bg, 0, 0);
  button = new PImage[6];
  button[0] = loadImage ("icon1.png");
  button[1] = loadImage ("icon2.png");
  button[2] = loadImage ("icon3.png");
  button[3] = loadImage ("icon4.png");
  button[4] = loadImage ("icon5.png");
  button[5] = loadImage ("icon6.png");
  image(button[0], x, y);
  image(button[1], x+80, y);
  image(button[2], x+160, y);
  image(button[3], x+240, y);
  image(button[4], x+320, y);
  image(button[5], x+400, y);
}

void draw() {
  if (mousePressed) { // User is pressing mouse...

    if (mouseY > 515) {
      // ...inside menu area, need to check which button is being pressed:
      if (x < mouseX && mouseX < x+52 && 515 < mouseY && mouseY < 567)  selButton = 0;
      else if (x+80 < mouseX && mouseX < x+132 && 515 < mouseY && mouseY < 567) selButton = 1;
      else if (x+160 < mouseX && mouseX < x+212 && 515 < mouseY && mouseY < 567)  selButton = 2;
      else if (x+240 < mouseX && mouseX < x+292 && 515 < mouseY && mouseY < 567)  selButton = 3;
      else if (x+320 < mouseX && mouseX < x+372 && 515 < mouseY && mouseY < 567)  selButton = 4;
      else if (x+400 < mouseX && mouseX < x+452 && 515 < mouseY && mouseY < 567)  selButton = 5;
    }
    else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(button[selButton], mouseX - 21.5 , mouseY - 21.5);
    }

  }
 

  }



