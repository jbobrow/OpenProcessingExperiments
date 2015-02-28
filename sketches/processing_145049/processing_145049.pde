

//Aplicación de Random y de mouse Pressed:
//El "sketch" se mueve, como bien dice el nombre de esta acción,siguiendo una trayectoria 
//que consiste en una sucesión de pasos aleatorios(random walker), además el backgroud
//cambia de color al hacer clic con el botón derecho del ratón  en difernetes
//puntos del interior de la ventana (mausePressed).

int posX; //definición de la variable entera
color colorback;

//utilizamos void set up y void draw como variables de movimiento
void setup(){
size(600,600);
  background(0);

 posX=0;
 colorback=0; 
}

void draw(){
  background(colorback);
  int posX,posY;
  
  //el dibujo se mueve de manera random walker:
  posX=int(random(0,width-1));
  posY=int(random(0,height-1));

  dibujar (posX,posY);
    
}

// Usamos la función mousePresed para cambiar el fondo de color al hacer "clic" con el ratón.
void mousePressed()
{
  colorback= color(mouseX,mouseY,0);
}

void dibujar (int _x,int _y)

{
 
  //creación del sketch a partir de las siguientes formas geometricas
 // puntualización: fill es el color que le das al interior de la figuras geometricas
//                  stroke es el color del contorno de las figuras geometricas
  noStroke();
  fill(178,174,174);
  ellipse(_x-80,_y-200,150,150);//oreja
  
  stroke(0);
  fill(237,163,220);
  ellipse(_x-80,_y-200,90,90);//oreja int
  
  
  fill(178,174,174);
  ellipse(_x+80,_y-200,150,150);//oreja derecha
  
  fill(237,163,220);
  ellipse(_x+80,_y-200,90,90);//oreja int
 

  fill(178,174,174);
  ellipse(_x,_y-100,200,300);//Cabeza
  

  stroke(178,174,174);
  fill(178,174,174);
  ellipse(_x,_y-10,250,310);//boca
   
 
  stroke(0);
  fill(0);
  ellipse(_x,_y-30,150,310);//boca negro
  

 fill(225);
 rect(_x,_y+50,30,45);
 rect(_x-32,_y+50,30,45);//dientes

  
  stroke(0);
  ellipse(_x-40,_y-105,80,150);//pupila
  
  
  fill(0);
  ellipse(_x-40,_y-105,50,50);//pup 2
  
 
  fill(225);
  ellipse(_x+40,_y-105,80,150); //pupila derecha
  

  fill(0);
  ellipse(_x+40,_y-105,50,50); //pup2

  ellipse(_x,_y-8,200,150);//ocico negro
  
  
  fill(225);
  ellipse(_x,_y-14,200,150);//ocico
  

  fill(237,163,220);
  ellipse(_x,_y,60,70);//nariz (centro del sketch)
    
}


