
int x_aleatorio;
int y_aleatorio;
void setup(){
    size(400,400);
    background(255);
    puntos_aleatorios();
}
  
 void puntos_aleatorios(){
     for(int i=0; i<300 ; i++){
     rect(random(1,399),random(1,399),1,1);
     }
 }
 void rectangulo (){
     rect(1,1,399,399);
      
 }
