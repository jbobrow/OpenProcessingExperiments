
/*************************

Alumno: Ignacio Dolz Monzó
Ejercicio: Animar el movimiento de una particula a velocidad v sobre
las 2 funciones osciladoras:
1.- y = sin(x) * exp(−0,005x) .
2.- y=a*sin(3*x) + a*0.5*sin(3.5*x); 
Asignatura: simulación. (Parte matematica)
Centro: Universidad de valencia Ingeniería multimedia

************************/


float x,y;
float vel=0;
float vel1=0;
float a=40;
void setup(){
  
  size(640,480);
   }

void draw(){
  
 background(255); //para que se repinte
 int tiempo = millis();//Toma valores de la hora del sistema en milisegundos
   fill(0);
  /*text("Presiona espacio para empezar la simulación " ,width/2, 40);
  text("Presiona r para reiniciar la simulación  ",width/2, 60);
  text("Presiona + para aumentar la amplitud  ",width/2, 80);
  text("Presiona - para reducir la amplitud ",width/2, 100);*/
  text("Amplitud= "+ a,width-150,height-10);
 stroke(2); 
 line(0,(height/2)+100,width,(height/2)+100); //eje de y pintado en rojo
 line(0,(height/4),width,(height/4));
 
      
  pushMatrix();
   
   //Primera funcion Osciladora
   
   x+=vel;  
   y=a*sin(x)*exp(-0.005*x); 
   
     translate(x,y);
     
     
     
     noStroke();
     fill(0,0,255);//Relleno de la esfera
     fill(#33CC33);//Relleno de la esfera
     ellipse(0, (height/4), 25, 25); 
     
  popMatrix();
  
  
  pushMatrix();
  
  
   x+=vel1;  
   y=a*sin(3*x) + a*0.5*sin(3.5*x);
   
   translate(x,y);

   //stroke(255); //color del borde
   //strokeWeight(2); //Grosor del borde
   noStroke();
   fill(255,0,0);//Relleno de la esfera
   ellipse(0, (height/2)+100, 25, 25); 
 
   popMatrix();
    
println("coordenada X: " + x);
println("tiempo: " + tiempo);

 
}

void keyPressed(){
 if(key==' '){
    vel=0.1;
    vel1=0.01;
}
      if(key=='r'){
    vel=0;
    vel1=0;
    x=0;
    y=0;
}

      if(key=='+'){
   a+=5;
}

     if(key=='-'){
   a-=5;
}
 
}



