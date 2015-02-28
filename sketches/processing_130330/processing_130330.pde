
/* Tomas de Camino Beck
prueba de colores agregando aleatoridad
taller de programacin MDI veritas
*/


//size of the square for the color palette
int rectSize = 30;
void setup(){
  size(400,400);
  fill(255);
  //define la paletta de colores HSB y los m'aximos
  colorMode(HSB,width/rectSize,height/rectSize,255);

}

void draw(){
  background(0);
  smooth();
  for(int i = 0; i < width/rectSize ; i++){
   for(int j = 0; j < height/rectSize; j++){
     noStroke();
     fill(i,j,255);
     //dibuja cuadrados del tamano definido
     //agrega variabilidad a la posicion del cuadrado
     rect(i*rectSize+random(3),j*rectSize+random(3),rectSize,rectSize);
   }
  }
}

