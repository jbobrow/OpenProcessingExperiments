
//PImage backImage;
PImage[] buttons;
int selButton=0;

 
void setup() {
    size(600, 480);
 
  buttons = new PImage[10];
  
  buttons[0] = loadImage("cat.png");
  buttons[1] = loadImage("firework1.png");
  buttons[2] = loadImage("firework2.png");
  buttons[3] = loadImage("firework3.png");
  buttons[4] = loadImage("firework4.png");
  buttons[5] = loadImage("pencil.png");
  buttons[6] = loadImage("eraser.png");
  buttons[7] = loadImage("rainbow.png");
  buttons[8] = loadImage("erase.png");
  buttons[9] = loadImage("draw.png");
 
background(0,52,102);
fill(0);
rect(0,363,600,117);
// backImage = loadImage("bg.jpg");
//  image(backImage, 600, 480);
  smooth();
  
}
 
void draw() {
 
 
  if (mousePressed) {
 
    if (mouseY > 360) {
 
      if (44 < mouseX && mouseX <144 && 393 < mouseY && mouseY < 393+60 ) selButton = 0;
      else if ( 178 < mouseX && mouseX < 178+36 && 405 < mouseY && mouseY < 405+36) selButton = 1;
      else if ( 247 < mouseX && mouseX < 247+36 && 405 < mouseY && mouseY < 405+36) selButton = 2;
      else if ( 317 < mouseX && mouseX < 317+36 && 405 < mouseY && mouseY < 405+36) selButton = 3;
      else if ( 384 < mouseX && mouseX < 384+36 && 405 < mouseY && mouseY < 405+36) selButton = 4;
      else if ( 442 < mouseX && mouseX < 442+56 && 393 < mouseY && mouseY < 393+60) selButton = 9;
      else if ( 526 < mouseX && mouseX < 526+40 && 395 < mouseY && mouseY < 395+60) selButton = 8;
     
    } else {
      image(buttons[selButton], mouseX-20, mouseY-20);
    }
  }
  noStroke();
  image(buttons[0], 44, 393);
  image(buttons[1], 178, 405);
  image(buttons[2], 247, 405);
  image(buttons[3], 317, 405);
  image(buttons[4], 384, 405);
  image(buttons[5], 442, 393);
  image(buttons[6], 526, 395);
  image(buttons[7], 0, 338);
 
 
}
 
void keyPressed() {
  // Press any key to save
  PImage img = get(0, 0, width, height);
  img.save("drawing.png");
}


