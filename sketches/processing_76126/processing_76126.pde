
class Block {
  float x;
  float y;
  float speed;
  float rect_w;
  float rect_h;

  Block() {
    speed = random(-10, 10);
    if(speed < 1 && speed > -1){
      speed += 3;
    }
    rect_w = random(10, 40);
    rect_h = random(220, 280);

    x = random(width);
    y = random(height);
  }

  void display() {
    noStroke();
    fill(0);
    rect(x, y, rect_w, rect_h);
  }

  void move() {
    y += speed;
    if (y > height + rect_h/2  || y < -rect_h/2) {
      rect_w = random(10, 40);
      rect_h = random(220, 280);
      x = random(width);

      if (speed > 0) {
        y = - rect_h/2;
      }
      else {
        y = height+rect_h/2;
      }
    }
  }
}


