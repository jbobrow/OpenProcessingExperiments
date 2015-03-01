
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
stroke(255,0,0);
fill(0);
rect(50,50,300,200);
fill(255);
  pX = pX + vX;
  pY = pY + vY;

  if ((pX >= width-75)||(pX < 75)) { 
    vX = -vX;
  } 
  if ((pY >= height-75)|| (pY < 75)) { 
    vY = -vY;
  } 

stroke(0);
  ellipse(pX, pY, tam, tam);

  if (pX < width/3) {
    fill(0, 0, 255);
  } else if (pX < 2*(width/3)) {//dos tercios
    fill(255);
  } else {
    fill(255, 0, 0);
  }
}



