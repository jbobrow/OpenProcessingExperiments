
//Terrance Shields - Prof. Calli Higgins - HW 4.1 - 2/21/13

boolean square = true;
boolean ball = true;
boolean quad = true;

int bgChange = 0;

int bgColor = 255; 

color green = color(28, 198, 14);
color blue = color(14, 138, 198);
color purple = color(145, 14, 198);
color white = color(255);

float x = 10; // x location of square 
float y = 0;  // y location of square
float bx = 0; 
float by = 100; 
float qx = 0;
float qy = 400;
float squareSpeed = 0; // speed of square
float ballSpeed = 3;
float quadSpeed = 1;
float gravity = 0.1;


void setup() { 
  size(400, 400);
  smooth();
}

void draw() { 
  background(bgColor);

  // Display the square 
  fill(0); 
  noStroke(); 
  rectMode(CORNER); 
  rect(x, y, 30, 30);
  fill(255, 255, 0); 
  ellipseMode(CORNER); 
  ellipse(bx, by, 40, 40);

  if (square) { 
    x++;
    y = y + squareSpeed;
    squareSpeed = squareSpeed + gravity; 
  }
    if ((x > width) || (x < 0)) {
      x= x - 1;
      println(x);
    }
    // If square reaches the bottom // 
    if (y > height) {
      squareSpeed = squareSpeed * -0.95;
    }
    else if (!square) {
      squareSpeed = 0;
    }

  if (ball) { 
    bx = bx + ballSpeed;
    // If ball reaches the sides // 
    if ((bx > width) || (bx < 0)) {
      ballSpeed = ballSpeed * -1;
    }
  }
  else if (!ball) {
    fill(255, 0, 0);
    noStroke(); 
    ellipseMode(CORNER); 
    ellipse(bx, by, 40, 40);
    bx = bx + ballSpeed;
    if ((bx > width) || (bx < 0)) {
      ballSpeed = ballSpeed * -1;
    }
  }

  if (quad) { 
    fill(113, 63, 0); 
    noStroke(); 
    rectMode(CORNER); 
    rect(qx, qy, 80, 25);
    qx = qx + quadSpeed;
    qy = qy - quadSpeed;
    // If ball reaches the sides // 
    if ((qx > width) || (qx < 0)) {
      quadSpeed = quadSpeed * -1;
    }
  }
  else if (!quad) {
    fill(32, 160, 16);
    noStroke(); 
    ellipseMode(CORNER); 
    ellipse(qx, qy, 50, 50);
    qx = qx + quadSpeed;
    qy = qy - quadSpeed;   
    if ((qx > width) || (qx < 0)) {
      quadSpeed = quadSpeed * -1;
    }
  }

  if (bgChange == 0) {
    bgColor = (white);
  }

  if (bgChange == 1) {
    bgColor = (green);
  }
  if (bgChange == 2) {
    bgColor = (blue);
  }
  if (bgChange == 3) {
    bgColor = (purple);
  }
}

void mousePressed() {
  if (mouseX > x && mouseX < x+30 && mouseY > y && mouseY < y+30 && mousePressed) {
    square = !square;
    println("square clicked");
  }
  if (mouseX > bx && mouseX < bx+30 && mouseY > by && mouseY < by+30 && mousePressed) {
    ball = !ball;
    println("ball clicked");
  }

  if (mouseX > qx && mouseX < qx+30 && mouseY > qy && mouseY < qy+30 && mousePressed) {
    quad = !quad;
    println("quad clicked");
  }

  bgChange++;

  if (bgChange > 3) {
    bgChange = 0;
  }
}



