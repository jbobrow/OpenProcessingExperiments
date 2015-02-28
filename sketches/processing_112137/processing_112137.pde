
class Antennae {
  PVector pos;
  PImage antennae;
  PImage petunia;
  float rot, initRot;
  int scaleDown = 2;
  int num;

  Antennae(PVector _pos, float _rot, int _num) {
    pos = _pos;
    initRot = _rot;
    num = _num;
    antennae = loadImage("antennae.png");
    petunia = loadImage("petunia.png");
  } 

  void update() {
    float theta = map(millis()%60000,0,59999, 0, TWO_PI);
    rot = map(sin(theta), -1, 1, -.19, .19);
  }

  void draw() {
    translate(pos.x, pos.y - (antennae.height/(scaleDown*2)));
    rotate(initRot);
    for (int i = 0; i < num; i++) {
      image(antennae, 0, 0, 1.3*(antennae.width/scaleDown), antennae.height/(scaleDown*2)); 
      translate(0, .8 * (antennae.height/(scaleDown*2)));
      rotate(rot);
      pushMatrix();
      rotate(millis()/5000.0); 
      if(i == num-1) {
        image(petunia,-petunia.width/2,-petunia.height/2);
      }
      popMatrix();
    }
  }
}


