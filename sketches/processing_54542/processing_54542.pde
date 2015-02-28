
class Food {

  PVector pos;

  Food() {

    pos = new PVector(wObj * random(5, scaleObj - 5), wObj * random(5, scaleObj - 5));
  }

  void display() {
    rect(pos.x, pos.y, wObj, wObj);
  }

  void randomize(){
     pos.x = wObj * random(5, scaleObj - 5);
     pos.y = wObj * random(5, scaleObj - 5);
  }

}


