
float pX = 200;
float pY = 140;
float vX = random(5,9);
float vY = random(5, 9);
int tam = 50;


void setup() {
  size(400, 300);

}

void draw() {
  background(0);


  pX = pX + vX;
  pY = pY + vY;

  if ((pX >= width-25)||(pX < 25)) { 
    vX = -vX;
  } 
  if ((pY >= height-25)|| (pY < 25)) { 
    vY = -vY;
  } 

stroke(0);
  ellipse(pX, pY, tam, tam);

  if (mousePressed) {
    pX = mouseX + vX;
    pY = mouseY + vY;
    fill (random (0,255),random(0,255),random(0,255));
  }
}


