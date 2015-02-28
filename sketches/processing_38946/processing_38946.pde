
// danielmonje.com
//una cosilla visual bonita con pocas lineas
void setup () {
  size (500, 400);
}
//las funciones cuadrado y linea se repiten mil veces cada frame gracias al uso del for
void draw () {
  for (int sumas =0; sumas <1000; sumas++) {
    fill (random (255),random(255),random(255));
    cuadrado();
    linea (random (500),random (400));
  }
}
void cuadrado () {
  rect (random(500), random (400), 10, 10);
}
void linea (float puntox,float puntoy) {
  line (puntox,puntoy,mouseX,mouseY); 
}

