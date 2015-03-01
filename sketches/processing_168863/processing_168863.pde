
PImage backImage;
PImage[] buttons;
int selButton = 0;

/* @pjs preload="0.png"; */
/* @pjs preload="1.png"; */
/* @pjs preload="2.png"; */
/* @pjs preload="3.png"; */
/* @pjs preload="4.png"; */
/* @pjs preload="5.png"; */
/* @pjs preload="6.png"; */
/* @pjs preload="7.png"; */
/* @pjs preload="8.png"; */
/* @pjs preload="9.png"; */
/* @pjs preload="10.png"; */
/* @pjs preload="13.png"; */
/* @pjs preload="lego.png"; */
/* @pjs preload="background.png"; */


void setup() {

  backImage = loadImage("background.png");

  buttons = new PImage[14];
  buttons[0] = loadImage("0.png");
  buttons[1] = loadImage("1.png");
  buttons[2] = loadImage("2.png"); 
  buttons[3] = loadImage("3.png");
  buttons[4] = loadImage("4.png");
  buttons[5] = loadImage("5.png");
  buttons[6] = loadImage("6.png");
  buttons[7] = loadImage("7.png");
  buttons[8] = loadImage("8.png");
  buttons[9] = loadImage("9.png");
  buttons[10] = loadImage("10.png");
  buttons[11] = loadImage("13.png");
  buttons[12] = loadImage("lego.png");

  size(1300, 750);  
  background(255);
  //image(buttons[13], 15, 40);

  // This is just a white circle to use as an eraser

  //background(255);

  smooth();
}


void draw() {


  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 400) {

      if (40 < mouseX && mouseX < 70 && 40 < mouseY && mouseY < 100)  selButton = 0;  //APPLE
      else if (40 < mouseX && mouseX < 120 && 110 < mouseY && mouseY < 183) selButton = 1;  //PINK BASKET
      else if (37 < mouseX && mouseX < 120 && 193 < mouseY && mouseY < 240)  selButton = 2;  //BANANA
      else if (34 < mouseX && mouseX < 120 && 250 < mouseY && mouseY < 306)  selButton = 3;  //DISH
      else if (36 < mouseX && mouseX < 120 && 316 < mouseY && mouseY < 368) selButton = 4;  //BREAD
      else if (50 < mouseX && mouseX < 120 && 378 < mouseY && mouseY < 440)  selButton = 5;  //GLASS
      else if (67 < mouseX && mouseX < 280 && 450 < mouseY && mouseY < 730)  selButton = 6;  //HOUSE
      else if (120 < mouseX && mouseX < 246 && 40 < mouseY && mouseY < 150)  selButton = 7;  //BOAT

      else if (145 < mouseX && mouseX < 246 && 210 < mouseY && mouseY < 300)  selButton = 8;  //FROG
      else if (137 < mouseX && mouseX < 246 && 310 < mouseY && mouseY < 440)  selButton = 11;  //TREE

      else if (310 < mouseX && mouseX < 430 && 40 < mouseY && mouseY < 180) selButton = 9;  //GIRL
      else if (310 < mouseX && mouseX < 430 && 220 < mouseY && mouseY < 370)  selButton = 10;  //BOY
    } else {

      image(buttons[selButton], mouseX - 50, mouseY -50 );
    }
  }


  image(backImage, 0, 0);

  noStroke();
  fill(230);
  rect(10, 10, 420, 730, 15);
  
  image(buttons[0], 40, 40); //APPLE
  image(buttons[1], 40, 110); //PINK BASKET
  image(buttons[2], 37, 193); //BANANA
  image(buttons[3], 34, 250); //DISH
  image(buttons[4], 36, 316); //BREAD
  image(buttons[5], 50, 378); //GLASS
  image(buttons[6], 67, 450); //HOUSE
  image(buttons[7], 120, 40); //BOAT
  image(buttons[8], 145, 203); //FROG
  image(buttons[9], 310, 40); //GIRL
  image(buttons[10], 310, 220); //BOY
  image(buttons[11], 137, 304); //TREE
  image(buttons[12], 290, 400); //lego



  noFill();
  stroke(255);
  strokeWeight(5);

  if (selButton == 0) rect(35, 38, 55, 55, 15);
  else if (selButton == 1) rect(35, 110, 55, 55, 15);
  else if (selButton == 2) rect(35, 190, 57, 35, 15);
  else if (selButton == 3) rect(32, 248, 65, 40, 15);
  else if (selButton == 4) rect(33, 312, 61, 40, 15);
  else if (selButton == 5) rect(42, 374, 39, 54, 15);
  else if (selButton == 6) rect(62, 443, 290, 280, 22);
  else if (selButton == 7) rect(114, 37, 152, 140, 22);
  else if (selButton == 8) rect(132, 195, 122, 86, 22);
  else if (selButton == 9) rect(300, 36, 100, 158, 22);
  else if (selButton == 10) rect(300, 214, 100, 153, 22);
  else if (selButton == 11) rect(130, 296, 130, 138, 22);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



