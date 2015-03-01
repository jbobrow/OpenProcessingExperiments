
/*************************

Alumno: Ignacio Dolz MonzÃ�Â³
Ejercicio: 
Caso 1 : Simular el movimiento de una esfera de manera que se mueva con
una velocidad lineal v(t) y que gire lo necesario para no producir el
clasico efecto de deslizamiento sobre el suelo (que no patine)

caso 2Como podriamos simular que nuestra esfera se desplaza sobre un
plano situado en la parte superior de la misma?
Asignatura: simulaciÃ�Â³n. 

Centro: Universidad de valencia IngenierÃ�Â­a multimedia


INTERACCION: Pulsa las teclas 1 y 2 para cambiar de modo.
             Pulsa m y c para mover la esfera y observar el movimiento.
************************/

//import peasy.*;


/* @pjs globalKeyEvents=true; 
 */

//PeasyCam cam;
float masa=8;
float dt=0.2;
float diametro=40;
float radio=diametro/2;
float wz=0;//angulo de rotacion del solido sobre Z
float angrot=0; //angulo de toracion =rz
PVector location = new PVector(0,0,0);
PVector vel= new PVector(10,0,0); //velocidad lineal
PVector velAng;

PVector acc= new PVector(0,0,0);
PVector VelAng= new PVector(0,0,0);
PVector pto = new PVector(0,radio,0);
PVector velpto = new PVector(0,0,0);
 
 int tipo=1;

void setup(){
size(460,500,P3D);
background(255);
/*cam=new PeasyCam(this,1000);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1000);*/
  
  
}


void applyForcePart(PVector force) {
  PVector fuerza = force.get();
  fuerza.div(masa);
  acc.add(PVector.mult(fuerza, dt));
}

void update(){
  wz= vel.x/pto.y;
  velAng= new PVector (0.0,0.0,wz);
  
  if( key== 'c' ){

    //movimiento acia la izqierda
    location.sub(PVector.mult(vel,dt));
    angrot+= (velAng.mag()*dt)*-1;
 
        }
  
  if(key == 'm'){ //movimiento de la derexa
    location.add(PVector.mult(vel,dt));
    angrot +=(velAng.mag()*dt);
  }
}

void draw(){
  camera(-100,0,-500,0,0,0,0,1,0);
  text("Mover la pelota con m y c ", 0,0,0);
 background(255);
update(); 

//pelota
      strokeWeight(0.5);
      stroke(0,0,255); 
      //fill(255,0,0);
      noFill();
  pushMatrix();
  translate(location.x,location.y,location.z);
  if(tipo==1)
  rotateZ(angrot);
  
  else if(tipo==2)
  rotateZ(-angrot);
  
  sphere(diametro);
  popMatrix();
  
  //Plano
  if(tipo==1)
  translate(0,50, 0);
  else if(tipo==2)
  translate(0,-50, 0);
  //nostroke();
  fill(10,255,0);
  stroke(0);
  strokeWeight(0.5);
  box(800, 10, 200);
  
  //comprobacion de velocidad en el punto de abajo=0
   velpto = velAng.cross(pto);
   velpto.add(vel);
   print(velpto);
  
}

void keyPressed(){
  if(key=='1')
  tipo=1;
  
  else if(key=='2')
  tipo=2;
  
 else if(key=='+')
 vel.add(1,0,0);

else if(key=='-')
 vel.sub(1,0,0);


}
  


