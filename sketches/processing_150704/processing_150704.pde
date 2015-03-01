
/***************************************/
/*                                     */
/*            FUERZAS MUELLE           */
/*    Autor: Pablo Casanova Salas      */
/*    Interacción con teclado:         */
/*    -UP-> Aumentar masa              */
/*    -DOWN-> Decrementar masa         */
/*    -SPACE-> On/Off amortiguacion    */
/*                                     */
/***************************************/

//VARIABLES GLOBALES
//Diferencial de tiempo
float dt=0.2;
//Masa de los objetos
float m=2.0;
//Constante de aceleración gravitatoria
float g=9.8;
//Constante elástica
float ks=0.2;
//Constante de amortiguacion
float kd=0.1;
//Centro x de la pantalla
float cx;
//Centro y de la pantalla
float cy;
//Longitud del muelle en reposo
float l_reposo=200;

//Vectores de velocidad, posición y aceleración de los 3 integradores
//Euler
PVector v_euler = new PVector(0,-10);
PVector p_euler = new PVector(0,100);
PVector a_euler = new PVector(0,-10);
//Heun
PVector v_heun = new PVector(0,-10);
PVector v_old_heun = new PVector(0,-10);
PVector p_heun = new PVector(0,100);
PVector a_heun = new PVector(0,-10);
//RK2
PVector v_rk2 = new PVector(0,-10);
PVector v_rk2_half = new PVector(0,0);
PVector p_rk2 = new PVector(0,100);
PVector p_rk2_half = new PVector(0,0);
PVector a_rk2 = new PVector(0,-10);
PVector a_rk2_half = new PVector(0,-10);
//Vectores para las fuerzas del sistema
PVector fk = new PVector(0,0);
PVector f_total = new PVector(0,0);

void setup()
{
    size(800,500);
    noStroke();
    smooth();
    cx=(width*0.5);
    cy=(height*0.5);
}
//Función que calcula la aceleración respecto a la posición actual y la velocidad mediante las fuerzas existentes
float computoFuerzas(float pos_actual, float v)
{
    float Ftangencial  =  g * m;
    float acel=0.0;
    //Solo tenemos fuerza en la componente y
    fk.y= -ks * (pos_actual-l_reposo) - (kd*v);
    f_total.y= Ftangencial + fk.y;
    acel = f_total.y / m;
    return acel;
}

void draw()
{
    background(0);
    //Imprimimos los datos de los muelles por pantalla
    fill(255);
    textSize(16);
    text("Masa = "+m,10,80);
    text("L euler = "+p_euler.y,10,100);
    text("L heun = "+p_heun.y,10,120);
    text("L RK2 = "+p_rk2.y,10,140);
    text("v euler = "+v_euler.y,10,160);
    text("v heun = "+v_heun.y,10,180);
    text("v RK2 = "+v_rk2.y,10,200);
    text("kd: "+kd,10,220);
    
    //EULER  
    //Cálculo de la aceleración mediante llamada a la función computoFuerzas
    a_euler.y=computoFuerzas(p_euler.y,v_euler.y);
    //Cálculo de la velocidad
    v_euler.y = v_euler.y + a_euler.y * dt;
    //Cálculo de longitud actual del muelle(Euler Semi)
    p_euler.y = p_euler.y + v_euler.y * dt;
  
    //HEUN
    //Cálculo de la aceleración mediante llamada a la función computoFuerzas
    a_heun.y=computoFuerzas(p_heun.y,v_heun.y);
    
    //Cálculo de la velocidad
    v_heun.y = v_heun.y + a_heun.y * dt;
    //Cálculo de longitud actual del muelle
    p_heun.y = p_heun.y + ((v_heun.y+v_old_heun.y)/2) * dt;
     //Guardamos la velocidad anterior para el siguiente cálculo de posicion
    v_old_heun.y = v_heun.y;

    //RK2
    //Cálculo de la aceleración mediante llamada a la función computoFuerzas
    a_rk2.y=computoFuerzas(p_rk2.y,v_rk2.y);
    //Cálculo de la velocidad en el punto medio
    v_rk2_half.y = v_rk2.y + (0.5 * a_rk2.y * dt);
    //Cálculo de longitud del muelle en el punto medio
    p_rk2_half.y = p_rk2.y + (0.5 * v_rk2.y * dt);
    //Cálculo de la aceleración en el punto mediamediante llamada a la función computoFuerzas
    a_rk2_half.y=computoFuerzas(p_rk2_half.y,v_rk2_half.y);
    //Cálculo de la velocidad
    v_rk2.y = v_rk2.y + a_rk2_half.y * dt;
    //Cálculo de longitud actual del muelle
    p_rk2.y = p_rk2.y + v_rk2_half.y * dt;

    //Pintamos la barra que sujeta los muelles
    pushMatrix();
    segment(cx,50,400,0);
    popMatrix();
  
    //Pintamos los muelles(lineas) de los que cuelgan los sólidos
    //1 por Cada Integrador
    //Euler(Rojo)
    pushMatrix();
    translate(cx-100,50);
    fill(255,0,0);
    text("EULER",-20,-10);
    line(0,0,0,p_euler.y-60);
    translate(0,p_euler.y-50);
    rectMode(CENTER);
    rect(0,-30,50*m,30*m);
    popMatrix();
  
    //Heun(Verde)
    pushMatrix();
    translate(cx+100,50);
    fill(0,255,0);
    text("HEUN",-20,-10);
    line(0,0,0,p_heun.y-60);
    translate(0,p_heun.y-50);
    rectMode(CENTER);
    rect(0,-30,50*m,30*m);
    popMatrix();
  
    //RK2(Azul)
    pushMatrix();
    translate(cx+300,50);
    fill(0,0,255);
    text("RK2",-15,-10);
    line(0,0,0,p_rk2.y-60);
    translate(0,p_rk2.y-50);
    rectMode(CENTER);
    rect(0,-30,50*m,30*m);
    popMatrix();
  
    
    
}

//Función que pinta una linea con centro (x,y) longitud 2*length y rotación a
void segment(float x,float y, float length,float a)
{
    stroke(250);
    strokeWeight(1);
    translate(x,y);
    rotate(-a);
    line(-length,0,length,0);
}
void keyReleased()
{
  //Interacción con el teclado
  if (keyCode == UP) 
    if(m<=3.4)
       m+=0.2;
  if (keyCode == DOWN) 
    if(m>1)
       m-=0.2;

  if(key==' ')
  {
    if(kd>0)
      kd=0;
    else
      kd=0.2;

  }
}


