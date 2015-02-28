
int tamanoMinimo = 20;
int tamanoMaximo = 175;
int intervalo = 3;
boolean creciendo = true;
int tamanoPelota = 2;

void setup(){
  size(200,200);
  smooth();
  strokeWeight(3);
}

void draw(){
  background(255,255,127); 
  //colores
  fill(255,127,255);
  stroke(127,255,255);

  //El tamaÃ±o de la pelota debe cambiar segÃºn estemos creciendo 
  //o decreciendo:
  if(creciendo==true){
    tamanoPelota = tamanoPelota + intervalo;
  } 
  else { //es decir, si no estÃ¡ creciendo
    tamanoPelota = tamanoPelota - intervalo;
  }

  ///////////////////////
  //Y aquÃ­ hay que comprobar si se llegÃ³ a un tamaÃ±o lÃ­mite,
  //para cambiar el ciclo crecer decrece
  if(tamanoPelota > tamanoMaximo){
    creciendo = false;
  }
  if(tamanoPelota < tamanoMinimo){
    creciendo = true;
  }

  //Finalmente, dibujamos la pelotita
  ellipse(width/2,height/2,tamanoPelota,tamanoPelota);
}
