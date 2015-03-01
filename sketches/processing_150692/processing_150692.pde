

/*************************

Alumno: Ignacio Dolz Monzó
Ejercicio:buble-shooter’ sencillo, lanzador de pelotas mediante la interaccion del raton.
Asignatura: simulacion. (Parte matematica)
Centro: Universidad de valencia Ingeniería multimedia

************************/

  PVector mouse= new PVector(mouseX,mouseY);
  boolean disparo=false;//condicion de disparo
  PVector aux= new PVector(0,0);
  float balaX=0.0;//posicion de la bala en X
  float balaY=0.0;//posicion de la bala en Y
  float vel=0.0001;
  
void setup(){
size(680,380);  
smooth();

}

void draw(){
  background(120);
  fill(0);
   text("Presiona el raton sostenidamente para producir un disparo \n en la direccion establecida por el vector ",50, 50);
  PVector centro=new PVector(100,300); //Vector de movimiento del brazo
  PVector mouse= new PVector(mouseX,mouseY);//Vector raton para eventons de teclado 
  
  mouse.sub(centro); //Resta de vectores
  mouse.normalize();//normalizar el vector
  mouse.mult(100);//multiplicacion de vectores para hacer el brazo mas larco
  
  translate(width/2, 370); //trasladamos el brazo a la parte inferior centrado
  stroke(255);
  strokeWeight(2);
  line(0, 0, mouse.x, mouse.y);
  aux.set(mouse);
  


if( mousePressed){  //evento de teclado que cambia la condicion de disparo
    disparo=true;
    
  }
  if(disparo){
    
    balaX += vel+ aux.x/4; //desplazamiento de la bala en X
    balaY += vel+ aux.y/4;//desplazamiento de la bala en Y
    
      noStroke(); //color del borde
      //strokeWeight(2); //Grosor del borde
     fill(255,0,0);//Relleno de la esfera
    ellipse(balaX,balaY,30,30);
    disparo=false;
       
   } 
   
  else{ //volvemos a poner la bala en 0.0
  
   balaX=0.0;
   balaY=0.0;

  }

}



