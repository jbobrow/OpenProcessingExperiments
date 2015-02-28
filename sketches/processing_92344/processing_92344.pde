
class Wave {
  float t;
  float xoff;
  float off_random;
  float ch;
  float t_random;

  int stroke_c_w;

  Wave() {
    t = 0.0;
    xoff = t;
    off_random = random(1, 100);
    ch = random(360);
    t_random = random(0.05);

    stroke_c_w = (int)random(2, 6) * 10;
  }

  void waving() {
    xoff = t + off_random;

    for (int i = 0; i < width; i++) {
      if ((i / stroke_c_w) % 2 == 0) {
        stroke(ch, 30, 100);
      }
      else {
        stroke(360);
      }

      strokeWeight(2);

      float y1 = noise(xoff)*height;
      float y2 = noise(xoff+0.3)*height;

      line(i, y1, i+1, y2);

      xoff += 0.01;
    }

    t+= 0.04 + t_random;

    ch += 1;
    if (ch > 360) {
      ch = 0;
    }
  }
}


