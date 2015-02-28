
class Particle {
  float xCurr, yCurr;
  float xInit, yInit;
  float xo,yo;
  Particle(float xo_, float yo_) {
    xo = xo_;
    yo = yo_;
    float degreeTemp = random(360);
    float rTemp = random(30, 300);
    xInit = cos(radians(degreeTemp))*rTemp+xo;
    yInit = sin(radians(degreeTemp))*rTemp+yo;
    xCurr = xInit;
    yCurr = yInit;
  }
  void update() {
    float x0 = xCurr;
    float y0 = yCurr;
    float a = mouseX-x0+random(-50,50);
    float b = mouseY-y0+random(-250,250);
    float r = sqrt(a*a+b*b);
    float quer_fugir_x = xCurr-(a/r)*100/r;
    float quer_fugir_y = yCurr-(b/r)*100/r;
    float quer_voltar_x = (xInit-x0)/10;
    float quer_voltar_y = (yInit-y0)/10;
    xCurr = quer_fugir_x+quer_voltar_x;
    yCurr = quer_fugir_y+quer_voltar_y;
  }
  void display() {
    strokeWeight(1);
    stroke(0);
    point(xCurr, yCurr);
  }
  void reset() {
    float degreeTemp = random(360);
    float rTemp = random(10, 200);
    xInit = cos(radians(degreeTemp))*rTemp+xo;
    yInit = sin(radians(degreeTemp))*rTemp+yo;
  }
}


