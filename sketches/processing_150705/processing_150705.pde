
/***************************************/
/*                                     */
/*           PLANO INCLINADO           */
/*    Autor: Pablo Casanova Salas      */
/*    Interacción con teclado:         */
/*    -UP-> Aumentar inclinacion       */
/*    -DOWN-> Decrementar inclinacion  */
/*    -1-> Seleccionar integ. Euler    */
/*    -2-> Seleccionar integ. Heun     */
/*    -3-> Seleccionar integ. Rk2      */
/*                                     */
/***************************************/

//VARIABLES GLOBALES
//diferencial de tiempo
float dt=0.3;
//masa de los objetos
float m=1.0;
//centro x de la pantalla
float cx;
//centro x de la pantalla
float cy;
//angulo de inclinacion del plano
float ang=0.0;
//constante de rozamiento
float K=0.1;
//Constante de aceleración gravitatoria
float g=-9.8;
//Entero para seleccionar el integrador {1=Euler,2=Heun,3=RK2}
int integ=1;

//Vectores para las fuerzas presentes en el sistem {tangencial,rozamiento,total}
PVector f_tan = new PVector(0,0);
PVector f_r = new PVector(0,0);
PVector f_total = new PVector(0,0);
//Vector aceleración
PVector a = new PVector(0,0);

//Vector velocidad del metodo de integración seleccionado
PVector v_int= new PVector(0,0);
//Vectores de velocidad inicial y posición para los 3 integradores
//Euler
PVector v_euler = new PVector(0,0);
PVector p_euler= new PVector(0,0);
//Heun
PVector v_heun = new PVector(0,0);
PVector v_old_heun = new PVector(0,0);
PVector p_heun= new PVector(0,0);
//RK2
PVector v_rk2 = new PVector(0,0);
PVector v_rk2_half = new PVector(0,0);
PVector p_rk2 = new PVector(0,0);

void setup()
{
    size(800,500);
    noStroke();
    smooth();
    cx=(width*0.5);
    cy=(height*0.5);
}

void computoFuerzas()
{
    //Modulo de la fuerza tangencial
    float Ftangencial  =  g * m * sin(ang);
    //Componentes de la fuerza tangencial
    f_tan.x =Ftangencial*cos(ang);
    f_tan.y =Ftangencial*sin(ang);
    //Calculo de la fuerza de rozamiento
    f_r.x= (-K) * v_int.x;
    f_r.y= (-K) * v_int.y;
    //Calculo de la fuerza total resultante
    f_total.x = f_tan.x + f_r.x;
    f_total.y = f_tan.y + f_r.y;
    //Calculo de la aceleración resultante
    a.x = f_total.x / m;
    a.y = f_total.y / m;
}

void draw()
{
    background(0);
    //Llamada a la función que calcula las fuerzas presentes en el sistema
    computoFuerzas();
    //Imprimimos por pantalla los datos 
    text("F tangencial x: "+f_tan.x,10,10);
    text("F tangencial.y: "+f_tan.y,10,30);
    text("Fr x: "+f_r.x,200,10);
    text("Fr y: "+f_r.y,200,30);
    text("F total x: "+f_total.x,400,10);
    text("F total y: "+f_total.y,400,30);
    text("angulo: "+ang,10,50);
    text("aceleracion .x: "+a.x,600,10);
    text("aceleracion.y: "+a.y,600,30);
    text("velocidad x: "+v_int.x,800,10);
    text("velocidad y: "+v_int.y,800,30);
  
    if (integ==1)
    {
        //EULER
        //Cálculo de posición (Euler Explícito)
        p_euler.x = p_euler.x + v_euler.x * dt;
        p_euler.y = p_euler.y + v_euler.y * dt;
        //Calculo de la velocidad
        v_euler.x = v_euler.x + a.x * dt;
        v_euler.y = v_euler.y + a.y * dt;
        //Asociamos los valores de la velocidad del integrador
        //al vector global de velocidad 
        v_int.x=v_euler.x;
        v_int.y=v_euler.y;
  
        //Pintamos el Sólido que se desplaza por el plano
        //Euler (Rojo)
        pushMatrix();
        translate(cx,cy);
        fill(255,0,0);
        translate(p_euler.x,-p_euler.y);
        rectMode(CENTER);
        rotate(-ang);
        rect(0,-30,100,60);
        popMatrix();
    }
    
    else if(integ==2)
    {
        //HEUN
        //Guardamos la velocidad anterior para el siguiente cálculo
        v_old_heun.x = v_heun.x;
        v_old_heun.y = v_heun.y;
        //Cálculo de la velocidad
        v_heun.x = v_heun.x + a.x * dt;
        v_heun.y = v_heun.y + a.y * dt;
        //Cálculo de la posición
        p_heun.x = p_heun.x + ((v_heun.x+v_old_heun.x)/2.0) * dt;
        p_heun.y = p_heun.y + ((v_heun.y+v_old_heun.y)/2.0) * dt;
        //Asociamos los valores de la velocidad del integrador
        //al vector global de velocidad 
        v_int.x=v_heun.x;
        v_int.y=v_heun.y;
        
        //Pintamos el Sólido que se desplaza por el plano
        //Heun (Verde)  
        pushMatrix();
        translate(cx,cy);
        fill(0,255,0);
        translate(p_heun.x,-p_heun.y);
        rectMode(CENTER);
        rotate(-ang);
        rect(0,-30,100,60);
        popMatrix();
    }
    
    else
    {
        //RK2
        //Cálculo de la velocidad en el punto medio
        v_rk2_half.x = v_rk2.x + (0.5 * a.x*dt);
        v_rk2_half.y = v_rk2.y + (0.5 * a.y*dt);
        //Cálculo de la velocidad
        v_rk2.x = v_rk2.x + a.x * dt;
        v_rk2.y = v_rk2.y + a.y * dt;
        //Cálculo de la posición
        p_rk2.x = p_rk2.x + v_rk2_half.x * dt;
        p_rk2.y = p_rk2.y + v_rk2_half.y * dt;
        //Asociamos los valores de la velocidad del integrador
        //al vector global de velocidad   
        v_int.x=v_rk2.x;
        v_int.y=v_rk2.y;
        
        //Pintamos el Sólido que se desplaza por el plano
        //RK2 (Azul) 
        pushMatrix();
        translate(cx,cy);
        fill(0,0,255);
        translate(p_rk2.x,-p_rk2.y);
        rectMode(CENTER);
        rotate(-ang);
        rect(0,-30,100,60);
        popMatrix();
    }
    
    //Pintamos el Plano
    pushMatrix();
    segment(cx,cy,500,ang);
    popMatrix();
    
    //Interacción con el teclado
    if (keyPressed)
    { 
        if (key == CODED) 
        {
            if (keyCode == UP) 
            {
                if(ang<(PI/2))
                    ang+=0.1;
            } 
            else if (keyCode == DOWN) 
            {
                if(ang>(-PI/2))
                    ang-=0.1;
            }
            if(keyCode== UP || keyCode == DOWN)
            {
                //Cuando cambiamos el ángulo reinicializamos todos los valores
                f_tan= new PVector(0,0);
                f_r= new PVector(0,0);
                f_total= new PVector(0,0);
                a= new PVector(0,0);
                v_euler= new PVector(0,0);
                p_euler= new PVector(0,0);
                v_heun = new PVector(0,0);
                v_old_heun = new PVector(0,0);
                p_heun= new PVector(0,0);
                v_rk2 = new PVector(0,0);
                v_rk2_half = new PVector(0,0);
                p_rk2 = new PVector(0,0);
                v_int= new PVector(0,0);
            } 
        }
        if (key=='1')
        {
            integ=1;
            //Cuando cambiamos el integrador reinicializamos 
            //los valores que afectan al integrador seleccionado
            f_tan= new PVector(0,0);
            f_r= new PVector(0,0);
            f_total= new PVector(0,0);
            a= new PVector(0,0);
            v_euler= new PVector(0,0);
            p_euler= new PVector(0,0);
            v_int= new PVector(0,0);
        }
        else if (key=='2')
        {
            integ=2;
            //Cuando cambiamos el integrador reinicializamos 
            //los valores que afectan al integrador seleccionado
            f_tan= new PVector(0,0);
            f_r= new PVector(0,0);
            f_total= new PVector(0,0);
            a= new PVector(0,0);
            v_heun = new PVector(0,0);
            v_old_heun = new PVector(0,0);
            p_heun= new PVector(0,0);
            v_int= new PVector(0,0);
        }
        else if (key=='3')
        {
            integ=3;
            //Cuando cambiamos el integrador reinicializamos 
            //los valores que afectan al integrador seleccionado
            f_tan= new PVector(0,0);
            f_r= new PVector(0,0);
            f_total= new PVector(0,0);
            a= new PVector(0,0);
            v_rk2 = new PVector(0,0);
            v_rk2_half = new PVector(0,0);
            p_rk2 = new PVector(0,0);
            v_int= new PVector(0,0);
        }
    }
    
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





