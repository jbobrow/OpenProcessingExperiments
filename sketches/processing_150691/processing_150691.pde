
/*Alina Honhala
-Ejercicio: Simular el movimiento lineal de un coche en 2 tramos
con pendientes 0 y PI/4 y velocidades v, v/2 en cada tramo. */

float x = 0;
float y = 0;
float pos_y; 
float incr = 0.03; //Incremento en 'x'
float vel = 80; //Velocidad
int diam = 30; //diÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¡metro de ruedas


void setup( ){
  size (600,600);
  smooth();
}
void draw ( ){
  
  pos_y = height/2;
  background (0);
  fill(#EB9927);
  text("Pulsa 'espacio' para comenzar.",20,50);
  
    
  if(x < 200)
  {
    x+= vel*incr; 
    rect (x, pos_y-60, 90, 50);
    ellipse (x+20, pos_y, diam, diam);
    ellipse (x+70, pos_y, diam, diam);
    
  }
  else
  {
    x+= (vel/2)*incr; //Se reduce la velocidad
    y+= (PI/4); //Pendiente descendiente
    rect (x, (pos_y-60)+y, 90, 50); //En el eje 'y' sumamos la pendiente
    ellipse (x+20, pos_y+y, diam, diam);
    ellipse (x+70, pos_y+y, diam, diam);
    
  }
 

}

void keyPressed(){
   if(key == ' '){
       x=0;
       y=0;
       pos_y = height/2;
       setup();
   }
      

}





