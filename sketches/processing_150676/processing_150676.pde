
/*************************

Alumno: Ignacio Dolz MonzÃ�ï¿½Ã�Â³
Ejercicio: Simula el movimiento lineal de un coche en 2 tramos con pendientes 0 a velocidad v 
Con pendiente  PI/4 velociad v.
Asignatura: simulacion. (Parte matematica)
Centro: Universidad de valencia IngenierÃ�ï¿½Ã�Â­a multimedia

************************/

float radio=80;
float x,y;
float vel=0;
void setup(){
  
  size(460,400);
  
   }

void draw(){
  
 background(255); //para que se repinte
 fill(0);
  text("Presiona v para comenzar con una velocidad lineal \n con valor 4 que se incrementa en cada iteracion"  ,15, 25);
 stroke(#0000CC); //color de linea
 line(width/2,0,width/2,height); 
 stroke(255,0,0); 
 line(0,height/2,width,height/2); 
   
 
 if(x<width/2){   
 
   x+=vel;  //movimiento lineal de un coche con pendiente 0 y velocidad v
   y=0;
     fill(0,0,0);
    text("Velocidad lineal " + x ,width-240, height-100);
   text("pendiente " + y ,width-240, height-120);   

 }
 else {
   x+=vel/2; //movimiento lineal de un coche con pendiente PI/4 y velocidad V/2
   y-=PI/4;
   fill(0);
   text("Velocidad lineal " + x ,width-240, height-100);
   text("pendiente = PI/4 " ,width-240, height-120);  
 }
 
if(x>width || y > height){
  x=0;
  vel=0;
  y=0;
}
 translate(x,y);
 
 stroke(255); //color del borde
 strokeWeight(2); //Grosor del borde
 fill(#33CC33);//Relleno de la esfera
 ellipse(0, height/2, 20, 20);

println("coordenada X: " + x);
println("coordenada Y: " + y);
}

void keyPressed(){
  
  if(key== 'v'){
    vel=4;
  }
    
 
}


