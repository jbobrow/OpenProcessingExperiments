
int milliseconds = 0;
int seconds = 0;
int minutes = 0;
int hours = 0;

void setup() {
  size(750, 750);
  background(#272727);
  smooth();
}

void draw() {

  background(#272727);

  //SUN
  pushMatrix();
  stroke(#C62B00);
  strokeWeight(5);
  fill(#F5D102);
  float xmovement = 0;
  float ymovement = 0;
  xmovement = (random((width/2), (width/2)+2));
  ymovement = (random((height/2), (height/2)+2));
  ellipse(xmovement, ymovement, 125, 125);
  noStroke();
  fill(#F5D102, 50);
  ellipse(xmovement, ymovement, 100, 100); 
  popMatrix();


  //MERCURY - milliseconds
  pushMatrix();
  noFill();
  stroke(#FFFFFF, 150);
  strokeWeight(1);
  ellipse(width/2, height/2, random(225,229), random(225,229));
  milliseconds = (millis()/30);
  translate(width/2, height/2);
  rotate(radians(6 * milliseconds));
  fill(#FFFFFF);
  ellipse(random(80,83), random(80,83), 20, 20);
  popMatrix();


  //VENUS - seconds
  pushMatrix();
  noFill();
  stroke(#FFFFFF, 80);
  strokeWeight(1);
  ellipse(width/2, height/2, random(345,348), random(345,348));
  milliseconds = (millis()/70);
  translate(width/2, height/2);
  rotate(radians(6 * milliseconds));
  fill(#D3111E);
  ellipse(random(122,124), random(122,124), 40, 40);
  popMatrix();


  //Earth - minutes
  pushMatrix();
  noFill();
  stroke(#FFFFFF, 50);
  strokeWeight(1);
  ellipse(width/2, height/2, random(525,528), random(525,528));
  milliseconds = (millis()/250);
  translate(width/2, height/2);
  rotate(radians(6 * milliseconds));
  fill(#44CE0A);
  int earthx = 0;
  int earthy = 0;
  stroke(#0099F5);
  strokeWeight(3);
  ellipse(random(185,186), random(185,186), 55, 55);
  popMatrix();


  // fix for 24 hour clock
  if (hours > 12) {
    hours -= 12;
  }
}
