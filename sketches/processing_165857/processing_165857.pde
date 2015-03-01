

PImage[] buttons;
int selButton = 0;


void setup() {
  size(800, 600);
frameRate(10);
  // Using an array to store the button images:
  buttons = new PImage[8];
  buttons[0] = loadImage("1_1.png");
  buttons[1] = loadImage("1_2.png");
  buttons[2] = loadImage("1_3.png"); 
  buttons[3] = loadImage("1_4.png");
  buttons[4] = loadImage("1_5.png");//eraser
  buttons[5] = loadImage("ha.png");
  buttons[6] = loadImage("k.png");
  buttons[7] = loadImage("1_6.png");
  
  background(255);

  smooth();
}


void draw() {
  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 200) {
      // ...inside menu area, need to check which button is being pressed:


      if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120)  selButton = 0;
      else if (20 < mouseX && mouseX < 120 && 140 < mouseY && mouseY < 240) selButton = 1;
      else if (20 < mouseX && mouseX < 120 && 260 < mouseY && mouseY < 360)  selButton = 2;
      else if (20 < mouseX && mouseX < 120 && 380 < mouseY && mouseY < 500)  selButton = 3;
      else if (100 < mouseX && mouseX < 220 && 20 < mouseY && mouseY < 120)  selButton = 4;
      else if (100 < mouseX && mouseX < 220 && 20 < mouseY && mouseY < 240)  selButton = 5;
      else if (100 < mouseX && mouseX < 220 && 20 < mouseY && mouseY < 360)  selButton = 6;
      else if (100 < mouseX && mouseX < 220 && 20 < mouseY && mouseY < 500)  selButton = 7;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(200);
  rect(0, 0, 200, height);
  image(buttons[0], 20, 20);
  image(buttons[1], 20, 140);
  image(buttons[2], 20, 260);  
  image(buttons[3], 20, 380);
  image(buttons[4], 100, 20);
  image(buttons[5], 100, 140);
  image(buttons[6], 100, 260);
  image(buttons[7], 100, 380);

  //Draw outline around selected button:
  noFill();
  stroke(120);
  if (selButton == 0) rect(20, 20, 72, 72);
  else if (selButton == 1) rect(20, 140, 72, 72);
  else if (selButton == 2) rect(20, 260, 72, 72);
  else if (selButton == 3) rect(20, 380, 72, 72);
  else if (selButton == 4) rect(100, 20, 72, 72);
  else if (selButton == 5) rect(100, 140, 72, 72);
  else if (selButton == 6) rect(100, 260, 72, 72);
  else if (selButton == 7) rect(100, 380, 72, 72);
}


void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}


