
class Pointer {

  PVector loc;

  //String name = "";
  //PImage img;

  color c;


  Pointer(float x, float y) {
    loc = new PVector(x, y);
    c = color(random(255), random(255), random(255));
  }

  void drawInfo() {
    fill(c);
    ellipse(loc.x, loc.y, 25, 25);
    //rect(loc.x,loc.y,100,100);
  }
}


