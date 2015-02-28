
class Wave {
  float t;
  float xoff;
  float off_random;
  float ch;
  float t_random;

  Wave() {
    t = 0.0;
    xoff = t;
    off_random = random(1, 100);
    ch = random(360);
    t_random = random(-0.0025, 0.0025);
  }

  void waving() {
    xoff = t + off_random;

    for (int i = 0; i < width; i++) {
      stroke(ch, 80, 100, 50);
      strokeWeight(2);

      float y1 = noise(xoff)*height;
      float y2 = noise(xoff+0.01)*height;

      line(i, y1, i+1, y2);

      xoff += 0.01;
    }

    t+= 0.03 + t_random;

    ch += 1;
    if (ch > 360) {
      ch = 0;
    }
  }
}


