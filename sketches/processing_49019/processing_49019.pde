
int page = 1;   // Current page, this is the most important variable in the code

 
 
 
PFont font;
PImage p1;
PImage p2;
PImage p3;
PImage p4;
PImage p5;
PImage p6;
PImage p7;

int b1x = 157;   // Button 1 x-coordinate
int b1y = 146;  // Button 1 y-coordinate
int b1w = 65;  // Button 1 width
int b1h = 65;   // Button 1 height
 
int b2x = 25;  // Button 2
int b2y = 224;
int b2w = 86;
int b2h = 86;

int b3x = 288;  // Button 3
int b3y = 224;
int b3w = 86;
int b3h = 86;

int b4x = 47;  // Button 4
int b4y = 215;
int b4w = 63;
int b4h = 195;

int b5x = 151;  // Button 5
int b5y = 371;
int b5w = 97;
int b5h = 185;

int b6x = 279;  // Button 6
int b6y = 215;
int b6w = 71;
int b6h = 195;

int b7x = 278;  // Button 7
int b7y = 19;
int b7w = 63;
int b7h = 63;

int b8x = 278;  // Button 8
int b8y = 101;
int b8w = 63;
int b8h = 63;

int b9x = 55;  // Button 9
int b9y = 121;
int b9w = 80;
int b9h = 80;

int b10x = 268;  // Button 10
int b10y = 121;
int b10w = 80;
int b10h = 80;

int b11x = 118;  // Button 11
int b11y = 188;
int b11w = 169;
int b11h = 49;

int b12x = 119;  // Button 12
int b12y = 213;
int b12w = 169;
int b12h = 49;

void setup() {
  size(400, 620);
  smooth();
  font = loadFont("SansSerif-48.vlw");
  textFont(font);
  p1 = loadImage("p1.jpg");
  p2 = loadImage("p2.jpg");
  p3 = loadImage("p3.jpg");
  p4 = loadImage("p4.jpg");
  p5 = loadImage("p5.jpg");
  p6 = loadImage("p6.jpg");
  p7 = loadImage("p7.jpg");
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
  } else if (page == 7) {
    pageSeven();
  }
}


void mousePressed() {
  if (page == 1) { //envelope
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 2;
    }
  }
  else if (page == 3) {//dress
    if (overButton(b4x, b4y, b4w, b4h) == true) {
      page = 4;
    } else if (overButton(b5x, b5y, b5w, b5h) == true) {
      page = 4;
    } else if (overButton(b6x, b6y, b6w, b6h) == true) {
      page = 4;
    }
}
   else if (page == 2) {//invite
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 3;
    } else if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 7;
    }
   }
    
  else if (page == 4){ //picnic
    if (overButton(b7x, b7y, b7w, b7h) == true) {
      page = 5;
    } else if (overButton(b8x, b8y, b8w, b8h) == true) {
      page = 7;
    }
  }
  else if (page == 5) {//lego
    if (overButton(b9x, b9y, b9w, b9h) == true) {
      page = 6;
    } else if (overButton(b10x, b10y, b10w, b10h) == true) {
      page = 7;
    }
   }
   else if (page == 6) {//thank
    if (overButton(b11x, b11y, b11w, b11h) == true) {
      page = 1;
    }
   }
   else if (page == 7) {//bye
    if (overButton(b12x, b12y, b12w, b12h) == true) {
      page = 1;
    }
   }
  }


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
  background(p1);
 
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
  background(p2);
   
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
  background(p3);
  //text("You end up in a sea of tea and drown.", 50, 100);
  //button
   if (overButton(b4x, b4y, b4w, b4h) == true) {
    noFill();
  }
  else {
    noFill();
  }
  rect(b4x, b4y, b4w, b4h);
  noFill();
   
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
 
// PAGE FOUR
 
void pageFour() {
  background(p4);
// Left Button
  if (overButton(b7x, b7y, b7w, b7h) == true) {
    noFill();
  }
  else {
    noFill();
  }
  rect(b7x, b7y, b7w, b7h);
  textAlign(CENTER);
  fill(0);
  //text("1", b1x + b1w/2, b1y + 32);
   
  // Right Button
  if (overButton(b8x, b8y, b8w, b8h) == true) {
    noFill();
  }
  else {
    noFill();
  }
  rect(b8x, b8y, b8w, b8h);
  fill(0);
  //text("2", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
  }
  
// PAGE FIVE
 
void pageFive() {
  background(p5);
   
// Left Button
  if (overButton(b9x, b9y, b9w, b9h) == true) {
    noFill();
  }
  else {
    noFill();
  }
  rect(b9x, b9y, b9w, b9h);
  textAlign(CENTER);
  fill(0);
  //text("1", b1x + b1w/2, b1y + 32);
   
  // Right Button
  if (overButton(b10x, b10y, b10w, b10h) == true) {
    noFill();
  }
  else {
    noFill();
  }
  rect(b10x, b10y, b10w, b10h);
  fill(0);
  //text("2", b2x + b2w/2, b2y + 32);
  textAlign(LEFT);
  }
  
// PAGE SIX
 
void pageSix() {
  background(p6);
 
  // Left Button
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
  
// PAGE SEVEN
 
void pageSeven() {
  background(p7);
 
  // Left Button
  if (overButton(b12x, b12y, b12w, b12h) == true) {
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

