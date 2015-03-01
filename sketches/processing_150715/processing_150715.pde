
/*************************

Alumno: Ignacio Dolz Monzó
Ejercicio: Simular el escenario de la figura para interactuar con
un muelle con y sin amortiguación.
Asignatura: simulación. (Parte fisica)
Centro: Universidad de valencia Ingeniería multimedia

************************/

//masa de las pelotas
float masa=3.0;

//incremento de tiempo
float dt=0.2;

float tama=1.0;

PVector grav= new PVector(0,9.8);

//Euler
PVector PosEuler= new PVector(0,0);
PVector VelEuler= new PVector(0,0);
PVector F_Euler= new PVector(0,0);

//Hune
PVector PosHeun= new PVector(0,0);
PVector VelHeun=new PVector(0,0);
PVector VelAntHeun= new PVector(0,0);
PVector F_Heun= new PVector(0,0);

//RK2
PVector PosRk2= new PVector(0,0);
PVector VelRk2=new PVector(0,0);
PVector F_Rk2= new PVector(0,0);

float Kd=0.5; //constante amortiguacion
float Ks=-1; //constante de elasticidad

float muelle(float posicion_M,float velocidad_M){
  
  float Lreposo=80;//muelle en reposo
  float peso=masa*grav.y;
  
  //vectores de la fuerza del muelle
  PVector F_muelle= new PVector(0,0); 
  PVector F_muelle_amort= new PVector(0,0);
  PVector F_total_amort=new PVector(0,0);
  
  
  //Fuerza del desp (LEY HOOKE)
  F_muelle.y=Ks*(posicion_M-Lreposo);
  
  F_muelle_amort.y= F_muelle.y - Kd*velocidad_M;
  
  //Fuerza total con amortiguacion
 return F_total_amort.y= F_muelle_amort.y/peso;

}

void setup(){
  size(460,500);
  background(255);
    smooth();
}

void draw(){
  background(255); 
    fill(0);
  text("INTEGRADORES",width-170, 50);
  fill(255,0,0);
  text("METODO EULER",width-170, 65);
  fill(0,255,0);
  text("METODO HEUN",width-170, 80);
  fill(0,0,255);
  text("METODO RUNGE-KUTTA 2",width-170, 95);
 fill(0);
  text("Kd (constante amortiguacion) = "+Kd ,width/4, height/4-10);
  text("Ks (constante elasticidad) = "+Ks ,width/4, height/4+10);
  text("Masa = "+masa ,width/4, height/4+30);
  //text("Presiona espacio para reiniciar",width/4, height/4-50);*/
    smooth();
    
  //Euler
  
 /////////////////////////////////////////////////
  //ley Hoke con amortigodor
  F_Euler.y= muelle(PosEuler.y, VelEuler.y); 
  //velocidad
  VelEuler.y= VelEuler.y+F_Euler.y*dt; 
  //Posicion
  PosEuler.y= PosEuler.y+VelEuler.y*dt;
//////////////////////////////////////////////////

  //Heun
  
///////////////////////////////////////////////   
    //ley Hoke con amortigodor
  F_Heun.y= muelle(PosHeun.y, VelHeun.y);  
  //velocidad
  VelHeun.y= VelHeun.y+F_Heun.y*dt;
  //Posicion
  PosHeun.y= PosHeun.y+((VelHeun.y+VelAntHeun.y)/2)*dt;
  //Posicion anterior;
  VelAntHeun.y= VelHeun.y;

  //RK2
/////////////////////////////////////////////  
    //ley Hoke con amortigodor
  F_Rk2.y= muelle(PosRk2.y, VelRk2.y); 
   //Velocidad 
  VelRk2.y= VelRk2.y+F_Rk2.y*(dt/2);
  //posicion
  PosRk2.y= PosRk2.y+VelRk2.y*(dt/2);
////////////////////////////////////////////  
 
 
 //resorte
     pushMatrix();
      line(0,(height/2),(width/2), (height/2));
    popMatrix();
  
  
   //Muelle EULER
   pushMatrix();
      line((width/2),(height/2),(width/2), (height/2)+PosEuler.y);
    popMatrix();
    
    // Ellipse EULER
    pushMatrix();
      translate(0,PosEuler.y);
      fill(255,0,0,50);
      ellipse(width/2,height/2,30+tama,30+tama);
    popMatrix();
  
  
      // Muelle Heun
    pushMatrix();
    line((width/2),(height/2),(width/2), (height/2) + PosHeun.y);
    popMatrix();
    
    // ellipse HEUN
    pushMatrix();
      translate(0,PosHeun.y);
      fill(0,255,0,80);
      ellipse(width/2,height/2,30+tama,30+tama);
    popMatrix(); 
    
        // MuelleRK2
    pushMatrix();
      line((width/2),(height/2),(width/2), (height/2) + PosRk2.y);
    popMatrix();
    
    // Ellipse RK2
    pushMatrix();
      translate(0,PosRk2.y);
      fill(0,0,255,80);
      ellipse(width/2,height/2,30+tama,30+tama);
    popMatrix();
  
}

void keyPressed() {  
    // Al pulsar la tecla x se aumentan los grados de inclinación del plano
  if(key == ' ') {
  PosEuler= new PVector(0,0);
  VelEuler= new PVector(0,0);
  F_Euler= new PVector(0,0);

//Hune
 PosHeun= new PVector(0,0);
 VelHeun=new PVector(0,0);
 VelAntHeun= new PVector(0,0);
 F_Heun= new PVector(0,0);

//RK2
 PosRk2= new PVector(0,0);
 VelRk2=new PVector(0,0);
 F_Rk2= new PVector(0,0);
  
}
  if(key == '+') {
     Kd+= 0.1;
  }

  else if(key == '-') {
    Kd-= 0.1;
  }
  
    if(key == 'z') {
     Ks+= 0.1;
  }
  else if(key == 'x') {
    Ks-= 0.1;
  }  
    if(key == 'n') {
     tama+= 1;
     masa+=1;
  }

  else if(key == 'm') {
    tama-= 1;
    masa-=1;
    
    if (masa==0 || tama ==0){
      masa=1;
      tama=1;
    }
  }
  
}



