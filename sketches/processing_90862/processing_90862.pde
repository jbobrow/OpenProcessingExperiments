
class Note {
  float startX;
  float startY;
  float stopX;
  float stopY;
  float x;
  float y;
  float step;
  float pct;
  float theta =random(TWO_PI);
  float c;
  float s = 0.1;
  float t = random(1);
  float pm = random(1);

  Note(int tmpStartX) {
    startX = tmpStartX;//width/2;
    startY = height/2;   

    stopX = width * cos(theta) + width/2;
    stopY = height * sin(theta) + height/2;

    step = random(0.003, 0.008)*1.2;
    pct = 0.0;

    if (pm >= 0.5) {
      pm = 1;
    }
    else {
      pm = -1;
    }

    if (startX == 0) {
      c = random(70, 155);
    }
    else {
      c = random(280, 325);
    }
  }

  void move() {
    if (pct < 1.0) {
      x = startX + ((stopX - startX)*pct);
      y = startY + ((stopY - startY)*pct);
      pct += step;
    }
    else {
      x = startX;
      y = startY;
      pct = 0.0;
      s = 0.1;
    }

    s+=0.01;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(t*pm);
    //scale(s);
    tint(c, /*100*abs(sin(t))*/100, 100, 80);
    image(img, 0, 0);
    popMatrix();

    t+=step*10;
  }
}


