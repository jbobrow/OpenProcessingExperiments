

PImage[] buttons;
int selButton =0;
PFont font;
PFont fontt;

void setup() {
  font = loadFont("GillSans-48.vlw"); 
  fontt = loadFont("GillSansMTPro-Book-15.vlw"); 
  size(640, 640);
  background(0);
  rect(30, 90, 580, 450);
  fill(255);


  buttons = new PImage[11];
  buttons[0] = loadImage("00.png");
  buttons[1] = loadImage("01.png");
  buttons[2] = loadImage("02.png");
  buttons[3] = loadImage("03.png");
  buttons[4] = loadImage("04.png");
  buttons[5] = loadImage("05.png");
  buttons[6] = loadImage("06.png");
  buttons[7] = loadImage("07.png");
  buttons[8] = loadImage("08.png");
  buttons[9] = loadImage("09.png");


  smooth();
}

void draw() {
  noStroke();


  if (mousePressed) {

    if (mouseY > 580) {

      if (30 < mouseX && mouseX <58 && 570 < mouseY && mouseY < 604 ) selButton = 0;
      else if ( 90 < mouseX && mouseX < 126 && 570 < mouseY && mouseY < 604) selButton = 1;
      else if ( 150 < mouseX && mouseX < 186 && 570 < mouseY && mouseY < 604) selButton = 2;
      else if ( 210 < mouseX && mouseX < 238 && 570 < mouseY && mouseY < 604) selButton = 3;
      else if ( 270 < mouseX && mouseX < 306 && 570 < mouseY && mouseY < 604) selButton = 4;
      else if ( 330 < mouseX && mouseX < 366 && 570 < mouseY && mouseY < 604) selButton = 5;
      else if ( 390 < mouseX && mouseX < 426 && 570 < mouseY && mouseY < 604) selButton = 6;
      else if ( 450 < mouseX && mouseX < 486 && 570 < mouseY && mouseY < 604) selButton = 7;
      else if ( 510 < mouseX && mouseX < 537 && 570 < mouseY && mouseY < 604) selButton = 8;
      else if ( 570 < mouseX && mouseX < 600 && 570 < mouseY && mouseY < 604) selButton = 9;
    } else {
      image(buttons[selButton], mouseX-0, mouseY-0);
    }
  }
  noStroke();
  image(buttons[0], 30, 570);
  image(buttons[1], 90, 570);
  image(buttons[2], 150, 570);
  image(buttons[3], 210, 570);
  image(buttons[4], 270, 570);
  image(buttons[5], 330, 570);
  image(buttons[6], 390, 570);
  image(buttons[7], 450, 570);
  image(buttons[8], 510, 570);
  image(buttons[9], 570, 585);


  textSize(48) ;
  textFont(font, 48);

  text("Enjoy Stone Drawing!", 30, 60); 
  textSize(15);
  textFont(fontt, 15);
  text("Eraser", 565, 580);
}



