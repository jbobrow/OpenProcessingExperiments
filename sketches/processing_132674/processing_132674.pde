
int cx, cy;
float secondsRadius;
float clockDiameter;
LED[] leds = new LED[60];
int lastSecond, currentSecond;

char mode;

color secondColor = color(255, 0, 0);
color minuteColor = color(0, 255, 0);
color hourColor = color(0, 0, 255);
int offset;

void setup() {
  size(360, 360);

  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  clockDiameter = radius * 1.8;

  cx = width / 2;
  cy = height / 2;

  color c = color(192, 192, 0);

  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a-90);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    leds[a/6] = new LED(x, y);
  }
  lastSecond = -1;
  max = leds.length;
  led = 0;
  lastMillis = millis();
  offset = 0;
}

void keyPressed() {
  mode = key;
}

void draw() {
  switch(mode) {
  case '1':
    drawFiller();
    break;
  case '2':
    drawPac();
    break;
  default:
    drawClock();
    break;
  }
}


void drawFace() {
  background(0);
  fill(80);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);
}

void drawClock() {
  currentSecond = second();
      for (int i = 0; i < leds.length; i++) {
      leds[i].setState(true);
    }
  if (currentSecond != lastSecond) {
    drawFace();
    for (int i = 0; i < leds.length; i++) {
      color col = color(100, 100, 100);
      if ( i % 5 == 0) col = color(150, 150, 150);
      leds[i].updateColor(col);
    }
    int currentHour = hour() % 12;
    int currentMinute = minute();
    leds[currentSecond].updateColor(secondColor);
    leds[currentHour*5].updateColor(hourColor);
    leds[currentMinute].updateColor(minuteColor);
    lastSecond = currentSecond;
  }
}

int max;
int led;
int currentMillis, lastMillis;

void drawFiller() {
  currentMillis = millis();
  if (currentMillis > lastMillis) {
    leds[led].setState(true);
    if (led != 0) {
      leds[led-1].setState(false);
    }
    drawFace();
    drawFillerLEDs();
    lastMillis = currentMillis;
    led++;
    if (led == max ) {
      led = 0;
      max--;
    }
    if (max == 0) resetFiller();
  }
}

void drawFillerLEDs() {
  for (int i = 0; i < leds.length; i++) {
    color fillerLEDcolor = color(0);
    if (leds[i].state == true) fillerLEDcolor = color(255, 0, 0);
    leds[i].updateColor(fillerLEDcolor);
  }
}

void resetFiller() {
  for (int i = 0; i < leds.length; i++) {
    leds[i].setState(false);
  }
  max = leds.length;
}

class LED {
  color ledColor;
  float x, y;
  boolean state;
  color currentColor;
  LED(float xpos, float ypos) { 
    x = xpos;
    y = ypos;
  };
  void drawLED() {
    strokeWeight(2);
    currentColor = color(0);
    if (state == true) currentColor = ledColor;
    stroke(currentColor);
    fill(currentColor);
    ellipse(x, y, 5, 5);
  }
  void updateColor(color c) {
    ledColor = c;
    drawLED();
  }
  void setState(boolean s) {
    state = s;
  }
};

int direction = 1;

void drawPac() {
  int startLED = 15;
  drawFace();
  color yellow = color(255, 255, 0);
  color grey = color(100, 100, 100);
  for (int i = 0; i < leds.length; i++) {
    leds[i].updateColor(yellow);
    leds[i].setState(true);
  }
  currentMillis = millis();
  if (currentMillis > lastMillis+100) {
    lastMillis = currentMillis;
    offset = offset + direction;
    if (offset > 5) direction = -1;
    if (offset == 0) direction = 1;
  }
  for (int i = 0; i < offset; i++) {
    leds[startLED-i].setState(false);
    leds[startLED].setState(false);
    leds[startLED+i].setState(false);
  }
}


