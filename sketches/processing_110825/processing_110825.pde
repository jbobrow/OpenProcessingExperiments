
int x_aleatorio;
int y_aleatorio;
void setup(){
    size(400,400);
    background(255);
    rectangulo();
    puntos_aleatorios();
}
  
 void puntos_aleatorios(){
     for(int i=0; i<300 ; i++){
     stroke (75);
     rect(random(26,374),random(26,374),2,2);
     }
 }
 void rectangulo (){
     stroke(75);
     rect(20,20,360,360);
      
 }
