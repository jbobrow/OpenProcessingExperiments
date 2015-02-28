
float tamano = 1;

void setup(){
  //tamaÃ±o
  size(200,150);
}
void draw(){
  //el fondo, en cada frame
  background(0);
  //el dibujo
  ellipse(width/2,height/2,tamano,tamano);

  //CONDICIONAL: SOLO CRECE SI ES MENOR A 150
  if(tamano < 120){
    tamano = tamano + 0.5;
  }
  
  if(tamano >= 120) {
    tamano = 1; 
  }
}
