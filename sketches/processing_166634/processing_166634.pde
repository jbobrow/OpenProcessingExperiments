
float posX,posY,velX,velY;
int sz;

void setup(){
 size(300,300);
 posX= width/2;
 posY= height/2;
 velX = random(1,10);
 velY = random(1,10);
 sz = 20;
}

void draw() {
 background(0);
 // Para que vaya cambiando de posición.
 posX += velX;
 posY +=velY;
 
 //creamos la elipse
 ellipse(posX,posY,sz,sz);
 
 // Creamos los condicionales para que no se salga del tablero
 
 if ( (posX<0) || (posX>width) ) {
    velX = -velX; 
 }
 
 if ( (posY<0) || (posY>height) ) {
   velY = -velY;
 }
  
}

void mousePressed() {
  posX = mouseX;
  posY = mouseY; 
  velX = random(1,10);
  velY = random(1,10);

}


