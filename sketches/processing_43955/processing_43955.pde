
class Particle {
  float xCurr, yCurr;
  float xInit, yInit;
  float xo,yo;
  
  Particle() {
    float degreeTemp = random(TWO_PI);
    float rTemp = random(10, 200);
    xInit = cos(degreeTemp)*rTemp+w/2;
    yInit = sin(degreeTemp)*rTemp+h/2;
    xCurr = xInit;
    yCurr = yInit;
  }
  
  Particle(int xm, int ym) {
    float degreeTemp = random(TWO_PI);
    float rTemp = 10;
    xInit = cos(degreeTemp)*rTemp+xm;
    yInit = sin(degreeTemp)*rTemp+ym;
    xCurr = xInit;
    yCurr = yInit;      
  }
  
  Particle(float xm, float ym,PVector vel) {
    float spr=round(vel.mag())/50;
    float degreeTemp = random(TWO_PI);
    xInit = cos(degreeTemp)*spr+xm;
    yInit = sin(degreeTemp)*spr+ym;
    xCurr = xInit;
    yCurr = yInit;
  }
  
  void update() {
    float x0 = xCurr;
    float y0 = yCurr;
    float a = mouseX-x0;
    float b = mouseY-y0;
    float r = sqrt(a*a+b*b);
    float quer_fugir_x = xCurr-(a/r)*MF/r;
    float quer_fugir_y = yCurr-(b/r)*MF/r;
    float quer_voltar_x = (xInit-x0)/10;
    float quer_voltar_y = (yInit-y0)/10;
    
    xCurr = quer_fugir_x+quer_voltar_x;
    yCurr = quer_fugir_y+quer_voltar_y;
  }
  
  void display() {
    strokeWeight(5);
    stroke(0,100);
    point(xCurr, yCurr);
  }  
}

