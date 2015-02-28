
/*****************************************
 * Assignment 3
 * Name:         Michelle Neuburger
 * E-mail:       mneuburger@brynmawr.edu
 * Course:       CS 110 - Section 1
 * Submitted:    10/3/2012
 * 
 * Drawing lamps above and people near a bookshelf with books using functions.
 ***********************************************/

//variables
int u = 0; //blackwhite background
float x; //book x position
float y; //book y position

//setup: size, background, draw shelf, light switch, first 3 books
void setup() {
  size(500, 500);
  background(255);
  drawShelf();
  drawRed();
  drawBlue();
  drawRed();
  fill(0);
  noStroke();
  rect(0,450,50,50);
}

//draw 3 people, 3 lamps
void draw() {
  drawPerson(100);
  drawPerson(250);
  drawPerson(400);
  drawLamp(100);
  drawLamp(250);
  drawLamp(400);
}

//redrawing background and drawing books during specific keypresses
void keyPressed() {
  if (key == 'b') {
    blackWhite();
    u = u + 1;
  } else if (key == 'h') {
    drawRed();
  } else if (key == 'l') {
    drawBlue();
  }
}

//blackwhite: alternate white and black background
//redraw shelf and off switch on "b" key press
void blackWhite() {
  if (u%2 == 0) {
    fill(0);
  } else {
    fill(255);
  }
  noStroke();
  rect(0, 0, 500, 500);
  drawShelf();
  if (u%2 == 0) {
    fill(255);
   } else {
    fill(0);
   }
   noStroke();
   rect(0,450,50,50);
}

//draw shelf: brown rectangle, lines for shelves
void drawShelf() {
  stroke(67, 32, 1);
  strokeWeight(8);
  fill(103, 58, 18);
  rect(50, 70, 400, 350);
  int s = 140;
  while (s < 420) {
    line(50, s, 450, s);
    s = s + 70;
  }
}

//set x and y variables for random placement of books
void bookPlacement() {
  int n = int(random(1, 5));
  int f = int(random(1, 6));
  if (n == 1) {
    x = 55;
  } else if (n == 2) {
    x = 160;
  } else if (n == 3) {
    x = 265;
  } else if (n == 4) {
    x = 360;
  }
  if (f == 1) {
    y = 75;
  } else if (f == 2) {
    y = 145;
  } else if (f == 3) {
    y = 215;
  } else if (f == 4) {
    y = 287;
  } else if (f == 5) {
    y = 357;
  }
  //print variable values for troubleshooting
  println("n = " + n);
  println("x = " + x);
  println("f = " + f);
  println("y = " + y);
}

//draw the red book
void drawRed() {
  float bookWidth;
  float bookHeight;
  bookPlacement();
  bookWidth = random(85);
  bookHeight = random(50, 60);
  fill(255, 0, 0);
  noStroke();
  rect(x, y, bookWidth, bookHeight);
}

//draw the blue book
void drawBlue() {
  float bookWidth;
  float bookHeight;
  bookPlacement();
  bookWidth = random(85);
  bookHeight = random(50, 60);
  noStroke();
  fill(0, 0, 255);
  rect(x, y, bookWidth, bookHeight);
}

//draw people (shirts and hand
void drawPerson(int personX) {
  float distance = dist(personX, 500, mouseX, mouseY);
  noStroke();
  fill(155, (distance/2), 255);
  ellipse(personX, 460,35, 60);
  fill(200, 0, (distance/2));
  ellipse(personX, 500, 100, 25);
}

//draw lamps
void drawLamp(int lampX) {
  fill(10,95,5);
  beginShape();
   vertex((lampX - 60),25);
   vertex((lampX + 60),25);
   vertex((lampX + 30),0);
   vertex((lampX - 30),0);
  endShape(CLOSE);
  if (((mouseX < (lampX + 60)) && (mouseX > (lampX - 60))) && (mouseY < 25)) {
    fill(255,247,3);
    ellipse(lampX, 30, 55, 45);
  } else if ((mouseY > 450) && (mouseX < 50)) {
    if (u%2 == 0) {
    fill(255);
    } else {
    fill(0);
    }
    rect(0,25,500,30);
  }
}
