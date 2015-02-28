
class Circle {
  float startX;
  float startY;
  float stopX;
  float stopY;
  float x;
  float y;
  float step;
  float pct;
  float theta =random(TWO_PI);
  float s = 1;
  float t = random(1);
  float pm = random(1);
  float sh = random(0.2,1.8);


  Circle() {
    startX = width/2;
    startY = height/2;   

    stopX = width * cos(theta) + width/2;
    stopY = height * sin(theta) + height/2;

    step = random(0.003, 0.008)/1.3;
    pct = 0.0;

    if (pm >= 0.5) {
      pm = 1;
    }
    else {
      pm = -1;
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
      s = 1;
    }

    s+=1;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(t*pm);
    if (x < width/2 && y < height/2 || x > width/2 && y > height/2) {
      stroke(360*abs(sin(t/2)), 80);
      noFill();
    }
    else {
      noStroke();
      fill(360*abs(sin(t/2)), 80);
    }
    ellipse(0, 0, s, s*sh);
    popMatrix();

    t+=step*10;
  }
}


