
PImage[] buttons;
int selButton = 0;


void setup() {
  noStroke();

  size(800, 800); 
  background(200); 
  rect(0, 0, 600, 800);


  buttons = new PImage[12];
  //eye
  buttons[0] = loadImage("a.png");
  buttons[1] = loadImage("b.png");
  buttons[2] = loadImage("c.png");

  buttons[3] = loadImage("d.png");
  //mouse
  buttons[4] = loadImage("e.png");
  buttons[5] = loadImage("f.png");
  buttons[6] = loadImage("g.png");

  buttons[7] = loadImage("h.png");
  //face

    buttons[8] = loadImage("aa.png");
  buttons[9] = loadImage("bb.png");

  buttons[10] = loadImage("cc.png");

  buttons[11] = loadImage("dd.png");



  smooth();
}


void draw() {
  smooth();
  if (mousePressed) {

    if (mouseX > 590) {

      //eye
      if (620 < mouseX && mouseX < 690 && 50 < mouseY && mouseY < 120)  selButton = 0;
      else if (700 < mouseX && mouseX < 770 && 50 < mouseY && mouseY <120) selButton = 1;
      else if (620 < mouseX && mouseX < 690 && 130 < mouseY && mouseY < 200)  selButton = 2;


      else if (700 < mouseX && mouseX < 770 && 130 < mouseY && mouseY < 200)  selButton = 3;

      //mouse
      else if (620< mouseX && mouseX < 690 && 250 < mouseY && mouseY < 320) selButton = 4;
      else if (700 < mouseX && mouseX < 770 && 250 < mouseY && mouseY < 320)  selButton = 5;
      else if (620 < mouseX && mouseX < 690 && 330 < mouseY && mouseY < 400)  selButton = 6;
      else if (700 < mouseX && mouseX < 770 &&330 < mouseY && mouseY < 400)  selButton = 7;


      //
      else if (620 < mouseX && mouseX < 800 && 500 < mouseY && mouseY <540)  selButton = 8;
      else if (620 < mouseX && mouseX < 800 && 540 < mouseY && mouseY < 600)  selButton = 9;
      else if (620 < mouseX && mouseX <800 && 600 < mouseY && mouseY < 680)  selButton = 10;
      else if (620 < mouseX && mouseX <800 && 680 < mouseY && mouseY < 780)  selButton = 11;
    } else {

      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }

    //noStroke();
    fill(150);
    //eye
    image(buttons[0], 620, 50, 70, 70);
    image(buttons[1], 700, 50, 70, 70);
    image(buttons[2], 620, 130, 70, 70);



    image(buttons[3], 700, 130, 70, 70);

    //mouse
    image(buttons[4], 620, 260, 70, 70);
    image(buttons[5], 700, 250, 70, 70);
    image(buttons[6], 620, 330, 70, 70);

    image(buttons[7], 700, 330, 70, 70);

    //

    image(buttons[8], 665, 500, 70, 70);
    image(buttons[9], 664, 540, 70, 70);

    image(buttons[10], 665, 600, 70, 70);

    image(buttons[11], 665, 680, 70, 70);



    noFill();
    noStroke(); 
    //eye
    if (selButton == 0) rect(620, 50, 70, 70);
    else if (selButton == 1) rect(700, 50, 70, 70);
    else if (selButton == 2) rect(620, 130, 70, 70);

    else if (selButton == 3) rect( 700, 130, 70, 70 );
    //mouse
    else if (selButton == 4) rect(620, 250, 70, 70);
    else if (selButton == 5) rect(700, 250, 70, 70);
    else if (selButton == 6) rect( 620, 330, 70, 70);
    else if (selButton == 7) rect(700, 330, 70, 70);

    //
    else if (selButton == 8) rect(665, 500, 50, 50);
    else if (selButton == 9) rect(  664, 540, 50, 50);
    else if (selButton == 10) rect(665, 600, 70, 70);
    else if (selButton == 11) rect( 665, 680, 70, 70);
  }
}

void keyPressed() {
  // Press any key to save
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
} 



