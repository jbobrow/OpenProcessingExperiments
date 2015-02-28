
class Clock
{
  int clockSize;
  int clockMin;
  int clockHour;
  float centerX;
  float centerY;
  float minLength;
  float minDeg;
  float hourLength;
  float hourDeg;

  float colorScale;

  Clock(int cs, int cm, float cl)
  {
    clockSize = cs;
    clockMin = cm;
    centerX = 25*clockSize/48;
    centerY = 5*clockSize/12;

    colorScale = cl;
  }

  void decreaseSize()
  {
    if ((clockMin-3)%60 == M) {
      clockSize = int(map(S, 0, 59, 8*width, 4*width));
      tint(map(colorScale, 0, 355, 0, 100), 90, 15);
    }
    if ((clockMin-2)%60 == M) {
      clockSize = int(map(S, 0, 59, 4*width, 2*width));
      tint(map(colorScale, 0, 355, 0, 100), 90, 25);
    }
    if ((clockMin-1)%60 == M) {
      clockSize = int(map(S, 0, 59, 2*width, width));
      tint(map(colorScale, 0, 355, 0, 100), 90, 35);
    }  
    if ((clockMin)%60 == M) {
      clockSize = int(map(S, 0, 59, width, width/2));
      tint(map(colorScale, 0, 355, 0, 100), 100, 65);
    }
    if ((clockMin+1)%60 == M) {
      clockSize = int(map(S, 0, 59, width/2, width/4));
      tint(map(colorScale, 0, 355, 0, 100), 90, 55);
    }
    if ((clockMin+2)%60 == M) {
      clockSize = int(map(S, 0, 59, width/4, width/8));
      tint(map(colorScale, 0, 355, 0, 100), 90, 65);
    }
    if ((clockMin+3)%60 == M) {
      clockSize = int(map(S, 0, 59, width/8, width/16));
      tint(map(colorScale, 0, 355, 0, 100), 90, 75);
    }
    if ((clockMin+4)%60 == M) {
      clockSize = int(map(S, 0, 59, width/16, width/32));
      tint(map(colorScale, 0, 355, 0, 100), 90, 85);
    }
    if ((clockMin+5)%60 == M) {
      clockSize = int(map(S, 0, 59, width/32, width/64));
      tint(map(colorScale, 0, 355, 0, 100), 90, 95);
    }
  }

  void setClockHour() {
    clockHour = H%12;
  }

  void display()
  {
    image(spiralClock, width/2, height/2, clockSize, clockSize);
    if (isVisible() && clockSize < width) { 
      drawHourHand();  
      drawMinuteHand();
    }
  }

  int getClockMin() {
    return clockMin;
  }

  int getClockSize() {
    return clockSize;
  }

  void remove() {
    clockSize = 0;
  }

  void drawHourHand() {
    centerX = width/2 + 0.0125 * clockSize;
    centerY = height/2 - 0.075 * clockSize;

    if (0 <= clockHour && clockHour < 1) {
      minLength = map(M, 0, 59, 0.325, 0.175);
      minDeg = map(M, 0, 59, 0, 38);
    }
    else if (1 <= clockHour && clockHour < 2) {
      minLength = map(M, 0, 59, 0.175, 0.215);
      minDeg = map(M, 0, 59, 38, 63);
    }
    else if (2 <= clockHour && clockHour < 3) {
      minLength = map(M, 0, 59, 0.215, 0.225);
      minDeg = map(M, 0, 59, 63, 90);
    }
    else if (3 <= clockHour && clockHour < 4) {
      minLength = map(M, 0, 59, 0.225, 0.23);
      minDeg = map(M, 0, 59, 90, 117);
    }
    else if (4 <= clockHour && clockHour < 5) {
      minLength = map(M, 0, 59, 0.23, 0.23);
      minDeg = map(M, 0, 59, 117, 145);
    }
    else if (5 <= clockHour && clockHour < 6) {
      minLength = map(M, 0, 59, 0.23, 0.215);
      minDeg = map(M, 0, 59, 145, 180);
    }
    else if (6 <= clockHour && clockHour < 7) {
      minLength = map(M, 0, 59, 0.215, 0.21);
      minDeg = map(M, 0, 59, 180, 210);
    }
    else if (7 <= clockHour && clockHour < 8) {
      minLength = map(M, 0, 59, 0.21, 0.22);
      minDeg = map(M, 0, 59, 210, 240);
    }
    else if (8 <= clockHour && clockHour < 9) {
      minLength = map(M, 0, 59, 0.22, 0.25);
      minDeg = map(M, 0, 59, 240, 270);
    }
    else if (9 <= clockHour && clockHour < 10) {
      minLength = map(M, 0, 59, 0.25, 0.26);
      minDeg = map(M, 0, 59, 270, 302);
    }
    else if (10 <= clockHour && clockHour < 11) {
      minLength = map(M, 0, 59, 0.26, 0.275);
      minDeg = map(M, 0, 59, 302, 333);
    }
    else if (11 <= clockHour && clockHour < 12) {
      minLength = map(M, 0, 59, 0.275, 0.325);
      minDeg = map(M, 0, 59, 333, 360);
    }

    stroke(map(colorScale, 0, 355, 0, 100), 80, 20);
    strokeWeight(0.035*clockSize);
    pushMatrix();
    translate(centerX, centerY);
    rotate(radians(minDeg));
    line(0, 0, 0, -(minLength*clockSize));
    popMatrix();
  }

  void drawMinuteHand() {
    centerX = width/2 + 0.0125 * clockSize;
    centerY = height/2 - 0.075 * clockSize;

    if (0 <= clockMin && clockMin <= 5) {
      minLength = map(clockMin, 0, 5, 0.325, 0.175);
      minDeg = map(clockMin, 0, 5, 0, 38);
    }
    else if (5 <= clockMin && clockMin <= 10) {
      minLength = map(clockMin, 5, 10, 0.175, 0.215);
      minDeg = map(clockMin, 5, 10, 38, 63);
    }
    else if (10 <= clockMin && clockMin <= 15) {
      minLength = map(clockMin, 10, 15, 0.215, 0.225);
      minDeg = map(clockMin, 10, 15, 63, 90);
    }
    else if (15 <= clockMin && clockMin <= 20) {
      minLength = map(clockMin, 15, 20, 0.225, 0.23);
      minDeg = map(clockMin, 15, 20, 90, 117);
    }
    else if (20 <= clockMin && clockMin <= 25) {
      minLength = map(clockMin, 20, 25, 0.23, 0.23);
      minDeg = map(clockMin, 20, 25, 117, 145);
    }
    else if (25 <= clockMin && clockMin <= 30) {
      minLength = map(clockMin, 25, 30, 0.23, 0.215);
      minDeg = map(clockMin, 25, 30, 145, 180);
    }
    else if (30 <= clockMin && clockMin <= 35) {
      minLength = map(clockMin, 30, 35, 0.215, 0.21);
      minDeg = map(clockMin, 30, 35, 180, 210);
    }
    else if (35 <= clockMin && clockMin <= 40) {
      minLength = map(clockMin, 35, 40, 0.21, 0.22);
      minDeg = map(clockMin, 35, 40, 210, 240);
    }
    else if (40 <= clockMin && clockMin <= 45) {
      minLength = map(clockMin, 40, 45, 0.22, 0.25);
      minDeg = map(clockMin, 40, 45, 240, 270);
    }
    else if (45 <= clockMin && clockMin <= 50) {
      minLength = map(clockMin, 45, 50, 0.25, 0.26);
      minDeg = map(clockMin, 45, 50, 270, 302);
    }
    else if (50 <= clockMin && clockMin <= 55) {
      minLength = map(clockMin, 50, 55, 0.26, 0.275);
      minDeg = map(clockMin, 50, 55, 302, 333);
    }
    else if (55 <= clockMin && clockMin <= 60) {
      minLength = map(clockMin, 55, 60, 0.275, 0.325);
      minDeg = map(clockMin, 55, 60, 333, 360);
    }

    stroke(map(colorScale, 0, 355, 0, 100), 90, 99);
    strokeWeight(0.015*clockSize);
    pushMatrix();
    translate(centerX, centerY);
    rotate(radians(minDeg));
    line(0, 0, 0, -(minLength*clockSize));
    popMatrix();
  }

  boolean isVisible() {
    return clockSize > 0;
  }
}


