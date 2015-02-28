

// Autor: Köhn Federico Lucas // Escrito: Junio 2010.

///////////////////////////////////////////////////////////////////////////////////////
// FUNCIÓN DEL PROGRAMA:
// Modificar segun Mouse, la velocidad de los nodos orbitales "MAQUINICOS":


///////////////////////////////////////////////////////////////////////////////////////
// SETEO DEL PROGRAMA:

/*
// Resolución y Proporción de visor:
 int Xsize = 800; // Referencia "X" de Proporción 4:3.
 int Usize = Xsize/4; // Unidad de Proporción 4:3.
 int Ysize = Usize*3; // Relación "Y" de Proporción 4:3.
*/

void setup() {
  
  size (800, 600); // muestreo visor "RUN" (Ctrl + R) en pixels de resolución.
  
  //background (200, 0, 0, 0);
  
  smooth (); // Activa Antialias.
  
  colorMode (RGB);
}



 float Rhip01 = 80; //Radio-Hipotenusa (C2=A2+B2)..
 float Alpha01 = 0; //Angulo (Pto de inicialización de la orbita).
 float Alpha01_vel = 0.0075; //Velocidad de orbita.
 float Alpha01_acc = 0.001; //Aceleración de orbita.
 

 float Rhip02 = 170; //Radio-Hipotenusa (C2=A2+B2)..
 float Alpha02 = 0; //Angulo (Pto de inicialización de la orbita).
 float Alpha02_vel = 0.02; //Velocidad de orbita.
 float Alpha02_acc = 0.001; //Aceleración de orbita.
 

 float Rhip03 = 12; //Radio-Hipotenusa (C2=A2+B2)..
 float Alpha03 = 0; //Angulo (Pto de inicialización de la orbita).
 float Alpha03_vel = 0.01; //Velocidad de orbita.
 float Alpha03_acc = 0.0001; //Aceleración de orbita. 
 

///////////////////////////////////////////////////////////////////////////////////////
// BUCLE DEL PROGRAMA:

void draw () {
  frameRate (30);
  

  float x1 = Rhip01*(cos(Alpha01)); //coordenadaY
  float y1 = Rhip01*(sin(Alpha01)); //coordenadaX

  float y2 = Rhip02*(cos(Alpha02)); //coordenadaY
  float x2 = Rhip02*(sin(Alpha02)); //coordenadaX

  float x3 = Rhip03*(cos(Alpha03)); //coordenadaY
  float y3 = Rhip03*(sin(Alpha03)); //coordenadaX

  float x4 = 100;
  float y4 = 100;
 
  float x5 = 700;
  float y5 = 80;
 
  float difYa = y2 - y1; //Cateto"Y".
  float difXa = x2 - x1; //Cateto"X".
  float HipXY = sqrt ((sq(difXa)) + (sq(difYa))); // Hipotenusa o Variación de linea entre Nodo02 y Nodo01.
 //println (HipXY);
 
//////////////////////////////////////// 
 background (HipXY, 0, 0, 0);
 
 
//////////////////////////////////////// Circulos Negros:
 
 float difYb = y4 - y3; //Cateto"Y".
 float difXb = x4 - x3; //Cateto"X".
 float HipXYb = sqrt ((sq(difXb)) + (sq(difYb))); // Hipotenusa o Variación de linea entre Nodo02 y Nodo01.
 
 
 float difYc = y5 - y2; //Cateto"Y".
 float difXc = x5 - x2; //Cateto"X".
 float HipXYc = sqrt ((sq(difXc)) + (sq(difYc))); // Hipotenusa o Variación de linea entre Nodo02 y Nodo01.
 

////////////////////////////////////////
 translate(width/2, height/2); //Lleva el origen de la(S) orbita a otro lugar.



//////////////////////////////////////// Circulos Negros de fondo:
strokeWeight (HipXYb*0.6);
  stroke(0);
  line (x4-(width/2), y4-(height/2), x1, y1);

ellipseMode(CENTER);
  stroke(10);
  fill(0, 0, 0);
  ellipse (x4-(width/2), y4-(height/2), HipXYb*3, HipXYb*3);


strokeWeight (HipXYc*0.2);
  stroke(0);
  line (x5-(width/2), y5-(height/2), x2, y2);

ellipseMode(CENTER);
  stroke(10);
  fill(0, 0, 0);
  ellipse (x5-(width/2), y5-(height/2), HipXYb*3, HipXYb*3);




//////////////////////////////////////// Lineas blancas:
  strokeWeight (7);
  stroke(255);
  line (x1, y1, x3, y3);
 
  strokeWeight (7);
  stroke(255);
  line (x2, y2, x1, y1);
 
  strokeWeight (7);
  stroke(255);
  line (x3, y3, x2, y2);


  
  

//////////////////////////////////////// 
  // Nodo03 (chico):
  ellipseMode(CENTER);
  stroke(255);
  
  
  float val_N01 = (HipXYc - HipXYb) - 350;
  //println (val_N01);
  strokeWeight (val_N01);  
  fill(0, HipXY, HipXY); //VER que pasa con el color!!!!!!!!!  fill(0, 0, 200, 0);;
  ellipse (x3, y3, 30, 30);
 
 // Alpha03_vel += Alpha03_acc; //Aplica Aceleración a velocidad
  Alpha03 += Alpha03_vel*((mouseX*0.075) + (mouseY*0.075)); //Aplica velocidad a Alpha para sen y cos de las coordenadas de la orbita01.
  
  
  
  
  
  ////////////////////////////////////////
  // Nodo01 (Mediano):
  
  ellipseMode(CENTER);
  noStroke();
  fill(255);
  ellipse (x1, y1, 60, 60);
 
 // Alpha01_vel += Alpha01_acc; //Aplica Aceleración a velocidad
  Alpha01 += Alpha01_vel*((mouseX*0.075) - (mouseY*0.075));
 
 


 ////////////////////////////////////////
 // Nodo02 (Grande):
  
  ellipseMode(CENTER);
  noStroke();
  fill(255); //VER que pasa con el color!!!!!!!!! fill(200, 0, 0, 0);
  ellipse (x2, y2, 90, 90);
 
 // Alpha02_vel += Alpha02_acc; //Aplica Aceleración a velocidad
  Alpha02 += Alpha02_vel*( ((pmouseX*0.01)) - ((mouseY*0.01) ) ); //Aplica velocidad a Alpha para sen y cos de las coordenadas de la orbita01.
 
 

   
 } //Cierra void draw.

