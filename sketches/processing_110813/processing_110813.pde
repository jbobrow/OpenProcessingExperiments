
int x_aleatorio;
int y_aleatorio;
void setup(){
    size(400,400);
    background(300);
    puntos_aleatorios();
}
  
 void puntos_aleatorios(){
     for(int i=0; i<300 ; i++){
     stroke (100);
     rect(random(1,399),random(1,399),0.9,0.9);
     }
 }
 void rectangulo (){
     stroke(100);
     rect(25,25,350,350);
      
 }
