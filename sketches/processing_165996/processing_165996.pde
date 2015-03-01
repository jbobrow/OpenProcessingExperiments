

PImage[] buttons;
int selButton = 0;


void setup() {
  size(800, 600);

  // Using an array to store the button images:
  buttons = new PImage[10];
  buttons[0] = loadImage("01.png");
  buttons[1] = loadImage("02.png");
  buttons[2] = loadImage("03.png");
  buttons[3] = loadImage("04.png");
  buttons[4] = loadImage("09.png");
  buttons[5] = loadImage("08.png");
  

  stroke(255, 30, 30);
  strokeWeight(5);
  background(255);

  stroke(#09DE75);
  fill(255);
  rect(270, 40, 510, 520);

  smooth();
}


void draw() {
  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 250) {
      // ...inside menu area, need to check which button is being pressed:


      if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 70)  selButton = 0;
      else if (90 < mouseX && mouseX < 190 && 70 < mouseY && mouseY < 170) selButton = 1;
      else if (50 < mouseX && mouseX < 120 && 170 < mouseY && mouseY < 240)  selButton = 2;
      else if (60 < mouseX && mouseX < 300 && 250 < mouseY && mouseY < 290)  selButton = 3;
      else if (120 < mouseX && mouseX < 180 && 300 < mouseY && mouseY < 400)  selButton = 4;
      else if (50 < mouseX && mouseX < 200 && 400 < mouseY && mouseY < 500)  selButton = 5;
      
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  stroke(#09DE75);
  fill(255, 237, 209);
  rect(30, 20, 200, 500 );
  image(buttons[0], 35, 30);
  image(buttons[1], 90, 70);
  image(buttons[2], 50, 170);  
  image(buttons[3], 70, 250);
  image(buttons[4], 120, 300);
  image(buttons[5], 50, 400);


  //Draw outline around selected button:
  noFill();
  stroke(255, 30, 30);
  strokeWeight(3);

  if (selButton == 0) rect(40, 25, 90, 50);
  else if (selButton == 1) rect(90, 70, 70, 90);
  else if (selButton == 2) rect(60, 180, 40, 40);
  else if (selButton == 3) rect(100, 260, 120, 40);
  else if (selButton == 4) rect(115, 310, 70, 70);
  else if (selButton == 5) rect(50, 420, 170, 60);

  
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



