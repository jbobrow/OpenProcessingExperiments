
PImage backImage;
PImage[] buttons;
int selButton = 0;

void setup(){
  size(600,600);

 buttons = new PImage[5];  
  buttons[0] = loadImage("moon.png");
  buttons[1] = loadImage("planet2.png");
  buttons[2] = loadImage("planet4.png"); 
  buttons[3] = loadImage("planet3.png"); 
  buttons[4] = loadImage("moon2.png");
  // This is just a white circle to use as an eraser
 backImage = loadImage("background4.jpg");
 
}


void draw() {
 
    image(backImage,0,0);
  float d = dist(300, 300, mouseX, mouseY);


  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 200) {
      // ...inside menu area, need to check which button is being pressed:
      if (35 < mouseX && mouseX < 85 && 53 < mouseY && mouseY < 103) selButton = 0;
      else if (10 < mouseX && mouseX < 60 && 482 < mouseY && mouseY < 532) selButton = 1;
      else if (0< mouseX && mouseX < 100 && 380 < mouseY && mouseY < 430 ) selButton = 2;
      else if (20 < mouseX && mouseX < 70 && 133 < mouseY && mouseY < 185 ) selButton = 3;
      else if (0 < mouseX && mouseX < 50 && 260 < mouseY && mouseY < 310 ) selButton = 4;
    
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      if (d <200) {
        image(buttons[selButton], mouseX - 50, mouseY - 50);
      }
      
    }
  
  }



}



