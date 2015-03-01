

PImage[] buttons;
int selButton = 0;


void setup() {
  
  size(800, 600);

  // Using an array to store the button images:
  buttons = new PImage[9];
  buttons[0] = loadImage("1.png");
  buttons[1] = loadImage("2.png");
  buttons[2] = loadImage("3.png"); // This is just a white circle to use as an eraser
  buttons[3] = loadImage("4.png");
  buttons[4] = loadImage("5.png");
  buttons[5] = loadImage("6.png");
  buttons[6] = loadImage("7.png");
  buttons[7] = loadImage("8.png");

  
  background(255);

  smooth();
}


void draw() {
  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 200) {
      // ...inside menu area, need to check which button is being pressed:


      if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120)  selButton = 0;
      else if (20 < mouseX && mouseX < 120 && 140 < mouseY && mouseY < 240) selButton = 1;
      else if (20 < mouseX && mouseX < 120 && 260 < mouseY && mouseY < 360)  selButton = 2;
else if (20 < mouseX && mouseX < 120 && 380 < mouseY && mouseY < 500)  selButton = 3;
else if (100 < mouseX && mouseX <220&& 20 < mouseY && mouseY < 120)  selButton = 4;    
  else if (100 < mouseX && mouseX <220&& 20 < mouseY && mouseY < 240)  selButton = 5;  
  else if (100 < mouseX && mouseX <220&& 20 < mouseY && mouseY < 360)  selButton = 6;
  else if (100 < mouseX && mouseX <220&& 20 < mouseY && mouseY < 500)  selButton = 7;
  
} else {
     
      image(buttons[selButton], mouseX - 20, mouseY - 20);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(255);
  rect(0, 0, 200, height);
  
 // fill(180);
 // rect(200, 0, 600, height);
  
  image(buttons[0], 10, 10);
  image(buttons[1], 30, 150);
  image(buttons[2], 30, 270);  
image(buttons[3], 30, 390);
  image(buttons[4], 110, 30);
  image(buttons[5],  110, 150);  
image(buttons[6], 90,255);
  image(buttons[7], 110, 395);
   





  //Draw outline around selected button:
  noFill();
  stroke(120);
  if (selButton == 0) rect(20, 20, 80, 80);
  else if (selButton == 1) rect(20, 140, 80, 80);
  else if (selButton == 2) rect(20, 260, 80, 80);
else if (selButton == 3) rect(20, 380, 80, 80);
else if (selButton == 4) rect(100, 20, 80, 80);
  else if (selButton == 5) rect(100, 140, 80, 80);
  else if (selButton == 6) rect(100, 260, 80, 80);
  else if (selButton == 7) rect(100, 380, 80, 80);



}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}


