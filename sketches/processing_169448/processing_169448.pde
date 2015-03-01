
float pX = 200;
float pY = 140;
float vX = random(-5, 5);
float vY = random(-5, 5);
int tam = 50;


void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  stroke(255, 0, 0);
  line(20, 20, 380, 20);
  line(20, 20, 20, 380);
  line(20, 380, 380, 380);
  line(380, 20, 380, 380);


  pX = pX + vX;
  pY = pY + vY;
  //tam/2 es la mitad de la bola y +20 es el tamaño de la margen
  if ((pX + tam/2+20 >= width)|| (pX - tam/2-20 < 0)) { 
    vX = -vX;
  } 
  if ((pY + tam/2+20 >= height)|| (pY - tam/2-20 < 0)) { 
    vY = -vY;
  } 

  noStroke();
  //de la mitad para allà es cuadrado
  //px-tam/2 es para mover el punto de partida de la esquina
  // al centro donde arranca el cuadrado y no haya salto
  //se resta por que es para el centro.
  if (pX >width/2){
    rect(pX-tam/2, pY-tam/2,tam, tam);}
    else {
    ellipse (pX, pY, tam, tam);
    }

  if (pX < width/3) {
    fill(0, 0, 255);
  } else if (pX < 2*(width/3)) {//dos tercios
    fill(255);
  } else {
    fill(random(255),random(255),random(255));
  }
  
}

void mousePressed() {
  //posiciòn en x y y se la del mouse cuando  hago click
  pX = mouseX;
  pY = mouseY;
  // y la velocidad del a bolita sea random
  vX = random(-5, 5);
  vY = random(-5, 5);
}



