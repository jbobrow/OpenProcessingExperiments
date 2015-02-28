
class Hill{
  float[] yLoc = new float[width];
  float groundLevel = 187;
  float theta = 0;
  float hillHeight = 250;

  Hill(){
    for (int x = 0; x < 375; x++){
      yLoc[x] = groundLevel;
    }
    for (int x = 375; x < width-6; x++) {
      yLoc[x] = map(-cos(theta), -1, 1, groundLevel, hillHeight);
      theta += .01005;
    }
    for (int x = width-6; x < width; x++){
      yLoc[x] = groundLevel;
    }
  }
  
  void update(){
    for (int x = 0; x < 375; x++){
      yLoc[x] = groundLevel;
    }
    for (int x = 375; x < width-6; x++) {
      yLoc[x] = map(-cos(theta), -1, 1, groundLevel, hillHeight);
      theta += .01005;
    }
    for (int x = width-6; x < width; x++){
      yLoc[x] = groundLevel;
    }
  }

  void resetTheta(){
    theta = 0;
  }
  
  void display(){
    noStroke();
    fill(255);
    rectMode(CORNER);
    for(int i = 0; i < width; i++){
      rect(i, yLoc[i], 1, height - yLoc[i]);
    }
  }
}

