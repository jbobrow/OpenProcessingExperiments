
PImage img;
PShape robot;
PFont myFont;

void setup() {
  img = loadImage("rastabeach.jpg");
  size(500, 333);
  smooth();
  shapeMode(CENTER);
  robot = loadShape("robot.svg");
  myFont = loadFont("lobster_14.ttf");
  textFont(myFont, 40);

}

void draw() {
  background(img);
  float diameter = map(mouseX, 0, width, 10, 800);
  shape(robot, 150, 60, diameter, diameter);
  text("Welcome World", 200,60);
}
 




