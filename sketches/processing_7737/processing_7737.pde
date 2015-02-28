
class Particle {
  
  Particle friend;
  float psize, pmass;
  float angle;
  float d2c, d2c_min;
  float speed, v_acc;
  PVector pos;
  color c, c_light;
  
  public Particle() {
    c = color(100 + (int)random(30), 30 + (int)random(20), 50);
    c_light = color(
      constrain(red(c) + 50, 0, 255),
      constrain(green(c) + 50, 0, 255),
      constrain(blue(c) + 50, 0, 255)
    );
    pos = new PVector();
    psize = 15 + random(55);
    pmass = psize/3;
    d2c_min = 10.0;
    d2c = d2c_min;
    angle = random(TWO_PI);
    speed = PI/120 + random(PI/120);
  }
  
  void view() {
    fill(0); stroke(0);
    pushMatrix();
      translate(pos.x, pos.y);
      // ellipse(0, 0, psize, psize);
      scale(psize*0.01);
      tint(c);
      image(img, 0, 0);
    popMatrix();
    stroke(c_light);
    viewFriend();
  }
  
  void viewFriend() {
    line(pos.x, pos.y, friend.pos.x, friend.pos.y);
  }
  
  void model() {
    friend = p[(int)random(p.length)];
    angle += speed;
    if (keyPressed) {
      v_acc = constrain(v_acc + 1.0/pmass, 0.0, 1.0);
    } else {
      v_acc = constrain(v_acc - 0.2/pmass, -1.0, 0.0);
      if (d2c < d2c_min) {
        d2c = d2c_min;
        v_acc = 0.0;
      }
    }
    d2c += v_acc;
    if (d2c > 200) { d2c = 200; }
    pos.x = d2c * cos(angle);
    pos.y = d2c * sin(angle);
  }
  
}


