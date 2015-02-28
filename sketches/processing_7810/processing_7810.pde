
// Assignment4 Narrate: Alice in Wonderland

int page = 0;   // Current page, this is the most important variable in the code
PFont font, font20, font16;
PImage AW1, AW2, AW3, AW4, AW5, AW6, AW7, AWt;


int b0Lx = 0;    // P0 Left
int b0Ly = 0;  
int b0Lw = 150;   
int b0Lh = 480;  
int b0Rx = 0;  // P0 Right
int b0Ry = 0;
int b0Rw = 300;
int b0Rh = 480;

int b1Lx = 0;    // P1 Left x-coordinate
int b1Ly = 300;  // P1 Left y-coordinate
int b1Lw = 320;  // P1 Left width
int b1Lh = 180;  // P1 Left height
int b1Rx = 320;  // P1 Right
int b1Ry = 300;
int b1Rw = 320;
int b1Rh = 180;

int b2Rx = 380;  // P2 Join
int b2Ry = 170;
int b2Rw = 300;
int b2Rh = 400;
int b2Lx = 0;    // P2 Leaves
int b2Ly = 150;
int b2Lw = 200;
int b2Lh = 300;

int b3Rx = 450;  // P3 Stay
int b3Ry = 200;
int b3Rw = 200;
int b3Rh = 150;
int b3Lx = 0;    // P3 Leaves
int b3Ly = 100;
int b3Lw = 250;
int b3Lh = 350;

int b4Rx = 400;  // P4 don't enter
int b4Ry = 150;
int b4Rw = 250;
int b4Rh = 350;
int b4Lx = 0;    // P4 enter
int b4Ly = 300;
int b4Lw = 400;
int b4Lh = 200;

int b5x = 245;  // P5 6:O'Clock
int b5y = 13;
int b5w = 20;
int b5h = 300;
int b5lx = 590;  // P5 Give Up
int b5ly = 100;
int b5lw = 50;
int b5lh = 50;

int b6Rx = 300;  // P6 shoe
int b6Ry = 350;
int b6Rw = 350;
int b6Rh = 350;
int b6Lx = 175;    // P6 drink
int b6Ly = 150;
int b6Lw = 100;
int b6Lh = 100;



void setup() {
  size(640, 480); 
  smooth();
  font = loadFont("BookAntiqua-Italic-12.vlw");
  font20 = loadFont("BookAntiqua-Italic-20.vlw");
  font16 = loadFont("BookAntiqua-Italic-16.vlw");
  textFont(font);
}

void draw() {

  if (page == 0) {
    pageZero();
  } 
  else if (page == 1) {
    pageOne(); 
  } 
  else if (page == 2) {
    pageTwo(); 
  } 
  else if (page == 3) {
    pageThree(); 
  }
  else if (page == 4) {
    pageFour(); 
  }
  else if (page == 5) {
    pageFive(); 
  }
  else if (page == 6) {
    pageSix(); 
  }
  else if (page == 7) {
    pageSeven(); 
  }
}
void mousePressed() {

  if (page == 0) {
    if (overButton(b0Lx, b0Ly, b0Lw, b0Lh) == true) {
      page = 1; 
    } 
  }
  else if (page == 1) {
    if (overButton(b1Lx, b1Ly, b1Lw, b1Lh) == true) {
      page = 4; 
    } 
    else if (overButton(b1Rx, b1Ry, b1Rw, b1Rh) == true) {
      page = 2;
    } 
  }
  else if (page == 2) {
    if (overButton(b2Rx, b2Ry, b2Rw, b2Rh) == true) {
      page = 3; 
    } 
    else if (overButton(b2Lx, b2Ly, b2Lw, b2Lh) == true) {
      page = 1;
    }
  } 
  else if (page == 3) {
    if (overButton(b3Rx, b3Ry, b3Rw, b3Rh) == true) {
      page = 3; 
    } 
    else if (overButton(b3Lx, b3Ly, b3Lw, b3Lh) == true) {
      page = 4;
    }
  } 
  else if (page == 4) {
    if (overButton(b4Rx, b4Ry, b4Rw, b4Rh) == true) {
      page = 1; 
    } 
    else if (overButton(b4Lx, b4Ly, b4Lw, b4Lh) == true) {
      page = 5;
    }
  } 
  else if (page == 5) {
    if (overButton(b5x, b5y, b5w, b5h) == true) {
      page = 6; 
    }
    else if (overButton(b5lx, b5ly, b5lw, b5lh) == true) {
      page = 4;
    } 
    else {
      page = 5;
    }
  }
  else if (page == 6) {
    if (overButton(b6Rx, b6Ry, b6Rw, b6Rh) == true) {
      page = 1; 
    } 
    else if (overButton(b6Lx, b6Ly, b6Lw, b6Lh) == true) {
      page = 7;
    }
  }  
}
// Check to see if the click happends over the button
boolean overButton(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true; 
  } 
  else {
    return false; 
  }
}










// PAGE ZERO
void pageZero() {
  AWt = loadImage("AWtitle.jpg"); 
  image(AWt, 0, 0); 

  // Left Button
  noStroke();
  if (overButton(b0Lx, b0Ly, b0Lw, b0Lh) == true) {
    fill(255, 1);
    PImage AWtb1 = loadImage("AWtitleslash.png");
    image(AWtb1, 0, 0);
  } 

  // Right Button
  if (overButton(b0Rx, b0Ry, b0Rw, b0Rh) == true) {
    fill(255, 1);
    PImage AWtb2 = loadImage("AWtitleslash2.png");
    image(AWtb2, 0, 0);
  } 
}






// PAGE ONE
void pageOne() {
  AW1 = loadImage("AW1.jpg"); 
  image(AW1, 0, 0); 
  fill(0);
  text("Then the Cheshire Cat continued to sit on the branches, grinning, as if freezed in time.... Which way should I go?", 50, 60, 200, 480);

  // Left Button
  noStroke();
  if (overButton(b1Lx, b1Ly, b1Lw, b1Lh) == true) {
    fill(255, 1);
    PImage AW1b1 = loadImage("AW1button1.png");
    image(AW1b1, 0, 0);
  } 
  else {
    fill(255, 1); 
  }
  rect(b1Lx, b1Ly, b1Lw, b1Lh);
  fill(0);
  text("The 'Left' Path", b1Lx + 150, b1Ly + b1Lh - 10);

  // Right Button
  if (overButton(b1Rx, b1Ry, b1Rw, b1Rh) == true) {
    fill(255, 1);
    PImage AW1b2 = loadImage("AW1button2.png");
    image(AW1b2, 0, 0);
  } 
  else {
    fill(255, 1); 
  }
  rect(b1Rx, b1Ry, b1Rw, b1Rh);
  fill(0);
  text("The 'Right' Path", b1Rx + 100, b1Ry + b1Rh - 10);
  textAlign(LEFT);
}






// PAGE TWO
void pageTwo() {
  AW2 = loadImage("AW2.jpg"); 
  image(AW2, 0, 0); 
  fill(0);
  textFont(font20);
  text("A Tea Party!", 360, 90);
  text("But I don't want to intrude...", 370, 110);
  textFont(font);

  // Button Join
  if (overButton(b2Rx, b2Ry, b2Rw, b2Rh) == true) {
    fill(255, 1);
    PImage AW2b1 = loadImage("AW2button1.png");
    image(AW2b1, 0, 0);
  } 
  else {
    fill(255, 1); 
  }
  rect(b2Rx, b2Ry, b2Rw, b2Rh);
  fill(0);
  text("I'm sure they won't mind", 450, 180);

  // Button Leaves
  if (overButton(b2Lx, b2Ly, b2Lw, b2Lh) == true) {
    fill(255, 1); 
    PImage AW2b2 = loadImage("AW2button2.png");
    image(AW2b2, 0, 0);
  } 
  else {
    fill(255,1); 
  }
  rect(b2Lx, b2Ly, b2Lw, b2Lh);
  fill(0);
  text("They seem so happy in their own world", 100, 210, 100, 300);
}






// PAGE THREE
void pageThree() {
  AW3 = loadImage("AW3.jpg"); 
  image(AW3, 0, 0); 
  textFont(font16);
  text("This tea party is becoming mentally grueling, ", 50, 50);
  text("Should I leave?", 50, 70);
  // Button Stay
  if (overButton(b3Rx, b3Ry, b3Rw, b3Rh) == true) {
    fill(255, 1);
    PImage AW3b1 = loadImage("AW3button1.png");
    image(AW3b1, 0, 0);
  } 
  else {
    fill(255, 1); 
  }
  rect(b3Rx, b3Ry, b3Rw, b3Rh);
  textFont(font);
  fill(0);
  text("I'll stay a little longer", 450, 320);
  text("I wonder what they would do next... ", 450, 305);
  // Button Leaves
  if (overButton(b3Lx, b3Ly, b3Lw, b3Lh) == true) {
    fill(255, 1); 
    PImage AW3b2 = loadImage("AW3button2.png");
    image(AW3b2, 0, 0);
  } 
  else {
    fill(255, 1); 
  }
  rect(b3Lx, b3Ly, b3Lw, b3Lh);
  fill(0);
  text("I'm Leaving", 210, 280, 0);
}







// PAGE FOUR
void pageFour() {
  AW4 = loadImage("AW4.jpg"); 
  textFont(font16);
  image(AW4, 0, 0); 
  text("This must lead to the Mad Hatter's house that the Cheshire cat mentioned.", 155, 25);

  // Button don't enter
  textFont(font);
  if (overButton(b4Rx, b4Ry, b4Rw, b4Rh) == true) {
    fill(255, 1);
    PImage AW4b1 = loadImage("AW4buttondontenter.png");
    image(AW4b1, 0, 0);
  } 
  else {
    fill(255, 1); 
  }
  rect(b4Rx, b4Ry, b4Rw, b4Rh);
  fill(0);
  text("The house looks", 555, 160);
  text("intimidating...", 565, 175);

  // Button enter
  if (overButton(b4Lx, b4Ly, b4Lw, b4Lh) == true) {
    fill(255, 1); 
    PImage AW4b2 = loadImage("AW4buttonenter.png");
    image(AW4b2, 0, 0);
  } 
  else {
    fill(255, 1); 
  }
  rect(b4Lx, b4Ly, b4Lw, b4Lh);
  fill(0);
  text("Wow! Maybe that's where the garden is!,", 10, 390, 80, 50);
}






// PAGE FIVE
void pageFive() {
  AW5 = loadImage("AW5.jpg"); 
  image(AW5, 0, 0, 640, 480);
  textFont(font); 
  text("On the front door was a large clock. After studying it, Alice found out that it is actually the lock of the front door to the Hatter's house.", 398, 10, 242, 300);
  text("In order to unlock it, you need to set the clock at the right time and left click" , 450, 63, 165, 200);
  text("Give Up", 597, 110);


  float x = map(mouseX, 0, 640, -250, 390);
  float y = map(mouseY, 0, 480, -160, 320);
  float c = sqrt(sq(x)+sq(y));
  float a = asin(x/c);
  //println(a);
  pushMatrix();
  translate(251, 160);
  if ((mouseY > 160)) {
    rotate(-a - PI);
  }
  else if (mouseY <= 160) {
    rotate(a);
  }
  PImage clockarm = loadImage("AW5clockhands.png");
  image(clockarm, -250, -160);
  popMatrix();


  // Button Give Up
  if (overButton(b5lx, b5ly, b5lw, b5lh) == true) {
    PImage AW5b = loadImage("AW5giveup.png");
    image(AW5b, 0, 0);
  }
}






// PAGE SIX
void pageSix() {
  AW6 = loadImage("AW6.jpg"); 
  image(AW6, 0, 0);
  fill(0);
  textFont(font16);
  text("After finally entering the house, she walked down a dark long hall with a table on the end. There was a big teacup on it", 20, 15, 560, 100);
  textFont(font);

  // Button Drink
  if (overButton(b6Lx, b6Ly, b6Lw, b6Lh) == true) {
    fill(255, 1);
    PImage AW6b1 = loadImage("AW6buttondrink.png");
    image(AW6b1, 0, 0);
  } 
  else {
    fill(255, 1); 
  }
  rect(b6Lx, b6Ly, b6Lw, b6Lh);
  fill(0);
  text("Drink", 220, 170);

  // Button Leaves
  if (overButton(b6Rx, b6Ry, b6Rw, b6Rh) == true) {
    fill(255, 1); 
    PImage AW6b2 = loadImage("AW6buttonshoe.png");
    image(AW6b2, 0, 0);
  } 
  else {
    fill(255, 1); 
  }
  rect(b6Rx, b6Ry, b6Rw, b6Rh);
  fill(0);
  text("I already had too much tea.", b6Rx + b6Rw/2, b6Ry + b6Rh/2 - 50);  

}






// PAGE SEVEN
void pageSeven() {
  AW7 = loadImage("AW7.jpg"); 
  image(AW7, 0, 0);
  textFont(font20);
  textAlign(CENTER);
  text("The End", width/2, 100);
}







