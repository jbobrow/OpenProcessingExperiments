
/* Francis Sheehan
 Homework 2
 Visual Foundation Studio
 */

void setup() {
  size(400, 400);
  frameRate(5);
}

void draw() {
  background(int(random(0, 50)), int(random(0, 50)), int(random(0, 50))); 

  pentagon();
  P();
}

void pentagon() {
  smooth(8);
  strokeWeight(int(random(2, 10)));
  stroke(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));

  // Determines where the points will be (50 px variance on all points).
  int point1X = 200 + int(random(-25,25));
  int point1Y = 63 + int(random(-25,25));
  int point2X = 340 + int(random(-25,25));
  int point2Y = 165 + int(random(-25,25));
  int point3X = 290 + int(random(-25,25));
  int point3Y = 315 + int(random(-25,25));
  int point4X = 135 + int(random(-25,25));
  int point4Y = 315 + int(random(-25,25));
  int point5X = 80 + int(random(-25,25));
  int point5Y = 165 + int(random(-25,25));
  int centerX = 200 + int(random(-25,25));
  int centerY = 200 + int(random(-25,25));

  // Outline
  line(point1X, point1Y, point2X, point2Y);
  line(point2X, point2Y, point3X, point3Y);
  line(point3X, point3Y, point4X, point4Y);
  line(point4X, point4Y, point5X, point5Y);
  line(point5X, point5Y, point1X, point1Y);

  // Inner lines (center on the center point ())
  strokeWeight(int(random(1, 5)));
  stroke(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));

  line(point1X, point1Y, centerX, centerY);
  line(point2X, point2Y, centerX, centerY);
  line(point3X, point3Y, centerX, centerY);
  line(point4X, point4Y, centerX, centerY);
  line(point5X, point5Y, centerX, centerY);
}

void P() {
  smooth(8);
  // Pulls a random font from a predefined list of fonts, then draws the letter "P" at 140, 270 
  PFont letter;
  String[] fonts = {
    "Cambria", "Arial", "Georgia", "Times New Roman", "Impact", "Palatino Linotype", "Verdana", "Trebuchet MS", "Impact"
  };
  int index = int(random(fonts.length));
  letter = createFont(fonts[index], 230, true);
  fill(255);

  textFont(letter);
  text("P", 140, 270);
}
