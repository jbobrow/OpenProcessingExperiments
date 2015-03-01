
float pX = 300;
float pY = 300;
float vX = random(4,6);
float vY = random(4,6);
int tam = 25;
float radio = 25/2;
void setup() {
  size(600, 600);
}

void draw() {

  fill(255,3);
  rect(0, 0, 600, 600);
  rect(75, 75, 450, 450);

  pX = pX + vX;
  pY = pY + vY;

  if ((pX >= width - (79 + radio)) || (pX < 0 + (79 + radio))) {
    vX= -vX;
  }
  if ((pY >= height - (79 + radio))||(pY < 0 + (79 + radio))) {
    vY = -vY;
  }

  fill(255,pX,0);
  ellipse(pX, pY, tam, tam);
}



