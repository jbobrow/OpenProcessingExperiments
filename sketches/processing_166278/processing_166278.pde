
PImage backImage;
PImage[] buttons;
int selButton = 0;

void setup() {
  size(600, 600);

  // Using an array to store the button images:
  buttons = new PImage[10];  
  buttons[0] = loadImage("blue.png");
  buttons[1] = loadImage("blue1.png");
  buttons[2] = loadImage("blue2.png"); 
  buttons[3] = loadImage("blue3.png"); 
  buttons[4] = loadImage("blue4.png"); 
 
   buttons[5] = loadImage("red.png");
  buttons[6] = loadImage("red1.png");
  buttons[7] = loadImage("red2.png"); 
  buttons[8] = loadImage("red3.png"); 
  buttons[9] = loadImage("red4.png"); 
  
  
  background(255);

  //drawing board
  backImage = loadImage("background.png");
  image(backImage, 100, 100);

  ellipseMode(RADIUS);
}

void draw() {
  float d = dist(300, 300, mouseX, mouseY);


  if (mousePressed) { // User is pressing mouse...

    if ( mouseX < 150 ) {
      // ...inside menu area, need to check which button is being pressed:
      if (0 < mouseX && mouseX < 70 && 0 < mouseY && mouseY < 115) selButton = 0;
      else if (0 < mouseX && mouseX < 70 && 170 < mouseY && mouseY < 220) selButton = 1;
      else if (0 < mouseX && mouseX < 100 && 260 < mouseY && mouseY < 340) selButton = 2;
      else if (0 < mouseX && mouseX < 100 && 390 < mouseY && mouseY < 450) selButton = 3;
      else if (0 < mouseX && mouseX < 70 && 480 < mouseY && mouseY < 600) selButton = 4; 
      
      else if (530 < mouseX && mouseX < 600 && 0 < mouseY && mouseY < 115) selButton = 5;      
     else if (530 < mouseX && mouseX < 600 && 170 < mouseY && mouseY < 220) selButton = 6;
       else if (500 < mouseX && mouseX < 600 && 260 < mouseY && mouseY < 340) selButton = 7;
      else if (500 < mouseX && mouseX < 600 && 390 < mouseY && mouseY < 450) selButton = 8;
     else if (530 < mouseX && mouseX < 600 && 480 < mouseY && mouseY < 600) selButton = 9; 
      
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      if (d < 200) {
        image(buttons[selButton], mouseX - 50, mouseY - 50);
      }
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
 
  image(buttons[0], 0, 0);
  image(buttons[1], 0, 170);
  image(buttons[2], 0, 260);  
  image(buttons[3], 0, 390); 
  image(buttons[4], 0, 480); 
  image(buttons[5], 530, 0); 
  image(buttons[6], 530, 170);
  image(buttons[7], 500, 260);  
  image(buttons[8], 500, 390); 
  image(buttons[9], 530, 480);   


  //Draw outline around selected button:
 /* noFill();
  stroke(120);
  if (selButton == 0) rect(20, 20, 100, 100);
  else if (selButton == 1) rect(20, 140, 100, 100);
  else if (selButton == 2) rect(20, 260, 100, 100);*/
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



