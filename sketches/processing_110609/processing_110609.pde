
int a 


void setup(){ 


    size(400,400); 


    background(255); 


    rectangulo(); 


    puntos_aleatroios(); 


 } 


 void puntos_aleatorios(){ 


     for(int i=0; i<300 ; i++){ 


     stroke(120); 


     rect(random(26,374),random(26,374),2,2); 


     } 


 void rectangulo(){ 


     stroke(120); 


     rect(25,25,350,350); 


     }
