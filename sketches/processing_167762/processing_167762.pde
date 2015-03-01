
PImage backImage;
PImage[] buttons;
int selButton = 0;

/* @pjs preload="background.png"; */

/* @pjs preload="0.png"; */
/* @pjs preload="1.png"; */
/* @pjs preload="2.png"; */
/* @pjs preload="3.png"; */
/* @pjs preload="4.png"; */
/* @pjs preload="5.png"; */
/* @pjs preload="6.png"; */
/* @pjs preload="7.png"; */
/* @pjs preload="8.png"; */
/* @pjs preload="9.png"; */


void setup() {
  size(700, 600);

  buttons = new PImage[10];  
  buttons[0] = loadImage("0.png");
  buttons[1] = loadImage("1.png"); 
  buttons[2] = loadImage("2.png"); 
  buttons[3] = loadImage("3.png"); 
  buttons[4] = loadImage("4.png"); 
  buttons[5] = loadImage("5.png"); 
  buttons[6] = loadImage("6.png"); 
  buttons[7] = loadImage("7.png"); 
  buttons[8] = loadImage("8.png"); 
  buttons[9] = loadImage("9.png");
  background(255);

  backImage = loadImage("background.png");
  image(backImage, 80, 50);
}

void draw() {

  if (mousePressed) { 

    if (mouseX < 60) {
      if (0 < mouseX && mouseX < 60 && 0 < mouseY && mouseY < 60) selButton = 0;
      else if (0 < mouseX && mouseX < 120 && 0 < mouseY && mouseY < 120) selButton = 1;
      else if (0 < mouseX && mouseX < 180 && 0 < mouseY && mouseY < 180) selButton = 2;
      else if (0 < mouseX && mouseX < 240 && 0 < mouseY && mouseY < 240) selButton = 3;
      else if (0 < mouseX && mouseX < 300 && 0 < mouseY && mouseY < 300) selButton = 4;
      else if (0 < mouseX && mouseX < 360 && 0 < mouseY && mouseY < 360) selButton = 5;
      else if (0 < mouseX && mouseX < 420 && 0 < mouseY && mouseY < 420) selButton = 6;
      else if (0 < mouseX && mouseX < 480 && 0 < mouseY && mouseY < 480) selButton = 7;
      else if (0 < mouseX && mouseX < 540 && 0 < mouseY && mouseY < 540) selButton = 8;
      else if (0 < mouseX && mouseX < 600 && 0 < mouseY && mouseY < 600) selButton = 9;
    } else {
      image(buttons[selButton], mouseX - 30, mouseY - 30);
    }
  }

  fill(0);
  rect(0, 0, 60, height);
  image(buttons[0], 0, 0);
  image(buttons[1], 0, 60);
  image(buttons[2], 0, 120);
  image(buttons[3], 0, 180);
  image(buttons[4], 0, 240);
  image(buttons[5], 0, 300);
  image(buttons[6], 0, 360);
  image(buttons[7], 0, 420);
  image(buttons[8], 0, 480);
  image(buttons[9], 0, 540);

  noFill();
  stroke(120);
  if (selButton == 0) rect(0, 0, 60, 60);
  else if (selButton == 1) rect(0, 60, 60, 60);
  else if (selButton == 2) rect(0, 120, 60, 60);
  else if (selButton == 3) rect(0, 180, 60, 60);
  else if (selButton == 4) rect(0, 240, 60, 60);
  else if (selButton == 5) rect(0, 300, 60, 60);
  else if (selButton == 6) rect(0, 360, 60, 60);
  else if (selButton == 7) rect(0, 420, 60, 60);
  else if (selButton == 8) rect(0, 480, 60, 60);
  else if (selButton == 9) rect(0, 540, 60, 60);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



