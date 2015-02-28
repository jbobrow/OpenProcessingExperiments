
float posicion=0;
float velocidad = 2.0/24.0;
void setup (){
  size(500,500);
}
void draw(){
  background (255);
  noFill();
  posicion= posicion +velocidad;
  float radio=noise (posicion)*10; // noise determina la velocidad
  for(float i=1.3; i<500;i++)// con el for se repiten cosas
  ellipse(width/2,height/2,radio*i,radio*i);
}

