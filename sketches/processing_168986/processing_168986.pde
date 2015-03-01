
PImage backImage;
PImage[] buttons;
int selButton = 0;

//@pjs preload="w.png";

//@pjs preload="0.png";
//@pjs preload="1.png";
//@pjs preload="2.png";
//@pjs preload="3.png";
//@pjs preload="4.png";
//@pjs preload="5.png";
//@pjs preload="6.png";
//@pjs preload="7.png";
//@pjs preload="8.png";
//@pjs preload="9.png";


void setup() {
  size(1130, 700);

  buttons = new PImage[13];  
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

  background(255, 234, 239);

  backImage = loadImage("w.jpg");
  image(backImage, 170, 0);
}

void draw() {

  if (mousePressed) { 

    if (mouseY > 600) {
      if (0 < mouseX && mouseX < 113 && 600 < mouseY && mouseY < 700) selButton = 0;
      else if (0 < mouseX && mouseX < 226 && 600 < mouseY && mouseY < 700) selButton = 1;
      else if (0 < mouseX && mouseX < 339 && 600 < mouseY && mouseY < 700) selButton = 2;
      else if (0 < mouseX && mouseX < 452 && 600 < mouseY && mouseY < 700) selButton = 3;
      else if (0 < mouseX && mouseX < 565 && 600 < mouseY && mouseY < 700) selButton = 4;
      else if (0 < mouseX && mouseX < 678 && 600 < mouseY && mouseY < 700) selButton = 5;
      else if (0 < mouseX && mouseX < 791 && 600 < mouseY && mouseY < 700) selButton = 6;
      else if (0 < mouseX && mouseX < 904 && 600 < mouseY && mouseY < 700) selButton = 7;
      else if (0 < mouseX && mouseX < 1017 && 600 < mouseY && mouseY < 700) selButton = 8;
      else if (0 < mouseX && mouseX < 1130 && 600 < mouseY && mouseY < 700) selButton = 9;
    } else {
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  fill(255, 204, 204);
  strokeWeight(0);
  rect(0, 580, width, 113);
  image(buttons[0], 0, 580);
  image(buttons[1], 113, 580);
  image(buttons[2], 226, 580);
  image(buttons[3], 339, 580);
  image(buttons[4], 452, 580);
  image(buttons[5], 565, 580);
  image(buttons[6], 678, 580);
  image(buttons[7], 791, 580);
  image(buttons[8], 904, 580);
  image(buttons[9], 1017, 580);


  noFill();
  strokeWeight(3);
  stroke(120);
  if (selButton == 0) rect(0, 580, 113, 113);
  else if (selButton == 1) rect(113,580, 113, 113);
  else if (selButton == 2) rect(226, 580, 113, 113);
  else if (selButton == 3) rect(339, 580, 113, 113);
  else if (selButton == 4) rect(452, 580, 113, 113);
  else if (selButton == 5) rect(565, 580, 113, 113);
  else if (selButton == 6) rect(678, 580, 113, 113);
  else if (selButton == 7) rect(791, 580, 113, 113);
  else if (selButton == 8) rect(904, 580, 113, 113);
  else if (selButton == 9) rect(1017, 580, 113, 113);

}

void keyPressed() {
  // Press any key to save 
  PImage img = get(0, 0, width, height);
  img.save("drawing.png");
}


