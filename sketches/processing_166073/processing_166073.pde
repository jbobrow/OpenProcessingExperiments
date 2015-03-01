
PFont font;
PImage[] buttons;
int selButton = 0;

void setup() {
  size(980, 840);
  
  font = loadFont("GiddyupStd-48.vlw");
  textFont(font);
  
  buttons = new PImage[11];
  buttons[0] = loadImage("white-01.png");
  buttons[1] = loadImage("cheese-01.png");
  buttons[2] = loadImage("choco-01.png");
  buttons[3] = loadImage("red-01.png");
  buttons[4] = loadImage("cream-01.png");
  buttons[5] = loadImage("strewberry-01.png");
  buttons[6] = loadImage("orange-01.png");
  buttons[7] = loadImage("chocolate-01.png");
  buttons[8] = loadImage("blue-01.png");
  buttons[9] = loadImage("ras-01.png");
  buttons[10] = loadImage("eraser-01.png");
  
  
  background(255,211,209);

  smooth();
}

void draw() {
    
    fill(227,90,82);
    textSize(50);
    text("Decorate your Cake!",450,80);
  
    if (mousePressed) { 
    if (mouseX < 200) {
     
      if (20 < mouseX && mouseX < 165 && 45 < mouseY && mouseY < 140)selButton = 0;
      else if (20 < mouseX && mouseX < 165 && 165 < mouseY && mouseY < 250) selButton = 1;
      else if (20 < mouseX && mouseX < 165 && 280 < mouseY && mouseY < 380)  selButton = 2;
      else if (20 < mouseX && mouseX < 165 && 380 < mouseY && mouseY < 500)  selButton = 3;
      else if (30 < mouseX && mouseX < 85 && 480 < mouseY && mouseY < 580)  selButton = 4;
      else if (108 < mouseX && mouseX < 160 && 520 < mouseY && mouseY < 560)  selButton = 5;
      else if (30 < mouseX && mouseX < 85 && 600 < mouseY && mouseY < 630)  selButton = 6;
      else if (108 < mouseX && mouseX < 165 && 580 < mouseY && mouseY < 635)  selButton = 7;
      else if (45 < mouseX && mouseX < 75 && 650 < mouseY && mouseY < 690)  selButton = 8;
      else if (118 < mouseX && mouseX < 160 && 650 < mouseY && mouseY < 680)  selButton = 9;
      else if (60 < mouseX && mouseX < 195 && 720 < mouseY && mouseY < 790)  selButton = 10;
      
    } else {
      image(buttons[selButton], mouseX - 40, mouseY - 40);
      
    }
   
  }

  
  fill(255,130,124);
  rect(0, 0, 200, height);
  image(buttons[0], 20, 20);
  image(buttons[1], 20, 140);
  image(buttons[2], 20, 260);
  image(buttons[3], 20, 380);
  image(buttons[4], 30, 520);
  image(buttons[5], 110, 520);  
  image(buttons[6], 30, 580);
  image(buttons[7], 110, 580);
  image(buttons[8], 40, 645);
  image(buttons[9], 120, 645);
  image(buttons[10], 70, 720);
  
  noFill();
  stroke(255);
  if (selButton == 0) rect(20, 45, 165, 110);
  else if (selButton == 1) rect(20, 165, 165, 110);
  else if (selButton == 2) rect(20, 280, 165, 110);
  else if (selButton == 3) rect(20, 402, 165, 110);
  else if (selButton == 4) rect(32, 525, 60, 50);
  else if (selButton == 5) rect(108, 525, 64, 50);
  else if (selButton == 6) rect(31, 590, 55, 48);
  else if (selButton == 7) rect(107, 587, 64, 47);
  else if (selButton == 8) rect(40, 643, 40, 40);
  else if (selButton == 9) rect(118, 643, 43, 43);
  else if (selButton == 10) rect(66, 716, 70, 70);
  
}

void keyPressed() {
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



