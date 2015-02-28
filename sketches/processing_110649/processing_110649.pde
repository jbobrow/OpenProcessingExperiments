
float x_aleatorio;
float y_aleatorio;

void setup(){
   
  size(400,400);
  background(255);
  puntos_aleatorios();
}
void puntos_aleatorios(){
  
  for (int i=0; i<=300; i++) {
  
     float x_aleatorio = random(i*2);
     float y_aleatorio = random(i*2);
     point(x_aleatorio, y_aleatorio);
    
    }
}
