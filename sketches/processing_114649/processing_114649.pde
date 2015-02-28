
void setup(){
  size (400, 400);
  background (255);
  smooth ();
} 
 void draw (){
   stroke (0,0,0);
   strokeWeight (5);
  
//Lineas Verticales 
//LINEA VERDE V
stroke (0,100,0);
line ( 50, 0, 50, 500);

//LINEA MARRON V
stroke (100,0,0);
line ( 150, 0, 150, 500);

//LINEA AZUL V
stroke (0,0,100);
line ( 250, 0, 250, 500);

//LINEA GRIS V
stroke (100,100,100);
line ( 350, 0, 350, 500);

//LINEA NEGRA H 1
stroke (0,0,0);
line ( 0, 50,400, 50);

//LINEA NEGRA H 2
stroke (0,0,0);
line ( 0, 150, 400, 150);

//LINEA NEGRA H 3
stroke (0,0,100);
line ( 0, 250, 400, 250);

//LINEA NEGRA H 4
stroke (100,100,100);
line ( 0, 350, 400, 350);

// rectangulo AMARILLO
stroke (0,0,0);
fill (230,255 ,0);
rectMode (CENTER);
rect (100,100,100,100);

// rectangulo rojo
stroke (0,0,0);
fill (255,0 ,0);
rectMode (CENTER);
rect (200,200,100,100);

//rectangulo azul//
stroke (0,100,0);
fill (0,44, 255);
rectMode (CENTER);
rect (300,300,100,100);

//rectangulo MORADO //
stroke (0,0,0);
fill (100,44, 255);
rect (100,400,100,100);

//rectangulo VERDE //
stroke (0,0,0);
fill (44,144, 155);
rect (300,0,100,100);
  
     
 }
  

