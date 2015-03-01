
/*************************

Alumno: Ignacio Dolz MonzÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â³ 
Ejercicio: Implementar una rutina que simule el movimiento de una partÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â­cula a lo largo de la espiral 2D de la figura. 
Con pendiente  PI/4 velociad v. 
Asignatura: simulaciÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â³n. (Parte matematica)  
Centro: Universidad de valencia IngenierÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â­a multimedia

************************/

float radio;
float x;
float vel;

void setup(){
  
  size(460,460);
   smooth();
   }

void draw(){
  
 background(255); 
 stroke(0); 
 line(width/2,0,width/2,600); 
 stroke(0); 
 line(0,height/2,width,height/2); 
 fill(0);
 
  if(key=='+'){
  vel+=0.001;
 
 }
 if(key=='-'){
  vel-=0.001;
 }
 
  //text("Presiona espacio para empezar y reiniciar la simulaciÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â³n",30, 80);   
  text("Radio= "+ radio ,width- 200, height-100);
  
 translate(radio*sin(x),radio*cos(x)); //trasladamos la esfera tanto en x como en y para que describa un movimiento circular
 
 stroke(0); //color del borde
 strokeWeight(0); //Grosor del borde
 fill(255,0,0);//Relleno de la esfera
 ellipse(width/2, height/2, 30, 30); 
 
  
   if(radio>0){
      x +=vel;
     radio=radio - 1;
   }
   else{
    vel=0;
   }
}

void keyPressed(){
 if(key==' '){
  vel=0.08;
  radio=200;
 }
 
}
 
 
 



