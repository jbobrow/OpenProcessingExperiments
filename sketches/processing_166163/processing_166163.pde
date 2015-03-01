
PImage backImage;
PImage[] buttons;
int selButton =5;

void setup() {
  size(513, 513);
  noStroke();
  background(0,68,120);
  fill(0,68,120);

  backImage = loadImage("titlebg.png");

  buttons = new PImage[6];  
  buttons[0] = loadImage("star1.png");
  buttons[1] = loadImage("star2.png");
  buttons[2] = loadImage("star3.png");
  buttons[3] = loadImage("star4.png");
  buttons[4] = loadImage("rainbow.png");
  buttons[5] = loadImage("cat.png");
}

void draw() {

  if (mousePressed) {

    if (mouseY < 81) {
      if (225 < mouseX && mouseX < 247 && 27 < mouseY && mouseY < 49) selButton = 0;
      else if (258 < mouseX && mouseX < 280 && 27 < mouseY && mouseY < 49) selButton = 1;
      else if (291 < mouseX && mouseX < 313 && 27 < mouseY && mouseY < 49) selButton = 2;
      else if (327 < mouseX && mouseX < 349 && 27 < mouseY && mouseY < 49) selButton = 3;
      else if (363 < mouseX && mouseX < 388 && 12 < mouseY && mouseY < 67) selButton = 4;
      else if (396 < mouseX && mouseX < 493 && 9 < mouseY && mouseY < 70) selButton = 5;
      else if (24 < mouseX && mouseX < 193 && 21 < mouseY && mouseY < 58) rect(0, 70, 513, 443);
    } else {
      if (80 < mouseY) {
        image(buttons[selButton], mouseX - 11, mouseY - 11);
      }
    }
  }
  
  image(backImage, 0, 0);
  image(buttons[0], 225, 27);
  image(buttons[1], 258, 27);
  image(buttons[2], 291, 27);
  image(buttons[3], 324, 27);
  image(buttons[4], 363, 12);
  image(buttons[5], 396, 9);
}



