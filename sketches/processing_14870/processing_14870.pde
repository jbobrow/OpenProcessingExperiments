
// project 4, narrate
// dma fall 2010, brian phan

// variables

boolean move = true;
int card = 1;
PImage page1;
PImage page2;
PImage page3;
PImage page4;
PImage page5;
PImage page6;
PImage page7;
PImage page8;
PImage page9;
PImage page10;
PImage page11;
PImage page12;
PImage page13;
PImage page14;
PImage page15;
PImage page16;
PImage page17;
PImage page18;
PImage page19;
PImage page20;
PImage page21;

int gameoverleft = 263;
int gameoverright = 375;

int choice1left = 303;
int choice1right = 335;
int choice1top = 439;
int choice1bot = 458;

int choice2aleft = 168;
int choice2aright = 258;
int choice2atop = 439;
int choice2abot = 458;

int choice2bleft = 363;
int choice2bright = 452;
int choice2btop = 439;
int choice2bbot = 458;

int choice3aleft = 86;
int choice3aright = 175;
int choice3atop = 439;
int choice3abot = 458;

int choice3bleft = 282;
int choice3bright = 370;
int choice3btop = 439;
int choice3bbot = 458;

int choice3cleft = 473;
int choice3cright = 562;
int choice3ctop = 439;
int choice3cbot = 458;

// setup

void setup()
{
  size(640, 480);
  background(255);
  page1 = loadImage ("1.jpg");
  page2 = loadImage ("2.jpg");
  page3 = loadImage ("3.jpg");
  page4 = loadImage ("4.jpg");
  page5 = loadImage ("5.jpg");
  page6 = loadImage ("6.jpg");
  page7 = loadImage ("7.jpg");
  page8 = loadImage ("8.jpg");
  page9 = loadImage ("9.jpg");
  page10 = loadImage ("10.jpg");
  page11 = loadImage ("11.jpg");
  page12 = loadImage ("12.jpg");
  page13 = loadImage ("13.jpg");
  page14 = loadImage ("14.jpg");
  page15 = loadImage ("15.jpg");
  page16 = loadImage ("16.jpg");
  page17 = loadImage ("17.jpg");
  page18 = loadImage ("18.jpg");
  page19 = loadImage ("19.jpg");
  page20 = loadImage ("20.jpg");
  page21 = loadImage ("21.jpg");
  smooth();
}

void draw()
{
  if (card == 1) {
    image(page1, 0, 0);
    if (mouseX > choice1left && mouseX < choice1right && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 2;
        mousePressed = false;
      }
    }
  } 
  else if (card == 2) {
    image(page2, 0, 0);
    if (mouseX > choice1left && mouseX < choice1right && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 3;
        mousePressed = false;
      }
    }
  } 
  else if (card == 3) {
    image(page3, 0, 0);
    if (mouseX > choice1left && mouseX < choice1right && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 4;
        mousePressed = false;
      }
    }
  } 
  else if (card == 4) {
    image(page4, 0, 0);
    if (mouseX > choice3aleft && mouseX < choice3aright && mouseY > choice3atop && mouseY < choice3abot) {
      if (mousePressed) {
        card = 5;
        mousePressed = false;
      }
    }

    if (mouseX > choice3bleft && mouseX < choice3bright && mouseY > choice3btop && mouseY < choice3bbot) {
      if (mousePressed) {
        card = 6;
        mousePressed = false;
      }
    }

    if (mouseX > choice3cleft && mouseX < choice3cright && mouseY > choice3ctop && mouseY < choice3cbot) {
      if (mousePressed) {
        card = 7;
        mousePressed = false;
      }
    }
  } 
  else if (card == 5) {
    image(page5, 0, 0);
    if (mouseX > choice2aleft && mouseX < choice2aright && mouseY > choice2atop && mouseY < choice2abot) {
      if (mousePressed) {
        card = 8;
        mousePressed = false;
      }
    }
    if (mouseX > choice2bleft && mouseX < choice2bright && mouseY > choice2btop && mouseY < choice2bbot) {
      if (mousePressed) {
        card = 9;
        mousePressed = false;
      }
    }
  }
  else if (card == 6) {
    image(page6, 0, 0);
    if (mouseX > choice1left && mouseX < choice1right && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 10;
        mousePressed = false;
      }
    }
  } 
  else if (card == 7) {
    image(page7, 0, 0);
    if (mouseX > choice2aleft && mouseX < choice2aright && mouseY > choice2atop && mouseY < choice2abot) {
      if (mousePressed) {
        card = 11;
        mousePressed = false;
      }
    }
    if (mouseX > choice2bleft && mouseX < choice2bright && mouseY > choice2btop && mouseY < choice2bbot) {
      if (mousePressed) {
        card = 12;
        mousePressed = false;
      }
    }
  }
  else if (card == 8) {
    image(page8, 0, 0);
    if (mouseX > choice2aleft && mouseX < choice2aright && mouseY > choice2atop && mouseY < choice2abot) {
      if (mousePressed) {
        card = 13;
        mousePressed = false;
      }
    }
    if (mouseX > choice2bleft && mouseX < choice2bright && mouseY > choice2btop && mouseY < choice2bbot) {
      if (mousePressed) {
        card = 14;
        mousePressed = false;
      }
    }
  }
  else if (card == 9) {
    image(page9, 0, 0);
    if (mouseX > choice1left && mouseX < choice1right && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 15;
        mousePressed = false;
      }
    }
  }
  else if (card == 10) {
    image(page10, 0, 0);
    if (mouseX > choice1left && mouseX < choice1right && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 16;
        mousePressed = false;
      }
    }
  }
  else if (card == 11) {
    image(page11, 0, 0);
    if (mouseX > choice1left && mouseX < choice1right && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 17;
        mousePressed = false;
      }
    }
  }
  else if (card == 12) {
    image(page12, 0, 0);
    if (mouseX > choice2aleft && mouseX < choice2aright && mouseY > choice2atop && mouseY < choice2abot) {
      if (mousePressed) {
        card = 18;
        mousePressed = false;
      }
    }
    if (mouseX > choice2bleft && mouseX < choice2bright && mouseY > choice2btop && mouseY < choice2bbot) {
      if (mousePressed) {
        card = 19;
        mousePressed = false;
      }
    }
  }
  else if (card == 13) {
    image(page13, 0, 0);
    if (mouseX > gameoverleft && mouseX < gameoverright && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 1;
        mousePressed = false;
      }
    }
  }
  else if (card == 14) {
    image(page14, 0, 0);
    if (mouseX > choice2aleft && mouseX < choice2aright && mouseY > choice2atop && mouseY < choice2abot) {
      if (mousePressed) {
        card = 20;
        mousePressed = false;
      }
    }
    if (mouseX > choice2bleft && mouseX < choice2bright && mouseY > choice2btop && mouseY < choice2bbot) {
      if (mousePressed) {
        card = 21;
        mousePressed = false;
      }
    }
  }
  else if (card == 15) {
    image(page15, 0, 0);
    if (mouseX > gameoverleft && mouseX < gameoverright && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 1;
        mousePressed = false;
      }
    }
  }
  else if (card == 16) {
    image(page16, 0, 0);
    if (mouseX > choice1left && mouseX < choice1right && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 4;
        mousePressed = false;
      }
    }
  }
  else if (card == 17) {
    image(page17, 0, 0);
    if (mouseX > gameoverleft && mouseX < gameoverright && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 1;
        mousePressed = false;
      }
    }
  }
  else if (card == 18) {
    image(page18, 0, 0);
    if (mouseX > choice1left && mouseX < choice1right && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 7;
        mousePressed = false;
      }
    }
  }
  else if (card == 19) {
    image(page19, 0, 0);
    if (mouseX > gameoverleft && mouseX < gameoverright && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 1;
        mousePressed = false;
      }
    }
  }
  else if (card == 20) {
    image(page20, 0, 0);
    if (mouseX > gameoverleft && mouseX < gameoverright && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 1;
        mousePressed = false;
      }
    }
  }
  else if (card == 21) {
    image(page21, 0, 0);
    if (mouseX > choice1left && mouseX < choice1right && mouseY > choice1top && mouseY < choice1bot) {
      if (mousePressed) {
        card = 4;
        mousePressed = false;
      }
    }
  }
}  

