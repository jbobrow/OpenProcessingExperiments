

PImage[] buttons;
int selButton = 0;



void setup() {
  size(600, 400);
  // Using an array to store the button images:
  buttons = new PImage[4];
  buttons[0] = loadImage("mario.png");
  buttons[1] = loadImage("mushroom.png");
  buttons[2] = loadImage("pipe.png"); // This is just a white circle to use as an eraser
  buttons[3] = loadImage("eraser.png");
  
  background(92, 148, 252);
  smooth();
}


void draw() {
  
  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 130) {
      // ...inside menu area, need to check which button is being pressed:


      if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120)  selButton = 0;
      else if (20 < mouseX && mouseX < 120 && 120 < mouseY && mouseY < 190) selButton = 1;
      else if (20 < mouseX && mouseX < 120 && 190 < mouseY && mouseY < 300)  selButton = 2;
      else if (20 < mouseX && mouseX < 120 && 300 < mouseY && mouseY < 400)  selButton = 3;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(150);
  rect(0, 0, 130, height);
  image(buttons[0], 20, 20);
  image(buttons[1], 20, 120);
  image(buttons[2], 20, 190);
  image(buttons[3], 20, 300);  

  //Draw outline around selected button:
  noFill();
  stroke(120);
  if (selButton == 0) rect(20, 20, 100, 100);
  else if (selButton == 1) rect(20, 120, 100, 100);
  else if (selButton == 2) rect(20, 190, 100, 100);
  else if (selButton == 3) rect(20, 300, 100, 100);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



