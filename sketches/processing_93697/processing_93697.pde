
//Aviva
//Class

Sparkle a;



void setup() {
  size(400, 600);
  a= new Sparkle();
}

void draw() {
  a.display();
  a.bounce();
}

class Sparkle {
  float xSpeed;
  float ySpeed;
  float xPosition;
  float yPosition;
  float wideness;

  Sparkle() {
    xSpeed=random(10);
    ySpeed=random(10);
    xPosition=random(width);
    yPosition=random(height);
    wideness=100;
  }

  void display() {
    fill(random(255), random (255), random(255));
    ellipse(xPosition, yPosition, wideness, wideness);
  }
  void bounce() {
    xPosition=xPosition+xSpeed;
    yPosition=yPosition+ySpeed;
    if (xPosition>width)
    {
      xSpeed=xSpeed*-1;
    }
    if (yPosition>height)
    {
      ySpeed=ySpeed*-1;
    }
    if (xPosition<0)
    {
      xSpeed=xSpeed*-1;
    }
    if (yPosition<0)
    {
      ySpeed=ySpeed*-1;
    }
  }
}
