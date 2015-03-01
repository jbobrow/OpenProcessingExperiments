
/*
 *  Práctica 6 - Simulación (sólido-rígido)
 *  Juan Carlos Leal y Pablo Casanova
*/

//import peasy.*;
//PeasyCam cam;

float radius = 60;
PVector location = new PVector(0,0,0);
PVector v_ang = new PVector(0,0,0);
PVector v_ang2 = new PVector(0,0,0);
PVector velocity = new PVector(0,0,0);
PVector rDown = new PVector(0, radius, 0);
PVector rUp = new PVector(0, -radius, 0);
PVector rDown2 = new PVector(0, radius/2, 0);
PVector rUp2 = new PVector(0, -radius/2, 0);
PVector velRDown = new PVector(0,0,0);
PVector velRUp = new PVector(0,0,0);
PVector velRDown2 = new PVector(0,0,0);
PVector velRUp2 = new PVector(0,0,0);
float mass = 5;
float dt = 0.15;

float wz = 0;
float wz2 = 0;
float ang = 0; //rz
float ang2 = 0;

boolean up = true;
boolean down = false;


void setup(){
  size(800, 500, P3D);
  background(100);
  //cam = new PeasyCam(this, 1000);  
  
}

void draw(){
  background(100);
  camera(0,0,1000,0,0,0,0,1,0);
  if(up){
    wz = velocity.x/rDown.y;
    wz2 = wz*rDown.y/(-rDown2.y);
  }
  if(down){
    wz = velocity.x/rUp.y;
    wz2 = wz*rUp.y/(-rUp2.y);
  }
    
  v_ang = new PVector(0, 0, wz);
  v_ang2 = new PVector(0, 0, wz2);
  
  // Esfera grande
  pushMatrix();
  translate(location.x, location.y, location.z);  
  if(up)
    rotateZ(ang);
  if(down)
    rotateZ(-ang);
  strokeWeight(1);
  stroke(255,0,0);
  noFill();
  sphere(radius*2);
  popMatrix();
  
  // Esfera pequeña
  pushMatrix();
  if(up){
    translate(location.x, location.y-radius*3, location.z); 
    rotateZ(ang2);
  }
  if(down){
    translate(location.x, location.y+radius*3, location.z); 
    rotateZ(-ang2);
  }
  strokeWeight(1);
  stroke(0,255,255);
  noFill();
  sphereDetail(14);
  sphere(radius);
  popMatrix();
  
  
  pushMatrix();
  if(up)    //ponemos el plano debajo de la esfera
    translate(0,radius*2,0);
  if(down)  //ponemos el plano encima de la esfera
    translate(0,-radius*2,0);
    
  stroke(0);
  strokeWeight(1);
  fill(0);
  box(5000,4,200);  
  popMatrix();
  
  if(up){
    rUp.set(0, -radius, 0);
    rDown.set(0, radius, 0);
    rUp2.set(0, -radius/2, 0);
    rDown2.set(0, radius/2, 0);
  }
  if(down){
    rDown.set(0, -radius, 0);
    rUp.set(0, radius, 0);
    rDown2.set(0, -radius/2, 0);
    rUp2.set(0, radius/2, 0);
  }
   
  velRDown = v_ang.cross(rDown);
  velRDown.add(velocity);
  
  velRUp = v_ang.cross(rUp);
  velRUp.add(velocity);
  
  velRDown2 = v_ang2.cross(rDown2);
  velRDown2.add(velocity);
  
  velRUp2 = v_ang2.cross(rUp2);
  velRUp2.add(velocity);
  
  ang += (v_ang.z*dt); 
  ang2 += (v_ang2.z*dt); 
  location.add(PVector.mult(velocity, dt));
  
  pushMatrix();
  translate(0,-250,0);  
  textSize(40);
  text("Velocidad Lineal (centro): " + velocity, -450, -180);
  text("Esfera grande: velocidad Lineal(arriba): " + velRUp, -450, -140);
  text("Esfera grande: velocidad Lineal(abajo): " + velRDown, -450, -100);
  text("Esfera pequeña: velocidad Lineal(arriba): " + velRUp2, -450, -60);
  text("Esfera pequeña: velocidad Lineal(abajo): " + velRDown2, -450, -20);
  popMatrix();
}

void keyPressed(){
  if(keyCode == UP){
    if(!up){
      up = true;
      down = false;
      velocity.set(0,0,0);
      location.set(0,0,0);
    }
  }  
  
  if(keyCode == DOWN){
    if(!down){
      down = true;
      up = false;
      velocity.set(0,0,0);
      location.set(0,0,0);
    }
  }
  
  
  if(keyCode == RIGHT){
    velocity.add(0.9, 0, 0);
  }
  if(keyCode == LEFT){
    velocity.sub(0.9, 0, 0);
  }
}




