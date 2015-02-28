
// the monster class builds Typomonsters!

class Monster {

  float x, y;
  int numType; // number of characters in flock
  int flockSize; // physical size of flock
  float typeSize; // physical size of characters
  float avgSpeed; // average speed of characters
  int emotion = 0; // initial emotion

  Type[] t; 

  Monster(float xpos, float ypos, int nt, int fs, float ts, float as) {
    x = xpos;
    y = ypos;
    numType = nt;
    t = new Type[numType];
    flockSize = fs;
    typeSize = ts;
    avgSpeed = as;
    
    for (int i=0; i<t.length; i++) {
      int num = i;
      float angle = random(-TWO_PI, TWO_PI);
      float rx = random(flockSize/2);
      float ry = random(flockSize/3);
      t[i] = new Type(x+rx*cos(angle), y+ry*sin(angle), (random(avgSpeed-1.0)+1.0), typeSize, num);
    }
  }

  void update() {
    for (int i=0; i<t.length; i++) {
      t[i].update();
      t[i].display();
    } 
  }

  int getEmotion() {
    int e = int(random(7));
    return e;
  }

  void setString(int[] c) {
    // iterate through string code and find characters
    if (c.length<=t.length) {
      int j=0;
      while (j<c.length) {
        for (int i=0; i<t.length; i++){
          if (t[i].getShapeNum() == c[j] && !t[i].inString){
            t[i].incSize();
            t[i].setTargetPos(j, c.length);
            t[i].setInString();
            j++;
            break;
          }
        }
      }
    }
  }

  void resetFlock() {
    // reset the whole flock to a new position
    int randomFlockSize = int(random(flockSize*0.8, flockSize*1.2));
    x = map(random(width), 0, width, width/6, width - width/6); // randomize x position
    y = map(random(height), 0, height, height/6, height - height/6); // randomize y position
    if (t[0] != null) { 
      for (int i=0; i<t.length; i++) {
        t[i].reset(x, y, int(random(randomFlockSize)), avgSpeed);
      }
    }
  }
}

