

/*************************

Alumno: Ignacio Dolz Monzó
Ejercicio: Simula un plano inclinado con un objeto cayendo con una fuerza de rozamiento determinada
Con pendiente  PI/4 velociad v.
Asignatura: simulación. (Parte matematica)
Centro: Universidad de valencia Ingeniería multimedia

************************/

float masa=1.0;
float dt=0.2;
float Kr=0.1;

//VectorFuerza 
PVector fuer_Eu= new PVector(0,0);
PVector fuer_Hu= new PVector(0,0);
PVector fuer_Rk= new PVector(0,0);


//Aceleracion
PVector vel_eu= new PVector(0,0);
PVector vel_hu= new PVector(0,0);
PVector vel_rk= new PVector(0,0);

//Fuerzas

PVector Ftang= new PVector(0,0);
//Fuerzas de rozamiento para cada sistema
PVector Froz_Eu= new PVector(0,0);
PVector Froz_Hu= new PVector(0,0);
PVector Froz_Rk= new PVector(0,0);

//Sumatorio de todas las fuerzas
PVector SumF_Eu=new PVector(0,0);
PVector SumF_Hu=new PVector(0,0);
PVector SumF_Rk=new PVector(0,0);

PVector grav= new PVector(0,9.8);
//PVector fuer= new PVector(0,0);

//angulo plano
float ang=30;

//Euler
PVector PosEuler= new PVector(0,0);
PVector VelEuler= new PVector(0,0);

//Hune
PVector PosHeun= new PVector(0,0);
PVector VelHeun=new PVector(0,0);
PVector VelAntHeun= new PVector(0,0);

//RK2
PVector PosRk2= new PVector(0,0);
PVector VelRk2=new PVector(0,0);

void setup(){
  
  size(900,600);
  background(255);

  
}

void Euler(){
  //Euler
  
///////////////////////////////////////////////  
  //velocidad
  VelEuler.x= VelEuler.x+fuer_Eu.x*dt;
  PosEuler.x= PosEuler.x+VelEuler.x*dt;
  
   vel_eu.x=VelEuler.x;
//////////////////////////////////////////////  
}

void Heun(){
    //Heun
  
///////////////////////////////////////////////   
  //velocidad
  VelHeun.x= VelHeun.x+fuer_Hu.x*dt;
  //Posicion del objeto
  PosHeun.x= PosHeun.x+((VelHeun.x+VelAntHeun.x)/2)*dt;
  //vel anterior;
  VelAntHeun.x= VelHeun.x;
  
  vel_hu.x=VelHeun.x;
  
//////////////////////////////////////////////

}

void Rk2(){
    //RK2

/////////////////////////////////////////////  
  //velocidad
  VelRk2.x= VelRk2.x+fuer_Rk.x*(dt/2);
  //posicion
  PosRk2.x= PosRk2.x+VelRk2.x*(dt/2);
  
  vel_rk.x=VelRk2.x;
////////////////////////////////////////////  
 
}
void Fuerzas(){
    //Fuerza Tangencial
  
  Ftang.x= masa*grav.x*sin(radians(ang));

  //Fuerza de rozamiento
  Froz_Eu.x= -Kr * vel_eu.x;
  Froz_Hu.x= -Kr * vel_hu.x;
  Froz_Rk.x= -Kr * vel_rk.x;
  
  //SumFuerzas
  SumF_Eu.x= Ftang.x+Froz_Eu.x;
  SumF_Hu.x= Ftang.x+Froz_Hu.x;
  SumF_Rk.x= Ftang.x+Froz_Rk.x;
  
  //Fuerza total producida
  fuer_Eu.x= SumF_Eu.x/masa;
  fuer_Hu.x= SumF_Hu.x/masa;
  fuer_Rk.x= SumF_Rk.x/masa;
  
}

void draw(){
  
  background(255);
  fill(255);
  text("INTEGRADORES",width-170, 50);
  fill(255,0,0);
  text("METODO EULER",width-170, 65);
  fill(0,255,0);
  text("METODO HEUN",width-170, 80);
  fill(0,0,255);
  text("METODO RUNGE-KUTTA 2",width-170, 95);
   fill(0);
  text("Valor Kr= "+Kr ,width/4, height/4+20);
 // fill(0);
 // text("Presiona espacio para iniciar",width/4, height/4);
  
  

  Fuerzas();
  Euler();
  Heun();
  Rk2();

   //plano
    stroke(0,0,0);
    strokeWeight(2);
    line(0,(height/2)+100,width,(height/2)+100);
    
    // Plano inclinado
    translate(width/2,height/2); //transladamos al centro para rotar el plano
    rotate(radians(-ang));//rotamos el plano en el centro
    stroke(0,0,0);
    strokeWeight(2);
    line(-1000,0,1000,0);
    
    pushMatrix();    
    translate(width/2,0);
    translate(PosEuler.x,0);
    fill(255,0,0,90);
    noStroke();
    ellipse(0,-40,20,20);
    popMatrix();
    
   pushMatrix();     
    // Objeto sobre plano inclinado
    translate(width/2,0);
    translate(PosHeun.x,0);
    noStroke();
    fill(0,255,0,90);
    ellipse(0,-15,20,20);
    popMatrix();
    
      pushMatrix();     
    // Objeto sobre plano inclinado
    translate(width/2,0);
    translate( PosRk2.x,0);
    noStroke();
    fill(0,0,255,90);
    ellipse(0,-15,20,20);
    popMatrix();

}
  
void keyPressed() {  

  if(key == ' ') {
PosEuler= new PVector(0,0);
 VelEuler= new PVector(-50,-70);

//Hune
 PosHeun= new PVector(0,0);
 VelHeun=new PVector(-50,-70);
VelAntHeun= new PVector(0,0);

//RK2
PosRk2= new PVector(0,0);
 VelRk2=new PVector(-50,-70);  
}
  if(key == '+') {
    Kr+= 0.1;
  }

  else if(key == '-') {
    Kr-= 0.1;
  }
  
}
  
  






