
//PImage backImage;
PImage[] buttons;
int selButton = 0;

void setup() {
  size(600, 750);

  // Using an array to store the button images:
  buttons = new PImage[6];  
  buttons[0] = loadImage("01.png");
  buttons[1] = loadImage("02.png");
  buttons[2] = loadImage("03.png");
  buttons[3] = loadImage("04.png");
  buttons[4] = loadImage("05.png");
  buttons[5] = loadImage("06.png"); // This is just a white circle to use as an eraser
  background(134, 229, 127);

  noStroke();
  fill(57,114,51);
  ellipse(200,300,800,800);
  //drawing board
  /*backImage = loadImage("background.png");
  image(backImage, 200, 100);

  ellipseMode(RADIUS);*/
}

void draw() {
  float d = dist(200, 300, mouseX, mouseY);


  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 200) {
      // ...inside menu area, need to check which button is being pressed:
      if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120) selButton = 0;
      else if (20 < mouseX && mouseX < 120 && 140 < mouseY && mouseY < 240) selButton = 1;
      else if (20 < mouseX && mouseX < 120 && 260 < mouseY && mouseY < 360) selButton = 2;
      else if (20 < mouseX && mouseX < 120 && 380 < mouseY && mouseY < 480) selButton = 3;
      else if (20 < mouseX && mouseX < 120 && 500 < mouseY && mouseY < 600) selButton = 4;
      else if (20 < mouseX && mouseX < 120 && 620 < mouseY && mouseY < 720) selButton = 5;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      if (d < 400) {
        image(buttons[selButton], mouseX - 50, mouseY - 50);
      }
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(150);
  rect(0, 0, 200, height);
  image(buttons[0], 20, 20);
  image(buttons[1], 20, 140);
  image(buttons[2], 20, 260);
  image(buttons[3], 20, 380);  
  image(buttons[4], 20, 500);
  image(buttons[5], 20, 620);
  //Draw outline around selected button:
  noFill();
  stroke(120);
  if (selButton == 0) rect(20, 20, 71, 100);
  else if (selButton == 1) rect(20, 140, 71, 100);
  else if (selButton == 2) rect(20, 260, 71, 100);
  else if (selButton == 3) rect(20, 380, 71, 100);
  else if (selButton == 4) rect(20, 500, 71, 100);
  else if (selButton == 5) rect(20, 620, 71, 100);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



