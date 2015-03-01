
PImage backImage;
PImage[] buttons;
int selButton = 0;

void setup() {
  size(600, 600);

  buttons = new PImage[7];  
  buttons[1] = loadImage("1.png");
  buttons[2] = loadImage("2.png");
  buttons[3] = loadImage("3.png");
  buttons[4] = loadImage("4.png");
  buttons[5] = loadImage("5.png");
  buttons[6] = loadImage("6.png");
  background(255);
  smooth();
  
backImage = loadImage("background.png");
image(backImage,110,70);
ellipseMode(RADIUS);
}
void draw() {
   
float d = dist(400, 300, mouseX, mouseY);


  if (mousePressed) { // User is pressing mouse...
 
    if (mouseX < 130) {
      // ...inside menu area, need to check which button is being pressed:
 
 
      if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120)  selButton = 1;
      else if (20 < mouseX && mouseX < 120 && 120 < mouseY && mouseY < 190) selButton = 2;
      else if (30 < mouseX && mouseX < 120 && 190 < mouseY && mouseY < 260)  selButton = 3;
      else if (30 < mouseX && mouseX < 120 && 260 < mouseY && mouseY < 330)  selButton = 4;
      else if (30 < mouseX && mouseX < 120 && 330 < mouseY && mouseY < 400) selButton = 5;
      else if (40 < mouseX && mouseX < 120 && 400 < mouseY && mouseY < 470)  selButton = 6;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }
 
  // Draw menu at the end so overwrites drawing going outside the border of the drawing area 
  noStroke();
  fill(230);
  rect(0, 0, 80, height);
  image(buttons[1], 20, 30);
  image(buttons[2], 30, 120);
  image(buttons[3], 30, 190);
  image(buttons[4], 30, 260); 
  image(buttons[5], 30, 330);
  image(buttons[6], 40, 400); 
 
}
 
void keyPressed() {
  // Press any key to save
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}


