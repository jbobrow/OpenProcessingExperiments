
//mouseOvers, basic functionalit
//jeg, coding for artists sandbox

//Variables
float xPosE, yPosE; //x and y position of ellipse (circle)
float xPosR, yPosR; //x and y postion of a rect
float sizeE, sizeR; //the width and height of the ellipse and rect, respectively.

color rectFillOn = color(234, 56, 78); //this is the color to used when the mouse is ON the rectangle
color rectFillOff = color(78, 56, 234); //this is the color to be used when the mouse is OFF the rectangle
color rectFill;//this variable will be the color of the rectangle, we will change its value as needed

color ellFillOn = color(23, 244, 89); //this is th color to be used when the mouse is ON the ellipse
color ellFillOff = color(89, 23, 244); //this is the color to be used when the mouse is OFF the ellipse
color ellFill; //this variable will be the color of the ellipse, we will change its value

void setup() {
  size(500, 500);
  xPosE = width/3; //so the ellipse is located 1/3rd of the way across the canvas
  xPosR = width/3 * 2; //so 2 times 1/3rd of the way across, or 2/3rd of the way across the canvas
  yPosE = height/2; //right in teh middle
  yPosR = height/2;
  sizeE = 100;
  sizeR = 100;
  smooth();
}

void draw() {
  background(123, 45, 67); //set a background that will be redrawn with every passing loop
  noStroke();

  fill(ellFill);
  ellipse(xPosE, yPosE, sizeE, sizeE);

  fill(rectFill);
  rectMode(CENTER);
  rect(xPosR, yPosR, sizeR, sizeR);

  if (mouseX > xPosR - sizeR/2 && mouseX < xPosR +sizeR/2 && mouseY > yPosR - sizeR/2 && mouseY < yPosR + sizeR/2) {
    rectFill = rectFillOn;
    println("Over the rectangle.");
  } else {
    rectFill = rectFillOff;
    println(" ");
  }

  float distance = dist(mouseX, mouseY, xPosE, yPosE);

  if (distance < sizeE/2) {
    ellFill = ellFillOn;
    println("Over the ellipse.");
  } else {
    ellFill = ellFillOff;
    println(" ");
  }
}

