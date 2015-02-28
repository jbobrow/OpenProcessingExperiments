
//declaración de variables globables
float movimiento_x=QUARTER_PI;
float movimiento_y=PI+((3*PI)/4);
float x=50;
//definición del "setup"
void setup(){
  size(200, 200);
  smooth();
  frameRate(5);
//función de draw
}
void draw(){
  background(153);
  fill(255,255,0);
  arc(x,100,100,100,movimiento_x,movimiento_y);
  fill(0);
  arc(x,70,20,20,0,2*PI);
  comer();
}
//movimiento, boca y desplazamiento
void comer(){
  if(movimiento_x==QUARTER_PI){
    movimiento_x=0;
    movimiento_y=2*PI;
    x+=5;
  }
  else{
    movimiento_x=QUARTER_PI;
    movimiento_y=PI+((3*PI)/4);
  }
}

