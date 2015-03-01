
PImage backImage;
PImage[] buttons;
int selButton = 0;

void setup() {
  size(600, 600);

  // Using an array to store the button images:
  buttons = new PImage[5];  
  buttons[0] = loadImage("spider.png");
  buttons[1] = loadImage("wspider.png");
  buttons[2] = loadImage("spiderman.png");
  buttons[3] = loadImage("fly.png");
  buttons[4] = loadImage("mosquito.png");
  background(255);
 
  //drawing board
  backImage = loadImage("background.png");
  image(backImage, 200, 0);
 
}

void draw() {
  float d = dist(400, 300, mouseX, mouseY);


  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 200) {
      // ...inside menu area, need to check which button is being pressed:
      if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120) selButton = 0;
      else if (20 < mouseX && mouseX < 120 && 140 < mouseY && mouseY < 240) selButton = 1;
      else if (20 < mouseX && mouseX < 120 && 230 < mouseY && mouseY < 360) selButton = 2;
      else if (20 < mouseX && mouseX < 120 && 420 < mouseY && mouseY < 480) selButton = 3;
      else if (20 < mouseX && mouseX < 120 && 480 < mouseY && mouseY < 600) selButton = 4;
  } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      if (d < 500) {
        image(buttons[selButton], mouseX - 50, mouseY - 50);
      }
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(255);
  rect(0, 0, 100, 600);
  image(buttons[0], 20, 20);
  image(buttons[1], 20, 140);
  image(buttons[2], 20, 230);
  image(buttons[3], 20, 420);
  image(buttons[4], 20, 480);  

  //Draw outline around selected button:
  noFill();
  noStroke();
  if (selButton == 0) rect(20, 20, 100, 100);
  else if (selButton == 1) rect(20, 140, 100, 100);
  else if (selButton == 2) rect(20, 230, 100, 137);
  else if (selButton == 3) rect(20, 420, 60, 60);
  else if (selButton == 3) rect(20, 480, 60, 60);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}


