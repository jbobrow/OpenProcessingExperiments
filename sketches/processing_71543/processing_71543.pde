
class EachParticle {
  color shading; //color of particles
  float bigness; //size of particles
  Particle all;

  EachParticle(color _shading, float _bigness, Particle _all) {
    shading = _shading;
    bigness = _bigness;
    all = _all;
  }

  void display() {
    fill(shading);
    ellipse(all.position().x(), all.position().y(), bigness, bigness);
  }
}


