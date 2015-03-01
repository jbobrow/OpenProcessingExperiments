
/*******************************************************************/
/* SIMULACIÓN 2014/2015                                            */
/*                                                                 */
/* Oscar García Martínez                                           */
/*                                                                 */
/*                                                                 */
/* Ejercicio montaña rusa: Simular el movimiento de una            */
/* circunferencia que se mueve a tramos de velocidad (ej. con      */
/* pendientes distintas en cada tramo y velocidades en función de  */
/* las pendientes ).                                               */
/*                                                                 */
/*******************************************************************/

//Declaración de variables e inicialización de las mismas

float v0 = 10.0;
float v = 0.0;
float pendiente = 0.0;
float vx = 0.0;
float vy = 0.0;
float t = 0.0;
float dt = 0.09;
float x = -250;
float y = -100; 
float t_tramo_1 = 10.0;
float t_tramo_2 = 20.0;
float t_tramo_3 = 40.0;
float t_tramo_4 = 50.0;

void setup() {
  size(500, 500);
  smooth();
}

//Aplicamos una pendiente y una velocidad distinta en cada tramo

void draw() {  
  background(0); 
  
  pushMatrix();  
    if(t<t_tramo_1){    
      pendiente = -PI/6;
      v = v0*1.5;
    }else if(t>=t_tramo_1 && t< t_tramo_2){
      pendiente =0.0 ;
      v=v0;
    }
    else if(t>=t_tramo_2 && t< t_tramo_3){
      pendiente = PI/4;
      v=v0/2;
    }else {
      pendiente = -PI/6;
      v=v0*1.5;
    }
    
    //calculamos la posición en x e y para cada instante
    vx = v*cos(pendiente);  
    vy = v*sin(pendiente);
    x = x + vx*dt;         
    y = y - vy*dt;          
    
    t += dt;  //incrementamos el tiempo t 
    
  translate(x, y);
  fill(255);
  ellipse(width/2, height/2, 20, 20);   
  popMatrix();
  
  text(" t: "+t+"   \t  v: " + v,30,20);
}




