
//using/ moifying example template of a clock from processing.org

int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
boolean night = false;
int hour = hour();
int min = minute() - 1;
float color1 = 0.0;
float color2 = 0.0;
float color3 = 0.0;
int countHour=0;
/* @pjs preload= "happy.jpg"; */
PImage img;
float tintvalue = map(hour() + norm(second(), 0, 60), 0, 60, 0, 255);


void setup() {
  img = loadImage("happy.jpg");
  size(640, 360);
  stroke(255);

  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;

  cx = width / 2;
  cy = height / 2;
}


void draw() {

  makeBackground(); //draws the background and controls the tinting og the days
  
  //draws ferris wheel and controls the cars moving, changing color, and so on
  drawFerrisWheel();

/*
  if (tintvalue < 100) {
    for (int x = 10; x >10; x-=1) {
      float y = random(0, height);
      stroke(255, 255, 51, 70);
      vertex(x*20, y);
      strokeWeight(3);
      stroke(255, 255, 51);
      vertex(x*20, y);
    }
  }
*/

  //draws the dots on the ferris wheel that shows the minutes
  drawTicks(cx, cy);


  endShape();
}



void makeBackground() {
  tintvalue = map(hour() + norm(second(), 0, 60), 0, 12, 0, 255);
  if (hour()!= hour) {
    hour = hour();
    countHour = hour;
    if( countHour == 12);
        night = !night;
        tintvalue = 0;
  }

  if ( night == true) {
    tint(255 - tintvalue);
  }
  else {
    tint(tintvalue);
  }
  image(img, 0, 0);
  image(img, 0, 0, width, height);
}



void drawTicks(int cx, int cy) {
  strokeWeight(8);
  beginShape(POINTS);
  int currentMin = minute();
  int color1 = 0;
  int color2 = 0;
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle- HALF_PI) * secondsRadius;
    float y = cy + sin(angle- HALF_PI) * secondsRadius;
    if (currentMin <=0) {
      color1 = 255;
      color2 = 51;
    }
    else {
      color1 = currentMin*4;
      color2 = currentMin*4;
    }
    stroke(255, color1, color2, 70);
    vertex(x, y);
    strokeWeight(3);
    stroke(255, color1, color2);
    vertex(x, y);
    currentMin-=1;
  }
}



void drawFerrisWheel() {
  noFill();
  strokeWeight(10);
  stroke(255);
  ellipse(cx, cy, clockDiameter, clockDiameter);
  strokeWeight(5);
  ellipse(cx, cy, clockDiameter/3, clockDiameter/3);
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;

  int maxNCars =6;
  float Spacing = TWO_PI / maxNCars;
  for (int numOfCars = maxNCars; numOfCars>0; numOfCars -= 1) {
    if (min != minute()) {
      color1 = random(0, 255);
      color2 = random(0, 255);
      color3 = random(0, 255);
      min = minute();
    }
    float px = cx + cos(s + numOfCars*Spacing) * secondsRadius;
    float py = cy + sin(s + numOfCars*Spacing) * secondsRadius;
    stroke(0);
    strokeWeight(2);
    line(cx, cy, px, py);
    stroke(color1, color2, color3);
    strokeWeight(50);
    point(px, py);
    strokeWeight(20);
    stroke(100, 150, 240);
    point(px, py);

    stroke(200, 50, 50);
    line(cx, cy, 100, height);
    line(cx, cy, width-100, height);
    strokeWeight(50);
    point(cx, cy);
  }
}



