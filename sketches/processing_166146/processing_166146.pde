
PImage[] buttons;
int selButton = 0;
//HanziPenSC-W3-48
PFont font;


void setup() {
  size(700, 700);

  // Using an array to store the button images:
  buttons = new PImage[6];
  buttons[0] = loadImage("c1.png");
  buttons[1] = loadImage("c2.png");
  buttons[2] = loadImage("c3.png"); 
  buttons[3] = loadImage("c4.png");
  buttons[4] = loadImage("c5.png");
  buttons[5] = loadImage("c6.png");// This is just a white circle to use as an eraser
  background(255);
   font = loadFont("HanziPenSC-W3-48.vlw");
 

  smooth();
}


void draw() {
  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 200) {
      // ...inside menu area, need to check which button is being pressed:


      if (40 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 140)  selButton = 0;
      else if (20 < mouseX && mouseX < 120 && 150 < mouseY && mouseY < 250) selButton = 1;
      else if (20 < mouseX && mouseX < 120 && 260 < mouseY && mouseY < 360)  selButton = 2;
      else if (20 < mouseX && mouseX < 120 && 370 < mouseY && mouseY < 470)  selButton = 3;
      else if (20 < mouseX && mouseX < 120 && 480 < mouseY && mouseY < 580)  selButton = 4;
      else if (20 < mouseX && mouseX < 120 && 590 < mouseY && mouseY < 690)  selButton = 5;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(190,220,240);
  rect(0, 0, 150, height);
  image(buttons[0], 20, 40);
  image(buttons[1], 20, 150);
  image(buttons[2], 20, 260);
  image(buttons[3], 20, 370);
  image(buttons[4], 20, 480);
  image(buttons[5], 20, 590);
  
  textSize(20) ;
  textFont(font,20);
  fill(50);
  text("Cat's House",18,30);


  //Draw outline around selected button:
  noFill();
  stroke(120);
  if (selButton == 0) rect(20, 40, 100, 100);
  else if (selButton == 1) rect(20, 150, 100, 100);
  else if (selButton == 2) rect(20, 260, 100, 100);
  else if (selButton == 3) rect(20, 370, 100, 100);
  else if (selButton == 4) rect(20, 480, 100, 100);
  else if (selButton == 5) rect(20, 590, 100, 100);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(150, 0, width - 150, height);
  img.save("drawing.png");
}



