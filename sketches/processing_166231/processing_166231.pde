

PImage[] buttons;
int selButton = 0;


void setup() {
  size(1200,950);

  // Using an array to store the button images:
  buttons = new PImage[4];
  buttons[0] = loadImage("pooh.png");
  buttons[1] = loadImage("piglet.png");
  buttons[2] = loadImage("goodie.png");
  buttons[3] = loadImage("eraser.png"); // This is just a white circle to use as an eraser
  background(255);

  smooth();
}


void draw() {
  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 300) {
      // ...inside menu area, need to check which button is being pressed:


      if (20 < mouseX && mouseX < 270 && 20 < mouseY && mouseY < 270)  selButton = 0;
      else if (20 < mouseX && mouseX < 270 && 270 < mouseY && mouseY < 520) selButton = 1;
      else if (20 < mouseX && mouseX < 270 && 520 < mouseY && mouseY < 770)  selButton = 2;
      else if (20 < mouseX && mouseX < 270 && 800 < mouseY && mouseY < 900)  selButton = 3;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(255,244,156);
  rect(0, 0, 300, height);
  image(buttons[0], 20, 20);
  image(buttons[1], 20, 270);
  image(buttons[2], 20, 520);  
  image(buttons[3], 95, 800);

  //Draw outline around selected button:
  noFill();
  stroke(120);
  if (selButton == 0) rect(20, 20, 250, 250);
  else if (selButton == 1) rect(20, 270, 250, 250);
  else if (selButton == 2) rect(20, 520, 250, 250);
  else if (selButton == 3) rect(95, 800, 100, 100);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



