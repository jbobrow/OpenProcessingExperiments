
class Element {

  static final int ACTION_NONE = 0;
  static final int ACTION_UP = 1;
  static final int ACTION_DOWN = 2;
  static final int ACTION_LEFT = 3;
  static final int ACTION_RIGHT = 4;

  PVector pos, vel;

  int currentAction = ACTION_NONE;

  float speed = 1;

  Element(float x, float y, float z) {
    pos = new PVector(x, y, z);
    vel = new PVector(0, 0, 0);
  }
  void update() {
    pos.add(vel);
  }

  void setAction(int newAction) {

    currentAction = newAction;

    switch(currentAction) {
    case ACTION_NONE:
      vel = new PVector();
      break;
    case ACTION_UP:
      vel = new PVector(0, -speed, 0);
      break;
    case ACTION_DOWN:
      vel = new PVector(0, speed, 0);
      break;
    case ACTION_LEFT:
      vel = new PVector(-speed, 0, 0);
      break;
    case ACTION_RIGHT:
      vel = new PVector(speed, 0, 0);
      break;

    }

  }

  void render() {
    pushMatrix();
    //TODO only 2D for the moment
    translate(pos.x, pos.y);
    fill(0, 0, 0);
    ellipse(0, 0, 10, 10);
    popMatrix();
  } 

}



