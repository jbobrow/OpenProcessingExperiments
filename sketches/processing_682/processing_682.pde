
PShape arlequin;
void setup(){
  // defino tamaño de lienzo
  size (720,486);
  // cargo el svg
  arlequin=loadShape("muneco2.svg");
  smooth();
}

void draw(){
  // color de fondo del dibujo
  background (255,255,255);
  bailedeltiempo();
}

void bailedeltiempo(){
  //manimulacion del tiempo en baile loco del arlequin
  //cargo el arlequin
  shape(arlequin,350,250,139/2,364/2);
  // entrada de segundos, minutos y horas
  int s = second();
  int m = minute();
  int h= hour();
  /* divido los minutos en 500 para que se translade 
  muy lento en el valor x y uso las horas para el valor y*/
  arlequin.translate(m/500,h);
  /*multiplico los segundos por 500 para acelerar el tiempo 
  y que rote a esa velocidad*/
  arlequin.rotate(s*300);
}



