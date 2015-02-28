
class Sat {
  // GLOBAL VARIABLES

  Vec3D loc = new Vec3D ();

  //CONSTRUCTOR
  Sat(Vec3D _loc) {
    loc = _loc;
  }

  //FUNCTIONS
  void run() {
    display();
  }

  void display() {

    float t = millis()/1000.0f;
    translate(loc.x, loc.y);
    rotate(r*t);
    fill(255);
    ellipse(0,0,40,40);
    fill(0);
    ellipse(0,0,30,30);
    fill(255);
    ellipse(0,0,20,20);
    scale(s);
    translate(x,x);

  }
}


