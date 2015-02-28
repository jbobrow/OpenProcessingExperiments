
//initialisation des valeurs
float x = 0;
float y = 0;
int posOeuilX = 0 ;                                   //position x de l'oeuil
int posOeuilY = 0 ;                                   //position y de l'oeuil
float compteur = 0 ;                                  //variable des boucles
float vitesseFlagel = 0;
float vertexP1Y = 0;                                  //position du premier noeud des vertex en Y
float vertexP1X = 0;                                  //position du premier noeud des vertex en X
float vertexP2X = 0;                                  //position du dexieme noeud des vertex en X
float centre = 0;
float etenduMouvement = 15;                           //etendu du mouvement des flagels
int i = 0;
int compteuretatOeuf = 0;                             //Dit au programme a quel etat de la naissance du monstre on en est
int intro = 0;
int posOeufX = 0;                                     //permet de faire bouger l'oeuf en X (obsolete mais peut servir)
float posOeufY = 0.5;                                 //permet de faire bouger l'oeuf en Y
int ferme = 100;                                      //valeur qui determine si les yeux sont ouverts ou fermés
boolean slapBasDroite = false;                        //zone de detection en bas a droite
boolean slapBasGauche = false;                        //zone de detection en bas a gauche
boolean slapHautDroit = false;                        //zone de detection en haut a droite
boolean slapHautGauche = false;                       //zone de detection en haut a gauche
boolean velSlap = false;                              //dit si la velocitée est suffisement grande pour un slap
boolean casse = false;                                //dit si l'oeuf se casse ou non si oui l'etat de l'oeuf avance de 1
float rotMonstre = 0;                                 //gere la rotation du monstre quand on le slap
float distanceOeuf = 0;                               //gere la distance de la souris par rapport a la zone de detection de l'oeuf
int posBrasGX = 0; // position X du bras gauche
float posBrasGY = 20;// position Y du bras droit
int posBrasDX = 0;// position droite en 
float posBrasDY = 20;
//le temps
int timeStamp;
int interval;
float targetX;
float x1, x2, v3;
float etatOeuil = 1;

//initialisation des parametres
void setup() {
  //max 400 par 400
  size(400, 400);
  //lisser tout
  smooth();
  //nombre de fois par secondes ou le draw s'execute
  frameRate(30);
  x = 0;
  y = 0;
  interval = 2000;
}


// void draw. contient par défaut un booucle qui s'execute toutes les n frameRate
void draw() {
  background(200);//fond gris
  /*
  bouger(); //void permettant de bouger le monstre
   */

  translate(200, 200);
  pushMatrix();
  casserOeuf();
  carresse();
  if (compteuretatOeuf > 1 && compteuretatOeuf < 5) {
    x = random(-5, 5);
  }
  if (compteuretatOeuf > 6 ) {
    bouger();
  }


  // quand le monstre est slap il fait un tour sur lui meme
  //haut gauche
  if (compteuretatOeuf == 7) {
    reactionSlap();
  }



  monstre(); //void du dessin du monstre

    if (intro == 0) {
    oeuf();
  }



  if (velSlap == true) {
    slap();
  }



  if (mousePressed) {
    vel();
  }
  popMatrix();
  minuterie();
}


////////////////////////////////////////////////////////
//dessinne la coquille et les craquelures
void oeuf() {

  //oeuf
  fill(255, 208, 147);
  ellipse(x+posOeufX, y+posOeufY, 280, 350 );
  if (casse == true) {
    if ((mousePressed) && (compteuretatOeuf == 0)) {
      compteuretatOeuf = 1;
    }
  }

  if (compteuretatOeuf > 0) {
    //fill(255, 208, 147, 255);

    //craquelures
    beginShape();

    vertex(x, y + posOeufY);
    vertex(x-50, y- 55 + posOeufY);
    vertex(x+25, y-100 + posOeufY);
    vertex(x-10, y-135 + posOeufY);
    vertex(x+15, y-150 + posOeufY);
    vertex(x-30, y-172 + posOeufY);

    
    endShape();
  }
  if (casse==true) {
    if ((mousePressed) && (compteuretatOeuf == 2)) {
      compteuretatOeuf = 3;
    }
  }
  if (compteuretatOeuf > 2 ) {
    fill(255, 208, 147, 255);
    beginShape();
    vertex(x, y + posOeufY);
    vertex(x-50, y+ 55 + posOeufY);
    vertex(x+25, y+100 + posOeufY);
    vertex(x-10, y+135 + posOeufY);
    vertex(x+15, y+150 + posOeufY);
    vertex(x-30, y+172 + posOeufY);

    
    endShape();


    if (casse == true) {
      if ((mousePressed) && ( compteuretatOeuf == 4)) {
        compteuretatOeuf = 5;
      }
    }

    if ((compteuretatOeuf == 5)) {
      posOeufY = posOeufY * 1.1;
    }

    if ((posOeufY > 500) ) {
      targetX = 0;
      bougerbras();
    }
  }
}


//////////////////////////////////////////////////////////////////
//fait bouger les parties du monstre
void bouger() {

  //bouger les flagels
  vitesseFlagel = vitesseFlagel + 0.8; // determine la vitesse du flagel
  vertexP1X = cos( vitesseFlagel ) * etenduMouvement + centre; // permet le mouvement aller retour du flagel
  vertexP2X = -vertexP1X; // inverse le mouvement

  //bouger les yeux avec la souris
  posOeuilX = (mouseX - height/2)/ ( height/6 );
  posOeuilY = (mouseY - width/2)/ ( width/6 );
}


/////////////////////////////////////////////////////////////////////
// dessinne le monstre
void monstre() {
  /* les x et y sont les valeurs relatives du monstre.
   le monstre est construit a partir de ses valeurs*/

  //cornes
  noStroke();//enleve les traits
  fill(150);// gris
  quad(x-20, y, x+20, y, x, y-150, x, y-150);
  noStroke();
  fill(150);//gris
  quad(x-20, y, x+20, y, x-50, y-130, x-50, y-130);
  noStroke();
  fill(150);//gris
  quad(x-20, y, x+20, y, x+50, y-130, x+50, y-130);

  //tete
  fill(255, 255, 0);//jaune en RGB
  noStroke();
  ellipse(x, y, 100, 150);//x et y pour les valeurs relatives. l'ellipse représente le centre du monstre

  //bouche
  //corp
  strokeWeight(20);
  fill(0);
  //http://processing.org/learning/curves/
  beginShape();
  curveVertex(x-30, y+25);
  curveVertex(x-30, y+25);
  curveVertex(x, y+30);
  curveVertex(x+30, y+25);
  curveVertex(x+30, y+25);
  endShape();
  strokeWeight(1);

  //support des yeux aux extremités
  //ils ne sont pas fait avec une boucle pour pouvoir les annimmer indépendement
  //oeil bras gauche
  fill(255, 255, 0);//jaune en RGB
  ellipse(x-95, y-5, 40, 40);//support de l'oeuil a l'extremité du bras
  fill(255, 255, 0);
  noStroke();
  rect(x-95, y-10, 50, 10, 100, 100, 100, 100);//bras


  //oeuil bras droit
  fill(255, 255, 0);
  ellipse(x+95, y-5, 40, 40);//support de l'oeuil a l'extremité du bras
  fill(255, 255, 0);
  noStroke();
  rect(x+45, y-10, 50, 10, 100, 100, 100, 100);//bras

  //les yeux
  while (compteur < 195) {//genere les yeux
    // blanc de l'oeuil
    fill(255);
    stroke(0);
    ellipse(x-95+compteur, y-5, 28, 28 / ferme);
    //retine
    //rouge
    fill(255, 0, 0);//rouge en RGB
    noStroke();
    ellipse(x-95+posOeuilX+compteur, y-5+posOeuilY, 20, 20 / ferme);
    //noir
    fill(0);//noir
    ellipse(x-95+posOeuilX+compteur, y-5+posOeuilY, 15, 15 / ferme );
    //reflet
    fill(255);//blanc
    ellipse(x-89+compteur, y-10, 3, 3 / ferme);
    /* le if permet de faire un bond entre les yeux
     accrochés au bras et ceux du milieux*/
    
    if (compteur > 64 && compteur < 100) {// si le compteur est superieur a 64 et en meme temps inferieur a 100
      //yeux du milieux
      compteur = compteur + 30;
    }
    else {//si la condition précédente n'est pas respectée alors
      //yeux des extremités
      compteur = compteur + 65;
    }
  }
  compteur = 0;// remise a zero pour que les dents reapparaissent sur les frames suivantes


  //flagel
  //1
  //base
  noStroke();
  fill(255, 255, 0);
  ellipse(x, y+70, 30, 30);
  //corp
  strokeWeight(10);
  noFill();
  //http://processing.org/learning/curves/
  beginShape();
  stroke(255, 255, 0);
  curveVertex(x, y+70);
  curveVertex(x, y+70);
  curveVertex(x+vertexP1X, y+100);
  curveVertex(x+vertexP2X, y+120);
  curveVertex(x+vertexP1X, y+140);
  curveVertex(x, y+140);
  endShape();
  strokeWeight(1);
  //2
  //base
  noStroke();
  fill(255, 255, 0);
  ellipse(x+30, y+60, 30, 30);
  //corp
  strokeWeight(10);
  noFill();
  //http://processing.org/learning/curves/
  beginShape();
  stroke(255, 255, 0);
  curveVertex(x+20, y+50);
  curveVertex(x+20, y+50);
  curveVertex(x+45+vertexP2X, y+80);
  curveVertex(x+50-10+vertexP1X, y+100);
  curveVertex(x+55+vertexP2X, y+140);
  curveVertex(x+60, y+140);
  endShape();
  strokeWeight(1);
  //3
  //base
  noStroke();
  fill(255, 255, 0);
  ellipse(x-30, y+60, 30, 30);
  //corp
  strokeWeight(10);
  noFill();
  //http://processing.org/learning/curves/
  beginShape();
  stroke(255, 255, 0);
  curveVertex(x-20, y+50);
  curveVertex(x-20, y+50);
  curveVertex(x-45+vertexP2X, y+80);
  curveVertex(x-50+vertexP1X, y+100);
  curveVertex(x-55+vertexP2X, y+140);
  curveVertex(x-60, y+140);
  endShape();
  strokeWeight(1);

  //main gauche
  strokeWeight(10);//change l'epaisseur d'un trait
  noFill();
  //http://processing.org/learning/curves/
  beginShape();
  stroke(255, 255, 0);
  curveVertex(x-50, y+20);
  curveVertex(x-50, y+20);
  curveVertex(x-70+posBrasGX, y+20+posBrasGY);
  curveVertex(x-90+posBrasGX, y+25+posBrasGY);
  curveVertex(x-110+posBrasGX, y+20+posBrasGY);
  curveVertex(x-110+posBrasGX, y+20+posBrasGY);
  endShape();
  line(x-110+posBrasGX, y+20+posBrasGY, x-120+posBrasGX, y+30+posBrasGY);
  line(x-110+posBrasGX, y+20+posBrasGY, x-130+posBrasGX, y+15+posBrasGY);
  line(x-110+posBrasGX, y+20+posBrasGY, x-120+posBrasGX, y+0+posBrasGY);
  //main droite
  strokeWeight(10);
  noFill();
  //http://processing.org/learning/curves/
  beginShape();
  stroke(255, 255, 0);
  curveVertex(x+50, y+20);
  curveVertex(x+50, y+20);
  curveVertex(x+70+posBrasDX, y+20+posBrasDY);
  curveVertex(x+90+posBrasDX, y+25+posBrasDY);
  curveVertex(x+110+posBrasDX, y+20+posBrasDY);
  curveVertex(x+110+posBrasDX, y+20+posBrasDY);
  endShape();
  line(x+110+posBrasDX, y+20+posBrasDY, x+120+posBrasDX, y+30+posBrasDY);
  line(x+110+posBrasDX, y+20+posBrasDY, x+130+posBrasDX, y+15+posBrasDY);
  line(x+110+posBrasDX, y+20+posBrasDY, x+120+posBrasDX, y+0+posBrasDY);
  strokeWeight(1);// remise a la valeur par défaut

  // dents
  while (compteur < 50) {//genere les dents
    fill(255);
    stroke(0);
    triangle( x-15 + compteur, y+25, x-25+compteur, y+25, x-20+compteur, y+35);
    compteur= compteur +10;
  }
  compteur = 0;// remise a zero pour que les dents reapparaissent sur les frames suivantes
}

void mouseReleased() {
  if (compteuretatOeuf==1) {
    compteuretatOeuf=2;
  }

  if (compteuretatOeuf==3) {
    compteuretatOeuf=4;
  }
}

void slap() {


  // detection Bas Droite  
  float gaucheBD = x ;
  float droiteBD = x + 100;
  float hautBD = y;
  float basBD = y + 100;
  if ( mouseX-200 > gaucheBD && mouseX-200 < droiteBD && mouseY-200 > hautBD && mouseY-200 < basBD ) {
    // le point est dans le rectangle
    fill(255, 200);
    slapBasDroite = true;
  } 
  else {
    fill(0, 200);
  }
  /*rect(x, y, 100, 150);*/

  // detection Bas gauche
  float gaucheBG = x - 100 ;
  float droiteBG = x -100 + 100;
  float hautBG = y;
  float basBG = y + 100;
  if ( mouseX-200> gaucheBG && mouseX-200 < droiteBG && mouseY > hautBG && mouseY < basBG ) {
    // le point est dans le rectangle
    fill(255, 200);
    slapBasGauche = true;
  } 
  else {
    fill(0, 200);
  }
  /*rect(x-100, y, 100, 150);*/


  // detection haut gauche
  float gaucheHG = x - 100 ;
  float droiteHG = x -100 + 100;
  float hautHG = y - 100;
  float basHG = y - 100 + 100;
  if ( mouseX-200 > gaucheHG && mouseX-200 < droiteHG && mouseY-200 > hautHG && mouseY-200 < basHG ) {
    // le point est dans le rectangle
    fill(255, 200);
    slapHautGauche = true;
  } 
  else {
    fill(0, 200);
  }
  /*rect(x-100, y -150, 100, 150);*/


  // detection haut droite
  float gaucheHD = x ;
  float droiteHD = x + 100;
  float hautHD = y - 100;
  float basHD = y - 100 + 100;
  if ( mouseX-200 > gaucheHD && mouseX-200 < droiteHD && mouseY-200 > hautHD && mouseY-200 < basHD ) {
    // le point est dans le rectangle
    fill(255, 200);
    slapHautDroit = true;
  } 
  else {
    fill(0, 200);
  }
  /*rect(x , y -150, 100, 150);*/
  velSlap = false;
}


void vel() {
  if ( ((mouseX ) > ( pmouseX + 20 )) || (( mouseY ) > ( pmouseY + 20 )))  {
    velSlap = true;
  }

  if ( ((mouseX ) < ( pmouseX - 20 )) || (( mouseY ) < ( pmouseY - 20 ))) {
    velSlap = true;
  }
}

///////////////////////////////////////////////////////////////
// inclu le compteur et les traits de cassure
void casserOeuf() {
  //zone de detection sur l'oeuf en forme de cercle
  float distanceOeuf = dist( mouseX-200, mouseY-200, 0, 0 );
  if ( distanceOeuf < 150 ) {
    // le point est dans le cercle
    fill(255);
    casse = true;
  } 
  else {
    fill(0);
    casse = false;
  }       

  //ellipseMode(CENTER);
  //ellipse( 0 , 0 , 150 * 2 , 150 * 2);
}

void minuterie() {


  //permet de fermer les yeux
  //http://wiki.t-o-f.info/Processing/Minuterie
  if ( (millis() - timeStamp >= interval) ) {
    timeStamp = timeStamp + interval;
    etatOeuil = etatOeuil * -1;
    fill(0);
  }

  if (compteuretatOeuf == 7) {
    //oeuil fermé pendant 0.1 secondes si etat 1
    if ( etatOeuil == 1) {
      ferme = 100;
      interval = 100;
    }

    //oeuil ouvert pendant 5 secondes si etat -1
    if ( etatOeuil == -1) {
      ferme = 1;
      interval = 5000;
    }
  }
}


/////////////////////////////////////////////////////////////////////
// void qui gere le mouvement des bras
void bougerbras() {

  // mouvement progressif quand il se reveille et quand il est slap
  compteuretatOeuf = 7;
  ferme = 1;
  posBrasDY = posBrasGY;
  //http://wiki.t-o-f.info/Processing/Assouplissement
  float k = 0.5;// amplitude
  float d = 0.7;// vitesse d'assouplissement
  float accel = k * (targetX - posBrasGY);// assouplissement
  v3 = d * (v3 + accel);       
  posBrasGY = posBrasGY + v3;
}

void reactionSlap() {
  if ( slapHautGauche == true) {
    slapHautDroit = false;
    slapBasGauche = false;
    slapBasDroite = false;
    rotate(rotMonstre);
    
    if ( rotMonstre < 360) {
      rotMonstre = rotMonstre + 10;
    }
    else {
      rotMonstre = 0;

      slapHautGauche = false;
      slapBasDroite = false;
    }
  }
  //bas droit
  if (slapBasDroite == true) {
    rotate(rotMonstre);
    if ( rotMonstre < 360) {
      rotMonstre = rotMonstre + 10;
    }
    else {
      rotMonstre = 0;

      slapHautGauche = false;
      slapBasDroite = false;
    }
  }
  // bas gauche
  if ( slapBasGauche == true ) {
    rotate(rotMonstre);
    slapHautDroit = false;
    slapHautGauche = false;
    slapBasDroite = false;
    if ( rotMonstre > - 360) {
      rotMonstre = rotMonstre - 10;
    }
    else {
      rotMonstre = 0;

      slapBasGauche = false;
      slapHautDroit = false;
    }
  }
  //haut droit
  if ( slapHautDroit == true ) {
    slapBasGauche = false;
    slapHautGauche = false;
    slapBasDroite = false;
    rotate(rotMonstre);
    if ( rotMonstre > - 360) {
      rotMonstre = rotMonstre - 10;
    }
    else {
      rotMonstre = 0; 

      slapBasGauche = false;
      slapHautDroit = false;
    }
  }
  // bouger les bras quand il est tappé
  if (  slapHautDroit == true || slapBasGauche == true || slapBasDroite == true || slapHautGauche == true) {
    targetX = 20; 
    bougerbras();
    ferme = 100;
  }
}

void carresse(){
   if(velSlap == false && mousePressed && (slapHautDroit == true || slapBasGauche == true || slapBasDroite == true || slapHautGauche == true)){
     
        float oscOffset = 0.3; // radians
        float oscCounter = 0.11 * frameCount;
        float oscCenter = x;
        float oscRadius = 10;

        y = cos( oscCounter + oscOffset ) * oscRadius + oscCenter;

        
   }

     
  
}
