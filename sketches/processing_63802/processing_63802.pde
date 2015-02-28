
final float marginOrientationPoints = 50.0;

final float widthHoursCircle = 235.0;
final float heightHoursCircle = 235.0;

final float widthMinutesCircle = 155.0;
final float heightMinutesCircle = 155.0;

final float widthSecondsCircle = 75.0;
final float heightSecondsCircle = 75.0;

final color colorHours = color(186, 193, 34);
final color colorMinutes = color(199, 0, 56);
final color colorSeconds = color(208, 231, 255);

final color colorOrientation = color(255, 255, 255);
final color colorBackground = color(0, 0, 0);

final int stroke = 5;

PFont font;


void setup() {
  size(500, 500);
  smooth();
  font = loadFont("Lobster-48.vlw");
  textFont(font, 26);
}

void draw() {
  background(colorBackground);
  strokeWeight(stroke);
  drawText();
  drawOrientationPoints();
  drawSecondsCircle();
  drawMinutesCircle();
  drawHoursCircle();
}

void drawText() {
  String text;
  if (hour() > 12){
    text = "p.m.";
  }
  else text = "a.m.";
  text(text, width/2 + 3, height/2 + 5);
  textAlign(CENTER);
  fill(255, 255, 255);
  noFill();
}

void drawOrientationPoints() {
  stroke(colorOrientation);
  //clock-wise
  point(width/2, height/2 - heightHoursCircle/2 - marginOrientationPoints);
  point(width/2 + widthHoursCircle/2 + marginOrientationPoints, height/2);
  point(width/2, height/2 + heightHoursCircle/2 + marginOrientationPoints);
  point(width/2 - widthHoursCircle/2 - marginOrientationPoints, height/2);
}

void drawSecondsCircle() {
  stroke(colorSeconds);
  float secondsValue = (second()/60.0 + 1);
  arc(width/2, height/2, widthSecondsCircle, heightSecondsCircle, TWO_PI - PI/2, TWO_PI * (secondsValue) - PI/2);
}

void drawMinutesCircle() {
  stroke(colorMinutes);
  float minutesValue = (minute()/60.0 + 1);
  arc(width/2, height/2, widthMinutesCircle, heightMinutesCircle, TWO_PI - PI/2, TWO_PI * (minutesValue) - PI/2);
}

void drawHoursCircle() {
  stroke(colorHours);
  float hoursValue = (((hour()%12.0)/12.0) + 1);
  arc(width/2, height/2, widthHoursCircle, heightHoursCircle, TWO_PI - PI/2, TWO_PI * (hoursValue) - PI/2);
}

