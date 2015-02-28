
class Cars {
  float x, y;
  float d, t;
  boolean moving = false;

  Cars(float _x, float _y, float _d, float _t) {
    x = _x;
    y = _y;
    d = _d;
    t = _t;
  }

  void drawCars() {
    //fill (255);
    //ellipse( x-5, y-5, d-5, r-5);
    fill(0);
    ellipse(x, y, d, t);
  }
  void CarKey() {

    fill(random(255),random(255),random(255));
    ellipse(x, y, d, t);
  }
/*
  void startMoving() {

    if (mouseX > x - 25 && mouseX < x + 25 &&
      mouseY > y - 25 && mouseY < y + 25)
    {
      moving = true;
    }
  }
  void display(){
  if (moving == true){
    moving = false;
   x = mouseX;
  }
  }
  */
}


