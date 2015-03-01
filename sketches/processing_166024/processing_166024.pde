
int posX,posY;
int inc,tam;
float tamV,tam2V;



void setup(){
  size(300,300);
  inc = 20;
  tam = 15; 
}


void draw() {
  // Para que no vaya sobredibujando
 posX = mouseX;
 posY = mouseY;
 background(0); 
 fill(mouseX,188,188);
 stroke(255);
 strokeWeight(3);
 tamV = mouseY*0.5;
 tam2V = mouseY*0.25;
 /* La posicion depende del mouse el tamaño de la esfera grande
 y el color. */
 line(posX-inc,posY-inc,posX+inc,posY+inc);
 line(posX-inc,posY+inc,posX+inc,posY-inc);
 ellipse(posX,posY,tamV,tamV);
 ellipse(posX-inc,posY-inc,tam2V,tam2V);
 ellipse(posX+inc,posY-inc,tam2V,tam2V);
}



