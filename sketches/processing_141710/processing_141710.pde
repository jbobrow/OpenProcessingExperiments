
/*
Original Code From Mela Gonzalez
Modified by: Rafa Salcedo
*/

int cantidad;
particula[] parts;
 
void setup(){
  size(1000,300);
   
  cantidad = 2000;
  parts = new particula[cantidad];
   
  for(int i=0; i<cantidad; i++){
    PVector ini= new PVector(width/2,height/2);
    parts[i]= new particula(ini);
  }
}
 
void draw(){
  fill(0, 10);
  rect(0, 0, width, height);
   
  for(int i=0; i<cantidad; i++){
    parts[i].display();
    parts[i].update();
  }
}
 
class particula {
  PVector position;
  PVector velocity;
  PVector acceleration;
  int transparencia;
  int size;
  color col;
   
  particula (PVector initial){
    position = initial.get();
    velocity = new PVector(random(-4,4),random(-4,4));
    acceleration = new PVector(0,0.002);
    transparencia = 0;
    size= (int)random (10,30);
    col= color(random(255),random(255),random(255));
     
  }
   
  void update(){
    if( (position.x<=0) || (position.x>=width) ) { velocity.x = velocity.x * -1;}
    if( (position.y<=0) || (position.y>=width) ) { velocity.y = velocity.y * -1;}
     
    position.add(velocity);
    velocity.add(acceleration);
    if(transparencia<100)transparencia++;
  }
   
  void display(){
    fill(col,transparencia);
    noStroke();
   
    rect(position.x,position.y,40,5);
  }
   
}

