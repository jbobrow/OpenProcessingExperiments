
float a;
float d; 
int x_aleatorio;
int y_aleatorio;
void setup(){
    size(400,400);
    background(255);
d = 2; // puntos de 7 px.
a = 4; // centros separados 10 px.
stroke (120); // los puntos se dibujan sin borde
noFill(); 

    puntos_aleatorios();

 }
 void puntos_aleatorios(){
     for(int i=0; i<300 ; i++){
     stroke(120);
     rect(random(26,374),random(26,374),2,2);
     }

     stroke(120);
     rect(25,25,350,350);
     }
