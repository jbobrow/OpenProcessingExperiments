


//##########################################################
//------------ Énonciation des variable et des tableaux
//##########################################################

//-- Centre du monstre

float x, y;

//-- variables pour déplacement des yeux !

float dyeux = 25;
float dpupille = 10;
float dpupille2 = 18;

//-- variables pour la navette

float xNavette = 50;
float yNavette = -20;
int etatNavette = 0;
float xNavetteCible = 0;
float yNavetteCible = 0;
float vitesseNavette = 0.01;
float xFumee = 118;
float yFumee = 150;
float xFumeeCible = 0;
float yFumeeCible = 0;
int f = 0;

//--- rectangle de home E.T.

float homeX = 55;
float homeY = 230;
float homeW = 50;
float homeH = 20;


//-- Tableau pour le déplacement du monstre sur la lune

boolean[] deplacement;

// -- variable pour sortie des dents

float dent = 0;

//-- variables pour up / down grosseur étoiles

float etoile, etoilecible;
float etoile2, etoilecible2;
float etoile3, etoilecible3;
float etoile4, etoilecible4;
float etoile5, etoilecible5;
float etoile6, etoilecible6;
float etoile7, etoilecible7;
float etoile8, etoilecible8;
float etoile9, etoilecible9;
float etoile10, etoilecible10;

//-- variables pour colorisation des planètes

float overplanete;
float overplanete2;
float press;
float r = 139;
float g = 84;
float b = 28;
float r2 = 139;
float g2 = 84;
float b2 = 28;


//--- variables pour déplacement proportionnel du satellite des planètes

float satX = 330;
float satY = 120;
float vitesseX;
float vitesseY;
float finalsatX = 330;
float finalsatY = 120;
float R;

//--- variable pour la latence du monstre méchant

float F = 0;

//-- Variable pour l'interval des yeux.

float etatOeil = 0;
float interval = 0;
float timeStamp =0;



//##################################################################
//------------ Initialisation de ma fenêtre ----- SETUP ---------
//##################################################################


void setup () {


  //--- Réglages de base  
  size(400, 400);
  smooth ();

  //--- Création du taleau pour le déplacement de gauche à droite du monstre.
  deplacement = new boolean[256];


  //---- variables principales pour le tableau, la plus part des éléments sont géré et placer dans
  //---- la scène grâce à ces deux variables.

  x = width/2;
  y = 270;


  //--- variable pour étoiles

  etoilecible = random(6);
}


//##########################################################
//----------------        DRAW        -------------------
//##########################################################


void draw () { 


  /*
    --- Instalation du décor présent tout au long du sketch
   --- Car à mon monstre est géré en deux état par des "IF"
   --- qui sont eux aussi dans le draw mais plus tard.
   */


  //--- Background  
  background (30);

  //--- Planète principale et cratères, les prochaines lignes servent à dessiner le décor ainsi que la grosse planete
  noStroke();

  fill(100, 101, 105);
  ellipse (200, 350, 600, 350);

  stroke(2);

  ellipse (300, 300, 50, 40);
  ellipse (100, 300, 50, 40);
  ellipse (80, 400, 30, 20);
  ellipse (150, 300, 10, 4);
  ellipse (10, 300, 16, 8);
  arc (80, 200, 100, 80, -0.5, PI-0.15);
  ellipse (400, 300, 30, 25);
  ellipse (20, 340, 30, 20);
  ellipse (330, 400, 20, 20);
  ellipse (150, 360, 25, 20);
  ellipse (300, 200, 25, 15);
  ellipse (340, 350, 8, 5);
  ellipse (300, 380, 15, 10);
  arc (360, 210, 40, 35, -0, 3.9);

  noStroke();

  fill(57, 53, 53);
  ellipse (400, 350, 10, 15);
  ellipse (30, 270, 8, 7);
  ellipse (300, 400, 10, 10);
  ellipse (100, 360, 15, 10);
  ellipse (330, 250, 15, 15);


  /*--- Étoiles, assouplissement de grosseur des étoiles... pas le moyen le plus efficace.
   Un tableau serait mieux, mais je ne me souvenais plus comment. J'avais fais cette partie pendant la grève désolé.
   Les étoiles se font assigné une grosseur aléatoire et elles possède une vitesse proportionnelle.
   */

  stroke(255);

  if ( random(100) < 5 ) {
    etoilecible = random(6);
  }
  etoile = ( etoilecible - etoile )  * 0.03 + etoile;
  strokeWeight(etoile); 
  point(30, 70);

  if ( random(100) < 5 ) {
    etoilecible2 = random(6);
  }
  etoile2 = ( etoilecible2 - etoile2 )  * 0.03 + etoile2;
  strokeWeight(etoile2);
  point(200, 40);

  if ( random(100) < 5 ) {
    etoilecible3 = random(6);
  }
  etoile3 = ( etoilecible3 - etoile3 )  * 0.03 + etoile3;
  strokeWeight(etoile3);
  point(50, 90);

  if ( random(100) < 5 ) {
    etoilecible4 = random(6);
  }
  etoile4 = ( etoilecible4 - etoile4 )  * 0.03 + etoile4;
  strokeWeight(etoile4);
  point(300, 100);

  if ( random(100) < 5 ) {
    etoilecible5 = random(6);
  }
  etoile5 = ( etoilecible5 - etoile5 )  * 0.03 + etoile5;
  strokeWeight(etoile5);
  point(90, 20);

  if ( random(100) < 5 ) {
    etoilecible6 = random(6);
  }
  etoile6 = ( etoilecible6 - etoile6 )  * 0.03 + etoile6;
  strokeWeight(etoile);
  point(270, 30);

  if ( random(100) < 5 ) {
    etoilecible7 = random(6);
  }
  etoile7 = ( etoilecible7 - etoile7 )  * 0.03 + etoile7;
  strokeWeight(etoile7);
  point(20, 190);

  if ( random(100) < 5 ) {
    etoilecible8 = random(6);
  }
  etoile8 = ( etoilecible8 - etoile8 )  * 0.03 + etoile8;
  strokeWeight(etoile8);
  point(380, 10);

  if ( random(100) < 5 ) {
    etoilecible9 = random(6);
  }
  etoile9 = ( etoilecible9 - etoile9 )  * 0.03 + etoile9;
  strokeWeight(etoile);
  point(310, 170);

  if ( random(100) < 5 ) {
    etoilecible10 = random(6);
  }
  etoile10 = ( etoilecible10 - etoile10 )  * 0.03 + etoile10;
  strokeWeight(etoile10);
  point(370, 180);
  strokeWeight(1.5);
  noStroke();



  //--- Petites planètes qui peuvent changer de couleur, grâce au clic de de la souris.
  //--- 

  overplanete = dist( mouseX, mouseY, 330, 120 ) ;
  if ( overplanete < 20 && press == 1) {
    r = random(255);
    g = random(255);
    b = random(255);
    press = 0;
    finalsatX = 330;
    finalsatY = 120;
  }

  fill(r, g, b);

  ellipse (330, 120, 30, 30);

  overplanete2 = dist( mouseX, mouseY, 40, 29 ) ;
  if ( overplanete2 < 11 && press  == 1) {
    r2 = random(255);
    g2 = random(255);
    b2 = random(255);
    press = 0;
    finalsatX = 40;
    finalsatY = 29;
  }
  fill(r2, g2, b2);
  ellipse (40, 29, 20, 20);




  //---- satellite "style lune" autour des planètes. La planète se fait changer
  //---- son point de rotation lors du clic de la souris. Elle gravite autour des planètes
  //---- grâce à un push et pop matrix. Il aurait également été possible de le faire grâce à
  //---- une incrémentation de la valeur PI, je crois.


  //-Vitesse proportionnel

  satX = ( finalsatX - satX) / 30 + satX; //30. vitesse de déplacement
  satY = ( finalsatY - satY) / 30 + satY;


  pushMatrix();

  translate(satX, satY);
  rotate(R * 0.05);  //vitesse de rotation
  translate(30, 0);

  fill(50, 200, 255);
  ellipse(0, 0, 10, 10);

  popMatrix();


  //--- Incrémentation de la variable R pour continuer une rotation de plus à chaque lecture du code.
  R++;




  //--- Condition de déplacement du monstre en X seulement ceci dépend des flèches de gauche et droite ------


  if (  deplacement[LEFT] == true && x > 140 ) {
    x = x - 0.5;
  }



  if (  deplacement[RIGHT] == true && x < 270) {
    x = x + 0.5;
  }



  //---- rectangle de maison E.T. Cette pancarte de retour à la maison est un réctangle et une ligne. Avec du texte au centre.

  fill(133, 188, 165);
  rectMode(CENTER);
  stroke(133, 188, 165);
  line(homeX, homeY, homeX, homeY+50);
  rect(homeX, homeY, homeW, homeH);

  fill(0);
  textAlign(CENTER);
  textSize(12);
  String s = "HOME";
  text(s, homeX, homeY+5 );
  stroke(0);


  //---  NAVETTE pour le monstre, constitué d'ellipses.
  //---  La navette se fait changer sa position lors du clic sur la pencarte de maison et ce dirige ensuite
  //---  vers la position sur la lune avec une vitesse proportionnelle
  //---  La fumée apparait et disparait grâce à une une incrémentation et à une réduction du alpha à certain stade de l'incrémentation

  fill(255);
  if (etatNavette == 1 ) {
    xNavetteCible = 160;
    yNavetteCible = 164;
    xNavette = (xNavetteCible - xNavette) * vitesseNavette + xNavette;
    yNavette = (yNavetteCible - yNavette) * vitesseNavette + yNavette;
  }

  stroke(95, 139, 224);
  line(xNavette, yNavette-2, xNavette-12, yNavette+16);
  line(xNavette, yNavette-2, xNavette+12, yNavette+15);
  noStroke();
  fill(104, 148, 240);


  ellipse (xNavette, yNavette, 20, 18);
  ellipse (xNavette, yNavette, 40, 10);
  fill(125, 214, 119);
  ellipse(xNavette+3, yNavette, 2, 2);
  ellipse(xNavette+9, yNavette, 2, 2);
  ellipse(xNavette-3, yNavette, 2, 2);
  ellipse(xNavette-9, yNavette, 2, 2);
  ellipse(xNavette+14, yNavette, 2, 2);
  ellipse(xNavette-14, yNavette, 2, 2);
  fill(255);



  if (f > 30) {
    fill(255, 150);
  }

  if ( f > 70) {
    fill(255, 100) ;
  }

  if (yNavette > 160  && f < 100 ) {
    noStroke();
    //gauche
    ellipse (xFumee+18, yFumee+20, 5, 5);
    ellipse (xFumee+19, yFumee+19, 4, 4);
    ellipse (xFumee+10, yFumee+12, 7, 7);
    ellipse (xFumee+12, yFumee+12, 8, 8);
    ellipse (xFumee+5, yFumee+3, 10, 10);
    ellipse (xFumee+5, yFumee, 12, 12);
    //droit
    ellipse (xFumee+60, yFumee+20, 5, 5);
    ellipse (xFumee+62, yFumee+19, 4, 4);
    ellipse (xFumee+66, yFumee+12, 7, 7);
    ellipse (xFumee+68, yFumee+12, 7, 8);
    ellipse (xFumee+80, yFumee+3, 9, 10);
    ellipse (xFumee+84, yFumee, 13, 12);
    f++;
  }

  if (f > 30) {
    xFumeeCible = xFumee + 2;
    yFumeeCible = yFumee - 5;
    xFumee = (xFumeeCible - xFumee) * vitesseNavette + xFumee;
    yFumee = (yFumeeCible - yFumee) * vitesseNavette + yFumee;
  }
  fill(255, 255);

  //##########################################################
  //---------- Si la souri est over le dessin est actualisé après que la souris soit rester plus que 2 secondes over.
  //-------------------- MONSTRE MÉCHANT -------------------
  //##########################################################

  //--Permet de savoir si la souris se trouve au dessus de monstre
  float over;
  over = dist( mouseX, mouseY, x-10, y-15 ) ;


  //--incrémentation qui gère la lentance avant la réaction du monstre
  //évite une réponse trop rapide lors du chevauchement de la zone active.

  if ( over < 50 ) {
    F = F + 1;
  }


  //-- Retour à zero de l'incrémentation lors de la sortie de la zone active 

  if ( over > 120 && F > 50) {
    F=0;
  }

  if ( over < 120 && F >= 50) {




    //--- Background dans la bouche              --MONSTRE MÉCHANT
    fill(75, 0, 0);
    ellipse(x-15, y-10, 210, 100);
    noFill();

    //--- Rayé dans bouche                       --MONSTRE MÉCHANT
    colorMode(HSB);
    strokeWeight(1.5);
    float   raye = 0;
    while ( raye < 200 ) {
      float   dessinx2 = random (-96, 70);
      float   dessiny2 = random (-50, 40);
      float   colorx   = random (  1, 30);
      stroke(0, 8, colorx);
      line(x+10, y, x+dessinx2, y+dessiny2);
      raye = raye + 1;
    }
    colorMode(RGB);


    //--- Mouvement avec les dents                            --MONSTRE MÉCHANT


    if (mousePressed == true) {



      dent = 1.5*(dent + 0.3);
      dent = constrain (dent, 0, 15);
    }


    else if (mousePressed == false) {

      dent = dent - 0.7;
      dent = constrain (dent, 0, 15);
    }


    //--- Dessin des dents animé par la variable dent               --MONSTRE MÉCHANT

    stroke(1);
    fill(255);
    triangle(x-40, y-5 + dent, x-45, y-25, x-35, y-25);
    triangle(x+20, y-9 + dent, x+25, y-25, x+15, y-25);
    triangle(x+30, y+12 -dent, x+35, y+28, x+25, y+28);
    triangle(x+10, y+24 -dent, x+15, y+28, x+5, y+28);
    triangle(x-50, y+16 -dent, x-55, y+28, x-45, y+28);
    triangle(x-10, y+30 -dent, x-15, y+28, x-5, y+28);
    triangle(x-30, y+24 -dent, x-35, y+28, x-25, y+28);

    //--- Gencives créé par des ellipse HAUTE                --MONSTRE MÉCHANT

    fill(185, 62, 62);
    noStroke();
    ellipse(x+35, y-29, 40, 20);
    ellipse(x+24, y-24, 40, 20);
    ellipse(x+10, y-24, 40, 20);
    ellipse(x, y-20, 50, 20);
    ellipse(x-10, y-20, 50, 20);
    ellipse(x-20, y-20, 50, 20);
    ellipse(x-40, y-28, 50, 20);
    ellipse(x-60, y-30, 50, 20);

    //--- Gencives créé par des ellipse BASSE                --MONSTRE MÉCHANT

    ellipse(x+35, y+29, 40, 20);
    ellipse(x+24, y+34, 40, 20);
    ellipse(x+10, y+35, 40, 20);
    ellipse(x, y+40, 50, 20);
    ellipse(x-10, y+32, 50, 20);
    ellipse(x-20, y+32, 50, 20);
    ellipse(x-40, y+28, 50, 20);
    ellipse(x-60, y+30, 50, 20);
    ellipse(x+50, y+30, 50, 20);
    ellipse(x-70, y+30, 50, 20);

    //--- Corps  ET trou dans la bouche         --MONSTRE MÉCHANT
    stroke(1);
    fill(255, 231, 178);
    beginShape();
    curveVertex(x, y-100);
    curveVertex(x, y-100);
    curveVertex(x+90, y-70);
    curveVertex(x+100, y);
    curveVertex(x+70, y+40);
    curveVertex(x+15, y+50);
    curveVertex(x-30, y+55);
    curveVertex(x-60, y+50);
    curveVertex(x-90, y+45);
    curveVertex(x-108, y+20);
    curveVertex(x-115, y-45);
    curveVertex(x, y-100);


    curveVertex(x-110, y-33);
    curveVertex(x-111, y-30);
    curveVertex(x-105, y-15);
    curveVertex(x-97, y);
    curveVertex(x-70, y+20);
    curveVertex(x-50, y+30);
    curveVertex(x-30, y+35);
    curveVertex(x, y+39);
    curveVertex(x+15, y+36);
    curveVertex(x+40, y+30);
    curveVertex(x+60, y+18);
    curveVertex(x+70, y+10);
    curveVertex(x+75, y);
    curveVertex(x+81, y-31);
    curveVertex(x+80, y-33);
    curveVertex(x+40, y-28);
    curveVertex(x, y-23);
    curveVertex(x-110, y-33);
    curveVertex(x-110, y-33);
    curveVertex(x-110, y-33);

    endShape();

    //--- Patch pour coin de bouche                    --MONSTRE MÉCHANT
    noStroke();
    ellipse (x-115, y-32, 10, 10);
    ellipse (x-102, y-38, 20, 10);
    stroke(1);



    //--- curve plus ronde du corps = dessus de tête   --MONSTRE MÉCHANT

    arc(x+40, y-75, 60, 40, PI+1.40, 2*PI-0.3);
    arc(x-10, y-35, 200, 135, PI+0.2, 2*PI-1.);


    //--- Mains + inclinaison légère de la main droite --MONSTRE MÉCHANT

    stroke(0);
    fill(255, 231, 178);

    pushMatrix();
    translate(-4, -2);
    rotate(-0.02);
    arc(x+100, y-10, 50, 25, 4.6, 8);
    popMatrix();

    arc(x-115, y-10, 50, 25, PI/2, 4.45 );
    noFill();

    //--- Bouche                                       --MONSTRE MÉCHANT
    noFill();
    beginShape();
    curveVertex(x-110, y-33);
    curveVertex(x-110, y-33);
    curveVertex(x-111, y-30);
    curveVertex(x-105, y-15);
    curveVertex(x-97, y);
    curveVertex(x-70, y+20);
    curveVertex(x-50, y+30);
    curveVertex(x-30, y+35);
    curveVertex(x, y+39);
    curveVertex(x+15, y+36);
    curveVertex(x+40, y+30);
    curveVertex(x+60, y+18);
    curveVertex(x+70, y+10);
    curveVertex(x+75, y);
    curveVertex(x+81, y-31);
    curveVertex(x+80, y-33);
    curveVertex(x+40, y-28);
    curveVertex(x, y-23);
    curveVertex(x-110, y-33);
    curveVertex(x-110, y-33);
    endShape();

    //--- Sourcil gauche                               --MONSTRE MÉCHANT

    fill(0);
    beginShape();
    vertex(x-85, y-75);
    vertex(x-85, y-75);
    vertex(x-72, y-68);
    vertex(x-75, y-68);
    vertex(x-83, y-72);
    endShape(CLOSE);

    //--- Sourcil droit                                --MONSTRE MÉCHANT

    beginShape();
    vertex(x+80, y-76);
    vertex(x+80, y-73);
    vertex(x+65, y-70);
    vertex(x+64, y-70);
    vertex(x+80, y-76);
    endShape(CLOSE);


    //--- Yeux Blanc                                   --MONSTRE MÉCHANT
    fill(255, 255, 255);
    ellipse(x+72, y-55, 25, 28);
    ellipse(x-83, y-55, 25, 28);

    //--- Joues droites                                --MONSTRE MÉCHANT
    noFill();
    arc(x+78, y-30, 20, 20, 5, 2*PI);
    arc(x+80, y-31, 20, 20, 5, 1.9*PI);

    //--- Joues gauches                                --MONSTRE MÉCHANT
    arc(x-105, y-30, 20, 20, PI, 5);
    arc(x-108, y-29, 20, 20, PI, 4);

    //--- Pieds                                        --MONSTRE MÉCHANT
    stroke(0);
    fill(255, 231, 178);
    arc(x+35, y+50, 30, 45, -0.25, PI+0.2);
    arc(x-50, y+47, 30, 45, 0.3, PI+0.1);
    noStroke();
    ellipse(x+35, y+50, 30, 20);

    //--- Queue                                        --MONSTRE MÉCHANT
    stroke(1);
    fill(255, 231, 178);
    arc (x+47, y+28, 130, 30, 5.55, 7.53);
    noFill();
    arc(x+5, y-5, 200, 120, 0.80, 0.9);



    //--- Yeux pupille droit                            --MONSTRE MÉCHANT
    fill(0);
    noStroke();
    float yposition = y - 54 ;
    float xposition = x + 71 ;
    float yposition2 = y-54;
    float xposition2 = x-83;

    float radians = atan2(mouseY - yposition, mouseX - xposition );
    float distance = dist(mouseX, mouseY, x, y);

    distance = constrain(distance, 0, dyeux/2 - dpupille/2);

    float pupilleX = cos(radians)* distance + x;
    float pupilleY = sin(radians)* distance + y;

    ellipse(pupilleX+71, pupilleY-54, dpupille, dpupille);


    //--- Yeux pupille gauche                            --MONSTRE MÉCHANT

    float radians2 = atan2(mouseY - yposition2, mouseX - xposition2 );    

    float pupilleX2 = cos(radians2)* distance + x;
    float pupilleY2 = sin(radians2)* distance + y;

    ellipse(pupilleX2-83, pupilleY2-54, dpupille, dpupille);

    //--- Ptit truc sous la bouche                       --MONSTRE MÉCHANT
    stroke(1);
    noFill();
    beginShape();
    curveVertex(x-11, y+40);
    curveVertex(x-11, y+40);
    curveVertex(x, y+43);
    curveVertex(x+10, y+40);
    curveVertex(x+10, y+40);
    endShape();

    beginShape();
    curveVertex(x-5, y+47);
    curveVertex(x-5, y+45);
    curveVertex(x, y+46);
    curveVertex(x+4, y+45);
    curveVertex(x+4, y+47);
    endShape();

    //--- Genoux                                             --MONSTRE MÉCHANT
    beginShape();
    curveVertex(x-60, y+53);
    curveVertex(x-55, y+60);
    curveVertex(x-51, y+62);
    curveVertex(x-47, y+60);
    curveVertex(x-47, y+60);
    endShape();

    beginShape();
    curveVertex(x+45, y+55);
    curveVertex(x+40, y+62);
    curveVertex(x+36, y+63);
    curveVertex(x+32, y+62);
    curveVertex(x+32, y+62);
    endShape();

    //--- Bosse en dessous de l'oeil gauche                    --MONSTRE MÉCHANT
    fill(255, 231, 178);
    stroke(2);
    arc(x-97, y-38, 50, 20, PI+PI/2, 2*PI);

    //--- Bosse en dessous de l'oeil droite                    --MONSTRE MÉCHANT
    arc(x+72, y-36, 50, 20, PI+0.2, PI+2.1);
    noStroke();
  }







  //-- ############################################################
  //------------------------- MONSTRE GENTIL ------------------
  //-- ############################################################
  //Lorsque la souris n'est pas au dessus de la zone active du monstre il prend son état standar

  else {


    //--- Ombres des jambes.

    fill(0, 0, 0, 150);
    noStroke();
    arc (x-50, y+64, 50, 10, -1, 1.3);
    arc  (x+33, y+68, 60, 10, -1, 1.3); 


    //--- remise à zéro de la variable dent

    dent = 0;


    //--- Queue Cu  -------- Monstre gentil
    stroke(1);
    strokeWeight(1.5);
    fill(255, 231, 178);
    ellipse(x+30, y+30, 145, 40);

    //--- Ellipse corps  -------- Monstre gentil
    noStroke();
    fill(255, 231, 178);
    ellipse(x, y, 200, 120);
    stroke(1);
    arc(x, y, 200, 120, 1, 2*PI+0.4);

    //--- Contour queue  -------- Monstre gentil
    stroke(0);
    noFill();
    arc(x, y, 200, 120, 0.75, 1.1);


    //--- Queue tête -------- Monstre gentil
    stroke(1);
    fill(255, 231, 178);
    arc(x+10, y-50, 60, 40, PI+0.4, 2*PI);
    arc(x+35, y-45, 60, 40, PI+1.45, 2*PI);
    arc(x+53, y-35, 60, 40, PI+1.88, 2*PI+0.02);


    //--- Mains ou ce qui peut ressembler a des mains  -------- Monstre gentil
    noFill();
    arc(x+53, y+30, 20, 25, 0, PI);
    arc(x-55, y+30, 20, 25, 0, PI);

    //--- Bouche  -------- Monstre gentil
    beginShape();
    vertex(x-80, y+14);
    vertex(x-80, y+14);
    vertex(x-60, y+15);
    vertex(x-40, y+17);
    vertex(x-20, y+18);
    vertex(x, y+18);
    vertex(x, y+18);
    vertex(x+20, y+18);
    vertex(x+40, y+17);
    vertex(x+60, y+15);
    vertex(x+80, y+14);
    vertex(x+80, y+14);
    endShape();

    //--- Yeux Blanc  -------- Monstre gentil
    fill(255, 255, 255);
    ellipse(x+72, y-5, 25, 28);
    ellipse(x-72, y-5, 25, 28);

    //--- Joues droites  -------- Monstre gentil
    noFill();
    arc(x+75, y+20, 20, 20, 5, 2*PI);
    arc(x+79, y+19, 20, 20, 5, 1.9*PI);

    //--- Joues gauches  -------- Monstre gentil
    arc(x-79, y+20, 20, 20, PI, 5);
    arc(x-81, y+19, 20, 20, PI, 4);

    //--- -Pieds  -------- Monstre gentil
    stroke(0);
    fill(255, 231, 178);
    arc(x+35, y+50, 30, 45, -0, PI-0.29);
    arc(x-50, y+47, 30, 45, 0.3, PI+0.1);

    //--- -Yeux pupille Droit -------- Monstre gentil
    //-- ils sont contraint à rester dans leur orbite avec le constrain. 
    //-- et ils suivent la direction de la souris

    fill(0);
    noStroke();

    float yposition = y + 2 ;
    float xposition = x + 69 ;
    float yposition2 = y + 2;
    float xposition2 = x - 69;

    float radians = atan2(mouseY - yposition, mouseX - xposition );
    float distance = dist(mouseX, mouseY, x, y);

    distance = constrain(distance, 0, dyeux/2 - 10);

    float pupilleX = cos(radians)* distance + x;
    float pupilleY = sin(radians)* distance + y;

    ellipse(pupilleX+73, pupilleY+2, dpupille, dpupille);


    //--- -Yeux pupille Gauche  -------- Monstre gentil
    //--- même chose que la pupille de droite mais les variables sont déjà appelé.


    float radians2 = atan2(mouseY - yposition2, mouseX - xposition2 );    

    float pupilleX2 = cos(radians2)* distance + x;
    float pupilleY2 = sin(radians2)* distance + y;

    ellipse(pupilleX2-73, pupilleY2+2, dpupille, dpupille);


    //--- -Ptit truc sous la bouche  -------- Monstre gentil

    stroke(1);
    noFill();
    beginShape();
    curveVertex(x-11, y+25);
    curveVertex(x-11, y+25);
    curveVertex(x, y+28);
    curveVertex(x+10, y+25);
    curveVertex(x+10, y+25);
    endShape();

    beginShape();
    curveVertex(x-5, y+33);
    curveVertex(x-5, y+31);
    curveVertex(x, y+32);
    curveVertex(x+4, y+31);
    curveVertex(x+4, y+33);
    endShape();

    //--- -Genoux  -------- Monstre gentil
    beginShape();
    curveVertex(x-60, y+53);
    curveVertex(x-55, y+60);
    curveVertex(x-51, y+62);
    curveVertex(x-47, y+60);
    curveVertex(x-47, y+60);
    endShape();

    beginShape();
    curveVertex(x+45, y+55);
    curveVertex(x+40, y+62);
    curveVertex(x+36, y+63);
    curveVertex(x+32, y+62);
    curveVertex(x+32, y+62);
    endShape();

    //--- Paupières qui se ferment aléatoirement créant plus de réalisme. DROITE

    if (etatOeil==1) {
      interval = 400;
      fill(255, 231, 178);
      stroke(0);
      ellipse (x+72, y-5, 25, 28);
      arc (x+72, y-5, 25, 4, 0, PI);

      if ( millis() - timeStamp >= interval ) {
        timeStamp = timeStamp + interval;
        interval = random(3000, 6000);
        etatOeil=0;
      }
    }

    // Timer pour le clignement d'oeil.

    if ( millis() - timeStamp >= interval ) {
      timeStamp = timeStamp + interval;
      etatOeil=1;
    }

    //--- Paupières qui se ferment aléatoirement créant plus de réalisme. GAUCHE

    if (etatOeil==1) {
      interval = 400;
      fill(255, 231, 178);
      stroke(0);
      ellipse (x-72, y-5, 25, 28);
      arc (x-72, y-5, 25, 4, 0, PI);

      if ( millis() - timeStamp >= interval ) {
        timeStamp = timeStamp + interval;
        interval = random(3000, 6000);
        etatOeil=0;
      }
    }

    // Timer pour le clignement d'oeil.

    if ( millis() - timeStamp >= interval ) {
      timeStamp = timeStamp + interval;
      etatOeil=1;
    }
  }
}


//La fonction qui gère si une touche (les flèches) ont été appuyé !

void keyPressed() {

  if ( key == CODED ) {
    deplacement[keyCode] = true;
  }
}




//La fonction qui gère si une touche à été relâché.  (les flèches toujours.)

void keyReleased() {

  if ( key == CODED ) {
    deplacement[keyCode] = false;
  }
}




//Permet de savoir si le bouton de la souris à été appuyer. Et si elle à été appuyer dans le rectangle de la pencarte ou la sélection du monstre.

void mousePressed() { 
  overplanete = dist( mouseX, mouseY, 330, 120 ) ;
  if (overplanete < 20) {
    press = 1;
  }


  overplanete2 = dist( mouseX, mouseY, 40, 29 ) ;
  if (overplanete2 < 11) {
    press = 1;
  }
  if (mousePressed == true) {

    if ( mouseX > 30 && mouseX < 80 && mouseY > 220 && mouseY < 240 ) {

      etatNavette = 1 ;
    }
  }
}


