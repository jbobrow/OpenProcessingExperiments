
class Crow {

  color c;
  float xPos;
  float yPos;
  float ySpeed;
  float acc;

  Crow() {
    c = color (209, 67, 15);
    xPos = random(0, width);
    yPos = height/2;
    ySpeed = 2;
    acc = random(0.05, 0.3);
  } 


  void display() {
    noStroke();
    fill(c);
    smooth();
    rect(xPos, yPos, 100, 100);
    fill(255);
    ellipse(xPos, yPos, 30, 30);
    fill(100);

  }

  void move() {
    ySpeed += acc;
    yPos += ySpeed;

    if ((yPos >= height) || (yPos==0)) {
      ySpeed *=-1;
    }
  }
}


