

class CompoundWave {
  
  Wave osc;
  Wave mod;
  
  float[] mixData;
  String mixMode = "multiply";
  boolean drawToEndpoints = false;
  
  // Trig fields
  float x1, y1, x2, y2;                                            // Endpoints which define the wave segment.
  float oppositeLength, adjacentLength, hypoteneuseLength;
  float angle;                                                     // For rotating the wave into the correct orientation.
  
  
  
  /******************************************************************************
  *
  *  CONSTRUCTORS
  *
  ******************************************************************************/
  
  CompoundWave (float x1_, float y1_, float x2_, float y2_) {
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;

    adjacentLength = x2 - x1;
    oppositeLength = y2 - y1;
    angle = atan2(oppositeLength, adjacentLength);
    hypoteneuseLength = ceil(sqrt((sq(adjacentLength)) + (sq(oppositeLength))));  // Calculate hyp; round up to next whole number.
    
    osc = new Wave(int(hypoteneuseLength));
    mod = new Wave(int(hypoteneuseLength));
    
    mixData = new float[int(hypoteneuseLength)];
  }



  /******************************************************************************
  *
  *  METHODS, LISTED ALPHABETICALLY
  *
  ******************************************************************************/

  void display() {
    osc.generateWave();
    mod.generateWave();
    
    pushMatrix();
      translate(x1, y1);                                                               // Move 0,0 to the position of the first node;
      rotate(angle);                                                                   // Rotate from there.
      mixWaves();
      drawCompoundWave();
    popMatrix();
  }
    
  
  
  void drawCompoundWave() {
    for (int i = 0; i < mixData.length - 1; i++) {
      line(i, mixData[i], i + 1, mixData[i + 1]);
    }
    if (drawToEndpoints == true) {
      line(0, 0, 0, mixData[0]);
      line(mixData.length - 1, mixData[mixData.length - 1], mixData.length - 1, 0);
    }
  }
  
  
  
  void drawToEndpoints(boolean state_) {
    drawToEndpoints = state_;
  }
  
  
  
  String getMixMode() {
    return mixMode;
  }
  
  
  
  void mixWaves() {
    if (mixMode.equals("multiply") || mixMode.equals("mult") || mixMode.equals("x")) {
      for (int i = 0; i < mixData.length; i++) {
        mixData[i] = osc.getWaveData(i) * mod.getWaveData(i);
      }
    }
    else if (mixMode.equals("add") || mixMode.equals("+")) {
      for (int i = 0; i < mixData.length; i++) {
        mixData[i] = osc.getWaveData(i) + mod.getWaveData(i);
      }
    }
  }
  
  
  
  void setMixMode(String newMixMode_) {
    mixMode = newMixMode_;
    mixMode = mixMode.toLowerCase();
  }
  
}

