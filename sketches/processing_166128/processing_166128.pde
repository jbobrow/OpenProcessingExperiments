
PImage[] buttons;
int selButton = 0;


void setup() {
  size(1000, 1000); 

  buttons = new PImage[7];

  buttons[0] = loadImage("07.png");
  buttons[1] = loadImage("06.png");
  buttons[2] = loadImage("05.png");
  buttons[3] = loadImage("04.png");
  buttons[4] = loadImage("03.png");
  buttons[5] = loadImage("02.png");
  buttons[6] = loadImage("01.png");
  background(255);

  smooth();
}


void draw() {
  if (mousePressed) { 
    if (mouseX < 200) {

      if (70 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 130)  selButton = 0;
      else if (70 < mouseX && mouseX < 120 && 120 < mouseY && mouseY < 230) selButton = 1;
      else if (70 < mouseX && mouseX < 120 && 220 < mouseY && mouseY < 330)  selButton = 2;
      else if (70 < mouseX && mouseX < 120 && 320 < mouseY && mouseY < 430) selButton = 3;
      else if (70 < mouseX && mouseX < 120 && 420 < mouseY && mouseY < 530)  selButton = 4;
      else if (70 < mouseX && mouseX < 120 && 540 < mouseY && mouseY < 650) selButton = 5;
      else if (70 < mouseX && mouseX < 120 && 660 < mouseY && mouseY < 770)  selButton = 6;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  stroke(255,0,0);
  fill(255);
  rect(10, 30, 230, 900);

  image(buttons[0], 20, 20);
  image(buttons[1], 20, 120);
  image(buttons[2], 20, 220);  
  image(buttons[3], 20, 320);
  image(buttons[4], 20, 420);
  image(buttons[5], 20, 540);  
  image(buttons[6], 20, 660);

/*
  noFill();
  stroke(120);
  if (selButton == 0) rect(70, 70, 100, 100);
  else if (selButton == 1) rect(70, 180, 100, 100);
  else if (selButton == 2) rect(70, 300, 100, 100);
*/
}




void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



