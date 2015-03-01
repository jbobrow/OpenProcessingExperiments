
float pX = 200;
float pY = 140;
float vX = random(2, 5);
float vY = random(2, 5);
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

  
}




