
/*****************************************
 * Assignment #4
 * Name:         Yunqi Chen
 * E-mail:       ychen07@brynmawr.edu
 * Course:       CS 110 - Section 001
 * Submitted:    02 OCT 2012
 * 
 * This program tells the moral that 'Everyone Can be a King'. It composes of
 a stage, 20 rabbits that used to be normal but will turn into a king when 
 the mouse passes over, and four spotlights that is constantly changing and 
 will change brightness along with the vertical position of mouse. 
 The programs employs techniques such as arrays, if conditionals, for loops, 
 functions, texts.
 ***********************************************/
int[]x = new int [20];
int[]y = new int [20];
int[]r = new int [20];

void setup() {
  size(500, 500);
  smooth();
  frameRate(10);  
  //initialize the parameters of rabbits; if initialize in void draw() then the rabbits won't be static
  for ( int i = 19; i >= 0; i --) {
    x[i] = (int) random(25, 475);
    y[i] = (int) random (280, 450);
    r[i] = (int) random (10, 30);
  }
}

void draw() {
  drawStage();  
  for ( int i = 19; i >= 0; i --) {
    drawRabbit(x[i], y[i], r[i]);
  }
  drawLight();
  mouseMoved();
  //write caption  
  String s = "   EVERYONE CAN BE A KING!";
  fill(255);
  text(s, 250, 200, 200, 80);
}

void mouseMoved() {
  for (int i = 19; i>= 0; i --) {
    if (mouseX >= x[i] - r[i] && mouseX <= x[i] + r[i] && mouseY >= y[i]-r[i] && mouseY <= y[i]+r[i]) {
      coronation(x[i], y[i], r[i]);
      return;
    }
  }
}


/** Draw the stage, including floors and curtains
 *return type: void
 */
void drawStage() {
  //draw the blue background
  rectMode(CENTER);
  fill(15, 38, 162);
  noStroke();
  rect(250, 250, width, height);
  //draw the wood floor
  fill(245, 144, 12);
  noStroke();
  rect(250, 400, width, 200);
  for (int p = 0; p <= 500; p += 25) {
    int q = 100 + p*15/25; 
    stroke(124, 73, 6);
    strokeCap(ROUND);
    strokeWeight(2);
    line(p, 480, q, 320);
  }
  //draw the side curtains
  strokeWeight(10);
  stroke(137, 3, 14);
  fill(227, 14, 32);
  rect(60, 180, 100, 350);
  rect(440, 180, 100, 350);
  rect(30, 200, 50, 420);
  rect(470, 200, 50, 420);
  //draw the upper curtains
  for (int i = 25; i <= 475; i += 50) {
    strokeWeight(10);
    stroke(137, 3, 14);
    fill(227, 14, 32);
    if ((i % 100) == 25) {
      rect (i, 20, 50, random(70, 90));
    }
    else {
      rect (i, 20, 50, random(50, 65));
    }
  }
}


/** Draw the origial plebian rabbits
 * input: randomized position and size of each rabbit
 * return type: void
 */
//draw Plain Rabbits
void drawRabbit(int x, int y, int r) {
  stroke(0);
  strokeWeight(4);
  fill(255);
  //draw body
  beginShape();
  vertex(x - 0.5*r, y + 0.8*r);
  vertex(x + 0.5*r, y + 0.8*r);
  vertex(x + r, y + 3*r);
  vertex(x - r, y + 3*r);
  endShape(CLOSE);
  //draw ears
  strokeWeight(3);
  ellipseMode(CENTER);
  ellipse(x - 0.3*r, y - 0.8*r, 0.3*r, 1.7*r);
  ellipse(x + 0.3*r, y - 0.8*r, 0.3*r, 1.7*r);
  //draw head
  strokeWeight(4);
  ellipse(x, y, 2*r, 2*r);
}


/** Turn the rabbit into a king
 *input: the position and size of the particular rabit
 *returns no value
 */
void coronation(int x, int y, int r) {
  drawRabbit(x, y, r);
  //draw cloak
  stroke(0);
  strokeWeight(3);
  fill(255, 0, 0);
  triangle(x - 0.5*r, y + 0.8*r, x - 0.1*r, y + 0.8* r, x - r, y + 3*r);
  triangle(x - 0.1*r, y + 0.8*r, x + 0.5*r, y + 0.8* r, x + r, y + 3*r);
  //draw crown
  fill(255, 255, 0);
  for (float k = x - 0.75*r; k <= x + 0.75*r; k += 0.5*r) {
    triangle(k, y-r, k-0.25*r, y, k + 0.25*r, y);
  }
  //draw eyes
  strokeCap(SQUARE);
  strokeWeight(4);
  stroke(0);
  line(x - 0.75*r, y + 0.5*r, x - 0.25*r, y + 0.5*r);
  line(x + 0.2* r, y + 0.5*r, x + 0.72*r, y + 0.5*r);
}


/** Draw the spotlight
 */
void drawLight() {
  int b;
  noStroke(); 
  if (mouseY<200) {  
    b = (200 - mouseY);
  }
  else {
    b = 40;
  }
  int e = (int)random(150, 255);
  int f =(int)random(150, 255);
  int g = (int) random(150, 255);
  constrain(b, 0, 80);
  for (int m = 3; m >=0; m --) {
    fill(e, f, g, b);
    int h = (int) random(m*100, m*200);
    triangle(h, 50, 100, 500, 400, 500);
  }
}


