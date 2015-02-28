
//class for simulation for a automation particle movement

class ManagerAutomaton {
  ArrayList  automaton;

  ManagerAutomaton() {
    automaton = new ArrayList();
  }

  void activate() {
    if (!automaton.isEmpty()) {
      for (int i = 0; i < automaton.size(); i++) {
        Automaton a = ((Automaton)automaton.get(i));
        a.activateMovement();
      }
    }
  }

  void push() {
    automaton.add( new  Automaton((int)random(3)));
  }

  void pop() {
    if (!automaton.isEmpty())
      automaton.remove(automaton.size() - 1 );
  }
}

class Automaton {
  float posX;
  float posY;
  float velposX;
  float velposY;
  float tposX;
  float tposY;

  float nValFX;
  float nValFY;

  int movementType;

  Automaton(int type) {
    nValFX = random(0.2, 0.3);
    nValFY = random(0.2, 0.3);
    movementType = type;
  }


  void activateMovement() {

    switch(movementType) {
    case 1:
      posX = noise(nValFX);
      posY = noise(nValFY);

      velposX = (posX - tposX)/( width / 7);
      velposY = (posY - tposY)/( height  / 7);

      addForce(posX, posY, velposX, velposY);

      tposX = tposX;
      tposY = tposY;

      nValFX += 0.026;
      nValFY += 0.028;
      break;
    case 2:
      posX = noise(nValFX);
      posY = noise(nValFY);

      velposX = (posX - tposX)/( width / 7);
      velposY = (posY - tposY)/( height  / 7);

      addForce(posX, posY, velposX, velposY);

      tposX = tposX;
      tposY = tposY;

      nValFX += 0.026 + random(-0.01, 0.01);
      nValFY += 0.028 + + random(-0.01, 0.01);
      break;
    case 3:
      posX = cos(nValFX);
      posY = sin(nValFY) * sin(nValFY) ;

      velposX = (posX - tposX)/( width / 7);
      velposY = (posY - tposY)/( height  / 7);

      addForce(posX, posY, velposX, velposY);

      tposX = tposX;
      tposY = tposY;

      nValFX += 0.3 + random(-0.01, 0.01);
      nValFY += 0.28 + + random(-0.01, 0.01);
      break;
    }
    // println(posX+" , "+ posY +" .. "+velposX+" , "+ velposY);
  }
}


