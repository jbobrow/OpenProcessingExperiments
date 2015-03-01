
PImage[] buttons;
int selButton = 0;


void setup() {

  buttons = new PImage[11];
  buttons[0] = loadImage("1.png");
  buttons[1] = loadImage("2.png");
  buttons[2] = loadImage("3.png");
  buttons[3] = loadImage("4.png");
  buttons[4] = loadImage("5.png");
  buttons[5] = loadImage("6.png");

  buttons[6] = loadImage("7.png");
  buttons[7] = loadImage("8.png");
  buttons[8] = loadImage("9.png");
  buttons[9] = loadImage("10.png");
  buttons[10] = loadImage("11.png");

  size(1100, 640);
  stroke(0, 0, 0);
  image(buttons[10], 280,0, width/1.3, height);
}


void draw() {

  if (mousePressed) {
    if (mouseX < 280) {

      if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120)  selButton = 0;
      else if (140 < mouseX && mouseX < 240 && 20 < mouseY && mouseY < 120) selButton = 1;


      else if (20 < mouseX &&  mouseX < 120 && 140 < mouseY && mouseY < 240)  selButton = 2;
      else if (140 < mouseX && mouseX < 240 && 140 < mouseY && mouseY < 240) selButton = 3;


      else if (20 < mouseX && mouseX < 120 && 260 < mouseY && mouseY < 360) selButton = 4;
      else if (140 < mouseX && mouseX < 240 && 260 < mouseY && mouseY < 360) selButton = 5;


      else if (20 < mouseX && mouseX < 120 && 380 < mouseY && mouseY < 480) selButton = 6;
      else if (140 < mouseX && mouseX < 240 && 380 < mouseY && mouseY < 480) selButton = 7;

      else if (20 < mouseX && mouseX < 120 && 500 < mouseY && mouseY < 600) selButton = 8;
      else if (140 < mouseX && mouseX < 240 && 500 < mouseY && mouseY < 600) selButton = 9;
    } 
    else {

      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }


  noStroke();
  fill(255);
  rect(0, 0, 280, height);
  image(buttons[0], 20, 30);
  image(buttons[1], 150, 30);

  image(buttons[2], 20, 150); 
  image(buttons[3], 150, 150);

  image(buttons[4], 20, 260);
  image(buttons[5], 150, 260);

  image(buttons[6], 20, 380);
  image(buttons[7], 150, 380);

  image(buttons[8], 20, 500);
  image(buttons[9], 150, 500);



  noFill();
  stroke(120);
  if (selButton == 0) rect(30, 30, 100, 100);
  else if (selButton == 1) rect(160, 30, 100, 100);

  else if (selButton == 2) rect(30, 140, 100, 100);
  else if (selButton == 3) rect(160, 140, 100, 100);

  else if (selButton == 4) rect (30, 260, 100, 100);
  else if (selButton == 5) rect (160, 260, 100, 100);

  else if (selButton == 6) rect (30, 380, 100, 100);
  else if (selButton == 7) rect(160, 380, 100, 100);

  else if (selButton == 8) rect(30, 500, 100, 100);
  else if (selButton == 9) rect(160, 500, 100, 100);
}

void keyPressed() {
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



