

PImage[] buttons;
int selButton = 0;


void setup() {
  size(1000, 650);

  // Using an array to store the button images:
  buttons = new PImage[10];
  buttons[0] = loadImage("dog.png");
  buttons[1] = loadImage("fox.png");
  buttons[2] = loadImage("elephant.png");
  buttons[3] = loadImage("lion.png");
  buttons[4] = loadImage("camel.png");
  buttons[5] = loadImage("flower1.png");
  buttons[6] = loadImage("flower3.png");
  buttons[7] = loadImage("flower5.png");
  buttons[8] = loadImage("flower6.png");
  buttons[9] = loadImage("jungle.jpg");

  // This is just a white circle to use as an eraser
  background(255);

  smooth();
}


void draw() {
  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 360) {
      // ...inside menu area, need to check which button is being pressed:


      if (20 < mouseX && mouseX < 150 && 20 < mouseY && mouseY < 140)  selButton = 0;
      else if (20 < mouseX && mouseX < 170 && 150 < mouseY && mouseY < 235) selButton = 1;
      else if (20 < mouseX && mouseX < 170 && 260 < mouseY && mouseY < 360)  selButton = 2;
      else if (20 < mouseX && mouseX < 170 && 360 < mouseY && mouseY < 470)  selButton = 3;
      else if (20 < mouseX && mouseX < 170 && 480 < mouseY && mouseY < 590)  selButton = 4;
      
      else if (200 < mouseX && mouseX < 335 && 20 < mouseY && mouseY < 165)  selButton = 5;
      else if (200 < mouseX && mouseX < 330 && 180 < mouseY && mouseY < 330)  selButton = 6;
      else if (200 < mouseX && mouseX < 335 && 340 < mouseY && mouseY < 490)  selButton = 7;
      else if (200 < mouseX && mouseX < 330 && 490 < mouseY && mouseY < 640)  selButton = 8;

    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(#647981);
  rect(0, 0, 360, height);
  image(buttons[9], 0, 0);
  image(buttons[0], 20, 20);
  image(buttons[1], 20, 150);
  image(buttons[2], 20, 250);  
  image(buttons[3], 20, 360); 
  image(buttons[4], 20, 480);
  image(buttons[5], 200, 20);
  image(buttons[6], 200, 180);
  image(buttons[7], 200, 340);
  image(buttons[8], 200, 490);

  //Draw outline around selected button:
  noFill();
  stroke(255);
  if (selButton == 0) rect(20, 20, 130, 120);
  else if (selButton == 1) rect(20, 150, 150, 85);
  else if (selButton == 2) rect(20, 250, 150, 100);
  else if (selButton == 3) rect(20, 360, 150, 110);
  else if (selButton == 4) rect(20, 480, 150, 110);
  else if (selButton == 5) rect(200, 20, 135, 145);
  else if (selButton == 6) rect(200, 180, 130, 150);
  else if (selButton == 7) rect(200, 340, 130, 150);
  else if (selButton == 8) rect(200, 490, 145, 155);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}

