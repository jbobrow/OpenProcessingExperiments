
/***************************************/
/*                                     */
/*        SIMULADOR DE COCHE           */
/*    Autor: Pablo Casanova Salas      */
/*    Interacción con teclado:         */
/*      -SPACE-> Aplicar potencia      */
/*                                     */
/***************************************/

//VARIABLES GLOBALES

//Diferencial de tiempo
float dt=0.2;
//Potencia
float P = 100;
float p=0;
//Constante de Rozamiento
float Kr = 0.1;
//Perdida de potencia por rozamiento
Float Pr;
//Vector posición para el integrador EULER
PVector p_euler = new PVector(0,0);
//Objeto de la clase Coche
Coche car;
float max;
int t = 0;
final int Tam_Vent_X = 790, Tam_Vent_Y = 100;
float[] vT = new float[Tam_Vent_X];
void setup() 
{
    size(800,500);
    smooth();
    // Coche con parametros masa, velocidad y Energía Cinética
    car = new Coche(1, 10, 50);
    max=0;
}

void draw() 
{
    background(130);
    //Texto impreso con los datos
    fill(136,186,129);
    textSize(14);
    text("Potencia: "+p, 20,20);
    text("Kr: "+Kr, 20, 40);
    text("Masa: "+car.m, 20, 60); 
    text("Posicion x: "+p_euler.x,400, 20);
    text("Velocidad "+car.v,  400, 40);
    text("Energía cinética: "+car.EC, 400, 60);

    //Cálculo de la velocidad del coche
    car.UpdateVelocidad();
    //Cálculo de la posición(x) del coche mediante el integrador Euler Semi
    p_euler.x=p_euler.x + car.v * dt;
    
    //Pintamos la línea sobre la que se desplazará el coche
    pushMatrix();
    translate(0,height/2+100);
    stroke(0);
    line(0,0,width,0);
    popMatrix();
    
    //Pintamos el coche mediante 2 rectángulos y 2 elipses  
    pushMatrix();
    translate(100,height/2+100);
    fill(80,80,210);
    noStroke();
    translate(p_euler.x,0);
    rectMode(CENTER);
    rect(-10,-65,80,30);
    rect(0,-35,100,40);
    ellipseMode(CENTER);
    fill(0);
    ellipse(-25,-15,30,30);
    ellipse(25,-15,30,30);
    popMatrix();

    //Interacción con el teclado
     if(max < car.v)
       max = car.v;
     
     vT[t] = car.v;
     plot_func(t);
  t = (t + 1)%Tam_Vent_X;
    
}
void plot_func(int time)
{
  stroke(200, 10, 0);
  strokeWeight(3);
  fill(153);
  rectMode(CORNER); 
  rect(5,height-105, Tam_Vent_X, Tam_Vent_Y);
  stroke(200, 210, 0);
  
  
  strokeWeight(1);
  stroke(255);
 
  for(int i=8;i<time;i++)
   point (i, height-8 - (vT[i]/max)*Tam_Vent_Y*0.9) ;
  
 }
void keyPressed()
{
   if(key == ' ') 
   {
     if(p<100)
       p+=2;
     car.AplicarPotencia(p);
     
   }
   if (keyCode==UP)
     car.m++;
   if(keyCode==DOWN)
   {
     if(car.m>0)
       car.m--;
   }
}
void keyReleased()
{
  if(key==' ')
  {
    car.AplicarPotencia(p);
    p=0;
    
  }

}
class Coche 
{
    float m;
    float v;
    float EC;

    Coche(float mass, float vel, float e) 
    {
        m=mass;
        v=vel;
        EC=e;
    }
  
    void AplicarPotencia(float P) 
    {
        //Cálculo de la energía cinética con la potencia
        EC= P*dt;
    }
  
    void UpdateVelocidad()
    {
        //Cálculo de la velocidad
        v= sqrt(2*EC/m);
        //Cálculo de la pérdida de energía
        Pr = -Kr * v * v;
        //Cálculo de la energia cinética
        EC = EC + (Pr*dt);
    }
}


