
/* Francis Sheehan
 Homework 3
 Visual Foundation Studio
 */
 
static int frameHeight = 400;
static int frameWidth = 400;
static int fps = 12;
float x = 140;
float y = 270;
boolean directionX = true; // true = left, false = right
boolean directionY = true; // true = down, false = up
 
Point point1 = new Point(200, 63);
Point point2 = new Point(340, 165);
Point point3 = new Point(290, 315);
Point point4 = new Point(135, 315);
Point point5 = new Point(80, 165);
Point center = new Point(200, 200);
 
PointLine line1 = new PointLine(point1, point2);
PointLine line2 = new PointLine(point2, point3);
PointLine line3 = new PointLine(point3, point4);
PointLine line4 = new PointLine(point4, point5);
PointLine line5 = new PointLine(point5, point1);
 
PointLine inner1 = new PointLine(point1, center);
PointLine inner2 = new PointLine(point2, center);
PointLine inner3 = new PointLine(point3, center);
PointLine inner4 = new PointLine(point4, center);
PointLine inner5 = new PointLine(point5, center);
 
void setup() {
  size(400, 400);
  frameRate(fps);
  smooth(8);
}
 
void drawLines(Point point1, Point point2) {
  line(point1.x, point1.y, point2.x, point2.y);
}
 
void draw() {
  background(int(random(0, 50)), int(random(0, 50)), int(random(0, 50)));
 
  pentagon();
  P();
  determineTranslation();
}
 
void pentagon() {
  strokeWeight(int(random(2, 10)));
  stroke(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
 
  // Randomize lines
  line1.randomize(50, 50);
  line2.randomize(50, 50);
  line3.randomize(50, 50);
  line4.randomize(50, 50);
  line5.randomize(50, 50);
 
  // Outline
  line1.drawLines();
  line2.drawLines();
  line3.drawLines();
  line4.drawLines();
  line5.drawLines();
 
  // Inner lines (center on the center point ())
  strokeWeight(int(random(1, 5)));
  stroke(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
 
  inner1.drawLines();
  inner2.drawLines();
  inner3.drawLines();
  inner4.drawLines();
  inner5.drawLines();
}
 
void P() {
  // Pulls a random font from a predefined list of fonts, then draws the letter "P" at 140, 270
  PFont letter;
  String[] fonts = {
    "Cambria", "Arial", "Georgia", "Times New Roman", "Impact", "Palatino Linotype", "Verdana", "Trebuchet MS", "Impact"
  };
  int index = int(random(fonts.length));
  letter = createFont(fonts[index], 230, true);
  fill(255);
   
  translate(x, y);
 
  textFont(letter);
  text("P", 0, 0);
}
 
void determineTranslation(){
  if(x > frameWidth){
    directionX = false;
  }
  else if(x < 0){
    directionX = true;
  }
  if(y > frameWidth){
    directionY = false;
  }
  else if(y < 0){
    directionY = true;
  }
   
  if(directionX == true){
    x += 1.5;
  }
  else{
    x -= 1.5;
  }
  if(directionY == true){
    y += 4.2;
  }
  else{
    y -= 4.2;
  }
}

class PointLine {
  Point startPoint;
  Point endPoint;
 
  PointLine(Point point1, Point point2) {
    startPoint = point1;
    endPoint = point2;
  }
 
  void randomize(int point1Offset, int point2Offset) {
    startPoint.randomize(point1Offset, point1Offset);
    endPoint.randomize(point2Offset, point2Offset);
  }
 
  void drawLines() {
    line(startPoint.x, startPoint.y, endPoint.x, endPoint.y);
  }
}
class Point {
  int x;
  int y;
  int origX;
  int origY;
 
  Point(int tempX, int tempY) {
    x = tempX;
    y = tempY;
    origX = tempX;
    origY = tempY;
  }
 
  void randomize(int xOffset, int yOffset) {
    x = origX + int(random(-xOffset, xOffset));
    y = origY + int(random(-yOffset, yOffset));
  }
}
