

PImage[] buttons;
int selButton = 0;


void setup() {
  size(700, 500);

  // Using an array to store the button images:
  buttons = new PImage[4];
  buttons[0] = loadImage("heart_icon.png");
  buttons[1] = loadImage("leaf_icon.png");
  buttons[2] = loadImage("star_icon.png");  
  buttons[3] = loadImage("eraser.png"); // This is just a white circle to use as an eraser

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
            else if (20 < mouseX && mouseX < 120 && 380 < mouseY && mouseY < 480)  selButton = 3;

    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(255,250,222);
  rect(0, 0, 200, height);
  image(buttons[0], 50, 20);
  image(buttons[1], 50, 140);
  image(buttons[2], 50, 260);  
  image(buttons[3], 50, 380);  

  //Draw outline around selected button:
  noFill();
  stroke(120);
  if (selButton == 0) rect(50, 20, 60, 60);
  else if (selButton == 1) rect(50, 140, 60, 60);
  else if (selButton == 2) rect(50, 260, 60, 60);
    else if (selButton == 3) rect(50, 380, 60, 60);

}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



