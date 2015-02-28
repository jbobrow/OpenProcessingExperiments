
/************************
 Monstre interactif
 Par Simon Gauthier
 UQAM 2012    EDM4600
*************************/

// Sources des inspirations et des exemples utilisés sont de provenance de Thomas O. Fredericks à l'adresse www.openprocessing.org/classroom/1228


//déclaration des variables
float x = 0; //implentation de l'origine au coin supérieur gauche
float y = 0; //implentation de l'origine au coin supérieur gauche

/////yeux
float yeuxblancgauchex = 248 ;
float yeuxblancgauchey = 130 ;
float yeuxblancgauchew = 75 ;
float yeuxblancgaucheh = 63 ;
float yeuxblancdroitx = 300 ;
float yeuxblancdroity = 140 ;
float yeuxblancdroitw = 30 ;
float yeuxblancdroith = 30 ;
float pupillew = 3;
float pupilleh = 3;

////////langue
float etatL; // langue état
float targetX; //assouplissement langue
float targetY; //assouplissement langue
float xlangue;
float ylangue;

//// assouplissement gazon pousse
float vitesse;
float courante = 350;
float cible = 275;
float K = 0.06; //parametre d'élasticité
float d = 0.9; //2e parametre d'élasticité

//////assouplissement gazon réduit
float vitesse2;
float courante2 = 275;
float cible2 = 350;
float K2 = 0.01; //parametre d'élasticité
float d2 = 0.9; //2e parametre d'élasticité

float etatG; //état gazon

/////////assouplissement gazon
float couranteBG;
float cibleeBG;
float vitesseBG;
float kBG = 0.1;
float dBG = 0.9;





//Création de l'environnement
void setup() { 
  size(400, 400);
  smooth();
  
}


void draw() {

  // background change
  if ( random(100) < 1 ) {
    cibleeBG = random(50, 70);
  }
  vitesseBG = dBG * (vitesseBG + kBG * (cibleeBG - couranteBG));
  couranteBG = couranteBG + vitesseBG;
  background (constrain (couranteBG, 50, 70)); //couleur arrière plan: gris



  //ellipse (187, 210, 54, 54); /////// placement de la zone interactive ellipse
  //rect (0, 350, 400, 400); ///////////plassement de la zone interactive rectangulaire





  gazon();
  masque();
  corpMonstre();
  brasMonstre();
  yeuxDuMonstreGauche();
  yeuxDuMonstreDroit();

  if (etatL == 1) { //état logique pour la langue
    langueMonstreGrande();
  } 
  else {
    langueMonstrePetite();
  }

  if (mousePressed && mouseX > 0 && mouseX < 400 && mouseY > 350 && mouseY < 400 ) { //état logique pour le gazon
    assouplissement();
  } 
  else {
    assouplissement2();
  }
}


void gazon() { //gazon

    stroke(50, 100, 20); //vert
  int z = 0; // initialisation
  while ( z < width ) { // tant que Z est plus petit que la largeur
    line(z, y+ courante, z, width); // barreaux 
    strokeWeight(3); // grosseur des barreaux
    z = z + 4; // incrementation
  }
}


void corpMonstre() { //corps du monstre

    fill(155, 156, 2); //RVB
  noStroke();
  beginShape();
  curveVertex(x+39+90, y+157);
  curveVertex(x+39+90, y+157);
  curveVertex(x+41+90, y+195);
  curveVertex(x+53+90, y+220);
  curveVertex(x+70+90, y+241);
  curveVertex(x+85+90, y+253);
  curveVertex(x+111+90, y+263);
  curveVertex(x+138+90, y+267);
  curveVertex(x+172+90, y+270);
  curveVertex(x+207+90, y+266);
  curveVertex(x+232+90, y+261);
  curveVertex(x+255+90, y+244);
  curveVertex(x+264+90, y+227);
  curveVertex(x+243+90, y+227);
  curveVertex(x+229+90, y+237);
  curveVertex(x+216+90, y+242);
  curveVertex(x+205+90, y+241);
  curveVertex(x+171+90, y+252);
  curveVertex(x+118+90, y+251);
  curveVertex(x+68+90, y+226);
  curveVertex(x+59+90, y+163);
  curveVertex(x+77+90, y+178);
  curveVertex(x+96+90, y+172);
  curveVertex(x+114+90, y+179);
  curveVertex(x+140+90, y+172);
  curveVertex(x+157+90, y+185);
  curveVertex(x+207+90, y+170);
  curveVertex(x+227+90, y+187);
  curveVertex(x+250+90, y+159);
  curveVertex(x+238+90, y+133);
  curveVertex(x+216+90, y+117);
  curveVertex(x+173+90, y+104);
  curveVertex(x+94+90, y+110);
  curveVertex(x+39+90, y+157);
  curveVertex(x+94+90, y+265);
  endShape();
}

void brasMonstre() { //bras du monstre
  beginShape();
  curveVertex(x+21, y+207.0);
  curveVertex(x+23, y+210.0);
  curveVertex(x+30, y+214.0);
  curveVertex(x+133, y+195.0);
  curveVertex(x+133, y+200.0);
  curveVertex(x+31, y+216.0);
  curveVertex(x+13, y+220.0);
  curveVertex(x+7, y+206.0);
  curveVertex(x+15, y+212.0);
  curveVertex(x+16, y+194.0);
  curveVertex(x+21, y+205.0);
  curveVertex(x+22, y+206.0);
  endShape();
}

void langueMonstrePetite() { //langue du monstre petite
  noStroke();
  fill(155, 10, 25);
  beginShape();
  curveVertex(x+175, y+235.0-23);
  curveVertex(x+159, y+251.0-23);
  curveVertex(x+180, y+220.0-23);
  curveVertex(x+195, y+212.0-23);
  curveVertex(x+204, y+215.0-23);
  curveVertex(x+195, y+231.0-23);
  curveVertex(x+175, y+235.0-23);
  curveVertex(x+159, y+251.0-23);
  curveVertex(x+191, y+215.0-23);
  endShape();
}




void mousePressed() { 
  

  float distance = dist( mouseX, mouseY, 187, 210);
  if (distance < 27) { //action pour la langue
    if (etatL == 0) {
      etatL = 1;
    }
  }
  else {
    etatL = 0;
  }


}


void mouseReleased() { //état lors de la relache du clic de la souris
  if (etatL == 0) {
    etatL = 0;
  }
  else {
    etatL = 0;
  }
  
  if(etatG == 1){
   
  }
  
}

void langueMonstreGrande() { //langue du monstre Grande
  noStroke();
  fill(155, 10, 25);
  beginShape();
  curveVertex(183.0, 218.0);
  curveVertex(158.0, 226.0);
  curveVertex(195.0, 216.0);
  curveVertex(361.0, 187.0);
  curveVertex(389.0, 198.0);
  curveVertex(355.0, 213.0);
  curveVertex(199.0, 227.0);
  curveVertex(157.0, 227.0);
  curveVertex(142.0, 259.0);
  endShape();
}

void yeuxDuMonstreGauche() {  //yeux du monstre gauche

    stroke(1);
  strokeWeight(1);

  fill(256, 256, 256);
  ellipse(yeuxblancgauchex, yeuxblancgauchey, yeuxblancgauchew, yeuxblancgaucheh); //blanc des yeux gauche

  float radians = atan2(mouseY-yeuxblancgauchey, mouseX-yeuxblancgauchex);
  float distance = dist(mouseX, mouseY, yeuxblancgauchex, yeuxblancgauchey);

  float distanceW = constrain(distance, 0, yeuxblancgauchew/2 - 10 - pupillew/2);
  float distanceH = constrain(distance, 0, yeuxblancgaucheh/2- 10 - pupilleh/2);

  float pupilleX = cos(radians)* distanceW + yeuxblancgauchex;
  float pupilleY = sin(radians)* distanceH + yeuxblancgauchey;

  fill(0, 0, 0);
  ellipse(pupilleX, pupilleY, pupillew, pupilleh); //pupille gauche
}




void yeuxDuMonstreDroit() { //yeux du monstre droit

    stroke(1);
  strokeWeight(1);

  fill(256, 256, 256);
  ellipse(yeuxblancdroitx, yeuxblancdroity, yeuxblancdroitw, yeuxblancdroith); //blanc des yeux droit

  float radians = atan2(mouseY-yeuxblancdroity, mouseX-yeuxblancdroitx);
  float distance = dist(mouseX, mouseY, yeuxblancgauchex, yeuxblancgauchey);

  float distanceW = constrain(distance, 0, yeuxblancdroitw/2 - 5 - pupillew/2);
  float distanceH = constrain(distance, 0, yeuxblancdroith/2- 5 - pupilleh/2);

  float pupilleX = cos(radians)* distanceW + yeuxblancdroitx;
  float pupilleY = sin(radians)* distanceH + yeuxblancdroity;


  fill(0, 0, 0);
  ellipse(pupilleX, pupilleY, pupillew, pupilleh); //pupille droit
}


// assouplissement
void assouplissement() {

  vitesse = d * (vitesse + K * (cible - courante));
  courante = courante + vitesse;
}

void assouplissement2() {

  vitesse2 = d2 * (vitesse2 + K2 * (cible2 - courante));
  courante = courante + vitesse2;
}

//pour masquer le gazon derrière le monstre
void masque(){
  noStroke();
  fill(constrain (couranteBG, 50, 70));
ellipse (240, 169, 200, 200);
}


// SG 2012
