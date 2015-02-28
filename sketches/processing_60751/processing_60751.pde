
class Animator {
  ArrayList<Limb> limbs = new ArrayList<Limb>();
  float speed = 0.05f, phi = 0f;
  
  Animator() {
  }
  void addLimb(Limb l) {
    limbs.add(l);
  }
  
  void setSpeed(float speed) {
    this.speed = speed;
  }
  
  void update() {
    phi += speed;
  }
  
  void display() {
    for (int i = 0; i < limbs.size(); i++) {
      Limb l = limbs.get(i);
      //mapping -1 : 1 to 0 : 1
      l.display((sin(l.phase0 + phi)+1)*0.5f);
    }
  }
}

