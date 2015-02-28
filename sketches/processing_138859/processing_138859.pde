
int cantidad;
particula[] parts;

void setup(){
  size(300,300);
  
  cantidad = 200;
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
    velocity = new PVector(random(-1,1),random(-1,1));
    acceleration = new PVector(0,0.005);
    transparencia = 0;
    size= (int)random (10,20);
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
    ellipse(position.x,position.y,10,10);
  }
  
}

