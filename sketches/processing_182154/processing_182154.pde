
float sizeb;
float posCabeza;
float posBrazoI;
float posYBrazoI;
float posBrazoD;
float posYBrazoD;
float posPieI;
float ypi;
float posPieD;
float posYPieD;
float sizePies;
float sol;


void setup() {

  background(0);
  size(700, 500);
  sizeb=0;
  posCabeza=255;
  posBrazoI=350;
  posYBrazoI=250;
  posBrazoD=350;
  posYBrazoD=250;
  posPieI=353;
  ypi=252;
  posPieD=349;
  posYPieD=252;
  sizePies=0;
}

void draw() {


  if (sizeb<=150) {
    sizeb=sizeb+1;
  }
  if (posCabeza>=150) {//cabeza
    posCabeza=posCabeza-0.7;
  }

  if (posBrazoI>=320) {//brazo izquierdo
    posBrazoI =posBrazoI-0.2;
  }
  if (posYBrazoI<=257) {
    posYBrazoI=posYBrazoI+1;
  }
  if (posBrazoD<=380) {//brazo derecho
    posBrazoD =posBrazoD+0.2;
  }
  if (posYBrazoD<=257) {
    posYBrazoD=posYBrazoD+1;
  }
  if (posPieI>=338) {//pie izquierdo
    posPieI =posPieI-0.15;
  }

  if (ypi<=385) {
    ypi=ypi+0.9;
  }

  if (posPieD<=370) {//pie derecho
    posPieD =posPieD+0.15;
  }
  if (posYPieD<=383) {
    posYPieD=posYPieD+0.9;
  }

  fill(100, 0, 255);
  rect(0, 0, 700, 250);
  fill(0, 0, 0, mouseX-200);
  rect(0, 0, 700, 250);
  fill(255-mouseX/2, 255-mouseX/2, -255);
  ellipse(mouseX, mouseY, (height/5)+(mouseY/2), (height/5)+(mouseY/2));
  fill(200, 100, 0);
  rect(0, 250, 700, 250);
  fill(100, 50, 0, mouseX);
  rect(0, 250, 700, 250);
  fill(0, 0, 255);
  ellipse(posPieI, ypi, sizeb/3.5, sizeb);
  ellipse(posPieD, posYPieD, sizeb/3.5, sizeb);
  fill(255, 0, 0);
  ellipse(350, 250, sizeb/2, sizeb);
  fill(255);
  strokeWeight(4);
  ellipse(350, posCabeza, sizeb/2, sizeb/2);
  ellipse(posBrazoI, posYBrazoI, sizeb/4, sizeb);
  ellipse(posBrazoD, posYBrazoD, sizeb/4, sizeb);
  
  
}
