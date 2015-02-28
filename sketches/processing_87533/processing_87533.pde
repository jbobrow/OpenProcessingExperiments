
/*
title : Magic Monster
 description : Cute mandala monster
 created : jan 2013
 by : Jessica Perrin
 */

float x; 
float y;
float angle;

void setup () {
  size (400, 412);
  colorMode (HSB, 359, 99, 99, 99); //valeurs max pour HSB + alpha
  smooth();
  frameRate (30);
  cursor(CROSS);
  
 x = (width/2); //place mes variables comme centre du monstre
 y = (height/2);
 angle = 0;
}

void draw () {

  translate (-12, 0);
  background (45, 0, 99);
  
  //Lèvres 
  noStroke();
  fill(333, 74, 33); //Hue, Saturation, Brightness
  ellipse (x, y, 250, 270);

  //Corps
  fill (333, 80, 70);
  ellipse (x-5, y, 230, 200);
  
  //Gradient
for (int i=125; i>0; i=i-3) { 
  noStroke();
  fill (255, map(i,125,0,0,10)); //blanc, alpha
  ellipse (x+60, y+60, i, i);
} 

  //paupière
  fill(333, 74, 33);
  ellipse (x+13, y-10, 150, 160);

  //oeil
  fill (68, 16, 98);
  ellipse (x+13, y-10, 148, 135);
  fill (0);
  ellipse (x+7, y-10, 125, 120); //pupille
  fill (255, 0, 99);
  ellipse (x+40, y-47, 30, 28); //Bling1
  ellipse (x+42, y-19, 18, 17); //Bling2 
   /*
    //------------------->Petits yeux fermés
   angle = 0;
   for (float i=0; i<4*PI; i++) { //pour incrémenter l'angle
  pushMatrix();
  translate (width/2, height/2);  //met le repère de ma rotation au centre
  rotate (angle); //l'angle de rotation
  petiteyeclosed();
  popMatrix();
    angle += PI/5; //Nombre d'oeil
   }
   */
   //--------------------->Tentacules
  for (float i=0; i<2*PI; i++) { //pour incrémenter l'angle
   pushMatrix();
     translate (width/2, height/2); //met le repère de ma rotation au centre
     rotate (angle); //l'angle de rotation définit plus bas
     tentacule(); //fonction définit à la fin du sketch. 
   popMatrix();
  angle += PI/2.5; //controle le nb de tentacule
  }
 
   //------------------>Petits yeux ouverts
   angle = 0;
   for (float i=0; i<2*PI; i++) { 
    pushMatrix();
      translate (width/2, height/2);
      rotate (angle); 
      petiteyeopen();
    popMatrix();
   angle += PI/2.5; // contrôle le nb d'oeil
   }
   
  //-------------------->Petits yeux au bout des tentacules
   angle = 0;
   for (float i=0; i<2*PI; i++) { 
    pushMatrix();
      translate (width/2, height/2);
      rotate (angle); 
      tentaculeye();
    popMatrix();
  angle += PI/2.5; // contrôle le nb d'oeil
   }
  
/*
  fill (256, 0, 0);
  text (mouseX + " " + mouseY, mouseX + 5, mouseY);
  */
}

// FONCTIONS :
//------------------>Fonction tentacule :
void tentacule() {   
   beginShape();
   fill (0);
curveVertex(94.0, -23.0);
curveVertex(123.0, -12.0);
curveVertex(143.0, -9.0);
curveVertex(163.0, -16.0);
curveVertex(180.0, -13.0);
curveVertex(178.0, -10.0);
curveVertex(164.0, -12.0);
curveVertex(145.0, 3.0);
curveVertex(123.0, 8.0);
curveVertex(81.0, -13.0);
endShape();
fill (70);
ellipse (132, 2, 11, 7); 
ellipse (144, -2, 7, 5);
ellipse (152, -7, 4, 4);
}

//-------------------->Fonction de petit oeil ouvert :
void petiteyeopen() {
  noStroke ();
  fill(333, 74, 33);
  ellipse (117, -80, 34, 34); //Tour
  fill (68, 16, 98);
  ellipse (115, -79, 27, 27); //Blanc
  fill (0);
  ellipse (114, -79, 23, 23); //pupille
  fill (255, 0, 99);
  ellipse (119, -86, 6, 6); //bling1
  ellipse (120, -81, 3, 3); //bling2
} 

//-------------------->Fonction de petit oeil au bout des tentacules :
void tentaculeye() {
  noStroke ();
  fill(333, 74, 33);
  ellipse (195, -10, 34, 32); //Tour
  fill (68, 16, 98);
  ellipse (193, -10, 28, 26); //Blanc
  fill (0);
  ellipse (192, -10, 23, 23); //pupille
  fill (255, 0, 99);
  ellipse (197, -16, 6, 6); //bling1
  ellipse (198, -11, 3, 3); //bling2
} 

//--------------------->Fonction de petit oeil fermé:
void petiteyeclosed() {
  noStroke ();
  fill(333, 74, 27);
  ellipse (142, 0, 34, 32); //Tour
  noFill();
  stroke (0);
  strokeWeight (1);
  arc (142, 0, 20, 30, HALF_PI,3*HALF_PI, OPEN); 
}








