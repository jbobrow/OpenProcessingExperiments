
class Leg {

  Particle pelvic, hip, kneeCap, ankle, toe;
  Limb thigh, knee, calf, foot;
  float radius = 200;
  float scale;

  Leg(float _scale) {
    scale = _scale;

    pelvic = new Particle(new PVector(0, 0), 10.0);
    hip = new Particle(new PVector(radius*.4, -radius*.1), 1.0);
    kneeCap = new Particle(new PVector(radius*.54, radius*.4), 1.0);
    ankle = new Particle(new PVector(radius*.4, radius*.8), 1.0);
    toe = new Particle(new PVector(radius*.25, radius*1.5), 0.2);

    float thighLen = PVector.dist(pelvic.pos, hip.pos);
    thigh = new Limb(pelvic, hip, thighLen, 0.05, 15, 0);

    float kneeLen = PVector.dist(hip.pos, kneeCap.pos);
    knee = new Limb(hip, kneeCap, kneeLen, 0.2, 15,0);

    float calfLen = PVector.dist(kneeCap.pos, ankle.pos);
    calf = new Limb(kneeCap, ankle, calfLen, 0.2, 15,0);

    float footLen = PVector.dist(ankle.pos, toe.pos);
    foot = new Limb(ankle, toe, footLen, 0.2, 15,0);
  }

  void update(PVector eyePos) {
    
    float pullIn = abs(eyePos.x - width/2)/3;
    
    pelvic.update();
    pelvic.setPosition(new PVector(0, eyePos.y/15));
    hip.update();
    hip.setPosition(new PVector(pullIn+100, -eyePos.y/5));
    kneeCap.update();
    ankle.update();
    toe.update();

    thigh.update(); 
    knee.update(); 
    calf.update(); 
    foot.update();
  }

  void draw(PVector eyePos) {
    pushMatrix();
    scale(scale);
    thigh.draw(eyePos);
    knee.draw(eyePos);
    calf.draw(eyePos);
    foot.draw(eyePos);
    popMatrix();
  }

  void twitch(float magnitude) {
    kneeCap.applyForce(new PVector(magnitude/2, -magnitude));
    magnitude*=.3;
    hip.applyForce(new PVector(-magnitude/2, -magnitude));
    magnitude*=.3;
    ankle.applyForce(new PVector(magnitude/2, -magnitude));
    magnitude*=.1;
    toe.applyForce(new PVector(-magnitude/2, magnitude));
  }
}


