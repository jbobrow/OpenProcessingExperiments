
class Particle {
  float xCurr, yCurr;
  float xInit, yInit;
  float xo,yo;
  float pushForce;
  float recoverForce;
  Particle(float xo, float yo) {
    this.xo = xo;
    this.yo = yo;
    
    float degreeTemp = random(360);
    float rTemp = random(10, 180);
    xInit = cos(radians(degreeTemp))*rTemp+xo;
    yInit = sin(radians(degreeTemp))*rTemp+yo;
    xCurr = xInit;
    yCurr = yInit;
    pushForce = random(10,300);
    recoverForce = random(10,100);
  }
  void update() {
    float x0 = xCurr;
    float y0 = yCurr;
    float a = mouseX-x0;
    float b = mouseY-y0;
    float r = pushForce/(a*a+b*b);
    float quer_fugir_x = xCurr-a*r;
    float quer_fugir_y = yCurr-b*r;
    float quer_voltar_x = (xInit-x0)/recoverForce;
    float quer_voltar_y = (yInit-y0)/recoverForce;
    xCurr = quer_fugir_x+quer_voltar_x;
    yCurr = quer_fugir_y+quer_voltar_y;
  }
  void display() {
    pushMatrix();
    translate(xCurr,yCurr);
    rotate(radians(360*noise(xCurr*0.01,yCurr*0.01)));
    float diam = (pushForce/recoverForce)/dist(xCurr,yCurr,mouseX,mouseY)*100;
    strokeWeight(1);
    stroke(0,100);
    fill(255);
    rect(0, 0,diam,diam);
    popMatrix();
  }
  void reset() {
    float degreeTemp = random(360);
    float rTemp = random(10, 180);
    pushForce = random(10,300);
    recoverForce = random(10,100);
    xInit = cos(radians(degreeTemp))*rTemp+xo;
    yInit = sin(radians(degreeTemp))*rTemp+yo;
  }
}


