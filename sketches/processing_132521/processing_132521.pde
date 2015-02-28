
int cx, cy;
float secondsRadius;
float clockDiameter;
LED[] leds = new LED[60];
int lastSecond, currentSecond;

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
}

void draw() {
  currentSecond = second();
  color col;
  if (currentSecond != lastSecond) {
    drawFace();
    for (int i = 0; i < 60; i++) {
      if ( i % 5 == 0) {
        col = color(150, 150, 150);
      } 
      else {
        col = color(100, 100, 100);
      };
      leds[i].updateColor(col);
    }
    int currentHour = hour() % 12;
    int currentMinute = minute();
    leds[currentHour*5-1].updateColor(hourColor);
    leds[currentHour*5].updateColor(hourColor);
    leds[currentHour*5+1].updateColor(hourColor);
    leds[currentMinute].updateColor(minuteColor);
    leds[currentSecond].updateColor(secondColor);
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
  color pixel_color;
  float x, y;
  LED(color c, float xpos, float ypos) { 
    pixel_color = c;
    x = xpos;
    y = ypos;
  };
  void draw() {
    strokeWeight(2);
    stroke(pixel_color);
    fill(pixel_color);
    ellipse(x, y, 5, 5);
  }
  void updateColor(color c) {
    pixel_color = c;
    draw();
  }
};
