

class Attractor extends VerletParticle2D {

  int r;
  
  Attractor(Vec2D loc, int _r) {
    super(loc);
    r = _r;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*4, 1));
  }
  
  void display() {
    
    pushStyle();
    fill(250,40,120);
    noStroke();
    ellipse(x, y+5, r/2, r+4);
    
    pushMatrix();
    translate(x-50,y-20);
    beginShape();
    vertex(50, 15);
    bezierVertex(50, -5, 90, 5, 50, 40);
    vertex(50, 15);
    bezierVertex(50, -5, 10, 5, 50, 40);
    endShape();
    popMatrix();
    popStyle();
  }
  
}

