

PImage[] buttons;
int selButton = 0;


void setup() {
  size(520, 650);

  // Using an array to store the button images:
  buttons = new PImage[8];
  buttons[0] = loadImage("0.png");
  buttons[1] = loadImage("1.png");
  buttons[2] = loadImage("2.png"); 
  buttons[3] = loadImage("3.png");
  buttons[4] = loadImage("4.png");
  buttons[5] = loadImage("5.png"); 
  buttons[6] = loadImage("6.png");
  buttons[7] = loadImage("7.png"); 
  background(255,0,0);
  noStroke();
  fill(255);
  ellipse(width/2, 250, 400,400);
  
 

  smooth();
}


void draw() {
  float d = dist(width/2, 250, mouseX, mouseY);
  if (mousePressed) { // User is pressing mouse...

    
      // ...inside menu area, need to check which button is being pressed:


      if (30 < mouseX && mouseX < 75 && 530 < mouseY && mouseY < 605)  selButton = 0;
      else if (90 < mouseX && mouseX < 135 && 530 < mouseY && mouseY < 605) selButton = 1;
      else if (150 < mouseX && mouseX < 195 && 530 < mouseY && mouseY < 605)  selButton = 2;
      else if (210 < mouseX && mouseX < 255 && 530 < mouseY && mouseY < 605)  selButton = 3;
      else if (270 < mouseX && mouseX < 315 && 530 < mouseY && mouseY < 605) selButton = 4;
      else if (330 < mouseX && mouseX < 375 && 530 < mouseY && mouseY < 605) selButton = 5;
      else if (390 < mouseX && mouseX < 435 && 530 < mouseY && mouseY < 605)  selButton = 6;
      else if (450 < mouseX && mouseX < 495 && 530 < mouseY && mouseY < 605)  selButton = 7;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
    if (d < 200) {
        image(buttons[selButton], mouseX - 22, mouseY - 37);
      }
   
  

  

  
  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  stroke(255,0,0);
  strokeWeight(72);
  noFill();
  ellipse(width/2,250,455,455);
  fill(0);
  noStroke();
  ellipse(0,680, 700,450);
  ellipse(450,680, 700,450);
  //fill(22,64,10);
  //rect(0, 0, 220, height);
  
  image(buttons[0], 30, 530,45,75);
  image(buttons[1], 90, 530, 45,75);
  image(buttons[2], 150, 530,45,75);
  image(buttons[3], 210, 530,45,75);
  image(buttons[4], 270, 530,45,75);
  image(buttons[5], 330, 530,45,75); 
  image(buttons[6], 390, 530,45,75);
  image(buttons[7], 450, 530,45,75); 
    //Draw outline around selected button:
  noFill();
  strokeWeight(1);
  stroke(255,0,0,100);
  if (selButton == 0) rect(25, 525,55,85);
  else if (selButton == 1) rect(85, 525,55,85);
  else if (selButton == 2) rect(145, 525,55,85);
  else if (selButton == 3) rect(205, 525,55,85);
  else if (selButton == 4) rect(265,525,55,85);
  else if (selButton == 5) rect(325, 525,55,85);
  else if (selButton == 6) rect(385, 525,55,85);
  else if (selButton == 7) rect(445, 525,55,85);
}
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(150, 0, width , 545);
  img.save("drawing.png");
}

