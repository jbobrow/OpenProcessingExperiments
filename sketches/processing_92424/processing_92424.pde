
class Wave {
  float t;
  float xoff;
  float off_random;
  float ch;
  float t_random;

  Wave(int num, float tmpCH) {
    t = 0.0;
    xoff = t;
    off_random = random(1, 100);
    if (num == 0) {
      ch = tmpCH;
    }
    else {
      if (tmpCH >= 180) {
        ch = abs(180 - tmpCH);
      }
      else {
        ch = 180 + tmpCH;
      }
    }

    t_random = random(0.05);
  }

  void waving() {
    xoff = t + off_random;

    for (int i = 0; i < width; i++) {
      stroke(ch, 30, 100, 30);

      float y = noise(xoff)*height;

      line(width/2, height, i, y);
      noStroke();
      fill(ch, 50, 100, 10);
      ellipse(i, y, 10, 10);
      xoff += 0.01;
    }

    t+= 0.2 + t_random;

    ch += 1;
    if (ch > 360) {
      ch = 0;
    }
  }
}


