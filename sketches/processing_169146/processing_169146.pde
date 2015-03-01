

PImage[] buttons;
int selButton = 0;
PImage img ;

void setup() {
  size(1210, 1080);
  img = loadImage("0.png");
  image(img,0,0);

  buttons = new PImage[12];
  buttons[0] = loadImage("7.png");
  buttons[1] = loadImage("8.png");
  buttons[2] = loadImage("9.png");
  buttons[3] = loadImage("10.png");
  buttons[4] = loadImage("11.png");
  buttons[5] = loadImage("12.png");
  
  buttons[6] = loadImage("1.png");
  buttons[7] = loadImage("2.png");
  buttons[8] = loadImage("3.png");
  buttons[9] = loadImage("4.png");
  buttons[10] = loadImage("5.png");
  buttons[11] = loadImage("6.png");


  smooth();
}


void draw() {
  if (mousePressed) {
    if (mouseY > 840) {

      if (260 < mouseX && mouseX < 360 && 840 < mouseY && mouseY < 940)  selButton = 0;
      else if (380 < mouseX && mouseX < 480 && 840 < mouseY && mouseY < 940) selButton = 1;
      
      
      else if (500 < mouseX &&  mouseX < 600 && 840 < mouseY && mouseY < 940)  selButton = 2;
      else if (260 < mouseX && mouseX < 360 && 960 < mouseY && mouseY < 1060) selButton = 3;
      
      
      else if (380 < mouseX && mouseX < 480 && 960 < mouseY && mouseY < 1060) selButton = 4; 
      else if (500 < mouseX && mouseX < 600 && 960 < mouseY && mouseY < 1060) selButton = 5;
      
      
      else if (850 < mouseX && mouseX < 950 && 840 < mouseY && mouseY < 940) selButton = 6; 
      else if (970 < mouseX && mouseX < 1070 && 840 < mouseY && mouseY < 940) selButton = 7;
      
      else if (1090 < mouseX && mouseX < 1190 && 840 < mouseY && mouseY < 940) selButton = 8; 
      else if (850 < mouseX && mouseX < 950 && 960 < mouseY && mouseY < 1060) selButton = 9;
      
      else if (970 < mouseX && mouseX < 1070 && 960 < mouseY && mouseY < 1060) selButton = 10; 
      else if (1090 < mouseX && mouseX < 1190 && 960 < mouseY && mouseY < 1060) selButton = 11;

      
    } else {
     
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  
  noStroke();

  image(buttons[0], 260, 840);
  image(buttons[1], 380, 840);
  image(buttons[2], 500, 840);  
  image(buttons[3], 260, 960);
  image(buttons[4], 380, 960);
  image(buttons[5], 500, 960); 
  image(buttons[6], 850, 840);
  image(buttons[7], 970, 840);
  image(buttons[8], 1090, 840);
  image(buttons[9], 850, 960);
  image(buttons[10], 970, 960);
  image(buttons[11], 1090, 960);
 

  noFill();
  stroke(255, 0, 0);
  if (selButton == 0) ellipse(310, 890, 100, 100);
  else if (selButton == 1) ellipse(430, 890, 100, 100);
  else if (selButton == 2) ellipse(550, 890, 100, 100);
  else if (selButton == 3) ellipse(310, 1010, 100, 100);
  else if (selButton == 4) ellipse(430, 1010, 100, 100);
  else if (selButton == 5) ellipse(550, 1010, 100, 100);
  else if (selButton == 6) ellipse(900, 890, 100, 100);
  else if (selButton == 7) ellipse(1020, 890, 100, 100);
  else if (selButton == 8) ellipse(1140, 890, 100, 100);
  else if (selButton == 9) ellipse(900, 1010, 100, 100);
  else if (selButton == 10) ellipse(1020, 1010, 100, 100);
  else if (selButton == 11) ellipse(1140, 1010, 100, 100);
}

void keyPressed() {
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}




