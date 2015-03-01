
PFont font;
PImage[] buttons;
int selButton = 0;

/* @pjs preload="6.png"; */


/* @pjs preload="0.png"; */
/* @pjs preload="1.png"; */
/* @pjs preload="2.png"; */
/* @pjs preload="3.png"; */
/* @pjs preload="4.png"; */
/* @pjs preload="5.png"; */


void setup() {
  
  size(800, 600);
  
  buttons = new PImage[7];
  buttons[0] = loadImage("0.png");
  buttons[1] = loadImage("1.png");
  buttons[2] = loadImage("2.png");
  buttons[3] = loadImage("3.png");
  buttons[4] = loadImage("4.png");
  buttons[5] = loadImage("5.png");
  
  backImage = loadImage("6.png");
  image(backImage, 0, 0);
  


}
  
void draw() {
  
  
  fill(0);
  textSize(17);
  text("ENJOY", 130, 90);

 
  if (mousePressed) {
    if (mouseX < 250) {
      
      if (30 < mouseX && mouseX < 160 && 60 < mouseY && mouseY < 130)selButton = 0;
      else if (60 < mouseX && mouseX < 160 && 130 < mouseY && mouseY < 230) selButton = 1;
      else if (60 < mouseX && mouseX < 160 && 230 < mouseY && mouseY < 330)  selButton = 2;
      else if (60 < mouseX && mouseX < 160 && 330 < mouseY && mouseY < 430)  selButton = 3;
      else if (60 < mouseX && mouseX < 160 && 430 < mouseY && mouseY < 530)  selButton = 4;
      else if (60 < mouseX && mouseX < 160 && 530 < mouseY && mouseY < 630)  selButton = 5;
      
    } else {
      image(buttons[selButton], mouseX - 50, mouseY - 50);
       
    }
    
  }
 
   



  image(buttons[0], 60, 30);
  image(buttons[1], 60, 130);
  image(buttons[2], 60, 230);
  image(buttons[3], 60, 330);
  image(buttons[4], 60, 430);
  image(buttons[5], 60, 530); 
  

  
  
  noFill();
  noStroke();
  if (selButton == 0) rect(60, 30, 100, 100);
  else if (selButton == 1) rect(60, 130, 100, 100);
  else if (selButton == 2) rect(60, 230, 100, 100);
  else if (selButton == 3) rect(60, 330, 100, 100);
  else if (selButton == 4) rect(60, 430, 100, 100);
  else if (selButton == 5) rect(60, 530, 100, 100);


   
}
 
void keyPressed() {
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}


