
class Font {

  PVector textLoc;
  PVector vel = new PVector();
  PVector acc = new PVector();

  String myText = "BEE";

  Font(PVector _textLoc) {
    textLoc = _textLoc;
  }

  void run() {
    display();
    update();
    followMouse();
  }

  void display() {
    fill(0);
    text(myText, textLoc.x, textLoc.y);
  }

  void update() {
    vel.add(acc);
    vel.limit(8);
    textLoc.add(vel);
    acc = new PVector(0, 0, 0);
  }

  void followMouse() {
    PVector target = new PVector(mouseX, mouseY, 0);
    PVector diff = PVector.sub(target, textLoc);

    float distance = diff.mag();

    diff.normalize();
    diff.mult(distance/40);
    acc.add(diff);
  }
}


