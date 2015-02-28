
/*
     5_
 4  /   \ 6
 3  \ _ / 1 
 2
 */

class Hexagon {
  static final float angleInc = TWO_PI / 6.0;
  float x, y, rad, distToNext;
  Hexagon neighbours[];
  int number;

  int pulseCounter, pulseSide;
  float hexVal;

  Hexagon(float x, float y, float rad) {
    this.x = x;
    this.y = y;
    this.rad = rad;

    distToNext = 2 * sqrt(rad * rad * 0.75) + 3;
    neighbours = new Hexagon[6];
    pulseCounter = -1;
    hexVal = 0;
  }

  void draw() {
    if(hexVal < VAL_MIN) {
      hexVal += 3;
      if(hexVal >= VAL_MIN)
        pulse = false; 
    }
    
    else if(hexVal > VAL_MIN)
      hexVal -= VAL_DECAY;
    
    float angle=0;

    pushMatrix();

    translate(x, y);
    fill(150, 255, int(hexVal));
    stroke(0);

    beginShape();
    for (int i=0; i<6; i++, angle+=angleInc)
      vertex(rad * cos(angle), rad * sin(angle));
    endShape(CLOSE);

    /* String txt = "" + number;
     fill(0);
     text(txt, -textWidth(txt) / 2, +3); */

    popMatrix();

    //drawNeighbours();
    doPulse();
  }

  void drawNeighbours() {
    pushMatrix();
    translate(x, y);
    stroke(255, 0, 0);

    float angle = angleInc / 2;
    for (int i=0; i<6; i++, angle+=angleInc) {
      if (neighbours[i] == null)
        continue;
      line(0, 0, distToNext * cos(angle), distToNext * sin(angle));
    }

    popMatrix();
  }

  Hexagon create(int side) {
    if (neighbours[side] != null)
      return null;

    float angle = angleInc / 2 + angleInc * side;
    Hexagon newHex = new Hexagon(x + distToNext * cos(angle), y + distToNext * sin(angle), rad);
    newHex.number = hexs.size();
    newHex.findNeighbours();

    return newHex;
  }

  void doPulse() {
    if (pulseCounter >= 0) {
      hexVal += VAL_INC;
      if(hexVal > VAL_MAX)
        hexVal = VAL_MAX;
      
      pulseCounter--; 
    }
    
    if (pulseCounter != 0)
      return;

    if (neighbours[pulseSide] != null)
      neighbours[pulseSide].startPulse(pulseSide);
    else
      hexs.add(create(pulseSide));
  }

  void findNeighbours() {
    int nNeighbours = 0;

    for (int hexIndex = 0; hexIndex < hexs.size() && nNeighbours < 6; hexIndex++) {
      Hexagon hex = (Hexagon) hexs.get(hexIndex);
      if (dist(x, y, hex.x, hex.y) <= distToNext + 2) {
        float angle = angleInc / 2;
        for (int side=0; side<6; side++, angle+=angleInc) {
          if (dist(x + distToNext * cos(angle), y + distToNext * sin(angle), hex.x, hex.y) <= 3) { // allow for imprecission
            neighbours[side] = hex;
            hex.neighbours[(side + 3) % 6] = this;
            nNeighbours++;
            break;
          }
        }
      }
    }
  }

  void startPulse(int side) {
    if (side == -1)
      pulseSide = int(random(6));
    else
      pulseSide = (side + 5 + floor(random(3))) % 6;

    pulseCounter = PULSE_LENGTH;
  }
}


