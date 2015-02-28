
void setup(){
  size(500,500);
  background (0);
  smooth();
  strokeWeight(2);
  fill(random(255));
  stroke(240,60,90);
  //las primeras 2 unidades son la posicion del primer punto, los segundos de la primera curva, los terceros de la segunda curva y los últimos en en donde acaba el ultimo punto
  
  curve(105,469,105,267,426,292,380,469);
   curve(105,424,105,222,436,247,380,424);
    curve(105,375,105,174,426,199,380,375);
    curve(105,346,105,144,426,169,380,336);
}
  
