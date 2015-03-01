
PImage[] buttons;
int selButton = 0;


void setup() {
  size(1000, 780);

  // Using an array to store the button images:
  buttons = new PImage[6];
  buttons[0] = loadImage("snoopy1.png");
  buttons[1] = loadImage("snoopy2.png");
  buttons[2] = loadImage("snoopy3.png"); // This is just a white circle to use as an eraser
  buttons[3] = loadImage("snoopy4.png");
  buttons[4] = loadImage("snoopy5.png");
  buttons[5] = loadImage("eraser.png");
  
  background(255);

  smooth();
}


void draw() {
  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 200) {
      // ...inside menu area, need to check which button is being pressed:


      if (50 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120)  selButton = 0;
      else if (50 < mouseX && mouseX < 120 && 140 < mouseY && mouseY < 240) selButton = 1;
      else if (50 < mouseX && mouseX < 120 && 260 < mouseY && mouseY < 360)  selButton = 2;
      else if (50 < mouseX && mouseX < 120 && 380 < mouseY && mouseY < 480)  selButton = 3;
      else if (50 < mouseX && mouseX < 120 && 510 < mouseY && mouseY < 600)  selButton = 4;
      else if (50 < mouseX && mouseX < 120 && 640 < mouseY && mouseY < 800)  selButton = 5;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(0);
  rect(0, 0, 200, height);
  image(buttons[0], 60, 20);
  image(buttons[1], 70, 140);
  image(buttons[2], 50, 260); 
  image(buttons[3], 50, 380);
  image(buttons[4], 50, 510);  
  image(buttons[5], 45, 640);  

  //Draw outline around selected button:
  noFill();
  strokeWeight(3);
  stroke(255,0,0);
  if (selButton == 0) rect(50, 20, 100, 100);
  else if (selButton == 1) rect(50, 140, 100, 100);
  else if (selButton == 2) rect(50, 260, 100, 100);
  else if (selButton == 3) rect(50, 380, 100, 100);
  else if (selButton == 4) rect(50, 510, 100, 100);
  else if (selButton == 5) rect(45, 640, 100, 100);
  
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}
