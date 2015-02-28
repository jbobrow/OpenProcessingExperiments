
// Project 4 Template
// To understand this code, read Structure 3 (p. 181)
// The RollDice example shows the basic mechanics of 
// working with functions

int page = 1;   // Current page, this is the most important variable in the code

PFont font;
PImage scr1; 
PImage hand;
PImage scr2;
PImage scr3;
PImage scr4;
PImage scr5;
PImage scr6;

int b1x = 310;   // Button 1 x-coordinate
int b1y = 250;  // Button 1 y-coordinate
int b1w = 25;  // Button 1 width
int b1h = 25;   // Button 1 height

int b2x = 90;  // Button 2
int b2y = 335;
int b2w = 100;
int b2h = 40;

int b3x = 475;  // Button 3
int b3y = 335;
int b3w = 100;
int b3h = 40;

int b4x = 460;  // Button 4
int b4y = 390;
int b4w = 100;
int b4h = 40;

int b5x = 90;  //dress1
int b5y = 280;
int b5w = 60;
int b5h = 130;

int b6x = 225;  //dress2
int b6y = 230;
int b6w = 60;
int b6h = 130;

int b7x = 360;  //dress3
int b7y = 270;
int b7w = 60;
int b7h = 130;

int b8x = 495;  //dress4
int b8y = 240;
int b8w = 60;
int b8h = 130;

int b9x = 50;  //yes
int b9y = 330;
int b9w = 75;
int b9h = 25;

int b10x = 350;  //no
int b10y = 370;
int b10w = 75;
int b10h = 25;

int b11x = 40;  //again
int b11y = 380;
int b11w = 100;
int b11h = 40;

// You can define more buttons here following the same pattern

void setup() {
  size(640, 480); 
  smooth();
  font = loadFont("HelveticaNeue-UltraLight-24.vlw");
  textFont(font);
  scr1 = loadImage("scr1.jpg");
  hand = loadImage("hand.png");
  scr2 = loadImage("scr2ed.jpg");
  scr3 = loadImage("scr3.jpg");
  scr4 = loadImage("scr4.jpg");
  scr5 = loadImage("scr5.jpg");
  scr6 = loadImage("scr6.jpg");
}

void draw() {
  if (page == 1) {
    pageOne();
  } else if (page == 2) {
    pageTwo(); 
  } else if (page == 3) {
    pageThree(); 
  } else if (page == 4) {
    pageFour(); 
  } else if (page == 5) {
    pageFive(); 
  } else if (page == 6) {
    pageSix(); 
  }
}

void mousePressed() {
  if (page == 1) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 2;
    }
  }
  else if (page == 3) {//dress
    if (overButton(b5x, b5y, b5w, b5h) == true) {
      page = 5; 
    } else if (overButton(b6x, b6y, b6w, b6h) == true) {
      page = 5;
    } else if (overButton(b7x, b7y, b7w, b7h) == true) {
      page = 5;
    } else if (overButton(b8x, b8y, b8w, b8h) == true) {
      page = 5;
    }
}
   else if (page == 2) {//invite
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 3;
    } else if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 4;
    }
   }
   
  else if (page == 4){ //alice upset
    if (overButton(b4x, b4y, b4w, b4h) == true) {
      page = 1; 
    }
  }
  else if (page == 5) {//tea
    if (overButton(b9x, b9y, b9w, b9h) == true) {
      page = 6;
    } else if (overButton(b10x, b10y, b10w, b10h) == true) {
      page = 4;
    }
   }
     else if (page == 6) {//tea
    if (overButton(b11x, b11y, b11w, b11h) == true) {
      page = 1;
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


// PAGE ONE

void pageOne() {
  background(scr1);

  // Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(255, 255, 255, 100); 
  } 
  else {
    noFill(); 
  }
  //rect(b1x, b1y, b1w, b1h);
  textAlign(CENTER);
  noStroke();
  fill(0);
  //text("Yes", b1x + b1w/2, b1y + 32);
 
}

// PAGE TWO

void pageTwo() {
  background(scr2);
  
// Left Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    noFill(); 
  } 
  else {
    noFill(); 
  }
  rect(b2x, b2y, b2w, b2h);
  textAlign(CENTER);
  fill(0);
  //text("1", b1x + b1w/2, b1y + 32);
  
  // Right Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    noFill(); 
  } 
  else {
    noFill(); 
  }
  rect(b3x, b3y, b3w, b3h);
  fill(0);
  //text("2", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
  }
 

// PAGE THREE

void pageThree() {
  background(scr4);
  //text("You end up in a sea of tea and drown.", 50, 100);
  //button
    if (overButton(b5x, b5y, b5w, b5h) == true) {
    noFill(); 
  } 
  else {
    noFill(); 
  }
  rect(b5x, b5y, b5w, b5h);
  noFill();

 // Right Button
  if (overButton(b6x, b2y, b6w, b6h) == true) {
    noFill();
  } 
  else {
   noFill();
  }
  rect(b6x, b6y, b6w, b6h);
}

//PAGE FOUR

void pageFour() {
  background(scr3);
  
  fill(0);
  //text("Alice becomes upset.", 50, 100);
  
  // Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(255, 255, 255, 100); 
  } 
  else {
    noFill(); 
  }
  rect(b4x, b4y, b4w, b4h);
  textAlign(CENTER);
  fill(0);
  //text("Yes", b1x + b1w/2, b1y + 32);
}

//PAGE FIVE
void pageFive() {
  background(scr5);
  
  noFill();
  
  // Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    noFill(); 
  } 
  else {
    noFill(); 
  }
  rect(b1x, b1y, b1w, b1h);
  textAlign(CENTER);
  fill(0);
  //text("Yes", b1x + b1w/2, b1y + 32);
  
  // Right Button
  if (overButton(b9x, b9y, b9w, b9h) == true) {
   noFill(); 
  } 
  else {
    noFill(); 
  }
  rect(b10x, b10y, b10w, b10h);
  fill(0);
  //text("No", b2x + b2w/2, b2y + 32);

}
  
  //PAGE SIX
void pageSix() {
  background(scr6);
  noFill();
  
 if (overButton(b11x, b11y, b11w, b11h) == true) {
    fill(255, 255, 255, 100); 
  } 
  else {
    noFill(); 
  }
  //rect(b1x, b1y, b1w, b1h);
  textAlign(CENTER);
  noStroke();
  fill(0);
  //text("Yes", b1x + b1w/2, b1y + 32); 
  
}




