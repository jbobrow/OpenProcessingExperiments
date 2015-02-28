
//:: .2010.KF.daemonfk@gmail.com ::





int XS = 600;
int YS = XS;

float orx = XS/2;
float ory = YS/2;

float a = XS/3;
float b = a;
float c = XS/40;  
float d = XS/20; 


float [] dnx; // Declaracion de Array
float [] dny; // Declaracion de Array => "datos.nodosF

float noiseVal01 = 0.01;

float xoff01 = 0.0; // Valor para variacion de RuidoPerlin.
float xoff02 = 0.0; // Valor para variacion de RuidoPerlin.
float xoff03 = 0.0; // Valor para variacion de RuidoPerlin.
float xoff04 = 0.0; // Valor para variacion de RuidoPerlin.
float xoff05 = 0.0; // Valor para variacion de RuidoPerlin.
float xoff06 = 0.0; // Valor para variacion de RuidoPerlin.
float xoff07 = 0.0; // Valor para variacion de RuidoPerlin.
float xoff08 = 0.0; // Valor para variacion de RuidoPerlin.


//:://ORBITAS de NODOS ROTATIVOS:
float Alpha81 = 0; //Angulo (Pto de inicialización de la orbita). ////////// => VARIABLE para RUEDA!
float Alpha12 = 0; //Angulo (Pto de inicialización de la orbita). ////////// => VARIABLE para RUEDA!
float Alpha23 = 0; //Angulo (Pto de inicialización de la orbita). ////////// => VARIABLE para RUEDA!
float Alpha34 = 0; //Angulo (Pto de inicialización de la orbita). ////////// => VARIABLE para RUEDA!
float Alpha45 = 0; //Angulo (Pto de inicialización de la orbita). ////////// => VARIABLE para RUEDA!
float Alpha56 = 0; //Angulo (Pto de inicialización de la orbita). ////////// => VARIABLE para RUEDA!
float Alpha67 = 0; //Angulo (Pto de inicialización de la orbita). ////////// => VARIABLE para RUEDA!
float Alpha78 = 0; //Angulo (Pto de inicialización de la orbita). ////////// => VARIABLE para RUEDA!
//:://
int Hip = XS/15;

///////////////////////////////////////////////////////////////////////////////////
// SETEO:

void setup() {
  size (600, 600);
  //size (screen.width, screen.height);

  dnx = new float [8]; // Creacion de Array
  //Asignación de variables del array:
  dnx [0] =   0+orx;
  dnx [1] = ( a/1.15471)+orx;
  dnx [2] =   a+orx;
  dnx [3] = ( a/2)+orx;
  dnx [4] =   0+orx;
  dnx [5] = (-a/2)+orx;
  dnx [6] =  -a+orx;
  dnx [7] = (-a/1.15471)+orx;

  dny = new float [8]; // Creacion de Array => "datos.nodosF
  //Asignación de variables del array:
  dny [0] =  -b+ory;
  dny [1] = (-b/2)+ory;
  dny [2] =   0+ory;
  dny [3] = ( b/1.15471)+ory;
  dny [4] =   b+ory;
  dny [5] = ( b/1.15471)+ory;
  dny [6] =   0+ory;
  dny [7] = (-b/2)+ory;
}

///////////////////////////////////////////////////////////////////////////////////
// BUCLE:
void draw(){
  //float velFR = 1; //random (0.1, 1.50);
  frameRate (20);

  //////////////////////////////////// COMPONENTES ALEATORIAS:
  float n01 = noise(xoff01)*5;
    xoff01 = xoff01 + .02;
  float n02 = noise(xoff02)*3.5;
    xoff02 = xoff02 + .025;
  float n03 = noise(xoff03)*5;
    xoff03 = xoff03 + .019;
  float n04 = noise(xoff04)*3.5;
    xoff04 = xoff04 + .027;
  float n05 = noise(xoff05)*5;
    xoff05 = xoff05 + .021;
  float n06 = noise(xoff06)*5;
    xoff06 = xoff06 + .022;
  float n07 = noise(xoff07)*3.5;
    xoff07 = xoff07 + .018;
  float n08 = noise(xoff08)*5;
    xoff08 = xoff08 + .026;
  println ( n01 + " // " + n02 + " // " + n03 + " // " + n04 + " // " + n05 + " // " + n06 + " // " + n07 + " // " + n08 );
  ////////////////////////////////////////

  //////////////////////////////////////// DESENFOQUE GRAL.
  
  fill(0, 0, 0, 20); // Valores funcionales entre 10 y 100, para Desenfoque de movimiento
  rectMode (CENTER);
  strokeWeight (0);
  rect(0, 0, width*2, height*2);
  ////////////////////////////////////////

  strokeWeight (5);
  strokeJoin (MITER); // Biselado del empalme con otros trazos.
  strokeCap (ROUND); // Sección del trazo.
  stroke (255); //
  
  line(dnx [0],dny [0], dnx [1],dny [1]);
  line(dnx [1],dny [1], dnx [2],dny [2]);
  line(dnx [2],dny [2], dnx [3],dny [3]);
  line(dnx [3],dny [3], dnx [4],dny [4]);
  line(dnx [4],dny [4], dnx [5],dny [5]);
  line(dnx [5],dny [5], dnx [6],dny [6]);
  line(dnx [6],dny [6], dnx [7],dny [7]);
  line(dnx [7],dny [7], dnx [0],dny [0]);

  fill (255);
  noStroke (); // 0=ValueRed
  ellipse(dnx [0],dny [0], c, c);
  ellipse(dnx [1],dny [1], c, c);
  ellipse(dnx [2],dny [2], c, c);
  ellipse(dnx [3],dny [3], c, c);
  ellipse(dnx [4],dny [4], c, c);
  ellipse(dnx [5],dny [5], c, c);
  ellipse(dnx [6],dny [6], c, c);
  ellipse(dnx [7],dny [7], c, c);

  ////////////////// Nodos de barras:
  fill (255);
  noStroke (); // 0=ValueRed
  ellipse ( (dnx[1]-(dnx[1]-dnx[0])/2), (dny[1]-(dny[1]-dny[0])/2),  d*n01, d*n01);
  ellipse ( (dnx[2]-(dnx[2]-dnx[1])/2), (dny[2]-(dny[2]-dny[1])/2),  d*n02, d*n02);
  ellipse ( (dnx[2]-(dnx[2]-dnx[3])/2), (dny[2]-(dny[2]-dny[3])/2),  d*n03, d*n03);
  ellipse ( (dnx[3]-(dnx[3]-dnx[4])/2), (dny[3]-(dny[3]-dny[4])/2),  d*n04, d*n04);
  ellipse ( (dnx[4]-(dnx[4]-dnx[5])/2), (dny[4]-(dny[4]-dny[5])/2),  d*n05, d*n05);
  ellipse ( (dnx[5]-(dnx[5]-dnx[6])/2), (dny[5]-(dny[5]-dny[6])/2),  d*n06, d*n06);
  ellipse ( (dnx[6]-(dnx[6]-dnx[7])/2), (dny[6]-(dny[6]-dny[7])/2),  d*n07, d*n07);
  ellipse ( (dnx[0]-(dnx[0]-dnx[7])/2), (dny[0]-(dny[0]-dny[7])/2),  d*n08, d*n08);


  ////////////////// "Componentes de Acción": // Primero ajustar Largo y luego inclinacion.
  float n12 = abs ((n01-n02)/2);
  float n23 = abs ((n02-n03)/2);
  float n34 = abs ((n03-n04)/2);
  float n45 = abs ((n04-n05)/2);
  float n56 = abs ((n05-n06)/2);
  float n67 = abs ((n06-n07)/2);
  float n78 = abs ((n07-n08)/2);
  float n81 = abs ((n08-n01)/2);
  //println (n56);

  ////////////////// Puntos en fuga cuadrangulares:
  fill (255);
  ellipse( (dnx[1]*n12*0.25)+orx    ,(dny[1]*(-n12)*0.325)+ory    , c*n12*2, c*n12*2); //FuncionX*variacion*LARGO+origen, FuncionY*variacion*INCLINACION+origen.
  ellipse( (dnx[3]*n34*0.185)+orx   ,(dny[3]*n34*0.26)+ory        , c*n34*2, c*n34*2);
  ellipse( (dnx[5]*n56*-0.34)+orx   ,(dny[5]*n56*0.25)+ory        , c*n56*2, c*n56*2);
  ellipse( (dnx[7]*n78*-0.92)+orx   ,(dny[7]*n78*-0.325)+ory      , c*n78*2, c*n78*2);


  ////////////////// Gesto Central:
  float ng = ((n12+n34+n56+n78)/4);
  fill (200, 0, 0, 100);
  ellipse (orx, ory,  ng*d*5, ng*d*5);


  ////////////////// Gesto Periferico: 
  float cgp = 0.2165*9*ng; // Coeficiente Factor periferico * escalamiento (hipotenusa entre lados)
  float N = noise (noiseVal01);

  fill (200, 0, 0, 250);
  noStroke ();
  ellipse(  dnx[0]                     ,((dny[0]-ory)*ng*2)+ory           , c, c);
  ellipse( ((dnx[1]-orx)*cgp)+orx      ,((dny[01]-ory)*cgp)+ory           , c, c);
  ellipse( ((dnx[2]-orx)*ng*2)+orx     ,  dny[2]                          , c, c);
  ellipse( ((dnx[3]-orx)*cgp)+orx      ,((dny[3]-ory)*cgp)+ory            , c, c);
  ellipse(   dnx[4]                    ,((dny[4]-ory)*ng*2)+ory           , c, c);
  ellipse( ((dnx[5]-orx)*cgp)+orx      ,((dny[5]-ory)*cgp)+ory            , c, c);
  ellipse( ((dnx[6]-orx)*ng*2)+orx     ,  dny[6]                          , c, c);
  ellipse( ((dnx[7]-orx)*cgp)+orx      ,((dny[7]-ory)*cgp)+ory            , c, c);

  strokeWeight (5);
  strokeJoin (MITER); // Biselado del empalme con otros trazos.
  strokeCap (ROUND); // Sección del trazo.
  stroke (200, 0, 0, 100); 
  line   (   dnx[0]                 ,((dny[0]-ory)*ng*2)+ory          , ((dnx[1]-orx)*cgp)+orx   ,((dny[1]-ory)*cgp)+ory  );
  line   ( ((dnx[1]-orx)*cgp)+orx ,((dny[1]-ory)*cgp)+ory           , ((dnx[2]-orx)*ng*2)+orx  ,  dny[2]                );
  line   ( ((dnx[2]-orx)*ng*2)+orx  ,  dny[2]                         , ((dnx[3]-orx)*cgp)+orx   ,((dny[3]-ory)*cgp)+ory  );
  line   ( ((dnx[3]-orx)*cgp)+orx   ,((dny[3]-ory)*cgp)+ory           ,   dnx[4]                 ,((dny[4]-ory)*ng*2)+ory );
  line   (   dnx[4]                 ,((dny[4]-ory)*ng*2)+ory          , ((dnx[5]-orx)*cgp)+orx   ,((dny[5]-ory)*cgp)+ory  );
  line   ( ((dnx[5]-orx)*cgp)+orx   ,((dny[5]-ory)*cgp)+ory           , ((dnx[6]-orx)*ng*2)+orx  ,  dny[6]                );
  line   ( ((dnx[6]-orx)*ng*2)+orx  ,  dny[6]                         , ((dnx[7]-orx)*cgp)+orx   ,((dny[7]-ory)*cgp)+ory  );
  line   ( ((dnx[7]-orx)*cgp)+orx   ,((dny[7]-ory)*cgp)+ory           ,   dnx[0]                 ,((dny[0]-ory)*ng*2)+ory);





////////////////// ORBITAS AZULES:
  
  //::// ORBITA 81:
  if (n01 > n08) {
  Alpha81 += (n01-n08)*0.25;
  }
  if (n08 > n01) {
  Alpha81 -= (n08-n01)*0.25; 
  }
  //UBICACION ORBITAL 81:
  float x01 = Hip*(cos(Alpha81));
  float y01 = Hip*(sin(Alpha81));
  //////////////////////////////////////// LINEA Circulo:
  strokeWeight (XS*0.005);
  stroke(0, 0, 255, 10);
  noFill ();
  ellipse (dnx [0], dny [0], Hip*2, Hip*2);
  //////////////////////////////////////// NODO de REF de movimiento:
  fill(0, 0, 255, 100);
  ellipseMode(CENTER);
  noStroke();
  ellipse (x01 +dnx [0], y01 +dny [0], XS*0.025, XS*0.025);
  //AlphaA += Incremento polar; no va??
  //Aplicar rotacion!!!!!
  //popMatrix();
  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  
  //::// ORBITA 12:
  if (n02 > n01) {
  Alpha12 += (n02-n01)*0.25;
  }
  if (n01 > n02) {
  Alpha12 -= (n01-n02)*0.25; 
  }
  //UBICACION ORBITAL 81:
  float x02 = Hip*(cos(Alpha12));
  float y02 = Hip*(sin(Alpha12));
  //////////////////////////////////////// LINEA Circulo:
  strokeWeight (XS*0.005);
  stroke(0, 0, 255, 10);
  noFill ();
  ellipse (dnx [1], dny [1], Hip*2, Hip*2);
  //////////////////////////////////////// NODO de REF de movimiento:
  fill(0, 0, 255, 100);
  ellipseMode(CENTER);
  noStroke();
  ellipse (x02 + dnx [1], y02 + dny [1], XS*0.025, XS*0.025);

  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  
  //::// ORBITA 23:
  if (n03 > n02) {
  Alpha23 += (n03-n02)*0.25;
  }
  if (n02 > n03) {
  Alpha23 -= (n02-n03)*0.25; 
  }
  //UBICACION ORBITAL 81:
  float x03 = Hip*(cos(Alpha23));
  float y03 = Hip*(sin(Alpha23));
  //////////////////////////////////////// LINEA Circulo:
  strokeWeight (XS*0.005);
  stroke(0, 0, 255, 10);
  noFill ();
  ellipse (dnx [2], dny [2], Hip*2, Hip*2);
  //////////////////////////////////////// NODO de REF de movimiento:
  fill(0, 0, 255, 100);
  ellipseMode(CENTER);
  noStroke();
  ellipse (x03 + dnx [2], y03 + dny [2], XS*0.025, XS*0.025);

  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  
  //::// ORBITA 34:
  if (n04 > n03) {
  Alpha34 += (n04-n03)*0.25;
  }
  if (n03 > n04) {
  Alpha34 -= (n03-n04)*0.25; 
  }
  //UBICACION ORBITAL 81:
  float x04 = Hip*(cos(Alpha34));
  float y04 = Hip*(sin(Alpha34));
  //////////////////////////////////////// LINEA Circulo:
  strokeWeight (XS*0.005);
  stroke(0, 0, 255, 10);
  noFill ();
  ellipse (dnx [3], dny [3], Hip*2, Hip*2);
  //////////////////////////////////////// NODO de REF de movimiento:
  fill(0, 0, 255, 100);
  ellipseMode(CENTER);
  noStroke();
  ellipse (x04 + dnx [3], y04 + dny [3], XS*0.025, XS*0.025);

  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  
  //::// ORBITA 45:
  if (n05 > n04) {
  Alpha45 += (n05-n04)*0.25;
  }
  if (n04 > n05) {
  Alpha45 -= (n04-n05)*0.25; 
  }
  //UBICACION ORBITAL 81:
  float x05 = Hip*(cos(Alpha45));
  float y05 = Hip*(sin(Alpha45));
  //////////////////////////////////////// LINEA Circulo:
  strokeWeight (XS*0.005);
  stroke(0, 0, 255, 10);
  noFill ();
  ellipse (dnx [4], dny [4], Hip*2, Hip*2);
  //////////////////////////////////////// NODO de REF de movimiento:
  fill(0, 0, 255, 100);
  ellipseMode(CENTER);
  noStroke();
  ellipse (x05 + dnx [4], y05 + dny [4], XS*0.025, XS*0.025);

  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  
  //::// ORBITA 56:
  if (n06 > n05) {
  Alpha56 += (n06-n05)*0.25;
  }
  if (n05 > n06) {
  Alpha56 -= (n05-n06)*0.25; 
  }
  //UBICACION ORBITAL 81:
  float x06 = Hip*(cos(Alpha56));
  float y06 = Hip*(sin(Alpha56));
  //////////////////////////////////////// LINEA Circulo:
  strokeWeight (XS*0.005);
  stroke(0, 0, 255, 10);
  noFill ();
  ellipse (dnx [5], dny [5], Hip*2, Hip*2);
  //////////////////////////////////////// NODO de REF de movimiento:
  fill(0, 0, 255, 100);
  ellipseMode(CENTER);
  noStroke();
  ellipse (x06 + dnx [5], y06 + dny [5], XS*0.025, XS*0.025);

  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  
  //::// ORBITA 67:
  if (n07 > n06) {
  Alpha67 += (n07-n06)*0.25;
  }
  if (n06 > n07) {
  Alpha67 -= (n06-n07)*0.25; 
  }
  //UBICACION ORBITAL 81:
  float x07 = Hip*(cos(Alpha67));
  float y07 = Hip*(sin(Alpha67));
  //////////////////////////////////////// LINEA Circulo:
  strokeWeight (XS*0.005);
  stroke(0, 0, 255, 10);
  noFill ();
  ellipse (dnx [6], dny [6], Hip*2, Hip*2);
  //////////////////////////////////////// NODO de REF de movimiento:
  fill(0, 0, 255, 100);
  ellipseMode(CENTER);
  noStroke();
  ellipse (x07 + dnx [6], y07 + dny [6], XS*0.025, XS*0.025);

  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  
  //::// ORBITA 78:
  if (n08 > n07) {
  Alpha78 += (n08-n07)*0.25;
  }
  if (n07 > n08) {
  Alpha78 -= (n07-n08)*0.25; 
  }
  //UBICACION ORBITAL 81:
  float x08 = Hip*(cos(Alpha78));
  float y08 = Hip*(sin(Alpha78));
  //////////////////////////////////////// LINEA Circulo:
  strokeWeight (XS*0.005);
  stroke(0, 0, 255, 10);
  noFill ();
  ellipse (dnx [7], dny [7], Hip*2, Hip*2);
  //////////////////////////////////////// NODO de REF de movimiento:
  fill(0, 0, 255, 100);
  ellipseMode(CENTER);
  noStroke();
  ellipse (x08 + dnx [7], y08 + dny [7], XS*0.025, XS*0.025);

  
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

pushMatrix();
  strokeWeight (XS*0.015);
  stroke(0, 0, 255, 100);
  line (x01+ dnx [0], y01+ dny [0], x02+dnx [1], y02+ dny [1]);
  line (x02+ dnx [1], y02+ dny [1], x03+dnx [2], y03+ dny [2]);
  line (x03+ dnx [2], y03+ dny [2], x04+dnx [3], y04+ dny [3]);
  line (x04+ dnx [3], y04+ dny [3], x05+dnx [4], y05+ dny [4]);
  line (x05+ dnx [4], y05+ dny [4], x06+dnx [5], y06+ dny [5]);
  line (x06+ dnx [5], y06+ dny [5], x07+dnx [6], y07+ dny [6]);
  line (x07+ dnx [6], y07+ dny [6], x08+dnx [7], y08+ dny [7]);
  line (x08+ dnx [7], y08+ dny [7], x01+dnx [0], y01+ dny [0]);
popMatrix();





  ///////////////////////////////////////////////////////////////////////////////////
  // PRINT:

  //println (dnx + " -- " + dny + " -- " + rg);
  //println (" -- " + hipAx + " -- " + hipAy + " -- " + hipBx + " -- " + hipBy);
  //print (dnx + " -- " + N);
}


///////////////////////////////////////////////////////////////////////////////////////
// FUNCIONES DE USUARIO:

//void rueda (float U, float V, float xA, float yA, float Dhip, float Na, float Nb, float ALPH ) {
void rueda (float U, float V, float Dhip, float xA, float yA) {
// UV = ubicación
// xy1= pto rotativo (por sin/cos, su distancia orbital, sera el Diametro de su ellipse.


  pushMatrix();
  // UBICACIÒN PARCIAL DE LA UNIDAD "RUEDA".
  translate(U, V); //Lleva el origen de la(S) orbita a otro lugar.

  //////////////////////////////////////// LINEA Circulo:
  strokeWeight (XS*0.005);
  stroke(0, 0, 255, 10);
  noFill ();
  ellipse (0, 0, Dhip*2, Dhip*2);
  
  //////////////////////////////////////// NODO de REF de movimiento:
  fill(0, 0, 255, 100);
  ellipseMode(CENTER);
  noStroke();
  ellipse (xA, yA, XS*0.025, XS*0.025);
  //AlphaA += Incremento polar; no va??
  //Aplicar rotacion!!!!!
  popMatrix();

  
} //Cierra void RUEDA.





