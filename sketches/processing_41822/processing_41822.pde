
class Arm {
  int skinColor;

  float upperArmX;
  float upperArmY;
  float upperArmWidth;
  float upperArmHeight;

  float maxUpperArmY;
  float minUpperArmY;

  float upperArmDeg;

  float lowerArmX;
  float lowerArmY;
  float lowerArmWidth;
  float lowerArmHeight;

  float maxLowerArmY;
  float minLowerArmY;
  float maxLowerArmX;
  float minLowerArmX;

  float lowerArmDeg;

  float handX;
  float handY;
  float handWidth;
  float handHeight;

  float maxHandY;
  float minHandY;
  float minHandX;

  float handDeg;

  boolean isRightArm;

  UpperArm cUpperArm;
  LowerArm cLowerArm;
  nHand cHand;

  Arm(int ac, 
  float uax, float uay, float uaw, float uah, 
  float maxuay, float minuay, 
  float uad, 
  float lax, float lay, float law, float lah, 
  float maxlay, float minlay, float maxlax, float minlax, 
  float lad, 
  float hx, float hy, float hw, float hh, 
  float maxhy, float minhy, float minhx, 
  float hd, 
  boolean ira) {
    skinColor = ac;

    upperArmX = uax;
    upperArmY = uay;
    upperArmWidth = uaw;
    upperArmHeight = uah;

    maxUpperArmY = maxuay;
    minUpperArmY = minuay;

    upperArmDeg = uad;

    lowerArmX = lax;
    lowerArmY = lay;
    lowerArmWidth = law;
    lowerArmHeight = lah;

    maxLowerArmY = maxlay;
    minLowerArmY = minlay;
    maxLowerArmX = maxlax;
    minLowerArmX = minlax;

    lowerArmDeg = lad;

    handX = hx;
    handY = hy;
    handWidth = hw;
    handHeight = hh;

    maxHandY = maxhy;
    minHandY = minhy;
    minHandX = minhx;

    handDeg = hd;

    isRightArm = ira;

    cUpperArm = new UpperArm(skinColor, 
    upperArmX, upperArmY, upperArmWidth, upperArmHeight, 
    maxUpperArmY, minUpperArmY, 
    upperArmDeg, isRightArm);
    cLowerArm = new LowerArm(skinColor, 
    lowerArmX, lowerArmY, lowerArmWidth, lowerArmHeight, 
    maxLowerArmY, minLowerArmY, maxLowerArmX, minLowerArmX, 
    lowerArmDeg, isRightArm);
    cHand = new nHand(skinColor, 
    handX, handY, handWidth, handHeight, 
    maxHandY, minHandY, minHandX, 
    handDeg, isRightArm);
  }

  void armBendDown() {
    cUpperArm.armTurnDown();
    cUpperArm.armMoveDown();
    cLowerArm.armTurnDown();
    cLowerArm.armMoveDown();
    cHand.handTurnDown();
    cHand.handMoveDown();
  }

  void armBendUp() {
    cUpperArm.armTurnUp();
    cUpperArm.armMoveUp();
    cLowerArm.armTurnUp();
    cLowerArm.armMoveUp();
    cHand.handTurnUp();
    cHand.handMoveUp();
  }

  void reset() {
    cHand.reset();
    cLowerArm.reset();
    cUpperArm.reset();
  }

  void armOnBarBendDown() {
    cUpperArm.armOnBarTurnDown();
    cUpperArm.armOnBarMoveDown();
    cLowerArm.armOnBarTurnDown();
    cLowerArm.armOnBarMoveDown();
  }

  void armOnBarBendUp() {
    cUpperArm.armOnBarTurnUp();
    cUpperArm.armOnBarMoveUp();
    cLowerArm.armOnBarTurnUp();
    cLowerArm.armOnBarMoveUp();
    cHand.handOnBarTurnUp();
    cHand.handOnBarMoveUp();
  }

  void display() {
    cUpperArm.display();
    cLowerArm.display();
    cHand.display();
  }
}


