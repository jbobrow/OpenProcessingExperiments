
//centre du monstre (au centre du ventre)
float x;
float y;

//Couleurs
//vert
color c = color(201, 223, 0);
//rouge
color r = color (191, 20, 0);
//jaune
color j = color (253, 255, 0);
//vert foncé
color v = color (56, 255, 0);

//Variables pour allonger et retrecir le cou
float distance;
float bougeY;
float bougeSin;

//Variables pour l'assouplissement des ailles
float targetY;
float y1;

//Variables pour la minutrie
float oscillationCompteur;
int timeStamp;
float vitesse;

//Variable pour changer l'état de l'ouverture de la bouche
int etat;

//Tableaux pour les taches
float[] tacheX= {
  x-61, x-65, x-57, x-64, x-61, x-69, x-65, x-70, x-71, x-71, x-70, x-66, x-74, x-74, x-74, x-70, x-73
};
float[] tacheY= {
  y-39, y-31, y-33, y-20, y-26, y-26, y-24, y-13, y-4, y+3, y-18, y-12, y-7, y-6, y+1, y+6, y+7, y+11
};
float[] tacheRayon= {
  10, 8, 6, 6, 5, 5, 4, 4, 4, 4, 5, 3, 3, 3, 3, 3, 3
};

float distance1;


void setup() {
  //Initialisation du sketch
  size(400, 400);
  frameRate(30);
  smooth();

  //centre du monstre  
  x= width*0.5;
  y= height* 0.72;

  //Variables pour allonger et retrecir le cou 
  distance=0;
  bougeSin=0;
  //Variables qui suit le mouvement de la tête
  bougeY=0;

  //Variables pour l'assouplissement des ailles
  targetY=height/2;
  y1= random (height);

  //Variables pour la minutrie
  oscillationCompteur=0;
  timeStamp=millis();
  vitesse =  0.5;

  //Variable pour changer l'état de l'ouverture de la bouche
  etat=1;
}


void draw () {
  //Couleur de fond de du sketch
  background(127);

  //Condition pour faire bouger la tête lors d'un clic
  if (mousePressed) {
    bougeY=sin(radians(bougeSin))*20;
    //Pour déterminer la zone interactive circulaire de la tête
    //La zone circulaire suit le mouvement de la tête
    distance = dist( mouseX, mouseY, x, y-232+bougeY ) ;
    if ( distance <42 ) {
      bougeSin+=10;
    }
  }
  //DEBUT TÊTE///////////////////////////////////////////////////////////////  
  //OEIL GAUCHE
  fill (255);
  stroke (0);
  strokeWeight(0.5);
  ellipse (x-12, y-248+bougeY, 25, 25);

  //iris
  noStroke();
  fill(27, 179, 143);
  ellipse(x-14, y-249+bougeY, 13, 13);

  //pupille
  fill(0);
  ellipse (x-14, y-249+bougeY, 7, 7);

  //cercle de lumiere
  fill(255);
  ellipse (x-18, y-250+bougeY, 3, 3);
  ellipse (x-16, y-249+bougeY, 1, 1);

  //OEIL DROIT
  fill (255);
  stroke (0);
  strokeWeight(0.5);
  ellipse (x+12, y-248+bougeY, 25, 25);

  //iris
  noStroke();
  fill(27, 179, 143);
  ellipse(x+15, y-249+bougeY, 13, 13);

  //pupille
  fill(0);
  ellipse (x+15, y-249+bougeY, 7, 7); 

  //cercle de lumiere
  fill(255);
  ellipse (x+18, y-250+bougeY, 3, 3);
  ellipse (x+16, y-249+bougeY, 1, 1);

  fill(c);  
  noStroke();

  //paupiere gauche
  arc(x-12, y-251+bougeY, 25, 25, radians(190), radians(370));

  //paupiere droite
  arc(x+12, y-251+bougeY, 25, 25, radians(170), radians(350));

  //nez
  triangle (x, y-245+bougeY, x+15, y-236+bougeY, x-15, y-236+bougeY);

  //narine
  stroke (0);
  strokeWeight(0.5);
  line (x+1, y-242+bougeY, x+1, y-240+bougeY);
  line (x-1, y-242+bougeY, x-1, y-240+bougeY);

  //machoire
  noStroke();
  triangle (x, y-193+bougeY, x-45, y-214+bougeY, x+41, y-213+bougeY);

  //DÉBUT BOUCHE///////////////////////////////////////
  //État initial
  if (etat%2==0) {
    //bouche ouverte
    fill(r);
    noStroke();
    ellipse (x-2, y-217+bougeY, 91, 20); 
    ellipse (x-2, y-228+bougeY, 91, 20);
    noFill();
    stroke(c);
    strokeWeight (2);
    arc (x-2, y-228+bougeY, 91, 20, radians(148), radians(390));
    arc(x-2, y-217+bougeY, 91, 20, radians(-35), radians(210));

    //glotte
    noStroke();
    fill(148, 20, 0);
    ellipse (x-1, y-222+bougeY, 15, 15);
    fill(223, 0, 48);
    ellipse (x-1, y-227+bougeY, 2, 4);
    ellipse (x-1, y-225+bougeY, 2, 3);

    //dents de l'extérieur a l'interieur
    //dent 1 haut gauche
    noStroke();
    fill(255);
    //utiliser les curveVertex pour dessiner les courbes de la dent
    beginShape();
    curveVertex (x-38, y-234+bougeY);
    curveVertex (x-38, y-234+bougeY);
    curveVertex (x-38, y-229+bougeY);
    curveVertex (x-35, y-223+bougeY);
    curveVertex (x-34, y-229+bougeY);
    curveVertex (x-31, y-236+bougeY);
    curveVertex (x-31, y-236+bougeY);
    endShape(CLOSE);

    //dent 2 haut gauche
    noStroke();
    fill(255);
    //utiliser les curveVertex pour dessiner les courbes de la dent
    beginShape();
    curveVertex (x-26, y-236+bougeY);
    curveVertex (x-26, y-236+bougeY);
    curveVertex (x-26, y-231+bougeY);
    curveVertex (x-23, y-225+bougeY);
    curveVertex (x-21, y-231+bougeY);
    curveVertex (x-18, y-237+bougeY);
    curveVertex (x-18, y-237+bougeY);
    endShape(CLOSE);

    //dent 3 haut gauche
    noStroke();
    fill(255);
    //utiliser les curveVertex pour dessiner les courbes de la dent
    beginShape();
    curveVertex (x-14, y-237+bougeY);
    curveVertex (x-14, y-237+bougeY);
    curveVertex (x-15, y-232+bougeY);
    curveVertex (x-11, y-225+bougeY);
    curveVertex (x-9, y-232+bougeY);
    curveVertex (x-6, y-238+bougeY);
    curveVertex (x-6, y-238+bougeY);
    endShape(CLOSE);

    //dent 1 haut droit
    noStroke();
    fill(255);
    //utiliser les curveVertex pour dessiner les courbes de la dent
    beginShape();
    curveVertex (x+26, y-236+bougeY);
    curveVertex (x+26, y-236+bougeY);
    curveVertex (x+30, y-229+bougeY);
    curveVertex (x+31, y-223+bougeY);
    curveVertex (x+34, y-229+bougeY);
    curveVertex (x+34, y-234+bougeY);
    curveVertex (x+34, y-234+bougeY);
    endShape(CLOSE);

    //dent 2 haut droit
    noStroke();
    fill(255);
    //utiliser les curveVertex pour dessiner les courbes de la dent
    beginShape();
    curveVertex (x+14, y-237+bougeY);
    curveVertex (x+14, y-237+bougeY);
    curveVertex (x+17, y-231+bougeY);
    curveVertex (x+19, y-225+bougeY);
    curveVertex (x+22, y-231+bougeY);
    curveVertex (x+22, y-236+bougeY);
    curveVertex (x+22, y-236+bougeY);
    endShape(CLOSE);

    //dent 3 haut droit
    noStroke();
    fill(255);
    //utiliser les curveVertex pour dessiner les courbes de la dent
    beginShape();
    curveVertex (x+1, y-238+bougeY);
    curveVertex (x+1, y-238+bougeY);
    curveVertex (x+4, y-232+bougeY);
    curveVertex (x+6, y-226+bougeY);
    curveVertex (x+9, y-236+bougeY);
    curveVertex (x+9, y-237+bougeY);
    curveVertex (x+9, y-237+bougeY);
    endShape(CLOSE);

    //dent 1 bas gauche
    noStroke();
    fill(255);
    //utiliser les curveVertex pour dessiner les courbes de la dent
    beginShape();
    curveVertex (x-32, y-210+bougeY);
    curveVertex (x-32, y-210+bougeY);
    curveVertex (x-33, y-215+bougeY);
    curveVertex (x-30, y-223+bougeY);
    curveVertex (x-29, y-215+bougeY);
    curveVertex (x-25, y-209+bougeY);
    curveVertex (x-25, y-209+bougeY);
    endShape(CLOSE);

    //dent 2 bas gauche
    noStroke();
    fill(255);
    //utiliser les curveVertex pour dessiner les courbes de la dent
    beginShape();
    curveVertex (x-20, y-209+bougeY);
    curveVertex (x-20, y-209+bougeY);
    curveVertex (x-20, y-214+bougeY);
    curveVertex (x-17, y-221+bougeY);
    curveVertex (x-16, y-214+bougeY);
    curveVertex (x-13, y-208+bougeY);
    curveVertex (x-13, y-208+bougeY);
    endShape(CLOSE);

    //dent bas droite
    noStroke();
    fill(255);
    //utiliser les curveVertex pour dessiner les courbes de la dent
    beginShape();
    curveVertex (x+21, y-209+bougeY);
    curveVertex (x+21, y-209+bougeY);
    curveVertex (x+25, y-216+bougeY);
    curveVertex (x+26, y-222+bougeY);
    curveVertex (x+29, y-216+bougeY);
    curveVertex (x+28, y-210+bougeY);
    curveVertex (x+28, y-210+bougeY);
    endShape(CLOSE);

    //dent 2 bas droite
    noStroke();
    fill(255);
    //utiliser les curveVertex pour dessiner les courbes de la dent
    beginShape();
    curveVertex (x+8, y-208+bougeY);
    curveVertex (x+8, y-208+bougeY);
    curveVertex (x+11, y-214+bougeY);
    curveVertex (x+12, y-221+bougeY);
    curveVertex (x+16, y-214+bougeY);
    curveVertex (x+15, y-209+bougeY);
    curveVertex (x+15, y-209+bougeY);
    endShape(CLOSE);
  }
  //Changer d'état pour fermer la bouche
  else if (etat%2==1)
  {
    //bouche fermée
    fill(c);
    noStroke();
    ellipse (x-1, y-222+bougeY, 95, 37);
    stroke(r);
    line(x-40, y-223+bougeY, x+39, y-223+bougeY);
  } 
  //FIN BOUCHE///////////////////////////////////////////////////////
  //FIN TÊTE/////////////////////////////////////////////////////////////
  
  //cou
  noStroke();
  fill(c);
  rect (x-4, y-205+bougeY, 8, 155);

  //DEBUT PIED GAUCHE ///////////////////////////////////////////////////
  fill(c);
  //talon
  ellipse (x-22, y+77, 10, 10);
  //patte
  triangle (x-18, y+78, x-86, y+67, x-86, y+92);

  //lignes pied gauche
  stroke (j);
  strokeWeight(1.5);
  line (x-78, y+73, x-58, y+75);
  line (x-78, y+79, x-58, y+78);
  line (x-78, y+84, x-58, y+82);

  //griffes
  noStroke();
  fill (255);
  triangle (x-93, y+71, x-86, y+67, x-86, y+75);
  triangle (x-93, y+80, x-86, y+76, x-86, y+84);
  triangle (x-93, y+89, x-86, y+85, x-86, y+92);
  //FIN PIED GAUCHE//////////////////////////////////////////////////////

  //DEBUT PIED DROIT/////////////////////////////////////////////////////
  fill(c);
  //talon
  ellipse (x+19, y+77, 10, 10);
  //patte
  triangle (x+18, y+78, x+84, y+68, x+84, y+92);

  //lignes pied droite
  stroke (j);
  line (x+56, y+75, x+75, y+73);
  line (x+56, y+79, x+75, y+79);
  line (x+55, y+82, x+76, y+84);

  //griffes
  noStroke();
  fill (255);
  triangle (x+91, y+72, x+84, y+68, x+84, y+75);
  triangle (x+91, y+80, x+84, y+77, x+84, y+84);
  triangle (x+91, y+89, x+84, y+85, x+84, y+92);
  //FIN PIED DROIT/////////////////////////////////////////////////////////

  //DEBUT AILLES////////////////////////////////////////////////////////////////////
  //Mouvements des ailles/
  pushMatrix ();
  //Assouplissement proportionnelle pour 1 variable
  float ratio = 0.2;
  y1 = (targetY - y1)* ratio + y1;

  //Minutrie pour les ailles. Change de vitesse aux 5 sec. entre les valeurs 0.01 et 0.5
  int tempsEcoule= millis()-timeStamp;
  if (tempsEcoule>= 5000) {
    timeStamp = millis();
    vitesse =  random (0.01, 0.5);
  }
  //Faire une translation pour mettre le point d'origine des ailles de gauche à la bonne place sur la scène
  translate (198, 212);
  //Déterminer la rotation des l'ailles de gauche
  rotate (cos (oscillationCompteur)* radians(5));

  //aille gauche (grosse)
  strokeWeight(1);
  fill(223, 255, 254);
  oscillationCompteur = oscillationCompteur + vitesse;
  //utiliser les curveVertex pour dessiner les courbes de l'aille
  beginShape();
  curveVertex (0, 0);
  curveVertex (0, 0);
  curveVertex (-37, -71);
  curveVertex (-74, -114);
  curveVertex (-50, -64);
  curveVertex (0, 0);
  stroke(173, 222, 217);
  endShape(CLOSE);
  line(-2, -3, -65, -100);

  //aille gauche (petite)
  fill(223, 255, 254);
  stroke (173, 222, 217);
  //utiliser les curveVertex pour dessiner les courbes de l'aille
  beginShape();
  curveVertex (0, 0);
  curveVertex (0, 0);
  curveVertex (-43, -28);
  curveVertex (-80, -41);
  curveVertex (-49, -20);
  curveVertex (0, 0);
  endShape(CLOSE);
  line(0, -1, -71, -36);
  stroke(173, 222, 217);
  popMatrix();

  pushMatrix ();
  //Faire une translation pour mettre le point d'origine des ailles de droite à la bonne place sur la scène
  translate (202, 212);
  //Déterminer la rotation des ailles de droite
  rotate (cos (oscillationCompteur)* radians(-5));

  //aille droite (grosse)
  fill(223, 255, 254);
  oscillationCompteur = oscillationCompteur + 0.5;
  stroke (173, 222, 217);
  //utiliser les curveVertex pour dessiner les courbes de l'aille
  beginShape();
  curveVertex (0, 0);
  curveVertex (0, 0);
  curveVertex (43, -68);
  curveVertex (80, -111);
  curveVertex (56, -61);
  curveVertex (0, 0);
  endShape(CLOSE);
  line(0, 0, 72, -97);
  stroke(173, 222, 217);

  //aille droite (petite)
  fill(223, 255, 254);
  stroke (173, 222, 217);
  //utiliser les curveVertex pour dessiner les courbes de l'aille
  beginShape();
  curveVertex (0, 0);
  curveVertex (0, 0);
  curveVertex (49, -28);
  curveVertex (86, -41);
  curveVertex (55, -20);
  curveVertex (0, 0);
  endShape(CLOSE);
  line(0, -1, 77, -36);
  stroke(173, 222, 217);
  popMatrix();
  //FIN AILLES//////////////////////////////////////////////////////////////////

  //ventre (boucle dans le dégradé)
  for (int i=0; i<=153; i++) {
    noStroke();
    fill(201+i*0.5, 223, 0+i*0.2);
    ellipse (x, y-i*0.5, 153-i, 153-i);
  }

  //DEBUT taches sur le côté gauche du ventre////////////////////////////////////////////////////
  //Boucle pour afficher les taches(cercles) 
  for (int i=0; i<=tacheX.length-1; i++) {
    //condition pour que le curseur soit à l'intérieur d'une zone interactive circulaire
    distance1= dist(mouseX, mouseY, tacheX[i]+200, tacheY[i]+290);
    if (distance1 < tacheRayon[i]*0.5) {
      fill (v);
    }
    else {
      fill(148, 186, 43);
    }
    noStroke();
    ellipse (tacheX[i]+200, tacheY[i]+290, tacheRayon[i], tacheRayon[i]);
  }
  //FIN taches sur le côté gauche du ventre//////////////////////////////////////////////////
}


void mousePressed() {
  //Condition de la zone interactive rectangulaire du cou
  //cliquer sur le cou pour qu'il s'allonge et se rétrécit
  {
    if (mouseX<x+4 && mouseX>x-4 && mouseY<y-71 && mouseY>y-211)
    {
      etat++;
    }
  }
}
