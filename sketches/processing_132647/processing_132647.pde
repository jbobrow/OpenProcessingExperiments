
int cx, cy;
float secondsRadius;
float clockDiameter;
LED[] leds = new LED[60];
boolean[] ledStates = new boolean[60];
int lastSecond, currentSecond;
color col;
int max;
int led;
int currentMillis, lastMillis;


color secondColor = color(255, 0, 0);
color minuteColor = color(0, 255, 0);
color hourColor = color(0, 0, 255);

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
    leds[a/6] = new LED(c, x, y);
  }
  lastSecond = -1;
  max = leds.length;
  led = 0;
  lastMillis = millis();
}

void draw() {
  //  drawClock();
  //drawFace();

  drawFiller();
}

void drawFiller() {

  filler();
}

void filler() {
  //  max = leds.length;
  currentMillis = millis();
  if (currentMillis > lastMillis+1) {
    ledStates[led] = true;
    if (led != 0) {
      ledStates[led-1] = false;
    }
    drawFace();
    drawLEDs();
    lastMillis = currentMillis;
    led++;
    if (led == max ) {
      led = 0;
      max--;
    }
    if (max == 0) {
      for (int j = 0; j < ledStates.length; j++) {
        ledStates[j] = false;
      }
      max = leds.length;
    }
  }
}
void drawLEDs() {
  for (int i = 0; i < leds.length; i++) {
    if (ledStates[i]) {
      leds[i].updateColor(color(255, 0, 0));
    } 
    else {
      leds[i].updateColor(color(100, 100, 100));
    }
  }
}


void drawClock() {
  currentSecond = second();
  if (currentSecond != lastSecond) {
    drawFace();
    for (int i = 0; i < 60; i++) {
      if ( i % 5 == 0) {
        col = color(150, 150, 150);
      } 
      else {
        col = color(100, 100, 100);
      }
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


void drawFace() {
  background(0);
  fill(80);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);
}
class LED {
  color pixelColor;
  float x, y;
  LED(color c, float xpos, float ypos) { 
    pixelColor = c;
    x = xpos;
    y = ypos;
  };
  void draw() {
    strokeWeight(2);
    stroke(pixelColor);
    fill(pixelColor);
    ellipse(x, y, 5, 5);
  }
  void updateColor(color c) {
    pixelColor = c;
    draw();
  }
};

