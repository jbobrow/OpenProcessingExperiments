

//---Interactive Clock
//---By Amanda Thai

//---Global Variables
int counter = 0;
int circleSize = 300;
PFont font;
PImage pencilMouse;

//Setup
void setup() {
  size(displayWidth, displayHeight);
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("BaronNeue-Outline-48.vlw");
  textFont(font, 48);
}

//Draw
void draw() {
  int seconds = second();
  int minutes = minute();
  int hours = hour();
  int day = day();
  int month = month();
  int year = year();

  float secondRot = map(seconds, 0, 59, 0, 360);
  float minuteRot = map (minutes, 0, 59, 0, 360);
  float hourRot = map (hours, 0, 23, 0, 360*2);
  float monthRot = map (month, 0, 11, 0, 360);
  float dayRot = map (day, 0, 30, 0, 360);
  float yearRot = map (year, 0, 10000, 0, 360);

  float secondsRadius = circleSize * 0.4;
  float minutesRadius = circleSize * 0.45;
  float monthRadius = circleSize * 0.15;
  float dayRadius = circleSize * 0.1;
  float yearRadius = circleSize * 0.2;


  //LETS YOU DRAW & ClEARS CANVAS AT 60 SECS
  stroke(random(255));
  if (mousePressed == true && seconds < 59) {
    pencilMouse = loadImage("pen.png");
    cursor(pencilMouse, 0, 0);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  else if (seconds == 59) {
    //BG COLOR CHANGES AS MOUSE MOVES
    float mx = mouseX;
    float my = mouseY;
    background(mx/width * 255, 150, my/height * 255);

    //BG LINES
    float randW = random(width);
    float randH = random(height);
    cursor(ARROW);
    noStroke();
    fill(random(255));
    rect(randW, randH, 1, randW);
    //  noStroke();
    //  fill(random(255));
    //  ellipse(randW, randH, 10, 10);
  }
  else {
    //BG COLOR CHANGES AS MOUSE MOVES
    float mx = mouseX;
    float my = mouseY;
    background(mx/width * 255, 150, my/height * 255);

    //BG LINES
    float randW = random(width);
    float randH = random(height);
    cursor(ARROW);
    noStroke();
    fill(random(255));
    rect(randW, randH, 1, randW);
    //  noStroke();
    //  fill(random(255));
    //  ellipse(randW, randH, 10, 10);
  }

  //SECONDS
  pushMatrix();
  //allows you to reset the starting point of the grid
  translate(width/2, height/2);
  rotate(radians(-90));
  //fill(242, 181, 225);
  float grayVal = map(seconds, 0, 59, 0, 360);
  color bgCol = color(grayVal, grayVal, grayVal);
  fill(bgCol);
  //fill(255);
  noStroke();
  arc(0, 0, circleSize, circleSize, 0, radians(secondRot));
  popMatrix();

  //MINUTES
  pushMatrix();
  translate(width/2, height/2); //allows you to reset the starting point of the grid
  rotate(radians(minuteRot));
  stroke(0);
  strokeWeight(5);
  strokeCap(ROUND);
  line(0, 10, 0, -120);
  popMatrix();

  //HOURS
  pushMatrix();
  translate(width/2, height/2); //allows you to reset the starting point of the grid
  rotate(radians(hourRot));
  stroke(0);
  strokeWeight(5);
  strokeCap(ROUND);
  line(0, 10, 0, -70);
  popMatrix();

  //MONTHS ARC
  pushMatrix();
  //allows you to reset the starting point of the grid
  translate(100, height/3);
  noStroke();
  fill(255, 75);
  ellipse(0, 0, circleSize/3 - 1, circleSize/3 - 1);
  rotate(radians(-90));
  fill(255);
  //fill(255);
  noStroke();
  arc(0, 0, circleSize/3, circleSize/3, 0, radians(monthRot));
  popMatrix();

  //DAYS ARC
  pushMatrix();
  //allows you to reset the starting point of the grid
  translate(200, height/3);
  noStroke();
  fill(255, 75);
  ellipse(0, 0, circleSize/4 - 1, circleSize/4 - 1);
  rotate(radians(-90));
  fill(255);
  //fill(255);
  noStroke();
  arc(0, 0, circleSize/4, circleSize/4, 0, radians(dayRot));
  popMatrix();

  //YEARS ARC
  pushMatrix();
  //allows you to reset the starting point of the grid
  translate(165, height/2 - 30);
  noStroke();
  fill(255, 75);
  ellipse(0, 0, circleSize/2 - 1, circleSize/2 - 1);
  rotate(radians(-90));
  fill(255);
  //fill(255);
  noStroke();
  arc(0, 0, circleSize/2, circleSize/2, 0, radians(yearRot));
  popMatrix();

  clockinfo(hours, minutes, seconds, month, day, year);
  ticks(secondsRadius, minutesRadius);
  dateTicks(monthRadius, dayRadius, yearRadius);
}

void clockinfo(int hours, int minutes, int seconds, int month, int day, int year) {
  fill(255);
  text("the current time is: " + hours + ":" + minutes + ":" + seconds, 50, 75);
  text("Today is: " + month + "/" + day + "/" + year, 50, 150);
}

void ticks(float secondsRadius, float minutesRadius) {
  //SECONDS TICKS
  stroke(0);
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = width/2 + cos(angle) * secondsRadius;
    float y = height/2 + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();

  //HOUR TICKS
  stroke(0);
  strokeWeight(5);
  beginShape(POINTS);
  for (int b = 0; b < 360; b+=30) {
    float angle = radians(b);
    float x = width/2 + cos(angle) * minutesRadius;
    float y = height/2 + sin(angle) * minutesRadius;
    vertex(x, y);
  }
  endShape();
}

void dateTicks(float monthRadius, float dayRadius, float yearRadius) {
  //MONTHS TICKS
  stroke(0);
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=30) {
    float angle = radians(a);
    float x = 100 + cos(angle) * monthRadius;
    float y = height/3 + sin(angle) * monthRadius;
    vertex(x, y);
  }
  endShape();

  //DAYS TICKS
  stroke(0);
  strokeWeight(2);
  beginShape(POINTS);
  for (int b = 0; b < 360; b+=12) {
    float angle = radians(b);
    float x = 200 + cos(angle) * dayRadius;
    float y = height/3 + sin(angle) * dayRadius;
    vertex(x, y);
  }
  endShape();

  //YEARS TICKS
  stroke(0);
  strokeWeight(2);
  beginShape(POINTS);
  for (int b = 0; b < 360; b+=36) {
    float angle = radians(b);
    float x = 165 + cos(angle) * yearRadius;
    float y = (height/2 - 30) + sin(angle) * yearRadius;
    vertex(x, y);
  }
  endShape();
}



