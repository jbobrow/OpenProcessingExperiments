
class Words {
  float handXpos;
  float handYpos;
  float jointXpos;
  float jointYpos;
  String[] wordArrayName;
  int textCounter;
  float deltaTrans;
  float trans;
  boolean changeText;
  float yAdjust;

  Words(String[] _wordArrayName) {
    wordArrayName = _wordArrayName;
    textCounter = 0;
    deltaTrans = 0;
    trans = 0;
    changeText = false;
  }

  void drawWords(float _handXpos, float _handYpos, float _jointXpos, float _jointYPos) {
    handXpos = _handXpos;
    handYpos = _handYpos;
    jointXpos = _jointXpos;
    jointYpos = _jointYPos;
    yAdjust = 0;
    float distForTrans = dist(handXpos, handYpos, jointXpos, jointYpos);


    for (int i=0; i<wordArrayName[textCounter].length(); i++) {
      float x = lerp(jointXpos, handXpos, (float)i/wordArrayName[textCounter].length());
      float y = lerp(jointYpos, handYpos, (float)i/wordArrayName[textCounter].length());

      if (distForTrans >= textWidth(wordArrayName[textCounter])) {
        deltaTrans+= 0.01;
        if (deltaTrans >= 1) {
          deltaTrans = 1;
        }
      }
      if ( distForTrans < textWidth(wordArrayName[textCounter])) {
        deltaTrans -= 0.01;
        if (deltaTrans <=0) {
          deltaTrans = 0;
        }
      } 

      float mappedDist = map(distForTrans, 0, textWidth(wordArrayName[textCounter]), 0, 125);
      trans = (i+deltaTrans)*mappedDist;
      fill(0, trans);
      text(wordArrayName[textCounter].charAt(i), x, y);
    }


    if (!changeText && distForTrans <= 20) {
      textCounter++;
      changeText = true;
    }
    if (textCounter > wordArrayName.length-1) {
      textCounter = 0;
    }
    if (distForTrans > 20) {
      changeText = false;
    }
  }

  void wordsFall(float _handXpos) {
    handXpos = _handXpos;
    for (int i=0; i<wordArrayName[textCounter].length(); i++) { 
      float x = lerp(jointXpos, handXpos, (float)i/wordArrayName[textCounter].length());
      float y = lerp(jointYpos, handYpos, (float)i/wordArrayName[textCounter].length()) + yAdjust;
      if (y < height) {
        yAdjust += (i+1)/random(10,30);
      }
      text(wordArrayName[textCounter].charAt(i), x, y);
    }
  }
}


