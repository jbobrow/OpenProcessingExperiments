
import g4p_controls.*;

float angulo, l = 3, d = 90;

float xH, yH, xE, yE, xHt, yHt, xEt, yEt;
float xHi, yHi, xEi, yEi, xHti, yHti, xEti, yEti;

int verifica = 0;

int R = 200;
int r = 73;
int z = 30;

void setup() {
  createGUI();
  background(197, 230, 220);
  size(900, 600);
  bg();
}

void draw () {

  strokeWeight(l);

  if (verifica == 1) {
    Hip();
  } 
  if (verifica == 2) {
    Hipc();
  } 
  if (verifica == 3) {
    Ept();
  } 
  if (verifica == 4) {
    Epc();
  }
  if (verifica == 5) {
    para();
  }
}

void Ept() {

  xE = R+r * cos(angulo) - d*cos(angulo*r/z);
  yE = R+r * sin(angulo) - d*sin(angulo*r/z);

  if (xEi > 0) {
    line(xEi+400, yEi+100, xE+400, yE+100);
  } 

  xEi = xE;
  yEi = yE;
  angulo += PI / 30;
}

void Epc() {

  xEt = R+r * cos(angulo) - d*cos(angulo*r/d);
  yEt = R+r * sin(angulo) - d*sin(angulo*r/d);

  if (xEti > 0) {
    line(xEti+400, yEti+100, xEt+400, yEt+100);
  }

  xEti = xEt;
  yEti = yEt;
  angulo += PI / 30;
}

void Hip() {

  xH = R-r * cos(angulo) + d*cos(angulo*r/z);
  yH = R-r * sin(angulo) - d*sin(angulo*r/z);

  if (xHi > 0) {
    line(xHi+400, yHi+100, xH+400, yH+100);
  }

  xHi = xH;
  yHi = yH;
  angulo += PI / 30;
}

void Hipc() {

  xHt = R-r * cos(angulo) + d*cos(angulo*r/d);
  yHt = R-r * sin(angulo) - d*sin(angulo*r/d);

  if (xHti > 0) {
    line(xHti+400, yHti+100, xHt+400, yHt+100);
  }

  xHti = xHt;
  yHti = yHt;
  angulo += PI / 30;
}

void para () {
}

void bg () {
  stroke(#480000);

  fill(#480000);
  rect(0, 0, 235, 600);

  fill(#C5E6DC);
  textSize(25);
  text("CONTROLES", 45, 40);
}
