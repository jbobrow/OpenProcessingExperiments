
PImage[] buttons;
int selButton = 0;

void setup() {
  size(800, 750);
   buttons = new PImage[6];
  buttons[0] = loadImage("s.png");
  buttons[1] = loadImage("t.png");
  buttons[2] = loadImage("r.png");
  buttons[3] = loadImage("a.png");
  buttons[4] = loadImage("w.png");
  buttons[5] = loadImage("dot1.png");
  background(247,247,235);
  //noStroke();
  //fill(247,247,235);
  //rect(100,47.5,790,1005);

  smooth();
}

void draw() {
  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 262) {
      // ...inside menu area, need to check which button is being pressed:


      if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120)  selButton = 0;
      else if (20 < mouseX && mouseX < 120 && 140 < mouseY && mouseY < 240) selButton = 1;
      else if (20 < mouseX && mouseX < 120 && 260 < mouseY && mouseY < 360)  selButton = 2;
      else if (20 < mouseX && mouseX < 120 && 380 < mouseY && mouseY < 480)  selButton = 3;
      else if (20 < mouseX && mouseX < 120 && 500 < mouseY && mouseY < 600)  selButton = 4;
      else if (20 < mouseX && mouseX < 120 && 620 < mouseY && mouseY < 720)  selButton = 5;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(130,125,125);
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
  if (selButton == 0) rect(20, 20, 100, 100);
  else if (selButton == 1) rect(20, 140, 100, 100);
  else if (selButton == 2) rect(20, 260, 100, 100);
  else if (selButton == 3) rect(20, 380, 100, 100);
  else if (selButton == 4) rect(20, 500, 100, 100);
  else if (selButton == 5) rect(20, 620, 100, 100);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}


