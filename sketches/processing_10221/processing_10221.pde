
/*
EJERCICIO 4 
SESION 3
CONDICIONALES Y VARIABLES

 Título: condicionales y variables
 Nombre: Aixa Martinez

 //
*/
 
//DECLARACIÓN DE VARIABLES
float cy, cx;
float angle;

//SETUP 
void setup (){
 
size (800, 400);
background (0);
fill (255);
frameRate (30);
 
}
//DRAW CREA
void draw(){
   
  float radius = sqrt (sq (mouseX-width/2) + sq (mouseY-height/2));
  translate (width/2, height/2);
  smooth();
   
  cx = cos (radians(angle));
  cy = sin (radians (angle));

//ELIPSES   
  stroke(30);   
  ellipse (radius*cx, radius*cy, 150, 150);
  angle -= 5;
  
//CONDICIONAL MOVIMIENTO ROTATIVO
  if (angle <= -360){
    angle=0;
    
//COLORES ALEATORIOS DE LAS ELIPSES     
    fill (random(250), random(250), random (250));
     }
   
//CONDICIONAL QUE CAMBIA BACKGROUND A BLANCO, BORRA TODO     
    if (mousePressed){     
      background (255);       
    }


     
}

