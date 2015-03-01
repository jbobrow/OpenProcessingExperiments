

/**********************************/
/*     CRISTOBAL BELDA            */
/*   EDUARDO CASTELLANOS          */
/**********************************/

//import peasy.*;
//PeasyCam cam;
float masa=15;
float dt=0.5;
float diametro=50;
float radio=diametro/2;
float wz=0;
float angrot=0; 
PVector location = new PVector(0,0,0);
PVector vel= new PVector(10,0,0); 
PVector velAng;
PVector gravity = new PVector(0,9.8,0);
PVector gravity2 = new PVector(0,-9.8,0);

PVector acc= new PVector(0,0,0);
PVector VelAng= new PVector(0,0,0);
PVector pto = new PVector(0,radio,0);
PVector velpto = new PVector(0,0,0);


void setup(){
 size(800,600,P3D);
background(255);
//cam=new PeasyCam(this,1500);
}


void applyForce(PVector force) {
  PVector fuerza = force.get();
  fuerza.div(masa);
  acc.add(PVector.mult(fuerza, dt));
}

void update(){
  wz= vel.x/pto.y;
  velAng= new PVector (0.0,0.0,wz);
  
  fill(0);
  textSize(15);
  text("PRESS 'r' / 'l' to move the ball:", width/4, height/5, location.z);
  textSize(30);
    
    text("Velocidad:"+vel, width/4, height/4, location.z);
  vel.sub(PVector.mult(acc, dt));
  if( key== 'l' ){ 
    location.sub(PVector.mult(vel,dt));
    angrot+= (velAng.mag()*dt)*-1;
  }
  
  if(key == 'r'){ //movimiento hacia la derecha
    location.add(PVector.mult(vel,dt));//Euler, primero posicion y luego velocidad(de las particulas)
    angrot +=(velAng.mag()*dt);
  }
  
  if(location.x<-750)
    applyForce(gravity);
   if(location.x>750)
    applyForce(gravity2);
}

void draw(){
 background(200,200,255);
 lights();
update(); 

//ESFERA
  pushMatrix();
  translate(width/2, height/2, -1000);
  translate(location.x,location.y,location.z);
  rotateZ(-angrot);
 //strokeWeight(1);
  //stroke(255); 
  //noFill();
  line(0,0,0, 75, 75, 0);
  noStroke();
  fill(100,200,100);
  sphere(diametro);
  //strokeWeight(2);
  //fill(55,255,255);
  
  popMatrix();
  
  //ESFERA
  translate(width/2, height/2, -1000);
  translate(0,-55, 0);
  stroke(0);
  strokeWeight(1);
  fill(80,80,150);
  box(1500, 10, 200); 
  
  
   velpto = velAng.cross(pto);
   velpto.add(vel);
   print(velpto);
  
}

void keyPressed(){
 if(key=='+')
 vel.add(1,0,0);

if(key=='-')
 vel.sub(1,0,0);


}
  


