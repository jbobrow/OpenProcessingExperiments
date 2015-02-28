
import processing.pdf.*;

int       MAX_NUMBER_OF_POINTS = 50000;  
int       systemType;
int       numberOfPoints;
int       currentRuleIndex;
float     scale;
float     offsetX;
float     offsetY;
PVector   currentPoint;
IFSRule[] rules;


void keyPressed() {
    background(255);
    systemType++;
    if (systemType > 5) systemType = 1;
    setGeometricProperties();
}


void mousePressed() {
    background(255);
    systemType++;
    if (systemType > 5) systemType = 1;
    setGeometricProperties();
}


void setup() {
  size(600, 400);
  background(255);
  systemType = 4; // BARNSLEY_LEAF
  setGeometricProperties();
}


void setGeometricProperties() {
  numberOfPoints = 0;
  currentPoint   = new PVector(1, 1);
  offsetX        = 0;
  offsetY        = 0;
  
  switch (systemType) {
      // HEXAGON
      case 1:
          rules    = new IFSRule[6];
          rules[0] = new IFSRule(0.3333f, 0, 0, 0.3333f, 0.1667f, 0, #0000ff, 0.1666f);
          rules[1] = new IFSRule(0.3333f, 0, 0, 0.3333f, 0.5f, 0, #0000ff, 0.1666f);
          rules[2] = new IFSRule(0.3333f, 0, 0, 0.3333f, 0, 0.3333f, #0000ff, 0.1666f);
          rules[3] = new IFSRule(0.3333f, 0, 0, 0.3333f, 0.6667f, 0.3333f, #0000ff, 0.1666f);
          rules[4] = new IFSRule(0.3333f, 0, 0, 0.3333f, 0.1667f, 0.6667f, #0000ff, 0.1666f);
          rules[5] = new IFSRule(0.3333f, 0, 0, 0.3333f, 0.5f, 0.6667f, #0000ff, 0.1666f);
          strokeWeight(2f);
          scale    = width  * 0.6;
          offsetX  = width  * 0.3;
          offsetY  = height * 0.4; 
      break;

      // CARPET
      case 2:
          rules    = new IFSRule[8];
          rules[0] = new IFSRule(0.3333f, 0, 0, 0.3333f, 0, 0, #0000ff, 0.125f);
          rules[1] = new IFSRule(0.3333f, 0, 0, 0.3333f, 0.3333f, 0, #0000ff, 0.125f);
          rules[2] = new IFSRule(0.3333f, 0, 0, 0.3333f, 0.6667f, 0, #0000ff, 0.125f);
          rules[3] = new IFSRule(0.3333f, 0, 0, 0.3333f, 0, 0.3333f, #0000ff, 0.125f);
          rules[4] = new IFSRule(0.3333f, 0, 0, 0.3333f, 0.6667f, 0.3333f, #0000ff, 0.125f);
          rules[5] = new IFSRule(0.3333f, 0, 0, 0.3333f, 0, 0.6667f, #0000ff, 0.125f);
          rules[6] = new IFSRule(0.3333f, 0, 0, 0.3333f, 0.3333f, 0.6667f, #0000ff, 0.125f);
          rules[7] = new IFSRule(0.3333f, 0, 0, 0.3333f, 0.6667f, 0.6667f, #0000ff, 0.125f);
          strokeWeight(2f);
          scale    = width  * 0.6;
          offsetX  = width  * 0.3;
          offsetY  = height * 0.4; 
      break;

      // LEAF
      case 3:
          rules    = new IFSRule[2];
          rules[0] = new IFSRule(0.6667f, 0, 0, 0.6667f, 0, 0.3333f, #00ff00, 0.5f);
          rules[1] = new IFSRule(0.4714f, -0.4714f, 0.4714f, 0.4714f, 0.9024f, -0.3788f, #00ff00, 0.5f);
          strokeWeight(2f);
          scale    = width  * 0.5;
          offsetX  = width  * 0.4;
          offsetY  = height * 0.35;  
      break;

      // BARNSLEY_LEAF
      case 4:
          rules    = new IFSRule[4];
          rules[0] = new IFSRule(0.85f, 0.04f, -0.04f, 0.85f, 0, 1.60f, #00ff00, 0.73f);
          rules[1] = new IFSRule(0.2f, -0.26f, 0.23f, 0.22f, 0, 1.60f, #00ff00, 0.13f);
          rules[2] = new IFSRule(-0.15f, 0.28f, 0.26f, 0.24f, 0, 0.44f, #00ff00, 0.11f);
          rules[3] = new IFSRule(0, 0, 0, 0.16f, 0, 0, #00ff00, 0.03f);
          strokeWeight(2.5f);
          scale    = width  * 0.06;
          offsetX  = width  * 0.03;
          offsetY  = height * 0.4;          
      break;

      // STAR_CROSS
      case 5:
          rules    = new IFSRule[2];
          rules[0] = new IFSRule(-0.5, 0.4, -0.4, -0.5, 0.5, 0.4, #0000ff, 0.5f);
          rules[1] = new IFSRule(-0.5f, -0.4f, 0.4f, -0.5f, 1f, 0, #0000ff, 0.5f);
          strokeWeight(2f);
          scale    = width  * 0.9;
          offsetX  = width  * 0.45;
          offsetY  = height * 0.2;
      break;

      default: print("MEGA BUG: IFS Type should never be on defaulf case"); break;
  }
}


void addPointToFractal() {
  if (numberOfPoints >= MAX_NUMBER_OF_POINTS) return;

  numberOfPoints++;
  
  if (numberOfPoints == MAX_NUMBER_OF_POINTS) println("End of Chaos Game");
  
  float prob = random(1);
  int j = 0, len = rules.length;
  for (j = 0; j < len; j++) {
    if (prob <= rules[j].getProbability()) break;
    prob -= rules[j].getProbability(); 
  }
  
  if (j >= len) j = len - 1;
  
  currentRuleIndex = j;
  float x          = rules[currentRuleIndex].getX(currentPoint.x, currentPoint.y);
  float y          = rules[currentRuleIndex].getY(currentPoint.x, currentPoint.y);
  currentPoint.x   = x;
  currentPoint.y   = y;
}


void draw() {
  translate(width * 0.5f, height * 0.5f);
  addPointToFractal();
  stroke(rules[currentRuleIndex].getColor());
  
  // Drop first 30 points to improve accuracy  
  if (numberOfPoints < 30) return;
  
  point(scale * currentPoint.x - offsetX, -scale * currentPoint.y + offsetY);  
}


class IFSRule {
  private float a, b, e,
                c, d, f,
                probability;
  private color cor;
  
  public IFSRule(float _a, float _b, float _c, float _d, float _e, float _f, color _cor, float prob) {
    a           = _a;
    b           = _b;
    c           = _c;
    d           = _d;
    e           = _e;
    f           = _f;
    cor         = _cor;
    probability = prob; 
  }
  
  public float getProbability() { return probability; }
  public color getColor() { return cor; }
  public float getX(float x, float y) { return (a * x + b * y + e); }
  public float getY(float x, float y) { return (c * x + d * y + f); }
}
