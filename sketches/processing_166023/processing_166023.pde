
int posX,posY;
int inc,tam,tam2;



void setup(){
  size(300,300);
  inc = 20;
  tam = 25;
  tam2 = 15;
 
}


void draw() {
  // Para que no vaya sobredibujando
 posX = mouseX;
 posY = mouseY;
 background(0); 
 fill(245,188,188);
 stroke(255);
 strokeWeight(3);
 
 // La posicion depende del mouse
 line(posX-inc,posY-inc,posX+inc,posY+inc);
 line(posX-inc,posY+inc,posX+inc,posY-inc);
 ellipse(posX,posY,tam,tam);
 ellipse(posX-inc,posY-inc,tam2,tam2);
 ellipse(posX+inc,posY-inc,tam2,tam2);

 

  
}



