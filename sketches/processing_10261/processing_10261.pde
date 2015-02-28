
private class Body {
  private Particle p;
  private float w;
  private float h;
  
  public Body(Particle p, float w, float h) {
    this.p = p;
    this.w = w;
    this.h = h;
  }
  
  private void draw() {
    pushMatrix();
    translate(p.position().x(), p.position().y());
    scaleByVelocity();
    strokeWeight(10);
    fill(0);
    ellipse(0, 0, w, h);
    popMatrix();
  }
  
  private void scaleByVelocity() {
    PVector pv = new PVector(p.velocity().x(), p.velocity().y());
    if(pv.x != 0 && pv.y != 0) {
      pv.normalize();
      pv.x = constrain(pv.x, 0.75, 1);
      pv.y = constrain(pv.y, 0.75, 1);
    }
    scale(abs(pv.x), abs(pv.y));
  }
}

