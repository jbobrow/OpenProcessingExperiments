

PImage[] buttons;
int selButton = 0;
int xPos = 600;
int yPos = 20;
int S = 25;
int sw;
int r, g, b;


void setup() {
  size(1100, 550);

  // Using an array to store the button images:
  buttons = new PImage[15];
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
  buttons[10] = loadImage("12.png");
  buttons[11] = loadImage("10.png");
  buttons[12] = loadImage("11.png");

  background(228, 245, 249);
  noStroke();
  fill(146, 198, 214);
  rect(200, 0, 1100, 380);
  smooth();
}


void draw() {
  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 200) {
      // ...inside menu area, need to check which button is being pressed:


      if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120)  selButton = 0;
      else if (120 < mouseX && mouseX < 200 && 20 < mouseY && mouseY < 120)  selButton = 1;
      else if (20 < mouseX && mouseX < 120 && 140 < mouseY && mouseY < 240) selButton = 2;
      else if (120 < mouseX && mouseX < 200 && 140 < mouseY && mouseY < 240) selButton = 3;
      else if (20 < mouseX && mouseX < 120 && 300 < mouseY && mouseY < 350)  selButton = 4;
      else if (120 < mouseX && mouseX < 200 && 300 < mouseY && mouseY < 350)  selButton = 5;
      else if (20 < mouseX && mouseX < 120 && 370 < mouseY && mouseY < 450)  selButton = 6;
      else if (120 < mouseX && mouseX < 200 && 370 < mouseY && mouseY < 450)  selButton = 7;
      else if (20 < mouseX && mouseX < 120 && 450 < mouseY && mouseY < 530)  selButton = 8;
      else if (120 < mouseX && mouseX < 200 && 450 < mouseY && mouseY < 530)  selButton = 9;
      else if (20 < mouseX && mouseX < 70 && 250 < mouseY && mouseY < 300)  selButton = 10;
      else if (60 < mouseX && mouseX < 130 && 250 < mouseY && mouseY < 300)  selButton = 11;
      else if (130 < mouseX && mouseX < 200 && 250 < mouseY && mouseY < 300)  selButton = 12;
      
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(0,45,90);
  rect(0, 0, 200, height);
  image(buttons[0], 20, 20, 70, 100);
  image(buttons[1], 110, 40, 65, 80);
  image(buttons[2], 20, 160, 80, 50);  
  image(buttons[3], 110, 160, 80, 55); 
  image(buttons[4], 20, 300, 80, 55); 
  image(buttons[5], 110, 310, 70, 40);
  image(buttons[6], 20, 370, 70, 75);
  image(buttons[7], 110, 370, 70, 75);
  image(buttons[8], 30, 450, 45, 75);
  image(buttons[9], 120, 450, 45, 75);
  image(buttons[10], 20, 230);
  image(buttons[11], 75, 230);
  image(buttons[12], 130, 230);

  //Draw outline around selected button:
  noFill();
  stroke(146, 198, 214);
  if (selButton == 0) rect(20, 20, 70, 100);
  else if (selButton == 1) rect(110, 20, 70, 100);
  else if (selButton == 2) rect(20, 140, 80, 80);
  else if (selButton == 3) rect(110, 140, 80, 80);
  else if (selButton == 4) rect(20, 300, 80, 60);
  else if (selButton == 5) rect(105, 300, 80, 60);
  else if (selButton == 6) rect(20, 365, 80, 80);
  else if (selButton == 7) rect(105, 365, 80, 80);
  else if (selButton == 8) rect(20, 450, 70, 80);
  else if (selButton == 9) rect(105, 450, 70, 80);
  else if (selButton == 10) rect(20, 230, 50, 50);
  else if (selButton == 11) rect(75, 230, 50, 50);
  else if (selButton == 12) rect(130, 230, 50, 50);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



