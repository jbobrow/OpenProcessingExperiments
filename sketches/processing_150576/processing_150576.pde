
/******************* EJERCICIO 1***************/

float x, y; //variables de posiciÃ³n
float dt = 0.1; //diferencial de tiempo
float r = 70; //radio

void setup(){
  size(500,500);//tamaÃ±o de la ventana
}

void draw(){
  background(200);
  x += dt; //x incrementa en dt
  //r *= 1.001;
  translate(r*sin(x), r*cos(x)); //funcion de la circunferencia
  fill(255,0,0);
  ellipse(width/2, height/2, 20,20);
}
  


