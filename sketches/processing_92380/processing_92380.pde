
/*
title : Magic Monster
 description : Cute mandala monster
 created : jan 2013
 by : Jessica Perrin
 */

float x; 
float y;
float angle;
float oscCounter = 0; 

int timeStamp;
float grosOeilX;
float grosOeilY;

int etat;
final int DODO = 1;
final int EVEIL = 0;

float courante;
float vitesse;
float cible;
 
float rectX;
float rectY;
float rectW;
float rectH;

float rayon;
float distance;


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
void setup () {
  size (400, 410);
  colorMode (HSB, 359, 99, 99, 99); //valeurs max pour HSB + alpha
  smooth();
  frameRate (30);

  x = (width/2); //place mes variables comme centre du monstre
  y = (height/2);
  angle = 0;
  
  grosOeilX = x+13;
  grosOeilY = y-10;
  rayon = 155/2;
  
  etat=DODO;
  timeStamp=millis();
  
  rectX = x+126;
  rectY = y-17;
  rectW = 32;
  rectH = 34;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void draw () {

  //translate (mouseX, mouseY);
  translate (-11, 0); //pour déplacer mon monstre afin que les tentacules ne sortent pas du cadre
  background (45, 0, 99);

  
  float distance = dist( mouseX , mouseY , x+13, y-10 );
  if ( distance < 155/2 ) { //condition pour que le curseur se chancge en main quand "mouse over" le gros oeil
    cursor (HAND);
  } else {
    cursor (ARROW);
  }
   
      vitesse = 10;


float Distance = abs(cible - courante); //Assouplissement pout faire apparaitre la tentacule
if ( courante < cible ) {
        courante = courante + min(Distance,vitesse);
} else {
        courante = courante - min(Distance,vitesse);
}
 
  //////définit mon etat EVEIL//////////////////////////////////////
  if (etat==EVEIL) {  
   
    cible = 130;

     //--------------------->Tentacules                           //
  for (float i=0; i<TWO_PI; i++) { //pour incrémenter l'angle     //
    pushMatrix();                                                 //
    translate (x, y); //met le repère de ma rotation au centre    //
    rotate (angle); //l'angle de rotation définit plus bas        //
    tentacule(); //fonction définit à la fin du sketch.           //
    popMatrix();                                                  //
    angle += PI/2.5; //controle le nb de tentacule                //
  }                                                               //
    //Lèvres                                                      //
  noStroke();                                                     //
  fill(333, 74, 33); //Hue, Saturation, Brightness                //
  ellipse (x, y, 250, 270);                                       //
                                                                  //
  //Corps                                                         //
  fill (333, 80, 70);                                             //
  ellipse (x-5, y, 230, 200);                                     //
                                                                  //
  //Gradient                                                      //
  for (int i=125; i>0; i=i-3) {                                   //
    noStroke();                                                   //
    fill (255, map(i, 125, 0, 0, 10)); //blanc, alpha             //
    ellipse (x+60, y+60, i, i);                                   //
  }                                                               //
                                                                  //
  //paupière                                                      //
  fill(333, 74, 33);                                              //  
  ellipse (x+13, y-10, 150, 160);                                 //
  //oeil                                                          //
  fill (68, 16, 98);                                              //
  ellipse (x+13, y-10, 148, 135); //Beige                         //
  fill (0);                                                       //
  ellipse (x+7, y-10, 125, 120); //pupille                        //
  fill (255, 0, 99);                                              //
  ellipse (x+40, y-47, 30, 28); //Bling1                          //
  ellipse (x+42, y-19, 18, 17); //Bling2                          //
                                                                  //
   //------------------>Petits yeux ouverts                       //
  angle = 0;                                                      //
  for (float i=0; i<2*PI; i++) {                                  //
    pushMatrix();                                                 //
    translate (x, y);                                             //
    rotate (angle);                                               //
    petitEyeOpen();                                               //
    popMatrix();                                                  //
    angle += PI/2.5; // contrôle le nb d'oeil                     //
  }                                                               //
  }                                                               //
////////////////////////////////////////////////////////////////////  

//////définit mon etat DODO/////////////////////////////////////////
  if (etat==DODO) {  
 cible = 0;

 //--------------------->Tentacules                           //
  for (float i=0; i<TWO_PI; i++) { //pour incrémenter l'angle     //
    pushMatrix();                                                 //
    translate (x, y); //met le repère de ma rotation au centre    //
    rotate (angle); //l'angle de rotation définit plus bas        //
    tentacule(); //fonction définit à la fin du sketch.           //
    popMatrix();                                                  //
    angle += PI/2.5; //controle le nb de tentacule                //
  }                             
 //
    //Lèvres                                                      //
  noStroke();                                                     //
  fill(333, 74, 33); //Hue, Saturation, Brightness                //
  ellipse (x, y, 250, 270);                                       //
                                                                  //
  //Corps                                                         //
  fill (333, 80, 70);                                             //
  ellipse (x-5, y, 230, 200);                                     //
                                                                  //
  //paupière                                                      //
  fill(333, 74, 33);                                              //
  ellipse (x+13, y-10, 150, 160);                                 //
                                                                  //
  //------------------->Petits yeux fermés                        //
 petitEyeClosed(); //la fonction est définit plus bas             //
                                                                  //
  //Gradient                                                      //
  for (int i=125; i>0; i=i-3) {                                   //
    noStroke();                                                   //
    fill (255, map(i, 125, 0, 0, 10)); //blanc, alpha             //
    ellipse (x+60, y+60, i, i);                                   //
  }                                                               //
  }                                                               //
 ///////////////////////////////////////////////////////////////////
 

 int tempsEcoule = millis() - timeStamp; 
  if (tempsEcoule >=5000) { //Après 5 secondes, le monstre se rendort 
    timeStamp = millis();
    etat = DODO;
  }
  //println(); 
}

// FONCTIONS////// FONCTIONS////// FONCTIONS////// FONCTIONS////// FONCTIONS////// FONCTIONS///// FONCTIONS///// FONCTIONS :

//------------------>Fonction tentacule :
void tentacule() { 

  oscCounter = oscCounter + 0.05 ;
  float xSegment = courante;
  float ySegment=0;

  int max = 14; //Nb d'ellipse pour la tentacule
  for ( int i = 0; i < max; i++ ) {

    float oscOffset = i*0.45;
    float oscRadius = 6;
    ySegment = cos( oscCounter - oscOffset ) * oscRadius;

    float taille = map(i, 0, max-1, 18, 1); //du plus gros au plus petit
    fill(0);
    ellipse(xSegment, ySegment, taille, taille);
    fill (70);
    ellipse (xSegment, ySegment*+1.5, taille/2, taille/2);
    xSegment = xSegment + taille*0.4; //eccart entre chaque ellipse
  }
  
  //-------------------->petit oeil au bout des tentacules :
  noStroke ();
  fill(333, 74, 33);
  ellipse (xSegment + 10, ySegment, 34, 32); //Tour
  fill (68, 16, 98);
  ellipse (xSegment + 10, ySegment, 28, 26); //Blanc
  fill (0);
  ellipse (xSegment + 10, ySegment, 23, 23); //pupille
  fill (255, 0, 99);
  ellipse (xSegment + 15, ySegment-7, 6, 6); //bling1
  ellipse (xSegment + 16, ySegment-2, 3, 3); //bling2

 // println(xSegment + " " + ySegment); //Coordonnées de la dernière ellipse de la tentacule (car écrit après que la loop soit jouée)
}

//-------------------->Fonction de petit oeil ouvert :
void petitEyeOpen() {
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

//--------------------->Fonction de petit oeil fermé:
void petitEyeClosed() {
  
  angle = 0;
  for (float i=0; i<4*PI; i++) { //pour incrémenter l'angle
    pushMatrix();
    translate (x, y);  //met le repère de ma rotation au centre
    //translate(0,0); //car le repère au complet tourne. Donc l'axe des x suit la rotation
    rotate (angle); //l'angle de rotation
    
       noStroke ();
       fill(333, 74, 27);
       ellipse (142, 0, 34, 32); //Tour
       noFill();
       stroke (0);
       strokeWeight (1);
       arc (142, 0, 20, 30, HALF_PI, 3*HALF_PI, OPEN); 
    
    popMatrix();
    
     // detecter le mouseOver sur un rectangle
    
  float gauche = rectX ;
  float droite = rectX+rectW;
  float haut = rectY;
  float bas = rectY+rectH;
  if ( mouseX > gauche && mouseX < droite && mouseY > haut && mouseY < bas ) {
      // mouseOver
      etat=EVEIL;
  } else {
      etat=DODO;
  }
  rectMode(CORNER);
  noStroke();
  fill (0,0,0,0);
  rect( rectX , rectY , rectW , rectH );
    

    
    angle += PI/5; //Nombre d'oeil
  }
}

//--------------------->Fonction mousePressed dans le gros oeil
void mousePressed () {
 distance = dist( mouseX , mouseY , grosOeilX , grosOeilY );
  if ( distance < rayon ) { //condition pour réveiller le monst
      etat=EVEIL;
  } else {
      etat=DODO;
  }
   
}
