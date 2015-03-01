
/*******************************************************************/
/* SIMULACIÓN 2014/2015                                            */
/*                                                                 */
/* Oscar García Martínez                                           */
/*                                                                 */
/*                                                                 */
/* Ejercicio montaña rusa (aceleración): Simular el movimiento de  */
/* una circunferencia que se mueve a tramos de velocidad (ej. con  */
/* pendientes distintas en cada tramo y velocidades en función de  */
/* las pendientes ).                                               */
/* Añadir aceleración en los tramos.                               */
/*                                                                 */
/*******************************************************************/

////Declaración de variables e inicialización de las mismas
float a0 = 1.0;
float a = 0.0;
float v = 1.0;
float pendiente = 0.0;
float vx = 0;
float vy = 0;
float x = -250.0;
float y = -100.0; 
float t = 0.0;
float dt = 0.08;
float t_tramo_1 = 9.0;
float t_tramo_2 = 17.0;
float t_tramo_3 = 25.0;
float t_tramo_4 = 35.0;


void setup() {
  size(500, 500);
  smooth();
}

//Aplicamos una pendiente y una aceleración distinta en cada tramo

void draw() {
  background(0);
    
  pushMatrix();  
    if(t<t_tramo_1){    
      pendiente = -PI/6;
      a = a0+0.5;
      v = calcularV(v,a,dt);
    }else if(t>=t_tramo_1 && t< t_tramo_2){
      pendiente = 0.0;
      a = a0;
      v = calcularV(v,a,dt);
    }
    else if(t>=t_tramo_2 && t< t_tramo_3){
      pendiente = PI/4;
      a = a0-3;
      v = calcularV(v,a,dt);
    }else {
      pendiente = -PI/6;
      a = a0+1;
      v = calcularV(v,a,dt);//calculamos velcidad con la aceleración aplicada
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
  
  text(" t:  "+t+   "   \t  v: " + v,20,20);
}

  
//Calculamos la velocidad con la aceleración aplicada y en caso de que la v 
//pudiese ser negativa (en el tramo en el que la aceleración es negativa), 
//la bola no se moverá en sentido contrario, sino que se parará.
float calcularV(float v,float a,float dt){
  
  v= v+a*dt;
  if(v< 0) {
    return 0; //la bola se parará si la velocidad es negativa
  }else{
    return v;
  }
}


