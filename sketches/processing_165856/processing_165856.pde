
PImage doggod;
PImage[] buttons;
int selButton = 0;


void setup() {
  size(1000, 1000);
  frameRate(10);
  // Using an array to store the button images:
  buttons = new PImage[8];  
  buttons[0] = loadImage("1.png");
  buttons[1] = loadImage("2.png");
  buttons[2] = loadImage("3.png");
  buttons[3]= loadImage("4.png");
  buttons[4]= loadImage("5.png");
  buttons[5]= loadImage("6.png");
  buttons[6]= loadImage("7.png");
  buttons[7]= loadImage("8.png");
doggod = loadImage("dog.jpg");
  background(255);

  //drawing board

  imageMode(CENTER);


  ellipseMode(RADIUS);
}

void draw() {
  image(doggod,870,99);
  if(720 < mouseX && mouseX < 1000 && 0 < mouseY && mouseY < 198 && mousePressed)
  {
    fill(255);
   rect(0,0,width, height); 
  }
  
  float d = dist(400, 300, mouseX, mouseY);


  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 200) {
      // ...inside menu area, need to check which button is being pressed:
      if (40 < mouseX && mouseX < 165 && 30 < mouseY && mouseY < 125) selButton = 0;
      else if (36 < mouseX && mouseX < 161 && 147 < mouseY && mouseY < 251) selButton = 1;
      else if (43 < mouseX && mouseX < 151 && 181 < mouseY && mouseY < 375) selButton = 2;
      else if (38 < mouseX && mouseX < 161 && 399 < mouseY && mouseY < 501) selButton = 3;
      else if (18 < mouseX && mouseX < 186 && 529 < mouseY && mouseY < 635) selButton = 4;
      else if (38 < mouseX && mouseX < 163 && 658 < mouseY && mouseY < 741) selButton = 5;
      else if (37 < mouseX && mouseX < 162 && 779 < mouseY && mouseY < 872) selButton = 6;
      else if (33 < mouseX && mouseX < 167 && 908 < mouseY && mouseY < 991) selButton = 7;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      if (mouseX > 200) {
        image(buttons[selButton], mouseX, mouseY);
      }
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(150);
  rect(0, 0, 200, height);
  scale(0.5, 0.5);
  image(buttons[0], 200, 150);
  image(buttons[1], 200, 400);
  image(buttons[2], 200, 650);
  image(buttons[3], 200, 900);  
  image(buttons[4], 200, 1150);  
  image(buttons[5], 200, 1400);  
  image(buttons[6], 200, 1650);
  image(buttons[7], 200, 1870);  

  scale(1);



  //Draw outline around selected button:
  noFill();
  stroke(255, 0, 0);
  if (selButton == 0) rect(50, 50, 300, 220);
  else if (selButton == 1) rect(50, 290, 300, 220);
  else if (selButton == 2) rect(50, 540, 300, 220);
  else if (selButton == 3) rect(50, 790, 300, 220);
  else if (selButton == 4) rect(20, 1040, 360, 250);
  else if (selButton == 5) rect(50, 1300, 300, 200);
  else if (selButton == 6) rect(50, 1550, 300, 200);
  else if (selButton == 7) rect(50, 1770, 300, 200);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



