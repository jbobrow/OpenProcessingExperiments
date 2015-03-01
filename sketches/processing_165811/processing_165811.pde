
PImage backImage;
PImage[] buttons;
int selButton = 0;

void setup() {
  size(800, 600);

  // Using an array to store the button images:
  buttons = new PImage[20];  
  buttons[0] = loadImage("01.png");
  buttons[1] = loadImage("02.png");
  buttons[2] = loadImage("03.png");
  buttons[3] = loadImage("04.png");
  buttons[4] = loadImage("05.png");
  buttons[5] = loadImage("06.png");
  buttons[6] = loadImage("07.png");
  buttons[7] = loadImage("08.png");
  buttons[8] = loadImage("09.png");
  buttons[9] = loadImage("10.png");
  buttons[10] = loadImage("01_1.png");
  buttons[11] = loadImage("02_1.png");
  buttons[12] = loadImage("03_1.png");
  buttons[13] = loadImage("04_1.png");
  buttons[14] = loadImage("05_1.png");
  buttons[15] = loadImage("06_1.png");
  buttons[16] = loadImage("07_1.png");
  buttons[17] = loadImage("08_1.png");
  buttons[18] = loadImage("09_1.png");
  buttons[19] = loadImage("10_1.png");

  // This is just a white circle to use as an eraser
  background(255);

  //drawing board
  backImage = loadImage("background.png");
  image(backImage, 0, 0);
}

void draw() {
  float d = dist(400, 400, mouseX, mouseY);


  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 370) {
      // ...inside menu area, need to check which button is being pressed:
      if (30 < mouseX && mouseX < 108 && 150 < mouseY && mouseY < 228) selButton = 0;
      else if (120 < mouseX && mouseX < 198 && 150 < mouseY && mouseY < 228) selButton = 1;
      else if (210 < mouseX && mouseX < 288 && 150 < mouseY && mouseY < 228) selButton = 2;
      else if (30 < mouseX && mouseX < 108 && 250 < mouseY && mouseY < 328) selButton = 3;
      else if (120 < mouseX && mouseX < 198 && 250 < mouseY && mouseY < 328) selButton = 4;
      else if (210 < mouseX && mouseX < 288 && 250 < mouseY && mouseY < 328) selButton = 5;
      else if (30 < mouseX && mouseX < 108 && 350 < mouseY && mouseY < 428) selButton = 6;
      else if (120 < mouseX && mouseX < 198 && 350 < mouseY && mouseY < 428) selButton = 7;
      else if (210 < mouseX && mouseX < 288 && 350 < mouseY && mouseY < 428) selButton = 8;
      else if (210 < mouseX && mouseX < 288 && 450 < mouseY && mouseY < 528) selButton = 9;
    } 
    else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      if (d < 500) {
        image(buttons[selButton], mouseX - 50,mouseY - 50);
     }
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  

  image(buttons[10], 30, 150);
  image(buttons[11], 120, 150);
  image(buttons[12], 210, 150);  
  image(buttons[13], 30, 250);  
  image(buttons[14], 120, 250);  
  image(buttons[15], 210, 250);  
  image(buttons[16], 30, 350);  
  image(buttons[17], 120, 350);  
  image(buttons[18], 210, 350);  
  image(buttons[19], 210, 450);  



  //Draw outline around selected button:
  noFill();
  stroke(120);
  if (selButton == 0) rect(30, 150, 78, 78);
  else if (selButton == 1) rect(120, 150, 78, 78);
  else if (selButton == 2) rect(210, 150, 78, 78);
  else if (selButton == 3) rect(30, 250, 78, 78);
  else if (selButton == 4) rect(120, 250, 78, 78);
  else if (selButton == 5) rect(210, 250, 78, 78);
  else if (selButton == 6) rect(30, 350, 78, 78);
  else if (selButton == 7) rect(120, 350, 78, 78);
  else if (selButton == 8) rect(210, 350,  78, 78);
  else if (selButton == 9) rect(210, 450, 78, 78);
  
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(320, 0, width -320, height);
  img.save("drawing.png");
}



