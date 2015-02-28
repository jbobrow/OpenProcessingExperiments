
class Bolita {

  // variables
  float xpos, ypos;
  int id;

  // constructor
  Bolita() {
  }

  void update () {
    xpos = id*5;
    ypos = w*.5 - amp*cos(radians((180*xpos/lon) - (180*t/per1))) + 
                    amp*cos(radians((180*xpos/lon) - (180*t/per2)));
  }

  void dibuja()
  {
    stroke(255, 30);
    strokeWeight(8);
    noFill();
    ellipse(xpos,ypos,4,4);
    stroke(255, 100);
    strokeWeight(.7);
    noFill();
    ellipse(xpos,ypos,4,4);
  }
}


