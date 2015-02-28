
public class Drip {

  // declare variables
  int ledNum;
  float ledSize;
  float[] ledValue;
  int dripTarget;
  int dripLife = 0;
  int dripLifeIncr;
  int oldAge;

  Drip(int _ledNum, float _ledSize, int _dripLifeIncr, int _oldAge){// constructor
    // parameters
    ledNum = _ledNum;
    ledSize = _ledSize;
    dripLifeIncr = _dripLifeIncr;
    oldAge = _oldAge;

    // initialize the rest of the variables
    dripTarget = floor(random(ledNum));
    ledValue = new float[ledNum];
  }
  void update(){
    for(int i = 0; i < ledNum; i++){
      ledValue[i] = 0;
      int dripRingLow = dripTarget - dripLife;
      int dripRingHigh = dripTarget + dripLife;
      if(dripRingLow < 0){
        dripRingLow = (ledNum-1)-abs(dripRingLow);
      }
      if(dripRingHigh >= ledNum){
        dripRingHigh = dripRingHigh - (ledNum-1);
      }
      if(i == dripRingLow || i == dripRingHigh){
        int offset = (abs(i-dripTarget))*(255/(oldAge));
        ledValue[i] = 255 - offset;
      }
      fill(0,ledValue[i],0);
      rect(i*ledSize,0,ledSize, height);
    }
    dripLife += dripLifeIncr;
    if(dripLife > oldAge){
      dripTarget = floor(random(ledNum));
      dripLife = 0; 
    } 
  }
}




