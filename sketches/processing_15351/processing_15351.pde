
// 毎回計算するのがもったいないのでグローバル化してsetupで設定
Coordinate2D[] transCoords;
Coordinate2D[] spiralVertices;

void setup() {
  size(320, 320);
  strokeWeight(5);
  fill(255);
  stroke(0);
  smooth();
  setupTransCoords();
  setupSpiralVertices();
}

void setupTransCoords() {
  int angle = 15;
  int step = 360 / angle;
  transCoords = new Coordinate2D[step];
  for(int i = 0; i < transCoords.length; i++) {
    float rad = radians(angle * i);
    transCoords[i] = new Coordinate2D(sin(rad) * 20, cos(rad) * 20);
  }
}

void setupSpiralVertices() {
  float centerX = width / 2;
  float centerY = height / 2;
  ArrayList<Coordinate2D> vertices = new ArrayList<Coordinate2D>();
  vertices.add(new Coordinate2D(centerX, centerY));

  float maxR = max(width, height);
  int deg = 0;
  for(float r = 0.0; r < maxR; r += 0.3) {
    float rad = radians(deg);
    vertices.add(new Coordinate2D(centerX + cos(rad) * r, centerY + sin(rad) * r));
    deg += 7;
  }

  spiralVertices = vertices.toArray(new Coordinate2D[vertices.size()]);
}

int transIndex = 0;
void draw() {
  translate(transCoords[transIndex].getX(), transCoords[transIndex].getY());
  transIndex++;
  if(transIndex >= transCoords.length) {
    transIndex = 0;
  }

  beginShape();
  background(255);
  for(int i = 0; i < spiralVertices.length; i++) {
    vertex(spiralVertices[i].getX(), spiralVertices[i].getY());
  }
  endShape();
}

class Coordinate2D {
  private float _x;
  private float _y;
  public Coordinate2D(float x, float y) {
    _x = x;
    _y = y;
  }
  public float getX() {
    return _x;
  }
  public float getY() {
    return _y;
  }
}



