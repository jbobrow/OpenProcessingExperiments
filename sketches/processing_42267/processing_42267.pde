

class Cat {

  float xpos;
  float ypos;
  float yspeed;
  color c;

  Cat(float tempx, float tempy, float tempspeed, color tempC) {

    println("It's raining cats!");

    xpos = tempx;
    ypos = tempy;
    yspeed = tempspeed;
    c = tempC;
  }

  void display() {
    if (ypos < 150) {
      image(catImage1, xpos, ypos);
    } else if (ypos > 100 && ypos < 250) {
      image(catImage2, xpos, ypos);
    } else if (ypos > 250 && ypos < 400) {
      image(catImage3, xpos, ypos);
    } else if (ypos > 400) {
      image(catImage4, xpos, ypos);
    }
  }

  void rain() {
    ypos = ypos + yspeed;
    if (ypos > height) {
      ypos = 0;
    }
  }
}

