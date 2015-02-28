
class star {
  float X, Y;
  float mySize;
  float timer = 0;
  float blinking;
  int myNumber;

  star(float posX, float posY, int Number) {
    X = posX;
    Y = posY;
    myNumber = Number;
  }

  void starShine() {
    timer++;
    if(myNumber%2 == 0 ){
    blinking = random(50,170);
    }
    mySize = random(0.5, 3.0);
    if (timer%blinking == 0) {
      fill(30);
    }
    else {
      fill(130);
    }
    ellipse(X, Y, mySize, mySize);
    println(timer);
  }
}


