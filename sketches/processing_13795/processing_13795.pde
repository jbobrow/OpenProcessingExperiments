
//:: UNQ.Taller.Multimedia :: Prof: Mgtr. Raul Lacabanne :: Köhn Federico Lucas ::
/*
TP5_EJ13: Crear dos "entes autónomos" en el escenario.
 Uno debe exhibir movimientos de cualidades más bien mecánicas y el otro orgánicas.
 Utilizar funciones de usuario.
 */

int XS = 800; 
int Usize = XS/4;
int YS = Usize*3;

void setup() {
  size (800, 600); 
  smooth ();
  colorMode (RGB);
}



float Rhip01 = XS/10;     
float Rhip02 = XS/4.706;
float Rhip03 = XS*0.015;

float Alpha01 = 0; 
float Alpha02 = 0; 
float Alpha03 = 0; 


float xoff = 0.0;

void draw () {
  frameRate (30);

  fill(200, 0, 0, 80);
  rect(0, 0, XS, YS);

  float n = noise(xoff)*3;
  xoff = xoff + .020;
  float nn = noise(xoff)*3;
  xoff = xoff + .015;
  float nnn = noise(xoff)*3;
  xoff = xoff + .01;

  
  float uu = Rhip01*(cos(Alpha01)); 
  float vv = Rhip01*(sin(Alpha01)); //coordenadaX

  float uuu = (cos(Alpha02)*n*nn); //coordenadaY (C2=A2+B2). ////////// => VARIABLE DE SINTAXIS, USO INCREMENTAL DE PTO.INI !!
  float vvv = (sin(Alpha02)*n*nnn); //coordenadaX
  ////////////////////////////////////////


  //// VARIABLES LOCALES para "ORGANICO":

  float xa = Rhip01*(cos(Alpha01)*(n*0.75)); //coordenadaY (C2=A2+B2). ////////// => VARIABLE DE SINTAXIS, USO INCREMENTAL DE PTO.INI !!
  float ya = Rhip01*(sin(Alpha01)*(n*0.75)); //coordenadaX
  //::Si invierto refEjes, gira alrevez.
  float xb = Rhip02*(cos(Alpha02)*(nn*0.75)); //coordenadaY (C2=A2+B2). ////////// => VARIABLE DE SINTAXIS, USO INCREMENTAL DE PTO.INI !!
  float yb = Rhip02*(sin(Alpha02)*(nn*0.75)); //coordenadaX
  //::Si invierto refEjes, gira alrevez.
  float xc = Rhip03*(cos(Alpha03)*(nnn*0.75)); //coordenadaY (C2=A2+B2). ////////// => VARIABLE DE SINTAXIS, USO INCREMENTAL DE PTO.INI !!
  float yc = Rhip03*(sin(Alpha03)*(nnn*0.75)); //coordenadaX
  //::Si invierto refEjes, gira alrevez.


  //// VARIABLES LOCALES para "MECANICO":

  float yaa = Rhip01*(cos(Alpha01)); 
  float xaa = Rhip01*(sin(Alpha01)); //coordenadaX
  //::Si invierto refEjes, gira alrevez.
  float ybb = Rhip02*(cos(Alpha02)); 
  float xbb = Rhip02*(sin(Alpha02)); //coordenadaX
  //::Si invierto refEjes, gira alrevez.
  float ycc = Rhip03*(cos(Alpha03)); 
  float xcc = Rhip03*(sin(Alpha03)); //coordenadaX
  //::Si invierto refEjes, gira alrevez.

  println (Alpha01 + " // " + Alpha02 + " // " + Alpha03);


  //////////////////////////////////////// ENTE MECANICO-organico:
  pushMatrix ();
  translate (XS/2, YS/2);
  mecanico (uu, vv, xa, ya, xb, yb, xc, yc, mouseX, mouseY, 255, 255);
  mecanico (uuu, vvv, xaa, yaa, xbb, ybb, xcc, ycc, mouseX*nnn, mouseY*nnn, 0, 0);
  popMatrix ();

  
} 



void mecanico (float U, float V, float x1, float y1, float x2, float y2, float x3, float y3, float Mx, float My, float STROKE, float FILL) {

  float Alpha01_vel = 0.0075; //Velocidad de orbita.
  float Alpha01_acc = 0.001; //Aceleración de orbita.

  
  float Alpha02_vel = 0.02; //Velocidad de orbita.
  float Alpha02_acc = 0.001; //Aceleración de orbita.

  
  float Alpha03_vel = 0.01; //Velocidad de orbita.
  float Alpha03_acc = 0.0001; //Aceleración de orbita.


  

  float x4 = XS/10;
  float y4 = XS/10;

  float x5 = XS*0.875;
  float y5 = XS/100;

  float difYa = y2 - y1; //Cateto"Y".
  float difXa = x2 - x1; //Cateto"X".
  float HipXY = sqrt ((sq(difXa)) + (sq(difYa))); // Hipotenusa o Variación de linea entre Nodo02 y Nodo01. ////////// => USADO EN BACKGROUND !!

  
  translate(U, V); 

  stroke(STROKE);

  strokeWeight (XS*0.00875);
  line (x1, y1, x3, y3);
  strokeWeight (XS*0.00875);
  line (x2, y2, x1, y1);
  strokeWeight (XS*0.00875);
  line (x3, y3, x2, y2);


  fill(FILL);

  
  ellipseMode(CENTER);
  noStroke();
  ellipse (x1, y1, XS*0.075, XS*0.075);
  
  Alpha01 += Alpha01_vel*((Mx*0.075) - (My*0.075));

  ////////////////////////////////////////
  // Nodo02 (Grande):
  //translate(x3, y3); //Lleva el origen de la(S) orbita a otro lugar.
  ellipseMode(CENTER);
  noStroke();
  ellipse (x2, y2, XS*0.1125, XS*0.1125);
  // Alpha02_vel += Alpha02_acc; //Aplica Aceleración a velocidad
  Alpha02 += Alpha02_vel*( ((Mx*0.01) - (My*0.01)) ); //Aplica velocidad a Alpha para sen y cos de las coordenadas de la orbita01. ////////// => VARIABLE DE SINTAXIS PARA XYMOUSE !!

  //Aro blanco protagonista: // Nodo03 (chico):
  //////////////////////////////////////// Afectación por distancia en Circulos BLANCOS ORBITALES:
  float difYb = y4 - y3; //Cateto"Y".
  float difXb = x4 - x3; //Cateto"X".
  float HipXYb = sqrt ((sq(difXb)) + (sq(difYb))); // Hipotenusa o Variación de linea entre Nodo02 y Nodo01.
  float difYc = y5 - y2; //Cateto"Y".
  float difXc = x5 - x2; //Cateto"X".
  float HipXYc = sqrt ((sq(difXc)) + (sq(difYc))); // Hipotenusa o Variación de linea entre Nodo02 y Nodo01.

  //translate Afectado por el cambio de origen inicial.
  ellipseMode(CENTER);
  stroke(STROKE);
  strokeWeight (abs((HipXYc - HipXYb) - (XS*0.4375)));
  fill(0, HipXY, HipXY);
  ellipse (x3, y3, XS*0.0375, XS*0.0375);
  // Alpha03_vel += Alpha03_acc; //Aplica Aceleración a velocidad
  Alpha03 += Alpha03_vel*((Mx*0.075) + (My*0.075)); //Aplica velocidad a Alpha para sen y cos de las coordenadas de la orbita01. ////////// => VARIABLE DE SINTAXIS PARA XYMOUSE !!

} //Cierra void mecanico.






