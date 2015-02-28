


int page = 1;   // Current page, this is the most important variable in the code

PFont font;
PImage p1;
PImage p2;
PImage p3;
PImage p4;
PImage p5;
PImage p6;
PImage p7;
PImage p8;
PImage p9;
PImage p10;
PImage p11;
PImage p12;
PImage p13;
PImage p14;
PImage p15;
PImage p16;
PImage p17;
PImage p18;
PImage p19;

int b1x = 440;   // Button 1 x-coordinate
int b1y = 290;  // Button 1 y-coordinate
int b1w = 100;  // Button 1 width
int b1h = 50;   // Button 1 height

int b2x = 440;  // Button 2
int b2y = 400;
int b2w = 100;
int b2h = 50;

int b3x = 40; //Button 3
int b3y = 390;
int b3w = 100;
int b3h = 50; 

int b4x = 40; //Button 4 
int b4y = 390;
int b4w = 100;
int b4h = 50;

int b5x = 170; //Button 5 
int b5y = 390;
int b5w = 100;
int b5h = 50;

int b6x = 380; //Button 6
int b6y = 360;
int b6w = 100;
int b6h = 50;

int b7x = 170; //Button 7
int b7y = 390;
int b7w = 100;
int b7h = 50;

int b8x = 40; //Button 8 
int b8y = 390;
int b8w = 100;
int b8h = 50;

int b9x = 380; //Button 9
int b9y = 390;
int b9w = 100;
int b9h = 50;

int b10x = 390; //Button 10
int b10y = 400;
int b10w = 100;
int b10h = 50;

int b11x = 500; //Button 11 
int b11y = 400;
int b11w = 100;
int b11h = 50;

int b12x = 40; //Button 12
int b12y = 390;
int b12w = 100;
int b12h = 50;

int b13x = 300; //Button 13 
int b13y = 320;
int b13w = 100;
int b13h = 50;

int b14x = 480; //Button 14 
int b14y = 320;
int b14w = 100;
int b14h = 50;

int b15x = 470; //Button 15
int b15y = 390;
int b15w = 100;
int b15h = 50;

int b16x = 40; //Button 16 
int b16y = 390;
int b16w = 100;
int b16h = 50;

int b17x = 490; //Button 17
int b17y = 390;
int b17w = 100;
int b17h = 50;

int b18x = 40; //Button 18
int b18y = 390;
int b18w = 100;
int b18h = 50;

int b19x = 170; //Button 19 
int b19y = 390;
int b19w = 100;
int b19h = 50;

int b20x = 40; //Button 20 
int b20y = 390;
int b20w = 100;
int b20h = 50;

int b21x = 120; //Button 21 
int b21y = 400;
int b21w = 100;
int b21h = 50;

int b22x = 440; //Button 22 
int b22y = 250;
int b22w = 120;
int b22h = 50;

int b23x = 440; //Button 23 
int b23y = 390;
int b23w = 120;
int b23h = 50;

int b24x = 400; //Button 24 
int b24y = 390;
int b24w = 100;
int b24h = 50;

int b25x = 170; //Button 25 
int b25y = 390;
int b25w = 100;
int b25h = 50;

int b26x = 40; //Button 26
int b26y = 390;
int b26w = 100;
int b26h = 50;

int b27x = 70; //Button 27 
int b27y = 390;
int b27w = 100;
int b27h = 50;

int b28x = 380; //Button 28
int b28y = 390;
int b28w = 100;
int b28h = 50;

// You can define more buttons here following the same pattern

void setup() {
  size(640, 480); 
  smooth();
  font = loadFont("Baskerville-Italic-48.vlw");
  textFont(font);
  p1 = loadImage("page1.png");
  p2 = loadImage("page2.png");
  p3 = loadImage("page3.png");
  p4 = loadImage("page4.png");
  p5 = loadImage("page5.png");
  p6 = loadImage("page6.png");
  p7 = loadImage("page7.png");
  p8 = loadImage("page8.png");
  p9 = loadImage("page9.png");
  p10 = loadImage("page10.png");
  p11 = loadImage("page11.png");
  p12 = loadImage("page12.png");
  p13 = loadImage("page13.png");
  p14 = loadImage("page14.png");
  p15 = loadImage("page15.png");
  p16 = loadImage("page16.png");
  p17 = loadImage("page17.png");
  p18 = loadImage("page18.png");
  p19 = loadImage("page19.png");
}

void draw() {
  if (page == 1) {
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
  else if (page == 8) {
    pageEight();
  }
  else if (page == 9) {
    pageNine();
  }
  else if (page == 10) {
    pageTen();
  }
  else if (page == 11) {
    pageEleven();
  }
  else if (page == 12) {
    pageTwelve();
  }
  else if (page == 13) {
    pageThirteen();
  }
  else if (page == 14) {
    pageFourteen();
  }
  else if (page == 15) {
    pageFifteen();
  }
  else if (page == 16) {
    pageSixteen();
  }
  else if (page == 17) {
    pageSeventeen();
  }
  else if (page == 18) {
    pageEighteen();
  }
  else if (page == 19) {
    pageNineteen();
  }

}


void mousePressed()
{

  if (page == 1) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 2; 
    } 
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 3;
    }
  } 

  else if (page == 2) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1; 
    } 
  } 

  else if (page == 3) {
    if (overButton(b4x, b4y, b4w, b4h) == true) {
      page = 4; 
    } 
    else if (overButton(b5x, b5y, b5w, b5h) == true) {
      page = 5;
    } 
  }

  else if (page == 4) { 
    if (overButton(b6x, b6y, b6w, b6h) == true) {
      page = 3;
    }
  }

  else if (page == 5) {
    if (overButton(b7x, b7y, b7w, b7h) == true) {
      page = 6;
    }
    else if (overButton(b8x, b8y, b8w, b8h) == true) {
      page = 7;
    }
  }

  else if (page == 6) {
    if (overButton(b9x, b9y, b9w, b9h) == true) {
      page = 5;
    }
  }


  else if (page == 7) { 
    if (overButton(b10x, b10y, b10w, b10h) == true) {
      page = 8;
    }
    else if (overButton(b11x, b11y, b11w, b11h) == true) {
      page = 9;
    }
  }

  else if (page == 8) {
    if (overButton(b12x, b12y, b12w, b12h) == true) {
      page = 7;
    }
  }

  else if (page == 9) {
    if (overButton(b13x, b13y, b13w, b13h) == true) {
      page = 10;
    }
    else if (overButton(b14x, b14y, b14w, b14h) == true ) {
      page = 11; 
    }
  }

  else if (page == 10) {
    if (overButton(b15x, b15y, b15w, b15h) == true) {
      page = 9;
    }
  }

  else if (page == 11) {
    if (overButton(b16x, b16y, b16w, b16h) == true) {
      page = 12;
    }
    else if (overButton(b17x, b17y, b17w, b17h) == true) {
      page = 13;
    }
  }

  else if (page == 12) {
    if (overButton(b18x, b18y, b18w, b18h) == true) {
      page = 1; 
    }
  }

  else if (page == 13) {
    if (overButton(b19x, b19y, b19w, b19h) == true) {
      page = 15; 
    }
    else if (overButton(b20x, b20y, b20w, b20h) == true) {
      page = 14; 
    }
  }


  else if (page == 14) {
    if (overButton(b21x, b21y, b21w, b21h) == true) {
      page = 1; 
    }
  }


  else if (page == 15) {
    if (overButton(b22x, b22y, b22w, b22h) == true) {
      page = 16;
    }
    else if (overButton(b23x, b23y, b23w, b23h) == true) {
      page = 17; 
    }
  }


  else if (page == 16) {
    if (overButton(b24x, b24y, b24w, b24h) == true) {
      page = 1; 
    }
  }


  else if (page == 17) {
    if (overButton(b25x, b25y, b25w, b25h) == true) {
      page = 18;
    }
    else if (overButton(b26x, b26y, b26w, b26h) == true) {
      page = 19; 
    }
  }

  else if (page == 18) {
    if (overButton(b27x, b27y, b27w, b27h) == true) {
      page = 1;
    }
  }
  
  else if (page == 19) {
    if (overButton(b28x, b28y, b28w, b28h) == true) {
      page = 1;
    }
  }
}







// Check to see if the click happens over the button
boolean overButton(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true; 
  } 
  else {
    return false; 
  }
}


// PAGE ONE

void pageOne() {
  background(147, 195, 224);
  image(p1, 0, 0);
  fill(0);
 textSize(27);
  text("Welcome to Wonderland in Watercolor!", 255, 60);
  textSize(30);
  text("Do you wish to paint", 385, 200);
  text("the roses red?", 425, 240);
  textSize(25);
  
  
  // Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(255); 
  } 
  else {
    fill(77,201,53); 
  }
  rect(b1x, b1y, b1w, b1h);
  textAlign(CENTER);
  fill(0);
  text("No", b1x + b1w/2, b1y + 32);

  // Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    fill(77,201,53); 
  }
  rect(b2x, b2y, b2w, b2h);
  fill(0);
  text("Yes", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
}


// PAGE TWO (NO)

void pageTwo() {
  background(195, 147, 224);
   image(p2, 0, 0);
  fill(0);
  text("You pick a rose and prick your finger on a thorn!", 35, 40);
  textSize(40);
  text("OUCH!", 35, 85);
  textSize(25);
  text("You drown in your own tears.", 40, 370);
  fill(255);
  text("Begin Again.", 300, 370);
 
  // Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    fill(255); 
  } 
  else {
    fill(67,145,237); 
  }
  rect(b3x, b3y, b3w, b3h);
  fill(0);
  textAlign(CENTER);
  text("Back", b3x + b3w/2, b3y + 32);
  textAlign(LEFT);
}


// PAGE THREE (YES)

void pageThree() {
  background(195, 224, 147);
  image(p3,0,0);
  textSize(35);
  text("OH NO!", 10, 40);
  textSize(20);
  text("The Queen is angry at you for painting her roses!", 8, 65);
  textSize(28);
  text("She challenges you to a game!", 35, 100); 
  textSize(22);
  text("Do you wish to beat the Queen", 50, 230);
  text("at a golf game of flamingos and", 50, 260);
   text("hedgehogs?", 50, 290);
  // Left Button
  if (overButton(b4x, b4y, b4w, b4h) == true) {
    fill(255); 
  } 
  else {
    fill(245,25,39); 
  }
  rect(b4x, b4y, b4w, b4h);
  textAlign(CENTER);
  fill(0);
  text("No", b4x + b4w/2, b4y + 32);

  // Right Button
  if (overButton(b5x, b5y, b5w, b5h) == true) {
    fill(255); 
  } 
  else {
    fill(245,25,39); 
  }
  rect(b5x, b5y, b5w, b5h);
  fill(0);
  text("Yes", b5x + b5w/2, b5y + 32);
  textAlign(LEFT);
}

// PAGE FOUR (NO)

void pageFour() {
  background(195, 147, 224);
  image(p4,0,0);
  fill(0);
  text("The Queen beats you!", 350, 60);
  textSize(35);
  text("Better luck next time!", 320, 100);
  textSize(45);
  text("She BANISHES", 320, 190);
  textSize(20);
  text("you from the kingdom!", 450, 220);
  textSize(25);
  text("Begin Again.", 380, 320);

  // Button
  if (overButton(b6x, b6y, b6w, b6h) == true) {
    fill(255); 
  } 
  else {
    fill(225,19,237); 
  }
  rect(b6x, b6y, b6w, b6h);
  fill(0);
  textAlign(CENTER);
  text("Back", b6x + b6w/2, b6y + 32);
  textAlign(LEFT);
}


// PAGE FIVE (YES)

void pageFive() {
  background(147, 195, 224);
  image(p5,0,0);

  fill(0);
  textSize(35);
  text("You BEAT the Queen", 50, 100);
  textSize(25);
  text("and find a little door behind a curtain!", 50, 125);
  textSize(30);
  text("Do you wish to", 70, 230);
  text("walk through the door?", 90, 260);
  textSize(20);
  // Left Button
  if (overButton(b7x, b7y, b7w, b7h) == true) {
    fill(255); 
  } 
  else {
    fill(123,186,240); 
  }
  rect(b7x, b7y, b7w, b7h);
  textAlign(CENTER);
  fill(0);
  text("No", b7x + b7w/2, b7y + 32);

  // Right Button
  if (overButton(b8x, b8y, b8w, b8h) == true) {
    fill(255); 
  } 
  else {
    fill(123,186,240); 
  }
  rect(b8x, b8y, b8w, b8h);
  fill(0);
  text("Yes", b8x + b8w/2, b8y + 32);
  textAlign(LEFT);
}


// PAGE SIX (NO)

void pageSix() {
  background(195, 147, 224);
  image(p6,0,0);
  fill(0);
  text("The Queen", 350, 100); 
  textSize(40);
  text("PITIES", 370, 145);
  textSize(30);
  text("your skills!", 390, 180);
  textSize(25);
  text("She banishes you from the kingdom!", 320, 280);
  textSize(30);
  text("Begin Again.", 370, 350);
  textSize(25);

  // Button
  if (overButton(b9x, b9y, b9w, b9h) == true) {
    fill(255); 
  } 
  else {
    fill(240,231,63); 
  }
  rect(b9x, b9y, b9w, b9h);
  fill(0);
  textAlign(CENTER);
  text("Back", b9x + b9w/2, b9y + 32);
  textAlign(LEFT);
}




// PAGE SEVEN (YES)

void pageSeven() {
  background(147, 195, 224);
  image(p7,0,0);

  fill(0);
  text("What a", 190, 40);
  textSize(40);
  text("TOUGH",200, 75);
  textSize(30);
  text("game! You deserve a few rounds on the house!", 165, 110);
  textSize(20);
  text("Ask the bartender for a drink from the Royal Bar?", 240, 140);
  textSize(20);
  // Left Button
  if (overButton(b10x, b10y, b10w, b10h) == true) {
    fill(255); 
  } 
  else {
    fill(219,211,44); 
  }
  rect(b10x, b10y, b10w, b10h);
  textAlign(CENTER);
  fill(0);
  text("No", b10x + b10w/2, b10y + 32);

  // Right Button
  if (overButton(b11x, b11y, b11w, b11h) == true) {
    fill(255); 
  } 
  else {
    fill(219,211,44); 
  }
  rect(b11x, b11y, b11w, b11h);
  fill(0);
  text("Yes", b11x + b11w/2, b11y + 32);
  textAlign(LEFT);
}

// PAGE EIGHT (NO)

void pageEight() {
  background(195, 147, 224);
  image(p8,0,0);
  fill(0);
  text("The Mad Hatter spills his entire drink on you!", 50, 270); 
  textSize(40);
  text("OH NO!", 50, 300);
  textSize(25);
  text("You are swept away in the flood!", 50, 330);
  textSize(30);
  text("Begin Again.", 30, 360);
textSize(20);
  // Button
  if (overButton(b12x, b12y, b12w, b12h) == true) {
    fill(255); 
  } 
  else {
    fill(204,25,245); 
  }
  rect(b12x, b12y, b12w, b12h);
  fill(0);
  textAlign(CENTER);
  text("Back", b12x + b12w/2, b12y + 32);
  textAlign(LEFT);
}

// PAGE NINE (YES)

void pageNine() {
  background(147, 195, 224);
  image(p9,0,0);

  fill(0);
  textSize(30);
  text("What a refreshing drink!", 350, 100);
  text("You grow", 350, 140);
  textSize(45);
  text("AMAZINGLY", 350, 180);
  textSize(25);
  text("tall with your new energy!", 350, 215);
  textSize(30);
  text("Leave the Royal Bar?", 350, 265); 
  textSize(20);
  // Left Button
  if (overButton(b13x, b13y, b13w, b13h) == true) {
    fill(255); 
  } 
  else {
    fill(83,142,234); 
  }
  rect(b13x, b13y, b13w, b13h);
  textAlign(CENTER);
  fill(0);
  text("No", b13x + b13w/2, b13y + 32);

  // Right Button
  if (overButton(b14x, b14y, b14w, b14h) == true) {
    fill(255); 
  } 
  else {
    fill(83,142,234); 
  }
  rect(b14x, b14y, b14w, b14h);
  fill(0);
  text("Yes", b14x + b14w/2, b14y + 32);
  textAlign(LEFT);
}

// PAGE Ten (NO)

void pageTen() {
  background(195, 147, 224);
  image(p10,0,0);
  fill(0);
  textSize(30);
  text("You keep", 420, 60); 
  textSize(40);
  text("GROWING", 450, 100);
  textSize(25);
  text("incredibly tall!", 420, 140);
  text("Oh No! You grow so tall you are stuck in the Royal Bar! Begin Again.", 20, 350);

  // Button
  if (overButton(b15x, b15y, b15w, b15h) == true) {
    fill(255); 
  } 
  else {
    fill(151, 27, 219); 
  }
  rect(b15x, b15y, b15w, b15h);
  fill(0);
  textAlign(CENTER);
  text("Back", b15x + b15w/2, b15y + 32);
  textAlign(LEFT);
}

// PAGE ELEVEN (YES)

void pageEleven() {
  background(147, 195, 224);
  image(p11,0,0);

  fill(0);
  text("You pass by", 30, 100);
  textSize(25);
  text("a mouse mumbling.", 20, 120);
  textSize(35);
  text("Stop and", 40, 170);
  textSize(45);
  text("LISTEN", 20, 220);
  textSize(25);
  text("to the mouse's story?", 10, 250);
  textSize(20);
  // Left Button
  if (overButton(b16x, b16y, b16w, b16h) == true) {
    fill(255); 
  } 
  else {
    fill(250,63,63); 
  }
  rect(b16x, b16y, b16w, b16h);
  textAlign(CENTER);
  fill(0);
  text("No", b16x + b16w/2, b16y + 32);

  // Right Button
  if (overButton(b17x, b17y, b17w, b17h) == true) {
    fill(255); 
  } 
  else {
    fill(250,63,63); 
  }
  rect(b17x, b17y, b17w, b17h);
  fill(0);
  text("Yes", b17x + b17w/2, b17y + 32);
  textAlign(LEFT);
}

// PAGE Twelve (MID-POINT WIN) (Back to PAGE ONE) 

void pageTwelve() {
  background(195, 147, 224);
  image(p12,0,0);
  fill(0);
  textSize(30);
  text("The Duke of Dodo", 10, 30); 
  textSize(25);
  text("presents you with the", 80, 50);
  textSize(28);
  text("silver thimbel!", 50, 100);
  textSize(30);
  text("You are now", 50, 160);
  textSize(40);
  text("Queen of the Critters!", 10, 200);
  textSize(25);
  text("Congratulations! You Win!", 50, 340);
  textSize(30);
  text("The End!", 50, 380);
  textSize(25);

  // Button
  if (overButton(b18x, b18y, b18w, b18h) == true) {
    fill(255); 
  } 
  else {
    fill(250,63,194); 
  }
  rect(b18x, b18y, b18w, b18h);
  fill(0);
  textAlign(CENTER);
  text("Back", b18x + b18w/2, b18y + 32);
  textAlign(LEFT);
}

// PAGE THIRTEEN (NO)

void pageThirteen() {
  background(147, 195, 224);
  image(p13,0,0);

  fill(0);
  textSize(23);
  text("The mouse tells you about a magical gryphon that you must find.", 50, 100);
  textSize(20);
  text("You find the gryphon sleeping.", 50, 140);
  textSize(40);
  text("Wake the sleeping gryphon?", 50, 185);
  textSize(20);
  // Left Button
  if (overButton(b19x, b19y, b19w, b19h) == true) {
    fill(255); 
  } 
  else {
    fill(222,121,192); 
  }
  rect(b19x, b19y, b19w, b19h);
  textAlign(CENTER);
  fill(0);
  text("No", b19x + b19w/2, b19y + 32);

  // Right Button
  if (overButton(b20x, b20y, b20w, b20h) == true) {
    fill(255); 
  } 
  else {
    fill(222,121,192); 
  }
  rect(b20x, b20y, b20w, b20h);
  fill(0);
  text("Yes", b20x + b20w/2, b20y + 32);
  textAlign(LEFT);
}

// PAGE FOURTEEN (2nd MID-pOINT WIN) back to page 1 (YES)

void pageFourteen() {
  background(195, 147, 224);
  image(p14,0,0);
  fill(0);
  textSize(20);
  text("The gryphon begins singing with ", 10, 100); 
  text("the mock turtle to you!", 10, 120);
  textSize(20);
  text("They invite you to join their traveling", 10, 170);
  text("singing group! Congratulations", 10, 190);
  text("You are now the", 20, 250);
  textSize(40);
  text("WONDER", 10, 280);
  text("OF", 20, 320);
  textSize(35);
  text("WONDERLAND!", 10, 360);
  textSize(30);
  text("The End!", 50, 390);
  textSize(25);

  // Button
  if (overButton(b21x, b21y, b21w, b21h) == true) {
    fill(255); 
  } 
  else {
    fill(179,121,222); 
  }
  rect(b21x, b21y, b21w, b21h);
  fill(0);
  textAlign(CENTER);
  text("Back", b21x + b21w/2, b21y + 32);
  textAlign(LEFT);
}

// PAGE FIFTEEN (NO)

void pageFifteen() {
  background(147, 195, 224);
  image(p15,0,0);

  fill(0);
  textSize(30);
  text("The cards", 250, 60);
  textSize(40);
  text("ARREST", 250, 100);
  textSize(20);
  text("you for trespassing!", 340, 120);
  text("Oh No! You are taken straight to trial without due process! ", 200, 170);
  text("Defend yourself or have a court-appointed attorney?", 220, 195);
  textSize(20);
  // Left Button
  if (overButton(b22x, b22y, b22w, b22h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b22x, b22y, b22w, b22h);
  textAlign(CENTER);
  fill(0);
  text("Defend Yourself!", b22x + b22w/2, b22y + 32);

  // Right Button
  if (overButton(b23x, b23y, b23w, b23h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b23x, b23y, b23w, b23h);
  fill(0);
  text("Get an attorney", b23x + b23w/2, b23y + 32);
  textAlign(LEFT);
}

// PAGE SIXTEEN (defend yourself!) back to page 1 

void pageSixteen() {
  background(195, 147, 224);
  image(p16,0,0);
  fill(0);
  textSize(25);
  text("You are thrown to the", 350, 100); 
  textSize(40);
  text("GIANT DOG!", 350, 170);
  textSize(30);
  text("Begin Again!", 350, 230);
  textSize(25);
  // Button
  if (overButton(b24x, b24y, b24w, b24h) == true) {
    fill(255); 
  } 
  else {
    fill(170,86,86); 
  }
  rect(b24x, b24y, b24w, b24h);
  fill(0);
  textAlign(CENTER);
  text("Back", b24x + b24w/2, b24y + 32);
  textAlign(LEFT);
}

// PAGE SEVENTEEN (ATTORNEY)

void pageSeventeen() {
  background(147, 195, 224);
  image(p17,0,0);

  fill(0);
  textSize(25);
  text("Mr. Hare, your attorney,", 10, 240);
  text("presents your case to the jury.", 20, 270);
  textSize(35);
  text("Interrupt the jury?", 30, 320);
  textSize(20);
  // Left Button
  if (overButton(b25x, b25y, b25w, b25h) == true) {
    fill(255); 
  } 
  else {
    fill(46,255,142); 
  }
  rect(b25x, b25y, b25w, b25h);
  textAlign(CENTER);
  fill(0);
  text("No", b25x + b25w/2, b25y + 32);

  // Right Button
  if (overButton(b26x, b26y, b26w, b26h) == true) {
    fill(255); 
  } 
  else {
    fill(46,255,142); 
  }
  rect(b26x, b26y, b26w, b26h);
  fill(0);
  text("Yes", b26x + b26w/2, b26y + 32);
  textAlign(LEFT);
}

// PAGE EIGHTEEN  (NO)

void pageEighteen() {
  background(195, 147, 224);
  image(p18,0,0);
  fill(0);
  textSize(30);
  text("The White Rabbit sounds his horn!", 20, 100); 
  textSize(40);
  text("Congrats!", 20, 140); 
  textSize(25);
  text("You posted bail!", 20, 170); 
  text("You Won! The End!", 20, 250); 
  // Button
  if (overButton(b27x, b27y, b27w, b27h) == true) {
    fill(255); 
  } 
  else {
    fill(255,46,46); 
  }
  rect(b27x, b27y, b27w, b27h);
  fill(0);
  textAlign(CENTER);
  text("Back", b27x + b27w/2, b27y + 32);
  textAlign(LEFT);
}

// PAGE NINETEEN  (YES)

void pageNineteen() {
  background(195, 147, 224);
  image(p19,0,0);
  fill(0);
  textSize(20);
  text("The judge finds you in contempt of court!", 340, 100); 
  text("Off to the", 340, 150); 
  textSize(35);
  text("WONDER WARD", 340, 190); 
  textSize(25);
  text("Begin Again!", 380, 240); 
  // Button
  if (overButton(b28x, b28y, b28w, b28h) == true) {
    fill(255); 
  } 
  else {
    fill(153); 
  }
  rect(b28x, b28y, b28w, b28h);
  fill(0);
  textAlign(CENTER);
  text("Back", b28x + b28w/2, b28y + 32);
  textAlign(LEFT);
}



