
class Ball extends Node {
   
  float durchmesser;
  color farbe;
   
  // Zeichnet an Position von Ball eine Ellipse mit Durchmesser durchmesser
  void zeichnen() {
    fill(farbe, 20 + velocity.mag() * 20);
    float drawDurchmesser = durchmesser*durchmesser/20*velocity.mag()/10+4;
    ellipse(x,y,drawDurchmesser,drawDurchmesser);
  }
   
}

