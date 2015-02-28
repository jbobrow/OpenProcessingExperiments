
//Déclaration des variables et des tableaux

int x = 0;
int y = 0;
int[] angleTentacle = new int[8];
float[] colorTentacle = new float[8];
int direction = -1;
int vitesse = 1;
int angleWing = 1;
int directionWing = -1;
float vitesseWing = -1;

void setup() { //Exécuté une seule fois au démarrage
  size(400, 400);
  frameRate(30);
  smooth();
  randomSeed(0); //garde les mêmes valeurs de couleurs qui ont jadis été random pour les tentacules
  //Détermine l'angle des tentacules (on ne le veut qu'une seule fois par tentacule)
  for (int i = 0; i <= 6; i++) {
    angleTentacle[i] = 30 - i*8; //angle entre -30 et 30 qui augmente pour chaque tentacule
    colorTentacle[i] = random(0, 25); //sert à mettre les couleurs des tentacules dans un ordre random une fois (sera utilisé dans draw)
  }
}


void draw() { //Exécuté un nombre de fois x par seconde, défini par frameRate dans le setup
  background(127);
  pushMatrix();
  translate(x+width/2, y+height/2); //monstre commence au centre du canevas

  //Fait bouger le monstre de haut en bas, change de direction aux points -15 et 0
  y += vitesse*direction; //en ce moment vitesse ne sert à rien, mais je laisse la variable au cas où je voudrais la changer
  
/*Le "if" et son contenu est inspiré de l'exemple à la page 95
du livre "Getting Started with Processing" (http://bookshelf.theopensourcelibrary.org/2010_OReilly_GettingStartedWithProcessing.pdf) */
   if ( y <= -15 || y >= 0) {
    direction = -direction;
  } 
  
  /* Essai de fonction sinus qui ne fonctionne pas pour remplacer la boucle ci-haut pour le vol
  for (float i = 0.0; i <= 5*PI/4; i++); {
    asin(i);
    if (asin(i) < PI/2) {
      y += sin(a);
    } else if (asin(i) > PI) {
      asin(i) = 0; }
      else {
        y-= sin(i);
      }
    } */

  //Tentacules
  for (int i = 0; i <= 6; i++) {
    pushMatrix();
    shapeMode(CENTER);
    translate(x-135+i*35, y+22+i*5); //commence à gauche du montre, puis i*facteur permet de déplacer chaque tentacule à la bonne place
    rotate(radians(angleTentacle[i])); //va chercher les angles du tableau angleTentacule déterminés dans le setup
    fill(92-colorTentacle[i]*2, 29, 85-colorTentacle[i]*0.5); //va chercher les nombres random déterminés dans le setup et les multiplie à des valeurs qui permettent d'avoir des teintes de mauve
    
    // permet d'avoir les tentacules dans un sens ou dans l'autre selon leur emplacement
    if ((i == 3) || (i >= 5)) {
      translate(+70, -12);
      rotate(radians(-15));
      makeTentacle(-1);
    } 
    else {
      makeTentacle(1);
    }
    popMatrix();
  }

  // corps dégradé
  for (float i =0; i<=270; i+= 8) { //i augmente de 0.5 pour un dégradé précis et tracera donc 2*270 bulbes
    noStroke();
    fill(72+i*0.4, 29+i*0.103, 95+i*0.33); //multiplie le i de la couleur d'un facteur équivalent au changement de couleur souhaité pour RGB
    arc(x, y, 270-i, 200-(i*0.74), radians(150), radians(390), 2); //réduit la taille des bulbes p/r à i pour que les derniers x et y ne soient qu'un point
    triangle(x-120+i*.444444444, y+50-i*.185185185, x, y, x+120-i*.444444444, y+50-i*.185185185); //pour le site processing (T_T)
  }

  //bordure corps
  stroke(0);
  strokeWeight(4);
  noFill(); //ne tracera que la bordure
  arc(x, y, 270, 200, radians(150), radians(390), 2); //mêmes dimensions que dégradé (évidemment)
  line(x-116, y+50, x+116, y+50); //pour openprocessing.org (T_______T)

  // Yeux
  // Gros oeil gauche
  makeEye(x-30, y-10, 30); //réfère à la fonction makeEye ci-bas qui contient les coordonnées de la forme, idem ci-bas
  //Gros oeil droit
  makeEye(x+30, y-10, 30); //ne fait que translater la fonction en fonction (hohoho) du besoin
  //Petit oeil gauche
  makeEye(x-60, y-40, 20);
  //Petit oeil droit
  makeEye(x+60, y-40, 20);
  
  //Soucils
  //Gros sourcil gauche
  pushMatrix();
  makeSourcil(x-28,y-12,50,50,240,300);
  popMatrix();
  
  //Gros sourcil droit
  pushMatrix();
  makeSourcil(x+28,y-12,50,50,240,300);
  popMatrix();
  
  //Petit sourcil gauche
  pushMatrix();
  makeSourcil(x-60,y-45,30,30,200,260);
  popMatrix();
  
  //Petit sourcil droit
  pushMatrix();
  makeSourcil(x+60,y-45,30,30,280,340);
  popMatrix();
  
  
  

  //Moustache gauche
  pushMatrix();
  translate(x-145, y-72);
  makeMustache(1); //ces blocs de codes utilisent les fonctions ci-dessous pour tracer les formes, et ne font que la translation au bon endroit. Voir donc ci-bas.
  popMatrix();

  //Moustache droite
  pushMatrix();
  translate(x+145, y-72);
  makeMustache(-1);
  popMatrix();

  //Dent gauche
  pushMatrix();
  translate(x-143, y-87);
  makeTooth();
  popMatrix();

  //Dent droite
  pushMatrix();
  translate(x-55, y-87);
  makeTooth();
  popMatrix();

  //Aile gauche
  pushMatrix();
  translate(x-85, y-90);
  rotate(radians(-angleWing)); //l'angle de rotation est inversé pour l'une des deux ailes, car elles sont en réflexion l'une p/r à l'autre, et angleWing défini pour la rotation plus bas
  translate(x-100, y-70); //déplacer l'axe de rotation vers point en bas à droite
  makeWing(1);
  popMatrix();

  //Aile droite
  pushMatrix();
  translate(x+85, y-90); //point de l'axe de rotation?
  rotate(radians(angleWing));
  translate(x+100, y-70); //point du coin droit de l'aile?
  makeWing(-1);
  popMatrix();

  popMatrix();

  //Rotation des ailes
  angleWing += vitesseWing*directionWing;

  if ( angleWing <= -5 || angleWing >= 10) {
    directionWing = -directionWing; //permet de faire une ascencion et une descente linéaire des angles, et donc que le mouvement soit continu
  } 

  //À enlever à l'affichage, pour afficher la souris en cas de détresse 
  //tiré intégralement de http://wiki.t-o-f.info/Processing/RepérerLaSouris)
  // text(mouseX + " " + mouseY, mouseX + 5, mouseY);
}


//fonction à appeler pour créer la forme de la moustache
void makeMustache(int a) { //le paramètre a décide du sens de la moustache (réflexion p/r à l'axe des y, donc x inversés)
  strokeWeight(5);
  fill(251, 176, 64);
  scale(0.48);
  beginShape();
  curveVertex(a*120.0, 274.0);
  curveVertex(a*163.0, 190.0);
  curveVertex(a*228.0, 182.0);
  curveVertex(a*239.0, 229.0);
  curveVertex(a*214.0, 233.0);
  curveVertex(a*140.0, 233.0);
  curveVertex(a*110.0, 173.0);
  curveVertex(a*159.0, 192.0);
  curveVertex(a*240.0, 116.0);
  endShape();
}

//fonction à appeler pour créer la forme de la dent
void makeTooth() {
  strokeWeight(3);
  fill(255);
  scale(0.6);
  beginShape();
  vertex(139, 228);
  vertex(162, 309);
  vertex(188, 228);
  curveVertex(188, 228);
  curveVertex(188, 228);
  curveVertex(163.5, 215);
  curveVertex(139, 228);
  curveVertex(139, 228);
  endShape(CLOSE);
  
  line(139,228,163,309); //openprocessing gossage
} 

// Définit couleurs par défaut des yeux si aucun paramètre n'est entré pour la couleur quand la fonction est appelée
//Permet donc tracer plusieurs yeux sans devoir réécrire blanc et noir
void makeEye(int a, int b, int radius) {
  makeEye(a, b, radius, 255, 0);
}

// Fonction à appeler pour dessiner un oeil
void makeEye(int a, int b, int radius, color foreground, color background) { //les variables de la fonction sont définis à même celle-ci

  //oeil noir
  fill(0);
  ellipse(a, b, radius, radius);

  //gros reflet blanc
  fill(0);
  strokeWeight(1);
  fill(255);
  ellipse(a-radius*0.03, b-radius*0.2, radius*0.4, radius*0.4);

  //petit reflet blanc
  fill(0);
  strokeWeight(1);
  fill(255);
  ellipse(a+radius*0.166, b-radius*0.1, radius*0.2, radius*0.26);
}

void makeSourcil(int a, int b, int radius1, int radius2, int angle1, int angle2) {
   stroke(2);
  noFill(); 
  arc(a,b,radius1, radius2, radians(angle1),radians(angle2)); 
}

// Fonction à appeler pour dessiner une aile
void makeWing(int a) { //le paramètre a décide du sens de l'aile (réflexion p/r à l'axe des y, donc x inversés)
  strokeWeight(3);
  fill(255);
  beginShape();
  vertex(a*20, 12);
  bezierVertex(a*10, 30, a*15, 45, a*29, 51);
  bezierVertex(a*22, 77, a*64, 81, a*55, 72);
  bezierVertex(a*60, 110, a*95, 75, a*87, 72);
  endShape(CLOSE);
}

// Fonction à appeler pour dessiner une tentacule
void makeTentacle(int a) {
  strokeWeight(3);
  //fill(72, 29,93);
  beginShape();
  vertex(a*49, 7);
  bezierVertex(a*0, 20, a*25, 40, a*22, 38);
  bezierVertex(a*45, 50, a*65, 20, a*67, 56);
  bezierVertex(a*30, 45, a*0, 65, a*16, 72);
  bezierVertex(a*58, 97, a*58, 97, a*58, 97);
  bezierVertex(a*54, 134, a*22, 122, a*38, 128);
  bezierVertex(a*52, 150, a*43, 149, a*52, 150);
  endShape();
}
