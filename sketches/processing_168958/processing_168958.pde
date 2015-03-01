
PImage backImage;
PImage[] buttons;
int selButton = 0;
/* @pjs preload="back.png"; */

/* @pjs preload="i1.png"; */
/* @pjs preload="i2.png"; */
/* @pjs preload="i3.png"; */
/* @pjs preload="i4.png"; */
/* @pjs preload="i5.png"; */
void setup() {
  size(800, 750);
  
  buttons = new PImage[5];
  buttons[0] = loadImage("i1.png");
  buttons[1] = loadImage("i2.png");
  buttons[2] = loadImage("i3.png");
  buttons[3] = loadImage("i4.png");
  buttons[4] = loadImage("i5.png");
  background(65,229,221);
  
  backImage = loadImage("back.png");
  image(backImage,0,129);

}

void draw(){
  if (mousePressed){
    if(mouseY<129){
      if(0<mouseX && mouseX<129 && 0<mouseY && mouseY < 129) selButton = 0;
      else if (173.3<mouseX && mouseX < 303.3 && 0<mouseY && mouseY<129) selButton=1;
      else if (340<mouseX && mouseX < 470 && 0<mouseY && mouseY<129) selButton=2;
      else if (500<mouseX && mouseX < 630 && 0<mouseY && mouseY<129) selButton=3;
      else if (665<mouseX && mouseX < 796 && 0<mouseY && mouseY<129) selButton=4;
    } else {
      image(buttons[selButton], mouseX-30,mouseY-30);
    }
  }
  
  image(buttons[0], 0, 0);
  image(buttons[1], 173.3, 0);
  image(buttons[2], 340, 0);
  image(buttons[3], 500, 0);
  image(buttons[4], 665, 0);

  noFill();
  stroke(20,201,188);
  if (selButton == 0) rect(0, 0, 129, 129);
  else if (selButton == 1) rect(173.3,0, 129, 129);
  else if (selButton == 2) rect(340, 0, 129, 129);
  else if (selButton == 3) rect(500, 0, 129, 129);
  else if (selButton == 4) rect(665, 0, 129, 129);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}




