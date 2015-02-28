
class Fish {
  float x;
  float y;
  float vx;
  float vy;
  float fishColour = random(100,255);

  Fish() {
    x = 20;
    y = 20;
  } 
  float getx() {
    return x;
  }
  float gety() {
    return y;
  }
  void update(int num) {
    vx *= fishAttract;
    vy *= fishAttract;
    for (int i = fishCount; i >= 0; i--) {
      if (i != num) {
        boolean drawthis = false;
        Fish fish = (Fish) fishes[i];
        float tx = fish.getx();
        float ty = fish.gety();
        float radius = dist(x,y,tx,ty);
        if (radius < 45) {
          drawthis = true;
          float angle = atan2(y-ty,x-tx);
          if (radius < 45) {
            vx += (30 - radius) * 0.07 * cos(angle);
            vy += (30 - radius) * 0.07 * sin(angle);
          }
          if (radius > 25) {
            vx -= (25 - radius) * 0.02 * cos(angle);
            vy -= (25 - radius) * 0.02* sin(angle);
          }
        }
      }
    }
    if (mousePressed) {
      float tx = mouseX;
      float ty = mouseY;
      float radius = dist(x,y,tx,ty);
      if (radius < foodSize + 20) {
        float angle = atan2(ty-y,tx-x);
        if (mouseButton == LEFT) {
          vx += radius * 0.14 * cos(angle);
          vy += radius * 0.14 * sin(angle);
          stroke(radius * 8,0,0);
        }
      }
    }
    int px = (int)x;
    int py = (int)y;
    x += vx;
    y += vy;
    if (x > width+200) {
      if (abs(vx) == vx) vx *= -1.0;
      x = width+200;
    }
    if (x < -200) {
      if (abs(vx) != vx) vx *= -1.0;
      x = -20;
    }
    if (y < -200) {
      if (abs(vy) != vy) vy *= -1.0;
      y = -200;
    }
    if (y > height+200) {
      if (abs(vy) == vy) vy *= -1.0;
      vx *= 0.6;
      y = height+200;
    }
    strokeWeight(fishSize);
    stroke (fishColour,fishColour);
    line(px,py,int(x),int(y));
  }
}


