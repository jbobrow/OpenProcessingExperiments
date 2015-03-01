
/***************************************/
/*                                     */
/*          TIRO PARABÓLICO            */
/*    Autor: Pablo Casanova Salas      */
/*                                     */
/***************************************/

//VARIABLES GLOBALES

//Diferencial de tiempo
float dt=0.2;
//Masa de las Pelotas
float m=1.0;
//Constante de aceleración gravitatoria
float g=9.8;

//Vector aceleración
PVector a=new PVector(0,0);

//Vectores de velocidad inicial y posición para los 3 integradores
//Euler
PVector v_euler = new PVector(40,-100);
PVector p_euler = new PVector(0,600);
//Heun
PVector v_heun = new PVector(40,-100);
PVector v_old_heun = new PVector(0,0);
PVector p_heun = new PVector(0,600);
//RK2
PVector v_rk2 = new PVector(40,-100);
PVector v_rk2_half = new PVector(0,0);
PVector p_rk2 = new PVector(0,600);

void setup()
{
    size(800,500);
    noStroke();
    smooth();
    //Llamada a la función que calcula las fuerzas del sistema
    computoFuerzas();
    //Leyenda 
    fill(255,0,0);
    text("EULER",10,10);
    fill(0,255,0);
    text("HEUN",10,30);
    fill(0,0,255);
    text("RK2",10,50);
}

void draw()
{
    //EULER
    //Cálculo de posición (Euler Explícito)
    p_euler.x = p_euler.x + v_euler.x * dt;
    p_euler.y = p_euler.y + v_euler.y * dt;
    //Calculo de la velocidad
    v_euler.x = v_euler.x + a.x * dt;
    v_euler.y = v_euler.y + a.y * dt;
  
    //HEUN
    
    //Cálculo de la velocidad
    v_heun.x = v_heun.x + a.x * dt;
    v_heun.y = v_heun.y + a.y * dt;
    //Cálculo de la posición
    p_heun.x = p_heun.x + ((v_heun.x+v_old_heun.x)/2.0) * dt;
    p_heun.y = p_heun.y + ((v_heun.y+v_old_heun.y)/2.0) * dt;
    
    //Guardamos la velocidad anterior para el siguiente cálculo de posicion
    v_old_heun.x = v_heun.x;
    v_old_heun.y = v_heun.y;

    //RK2
    //Cálculo de la velocidad en el punto medio
    v_rk2_half.x = v_rk2.x + (0.5 * a.x*dt);
    v_rk2_half.y = v_rk2.y + (0.5 * a.y*dt);
    //Calculo de la velocidad
    v_rk2.x = v_rk2.x + a.x * dt;
    v_rk2.y = v_rk2.y + a.y * dt;
    //Cálculo de la posición
    p_rk2.x = p_rk2.x + v_rk2_half.x * dt;
    p_rk2.y = p_rk2.y + v_rk2_half.y * dt;
 
    //Pintamos las esferas que representan a los integradores.
    //EULER (Rojo)
    pushMatrix();
    translate(p_euler.x,p_euler.y);
    fill(255,0,0);
    ellipse(0,0,10,10);
    popMatrix();
  
    //HEUN (Verde)
    pushMatrix();
    translate(p_heun.x,p_heun.y);
    fill(0,255,0);
    ellipse(0,0,10,10);
    popMatrix();
  
    //RK2 (Azul)
    pushMatrix();
    translate(p_rk2.x,p_rk2.y);
    fill(0,0,255);
    ellipse(0,0,10,10);
    popMatrix();
    
    //Imprimimos por consola las diferencias de posición entre los integradores
    print("Diferencia x Euler-Heun: "+ (p_euler.x-p_heun.x)+"\n");
    print("Diferencia y Euler-Heun: "+ (p_euler.y-p_heun.y)+"\n");
    print("Diferencia x Rk2-Heun: "+ (p_rk2.x-p_heun.x)+"\n");
    print("Diferencia y Rk2-Heun: "+ (p_rk2.y-p_heun.y)+"\n");
    print("Diferencia x Rk2-Euler: "+ (p_rk2.x-p_euler.x)+"\n");
    print("Diferencia y Rk2-Euler: "+ (p_rk2.y-p_euler.y)+"\n");
    
}

void computoFuerzas()
{
    float F;
    F= g*m;
    a.y=F/m;
}
void keyPressed()
{
   if(key==' ')
   {
      //Euler
      v_euler = new PVector(40,-100);
      p_euler = new PVector(0,600);
      //Heun
      v_heun = new PVector(40,-100);
      v_old_heun = new PVector(0,0);
      p_heun = new PVector(0,600);
      //RK2
      v_rk2 = new PVector(40,-100);
      v_rk2_half = new PVector(0,0);
      p_rk2 = new PVector(0,600);
      
      a=new PVector(0,0);
      background(160);
      setup();
   }
     

}


