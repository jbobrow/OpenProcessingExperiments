
class Automaton {
  float x;
  float y;
  float py;
  float px;
  float radioX;
  float radioY;
  float tStep;

  int posInitX;
  int posInitY;

  int type;
  float inc;

  Automaton(float radioX, float radioY, int type) {
    this.x = random(width);
    this.y = random(height);
    this.radioX = radioX;
    this.radioY = radioY;
    tStep = random(TWO_PI);
    this.type = type;
    inc = random(0.03, 0.045);
  }

  Automaton(int posInitX, int posInitY, float radioX, float radioY, int type) {
    this.posInitX = posInitX;
    this.posInitY = posInitY;
    this.x = random(width);
    this.y = random(height);
    this.radioX = radioX;
    this.radioY = radioY;
    tStep = random(TWO_PI);
    this.type = type;
    inc = random(0.02, 0.029);
  }

  void generate() {
    px = x;
    py = y;

    switch(type) {
    case 1:
      x =  cos(tStep)*radioX + width/2.0;
      y =  sin(tStep)*cos(tStep)*radioY + height/2.0;
      break;
    case 2:
      x =  cos(tStep + tStep/2.0)*radioX + width/2.0;
      y =  sin(tStep)*sin(tStep)*radioY + height/2.0;
      break;
    case 3:
      x =  sin(tStep + sin(tStep/2.0))*radioX + width/2.0;
      y =  sin(tStep + cos(tStep/2.0))*radioY + height/2.0;
      break;
    case 4:
      x = cos(tStep)*sin(tStep/6)*radioX + width/2.0 + noise(tStep)*60;
      y = sin(tStep/2 + cos(tStep/3))*cos(tStep/5)*radioY + height/2.0 + noise(tStep)*60;
      break;
    case 5:
      x = posInitX + 115*noise(tStep) + 50*cos(tStep);
      y = sin(tStep + cos(tStep/2))*radioY +  posInitY;
      break;
    }

    tStep += inc;
  }
  
}


