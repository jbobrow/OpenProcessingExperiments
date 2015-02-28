
class Bubble {
  float x, y; 
  float s, sw;

  Bubble() {
    x = random(width);
    y = random(height);
    sw = random(1,3);
    s =random(2,10);
  }

  void move() {
    y -= random(2,4); 
    // wiggle
    x+= random(-2,2); 
    if(y < 0) {
      x = random(width);
      y = height;
    }
  }

  void display() {
    noFill();
    stroke(255);
    strokeWeight(sw);
    ellipse(x,y,s,s);
  }
}


