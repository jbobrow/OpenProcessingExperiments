
/*************************

Alumno: Ignacio Dolz Monzó
Ejercicio: Simulamos en tiro parabolico con los 3 diferentes modelos estudiados: EULER, HEUN , RK2
Con pendiente  PI/4 velociad v.
Asignatura: simulación. (Parte fisica)
Centro: Universidad de valencia Ingeniería multimedia

************************/


float masa=0.7;
float tama=1.0;
float dt=0.2;

PVector grav= new PVector(0,9.8);
PVector fuer= new PVector(0,0);

//Euler
PVector PosEuler= new PVector(0,0);
PVector VelEuler=new PVector(0,0);

//Hune
PVector PosHeun= new PVector(0,0);
PVector VelHeun=new PVector(0,0);

PVector VelAntHeun= new PVector(0,0);

//RK2
PVector PosRk2= new PVector(0,0);
PVector VelRk2=new PVector(0,0);


public void Fuerza(){
  fuer.x=grav.x*masa;
  fuer.y=grav.y*masa;
}

void setup(){
  
  size(900,600);
  background(255);
  noStroke();
  fill(0);
  text("INTEGRADORES",width-170, 50);
  //text("Presiona espacio para iniciar",width/4, height/4);
  // text("Modificar masa con n (mas masa) y x m (menos masa) y reiniciar = "+ masa ,width/4, height/4+20);
  text("Velocidad de los integradores= " + VelEuler ,width/4, height/4+40 );
  fill(255,0,0);
  text("METODO EULER",width-170, 65);
  fill(0,255,0);
  text("METODO HEUN",width-170, 80);
  fill(0,0,255);
  text("METODO RUNGE-KUTTA 2",width-170, 95);
  
  
}

void draw(){
   
  Fuerza();
  
  //Euler
  
///////////////////////////////////////////////  
  //velocidad
  VelEuler.x= VelEuler.x+fuer.x*dt;
  VelEuler.y= VelEuler.y+fuer.y*dt;
  
  //Posicion
  PosEuler.x= PosEuler.x+VelEuler.x*dt;
  PosEuler.y= PosEuler.y+VelEuler.y*dt;
///////////////////////////////////////////////

  //Heun
  
///////////////////////////////////////////////   
  //velocidad
  VelHeun.x= VelHeun.x+fuer.x*dt;
  VelHeun.y= VelHeun.y+fuer.y*dt;
  //Posicion
  PosHeun.x= PosHeun.x+((VelHeun.x+VelAntHeun.x)/2)*dt;
  PosHeun.y= PosHeun.y+((VelHeun.y+VelAntHeun.y)/2)*dt;
  //Posicion anterior;
  VelAntHeun.x= VelHeun.x;
  VelAntHeun.y= VelHeun.y;
//////////////////////////////////////////////

  //RK2
  
  //velocidad
  VelRk2.x= VelRk2.x+fuer.x*(dt/2);
  VelRk2.y= VelRk2.y+fuer.y*(dt/2);
  //posicion
  PosRk2.x= PosRk2.x+VelRk2.x*(dt/2);
  PosRk2.y= PosRk2.y+VelRk2.y*(dt/2);
////////////////////////////////////////////  
 
  
  pushMatrix();
  //Euler
  translate(PosEuler.x,PosEuler.y);
  fill(255,0,0,50);
  ellipse(0,height, 20+tama,20+tama);
  popMatrix();
  
  pushMatrix();
  //Heun
  translate(PosHeun.x,PosHeun.y);
  fill(0,255,0,50);
  ellipse(0,height, 20+tama,20+tama);
  popMatrix();
  
  pushMatrix();
  //RK2
  translate(PosRk2.x,PosRk2.y);
  fill(0,0,255,50);
  ellipse(0,height, 20+tama,20+tama);
  popMatrix();
  
  
}
  
void keyPressed() {  

  if(key == ' ') {
   setup();
   draw();
//Euler
   PosEuler= new PVector(0,0);
   VelEuler= new PVector(50,-70);

//Hune
 PosHeun= new PVector(0,0);
 VelHeun=new PVector(50,-70);
 VelAntHeun= new PVector(0,0);

//RK2
 PosRk2= new PVector(0,0);
 VelRk2=new PVector(50,-70); 
  }
  
  if(key == 'n') {
     tama+= 0.5;
     masa+=0.5;
      
  }

  if(key == 'm') {
    tama-= 0.5;
    masa-=0.5;
     
    
    if (masa==0 || tama ==0){
      masa=0.5;
      tama=0.5;
    }
  }
  
  }
  



