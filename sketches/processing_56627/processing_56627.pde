
// pinta una rodona que es mou
int posX, posY; // centre de la rodona
int posX2, posY2;
int posX3, posY3;
int posX4, posY4;
void setup() {
  size(500, 500);
  background(0);
  noStroke();
  fill(0, 125, 255);
  smooth();

  posX=0;
  posY=height/2;
  
  posX2=width;
  posY2=height/3;
  
  posX3=0;
  posY3=height/4;
   
  posX4=0;
  posY4=4*height/5;
}

void draw() {

  background(0);
  fill(0, 125, 255);
  ellipse(posX, posY, 30, 30);

  // canvia la posicio
  // i controla que no surti de la finestra
  posX++;
  if (posX==width) {
    posX=0;
    
  }
   fill(3, 165, 155);
   ellipse(posX2, posY2, 50, 50);

  // canvia la posicio
  // i controla que no surti de la finestra
  posX2--;
  if (posX2==0) {
    posX2=width;
  }
   fill(0, 36, 255);
   ellipse(posX3, posY3, 20, 20);

  // canvia la posicio
  // i controla que no surti de la finestra
  posX3=posX3-2;
  if (posX3<=0) {
    posX3=width;
  }
   fill(94, 107, 183);
   ellipse(posX4, posY4, 60, 60);

  // canvia la posicio
  // i controla que no surti de la finestra
  posX4=posX4-3;
  if (posX4<=1) {
    posX4=width;
    }
    

  // canvia les quatre linies anteriors per
  //  posX = (posX+1)%width;
}

