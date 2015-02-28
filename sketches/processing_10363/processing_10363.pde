
/*
PROYECTO 01 SESION 3 :
 Titulo: Cuadrados
 Nombre:Lluc Llobell
 Fecha:  10/06/2010
 Lugar:Girona
 */


void setup (){
  size (500,500);
  colorMode (RGB, 255,255,255);
  smooth ();
  noFill();
  noStroke();
  background (222,247,247);
}

void draw () {

  //Creamos las variables aleatorias de las posiciones
  float x = random(0,500);
  float y = random(0,500);
  float rand_blur = random(0,5); //Blur random



  //Pintamos las mitades de diferentes colores. 0 -> 250 azul, 250 -> 500 grana
  if(x <= 250){ 
    fill(40,30,150);
    filter(BLUR,rand_blur);
  }
  else fill(150,15,25);


  //Creamos un rectangulo de 35x35 en una posicion aleatoria con su color correspondiente.
  rect(x, y, 35, 35);

}



