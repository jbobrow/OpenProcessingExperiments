

PImage[] buttons;
int selButton = 0;
int xPos = 600;
int yPos = 20;
int S = 25;
int sw;
int r, g, b;


void setup() {
  size(1020, 700);

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
  rect(0, 0, 1100, 580);
  smooth();
}


void draw() {
  if (mousePressed) { // User is pressing mouse...

    if (mouseY <150 ) {
      // ...inside menu area, need to check which button is being pressed:


      if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120)  selButton = 0;
      else if (120 < mouseX && mouseX < 200 && 20 < mouseY && mouseY < 120)  selButton = 1;
      else if (200 < mouseX && mouseX < 300 && 20 < mouseY && mouseY < 120) selButton = 2;
      else if (300 < mouseX && mouseX < 400 && 20 < mouseY && mouseY < 120) selButton = 3;
      else if (400 < mouseX && mouseX < 500 && 20 < mouseY && mouseY < 120)  selButton = 4;
      else if (500 < mouseX && mouseX < 600 && 20 < mouseY && mouseY < 120)  selButton = 5;
      else if (600 < mouseX && mouseX < 700 && 20 < mouseY && mouseY < 120)  selButton = 6;
      else if (700 < mouseX && mouseX < 800 && 20 < mouseY && mouseY < 120)  selButton = 7;
      else if (800 < mouseX && mouseX < 880 && 20 < mouseY && mouseY < 120)  selButton = 8;
      else if (880 < mouseX && mouseX < 950 && 20 < mouseY && mouseY < 120)  selButton = 9;
      else if (950 < mouseX && mouseX < 1000 && 10 < mouseY && mouseY < 40)  selButton = 10;
      else if (950 < mouseX && mouseX < 1000 && 30 < mouseY && mouseY < 80)  selButton = 11;
      else if (950 < mouseX && mouseX < 1000 && 60 < mouseY && mouseY < 120)  selButton = 12;
      
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(0,45,90);
  rect(0, 0, 1100,130);
  image(buttons[0], 20, 20, 60, 90);
  image(buttons[1], 110, 40, 55, 70);
  image(buttons[2], 200, 60, 70, 40);  
  image(buttons[3], 300, 60, 70, 45); 
  image(buttons[4], 400, 50, 80, 55); 
  image(buttons[5], 500, 60, 70, 40);
  image(buttons[6], 600, 40, 70, 75);
  image(buttons[7], 700, 40, 70, 75);
  image(buttons[8], 800, 40, 45, 75);
  image(buttons[9], 880, 40, 45, 75);
  image(buttons[10],950, 10,30,30);
  image(buttons[11], 950, 50,30,30);
  image(buttons[12], 950, 90,30,30);

  //Draw outline around selected button:
  fill(255,255,255, 60);
  noStroke();
  if (selButton == 0) rect(20, 20, 60, 90);
  else if (selButton == 1) rect(110, 35, 60, 80);
  else if (selButton == 2) rect(200, 50, 70, 60);
  else if (selButton == 3) rect(300, 50, 70, 60);
  else if (selButton == 4) rect(400, 50, 80, 60);
  else if (selButton == 5) rect(500, 50, 70, 60);
  else if (selButton == 6) rect(600, 30, 75, 90);
  else if (selButton == 7) rect(700, 30, 75, 90);
  else if (selButton == 8) rect(795, 30, 55, 90);
  else if (selButton == 9) rect(875, 30, 55, 90);
  else if (selButton == 10) rect(948, 7, 35, 35);
  else if (selButton == 11) rect(948, 47, 35, 35);
  else if (selButton == 12) rect(948, 87, 35, 35);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



