


class Fishery {
  float x;
  float y;
  int[] eyes = { 0, 255 };
  int index = int(random(eyes.length));
  float yoffset = 0.0;
  float angle = random(0, TWO_PI);
  float colour = random(80, 255);
  float fishScale = random(1, 1.02);
  float speed = random(1, 5);
 
  Fishery(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }
  
  void move() {
    if (x > -100) {
      x -= speed;
    } else {
      x = width + 100;
    }
    angle += 0.15;
    yoffset = sin(angle) * 0.5;
    y += yoffset;
  }
  
  void display() {
    scale(fishScale);
    fill(colour);
    ellipse(x, y, 110, 45);
    triangle(x+31, y-19, x+80, y, x+31, y+19);
    beginShape();
      vertex(x+68, y);
      vertex(x+100, y-23);
      vertex(x+90, y);
      vertex(x+100, y+23);
    endShape(CLOSE);
   if (colour > 180) { 
     fill(0);
   } else {
     fill(colour+100);
   }
    ellipse(x-35, y+5, 5, 5); 
  }
  
}

