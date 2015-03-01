
PImage[] buttons;
int selButton = 0;
 
 
void setup() {
  size(1000, 740);
 
  buttons = new PImage[12];
  buttons[0] = loadImage("7.png");
  buttons[1] = loadImage("8.png");
  buttons[2] = loadImage("9.png");
  buttons[3] = loadImage("10.png");
  buttons[4] = loadImage("11.png");
  buttons[5] = loadImage("12.png");
   
  buttons[6] = loadImage("1.png");
  buttons[7] = loadImage("2.png");
  buttons[8] = loadImage("3.png");
  buttons[9] = loadImage("4.png");
  buttons[10] = loadImage("5.png");
  buttons[11] = loadImage("6.png");
  background(255);
 
  smooth();
}
 
 
void draw() {
  if (mousePressed) {
    if (mouseX < 260) {
 
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
       
      else if (20 < mouseX && mouseX < 120 && 620 < mouseY && mouseY < 720) selButton = 10;
      else if (140 < mouseX && mouseX < 240 && 620 < mouseY && mouseY < 720) selButton = 11;
 
       
    } else {
      
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }
 
   
  noStroke();
  fill(150);
  rect(0, 0, 260, height);
  image(buttons[0], 20, 20);
  image(buttons[1], 140, 20);
  image(buttons[2], 20, 140); 
  image(buttons[3], 140, 140);
  image(buttons[4], 20, 260);
  image(buttons[5], 140, 260);
  image(buttons[6], 20, 380);
  image(buttons[7], 140, 380);
  image(buttons[8], 20, 500);
  image(buttons[9], 140, 500);
  image(buttons[10], 20, 620);
  image(buttons[11], 140, 620);
  
 
  noFill();
  stroke(120);
  if (selButton == 0) rect(20, 20, 100, 100);
  else if (selButton == 1) rect(140, 20, 100, 100);
  else if (selButton == 2) rect(20, 140, 100, 100);
  else if (selButton == 3) rect(140, 140, 100, 100);
  else if (selButton == 4) rect (20, 260, 100, 100);
  else if (selButton == 5) rect (140, 260, 100, 100);
  else if (selButton == 6) rect (20, 380, 100, 100);
  else if (selButton == 7) rect(140, 380, 100, 100);
  else if (selButton == 8) rect(20, 500, 100, 100);
  else if (selButton == 9) rect(140, 500, 100, 100);
  else if (selButton == 10) rect(20, 620, 100, 100);
  else if (selButton == 11) rect(140, 620, 100, 100);
}
 
void keyPressed() {
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



