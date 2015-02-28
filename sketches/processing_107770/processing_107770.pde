
float thetaStart;
int howMany = 5;
TriRot [] Elem = new TriRot[howMany];

void setup() {
  float x, y;
  float r = 0;
  float rad = 20; //radius
  float min_sz = 100; // min size of rect
  float max_sz = 90; //max size
  float sz = min_sz;
  float sw = 17; //strokeWeight
  float col = 255;
  float colIncr = 255/howMany;
  size(800, 600);
  background(255);
  for (int i = 0; i < Elem.length; i++) {
    x = width/3 + (i*(height/(howMany*2)));
    y = height/2 ;
    Elem[i] = new TriRot(x, y, sz, sw, col);
  }
}

void draw() {
  background(color(#78A1E5));
  for (int i = 0; i < Elem.length; i++) {
    Elem[i].display();
  }
}

void mouseClicked() {
  save(random(12345)+".png");
}

class TriRot {
  float x, y;
  float sz, sz_var; //size
  float sw; //strokeWeight
  float theta, thetaIncr;
  float col; //color

  TriRot(float _x, float _y, float _sz, float _sw, float _col ) {
    x = _x;
    y = _y;
    sz = _sz;
    sw = _sw;
    col = _col;
    rectMode(CENTER);
    stroke(0);
    strokeWeight(sw);
    theta = thetaStart;
    thetaIncr = .03;
    thetaStart += 0.2;
  }

  void display() {
    fill(col);
    translate(x, y);
    rotate(theta);
    //sz_var = map(sin(theta), -1,1,1,1.5)*sz;
    sz_var = sz;
    rect(0, 0, sz_var, sz_var);
    resetMatrix();
    theta += thetaIncr;
  }
}
