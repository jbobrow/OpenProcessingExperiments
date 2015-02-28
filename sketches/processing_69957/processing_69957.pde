
class Hipster {

  color c;
  float size = 150;
  float xPos;
  float yPos;
  float ySpeed;
  float acc;
  int r, g, b;
  float s = second();
  float m = minute(); 
  float h = hour();  
  float hourX;
  float minuteX;
  float secondX;

  Hipster() {
    r = 250;
    g = 55;
    b = 55;
    c = color(r, g, b);
    xPos = random(0, width/2);
    yPos = random(0, height/2);
    ySpeed = 1;
    acc = random(0.25, 0.35);
  }

  void display() {
      if (frameCount % 5 == 0) {
      stroke(random(r), random(g), random(b));
      pushMatrix();
      translate(width/2, height/2);
      println(hour());
      hourX = map(hour(), 0, 24, 0, 360);
      minuteX = map(minute(), 0, 60, 0, 360);
      secondX = map(second(), 0, 60, 0, 360);
      rotate(hourX);
      triangle(xPos, xPos, size/2, 0, yPos, yPos);
      rotate(minuteX);
      triangle(xPos, xPos, size/2, 0, yPos, yPos);
      rotate(secondX);
      triangle(xPos, xPos, size/2, 0, yPos, yPos);
      popMatrix();
    //  size+=0.25;
      }
  }
  void move() {
    ySpeed += acc;
    yPos += ySpeed;

    if ((yPos >= height)||(yPos==0)) {
      ySpeed *= -1;
    }
  }
}


