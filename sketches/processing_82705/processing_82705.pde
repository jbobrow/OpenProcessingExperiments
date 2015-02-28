
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
  int count;
  boolean active;

  Automaton(float radioX, float radioY, int type) {
    this.x = random(width);
    this.y = random(height);
    this.radioX = radioX;
    this.radioY = radioY;
    tStep = random(TWO_PI);
    this.type = type;
    inc = random(0.03, 0.045);
    active = false;
    count = 0;
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
    active = false;
    count = 0;
  }

  void generate() {
    px = x;
    py = y;

    switch(type) {
    case 1:
      x =  cos(tStep + noise(tStep))*radioX + width/2.0 + noise(tStep)*50 + noise(tStep)*30;
      y =  sin(tStep)*cos(tStep + sin(tStep + noise(tStep)))*radioY + height/2.0 + noise(tStep)*70;
      break;
    case 2:
      x =  sin(tStep + tStep/2.0 + noise(tStep))*radioX + width/2.0 + noise(tStep)*60 + noise(tStep)*20;
      y =  cos(tStep/2)*cos(tStep/5 + noise(tStep))*radioY + height/2.0 + noise(tStep)*70;
      break;
    case 3:
      x =  sin(tStep + sin(tStep/2.0))*radioX + width/2.0 + noise(tStep)*40;
      y =  cos(tStep + cos(tStep/2.0) + noise(tStep)*5)*radioY + height/2.0 + noise(tStep)*40;
      break;
    case 4:
      x = cos(tStep)*sin(tStep/6 + noise(tStep))*radioX + width/2.0 + noise(tStep)*40;
      y = sin(tStep/2 + cos(tStep/3))*cos(tStep/5 +noise(tStep))*radioY + height/2.0 + noise(tStep)*40;
      break;
    case 5:
      x = cos(tStep + noise(tStep))*radioX + width/2.0 + noise(tStep)*90;
      y = sin(tStep + noise(tStep))*radioY + height/2.0 + noise(tStep)*90;
      break;
    }

    tStep += inc;
  }

}



