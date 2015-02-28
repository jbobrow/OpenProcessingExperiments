

class Specimen {

  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float vx, vy;
  color typeColor;
  boolean goodBad;
  boolean destroyed;

  Specimen(float tempX, float tempY, float tempW, float tempVX, float tempVY, color temptypeColor, boolean tempGoodBad) {
    x = tempX;
    y = tempY;
    w = tempW;
    vx = tempVX;
    vy = tempVY;
    speed = 10;
    gravity = 0.1;
    typeColor = temptypeColor;
    goodBad = tempGoodBad;
    destroyed = false;
  }

  void move() {

    x +=vx;
    y += vy;


    //speed++;
    y = y + speed;

    if (x > (width/2 + 150)) {

      resetSpecimen();
    } 
    else if (x < (width/2 - 150)) {

      resetSpecimen();
    }

  }

  boolean finished() {

    if (y > height) {
      return true;
    } 
    else {
      return false;
    }
  }

  void display() {
    if (destroyed == true) 
    {
      noFill();
    } 
    else 
    {
      fill(typeColor);
      ellipse(x, y, w, w);
    }
  }

  void resetSpecimen() {
    //set new random velocity
    // b/w - and + numbers
    vx = random(-0.7, 0.7);
    vy = random(-0.1, 0.21);
  }

  void destroySpecimen() {
    destroyed = true;
  }
}


