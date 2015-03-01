

PImage[] buttons;
int selButton = 0;


void setup() {
  size(800, 400);

  buttons = new PImage[8];
  buttons[0] = loadImage("doong_01.png");
  buttons[1] = loadImage("doong_02.png");
  buttons[2] = loadImage("doong_03.png");
  buttons[3] = loadImage("doong_04.png");
  buttons[4] = loadImage("pen_01.png");
  buttons[5] = loadImage("pen_02.png");
  buttons[6] = loadImage("pen_03.png");
  buttons[7] = loadImage("pen_04.png");
  background(255);

  smooth();


}











void draw() {
  if (mousePressed) {

    if (mouseX < 290) {

      if (5 < mouseX && mouseX < 150 && 5 < mouseY && mouseY < 150)  selButton = 0;
      else if (160 < mouseX && mouseX < 300 && 5 < mouseY && mouseY < 150) selButton = 1;
      else if (5 < mouseX && mouseX < 150 && 160 < mouseY && mouseY < 320) selButton = 2;
      else if (160 < mouseX && mouseX < 300 && 160 < mouseY && mouseY < 320) selButton = 3;
      
      else if (35 < mouseX && mouseX < 70 && 320 < mouseY && mouseY < 360) selButton = 4;
      else if (95 < mouseX && mouseX < 130 && 320 < mouseY && mouseY < 360) selButton = 5;
      else if (155 < mouseX && mouseX < 200 && 320 < mouseY && mouseY < 360) selButton = 6;
      else if (235 < mouseX && mouseX < 260 && 320 < mouseY && mouseY < 360) selButton = 7;
    } else {
      image(buttons[selButton], mouseX - 30, mouseY - 30);
    }
  }

  //noStroke();
  strokeWeight(10);
  fill(255,212,212);
  rect(0, 0, 295, height,15);
  image(buttons[0], 0, 5);
  image(buttons[1], 130, 5);
  image(buttons[2], 5, 150); 
  image(buttons[3], 140, 150);
  image(buttons[4], 35, 320);
  image(buttons[5], 95, 320);
  image(buttons[6], 155, 320); 
  image(buttons[7], 215, 320); 
  
  
  
  

  noFill();
  stroke(255);
  strokeWeight(7);
  if (selButton == 0) rect(15, 15, 130, 130, 7);
  else if (selButton == 1) rect(150, 15, 130, 130, 7);
  else if (selButton == 2) rect(15, 160, 130, 130, 7);
  else if (selButton == 3) rect(150, 160, 130, 130, 7);
  else if (selButton == 4) rect(35, 320, 40, 40, 5);
  else if (selButton == 5) rect(95, 320, 40, 40, 5);
  else if (selButton == 6) rect(155, 320, 40, 40, 5);
  else if (selButton == 7) rect(215, 320, 40, 40, 5);
}




