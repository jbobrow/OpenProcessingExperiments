


PImage[] buttons;
int selButton = 0;


void setup() {
  size(800, 600);

  // Using an array to store the button images:
  buttons = new PImage[5];
  buttons[0] = loadImage("girl.png");
  buttons[1] = loadImage("A.png");
  buttons[2] = loadImage("B.png");
  buttons[3] = loadImage("D.png");
  buttons[4] = loadImage("32x32.png"); // eraser
  background(255);

  smooth();
}


void draw() {
  
  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 200) {
      // ...inside menu area, need to check which button is being pressed:


      if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120)  selButton = 0;
      else if (20 < mouseX && mouseX < 120 && 140 < mouseY && mouseY < 240) selButton = 1;
      else if (20 < mouseX && mouseX < 120 && 140 < mouseY && mouseY < 360)  selButton = 2;
      else if (20 < mouseX && mouseX < 120 && 140 < mouseY && mouseY < 540)  selButton = 3;
      
      
      
      else if (20 < mouseX && mouseX < 120 && 140 < mouseY && mouseY < 587)  selButton = 4;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(150);
  rect(0, 0, 200, height);
  image(buttons[0], 50, 20);
  image(buttons[1], 50, 140);
  image(buttons[2], 50, 260);
  image(buttons[3], 50, 400);
  
  image(buttons[4], 90, 550);

  //Draw outline around selected button:
  noFill();
  stroke(200);
  if (selButton == 0) rect(50, 20, 100, 100);
  else if (selButton == 1) rect(50, 140, 100, 100);
  else if (selButton == 2) rect(50, 260, 100, 100);
  else if (selButton == 3) rect(50, 400, 100, 100);
  
  else if (selButton == 4) rect(86, 545, 40, 40);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



