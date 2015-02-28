
Regla[] reglas = new Regla[2000];

int totalreglas = 0;

void setup() {
  size(800,600);
  smooth();
}

void draw() {
  background(0);

 
  reglas[totalreglas] = new Regla();

  
  totalreglas++ ;

  
  if (totalreglas >= reglas.length) {
    totalreglas = 0; 
  }

  
  for (int i = 0; i < totalreglas; i++ ) { 
   
    reglas[i].mostrar();
    reglas[i].rebotar();
   
  }

}
class Regla{
  float x,y;
  float velocidadX;
  float velocidadY;
 
 
  float r;
  Regla(){
    r=8;
    x=random(width);
    y=-r*4;
    velocidadX=random(1,10);
    velocidadY=random(1,10);
   
  }

  void mostrar(){
    y+=velocidadY;
    x+=velocidadX;
    
    stroke(255,0,0);
    for(int i=2;i<r;i++){
       line(0,600,y+10,x+10);
       stroke(255,0,0);
       
       line(800,600,y-10,x-10);
        noStroke();
      fill(255,153,8);
     ellipse(600-50*i,y-i,8-i,8+i);
      ellipse(600-30*i,y-i,8-2*i,8+i);
    }}
    
    void rebotar(){
    if(y>=width){
      velocidadY=velocidadY*-2;
    }
  if(x>=height){
  velocidadX=velocidadX*-1;
  }
if(y<=0){
  velocidadY=velocidadY*+2;
}}

}
     
    
    

