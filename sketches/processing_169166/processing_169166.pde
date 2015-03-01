
 /* @pjs preload="kiwi.png"; */
 /* @pjs preload="rasberry.png"; */
 /* @pjs preload="cherry.png"; */
 /* @pjs preload="rose.png"; */
 /* @pjs preload="pineapple.png"; */
 /* @pjs preload="more_icecream.png"; */
 /* @pjs preload="white.png"; */




PImage[] buttons;
int selButton = 0;
PFont font;



void setup() {
  size(600, 700);
  
  // Using an array to store the button images:
  buttons = new PImage[7];
  buttons[0] = loadImage("kiwi.png");
  buttons[1] = loadImage("rasberry.png");
  buttons[2] = loadImage("cherry.png");
  buttons[3] = loadImage("rose.png");
  buttons[4] = loadImage("pineapple.png");
  buttons[5] = loadImage("more_icecream.png");
  buttons[6] = loadImage("white.png");
  
  background(#eee7eb);
  
  image(buttons[6], 30, 150);
  
  
  
  font=loadFont("STYuanti-SC-Bold-48.vlw");
  textFont(font, 40);
  fill(255);
  text("topping&topping", 150,640);
  
    font=loadFont("VeneerExtras-Italic-48.vlw");
  textFont(font, 40);
  fill(255);
  text("WWWWWWWWWWWW", 150,620);
  
  image(buttons[6], 30, 150);
  
  
  

  smooth();
}


void draw() {
  
  if (mousePressed) { // User is pressing mouse...

    if (mouseY < 200) {
      // ...inside menu area, need to check which button is being pressed:


      if (10 < mouseX && mouseX < 80 && 30 < mouseY && mouseY < 130)  selButton = 0;
      else if (90< mouseX && mouseX < 170 &&30 < mouseY && mouseY < 130) selButton = 1;
      else if (170 < mouseX && mouseX < 240 && 30 < mouseY && mouseY < 130)  selButton = 2;
      else if (250 < mouseX && mouseX < 330 && 30 < mouseY && mouseY < 130)  selButton = 3;
      else if (340 < mouseX && mouseX < 440 && 30 < mouseY && mouseY < 130)  selButton = 4;
      else if (460 < mouseX && mouseX < 560 && 30 < mouseY && mouseY < 130)  selButton = 5;
    } else { //<>//
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 40, mouseY - 40);
    }
  }
image(buttons[6], 30, 150);
  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(#eee7eb);
  rect(0, 0, width , 150);
  image(buttons[0], 10, 30);
  image(buttons[1], 90, 30);
  image(buttons[2], 170, 30);
  image(buttons[3], 250, 30);
  image(buttons[4], 340, 30);
  image(buttons[5], 460, 30);
  
  
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}


