
class Raindrop {
  float x, y, s, timer, col;

  Raindrop(float xpos, float ypos, float gravity) {
    x = xpos;
    y = ypos;
    s = gravity;
    timer = 1; 
    col = random(200, 222);
  }

  void drop() {
    y += s; 
    x += s;
    if (y > height) y = 0; //keep rain amount constant
    if (x > width) x = 0;
  }

  void display() {
    timer -= 0.002; //decrease rain power
    if (timer < 0.1) {
      timer ++;
    }   
    //the shape and direction of raindrops
    stroke(col, 240);
    strokeWeight(random(timer)); 
    line(x, y, x + 20, y + 40);
    ellipse(x+20, y+40, 1, 1);
  }

  //draw circles when raindrops "touch" umbrella
  void colision() {
    if (x > 265 && x< 415 && y > 10 && y < 70) {
      noFill();
      stroke(250);
      ellipse(x+20, y+40, 10, 10);
    }
  }
}


