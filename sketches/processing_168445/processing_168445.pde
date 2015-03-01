

PImage[] buttons;
PImage img1, img2;
int selButton = 0;


void setup() {
  size(800, 400);

  // Using an array to store the button images:
  buttons = new PImage[8];
  buttons[0] = loadImage("1.png");
  buttons[1] = loadImage("2.png");
  buttons[2] = loadImage("3.png");
  buttons[3] = loadImage("4.png");
  buttons[4] = loadImage("5.png");
  buttons[5] = loadImage("6.png");
  buttons[6] = loadImage("9.png");
  buttons[7] = loadImage("10.png");
  img1 = loadImage("7.png");
  image (img1,200,0);
  img2 = loadImage("8.png");
  image (img2,160,0);

  smooth();
}


void draw() {
  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 200) {
      // ...inside menu area, need to check which button is being pressed:


      if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120)  selButton = 0;
      else if (20 < mouseX && mouseX < 120 && 100 < mouseY && mouseY < 170) selButton = 1;
      else if (20 < mouseX && mouseX < 120 && 180 < mouseY && mouseY < 250)  selButton = 2;
       else if (20 < mouseX && mouseX < 120 && 260 < mouseY && mouseY < 320)  selButton = 3;
       else if (110 < mouseX && mouseX < 160 && 20 < mouseY && mouseY < 120)  selButton = 4;
       else if (110 < mouseX && mouseX < 160 && 20 < mouseY && mouseY < 170)  selButton = 5;
       else if (110 < mouseX && mouseX < 160 && 20 < mouseY && mouseY < 250)  selButton = 6;
       else if (110 < mouseX && mouseX < 160 && 20 < mouseY && mouseY < 320)  selButton = 7;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(164,205,247);
  rect(0, 0, 160, height);
  image(buttons[0], 20, 20);
  image(buttons[1], 20, 100);
  image(buttons[2], 20, 180);  
  image(buttons[3], 20, 260);
  image(buttons[4], 90, 23);
  image(buttons[5], 95, 100);
  image(buttons[6], 95, 180);
  image(buttons[7], 95, 260);
  //Draw outline around selected button:
  noFill();
  stroke(120);
  if (selButton == 0) rect(20, 20, 50, 70);
  else if (selButton == 1) rect(20, 100, 50, 70);
  else if (selButton == 2) rect(20, 180, 50, 70);
  else if (selButton == 3) rect(20, 260, 50, 70);
  else if (selButton == 4) rect(90, 23, 50, 70);
  else if (selButton == 5) rect(95, 100, 50, 70);
  else if (selButton == 6) rect(95, 180, 50, 70);
  else if (selButton == 7) rect(95, 260, 50, 70);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}


