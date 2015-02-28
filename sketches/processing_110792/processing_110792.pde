
void setup () {
  size (400,400);
  background (255);

  puntos_aleatorios();
}
void puntos_aleatorios(){
 
  rect(20 ,20,360,360);
  for (int j = 20; j < 360; j = j+1) {
      x_aleatorio = random(20, 360);
      y_aleatorio = random(20, 360);

    rect(x_aleatorio ,y_aleatorio ,2,2);
  }



}
