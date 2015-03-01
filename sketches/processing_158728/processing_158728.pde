
// Credits:
// Réalisé par Louis-Philippe Bell 
// Création pour le mois d'août du Recueil Perpétuel, du collectif Pourquoi jamais: http://www.pourquoijamais.com/blogue_compulsif/recueil_perpetuel
// Les images d'archives proviennent des Archives de la ville de Montréal: http://ville.montreal.qc.ca/portal/page?_pageid=5677,32261565&_dad=portal&_schema=PORTAL
// Les images récentes proviennent de Google Street View.
// Merci à Thomas Ouellet Fredericks pour son site http://wiki.t-o-f.info/Processing/Processing.
// Et à Amélie-Myriam Plante pour le partage de sa passion de l'urbanisme.


//loading des images pour le web (Avec ce code, la page attent d'avoir loader pour lancer le code)
/* @pjs preload="SteCathStLo2012.jpg,SteCathStLo2007.jpg,SteCathStLo1914.jpg";*/

//Déclarations des variables
//Variables des images à loader
int nbImageNew=2; //Nombre d'images récentes.
int nbImageOld=1; //Nombre d'images anciennes.
PImage[] img = new PImage[nbImageNew+nbImageOld]; // Création du'un tableau d'images(Array). Le nombre d'image est de [5].
color[] imageHackWeb;//car pour le web, on ne peut pas écrire dans une image. :_(
int lengthPixels; //grandeur de l'image
boolean finLoading=false;
int frameLoaded=0;

//Variable de gestion des années
int[] annee = new int[nbImageNew+nbImageOld+1]; //Création d'un tablea pour les annéee, aurait pu être un dictionnaire.
int anneeDebut, anneeCourante, indexCible, anneeDiff, anneeCible; //
int fin=1850;//année de fin, ou l'image fini.

//Variable de la logique d'années.
boolean pause=false; //Pour faire pause avec la sourie.
int baseParAn=6;//Nb de step par année.
int nbStepParAn2=baseParAn;//Nb de step par année.

//Variable pour écrire.
PFont myFont;//Loading de la police d'écriture.
boolean ecrireAnnee=false;//Pour écrire selon l'année.

//Variable pour le noise des images
int[] renduModif; //Image de buffer des modifications.
int[][] renduBlurAll; 
float[]compCourt;//Compile les changements courts, d'année en année.
int triche64bit=127;// code il faut faire un différence, et que la couleur ARGB n'est pas signé (+/-), pour pas perdre le sige, il faudrait utiliser un "longColor" mais on peut tricher en ajoutant 127. don 126=-1 et 128=1
boolean imageHackWebShow=false;
// Variable pour le blur des changements rapides.
color[] renduBlur; //Image de buffer du flou des modifications.
float assoupFacteur;//Valeur de l'assouplissement du fade entre les images et le noise.


void setup() {
  size(584,584);// pour le web, le setup doit ^çetre hard codé
  lengthPixels=584*584; //Résulution de l'image.
  //Initialisation du loading l'image.
  
  img[0] = loadImage("SteCathStLo2012.jpg");
  img[1] = loadImage("SteCathStLo2007.jpg");
  img[2] = loadImage("SteCathStLo1914.jpg");
  // img[img.length-1] = createImage(img[0].width, img[0].height, RGB); //La dernière image est pour accumuler les différences entre les images voir ImageHackWeb

  // La grandeur du sketch est celui de la première image. Toute les image doivent avoir la même résolutiuon
  choixAnneePrint(); //Lancement de ces fonctions de contrôle une première fois avant le draw.
  choixIndexCible(); //Lancement de ces fonctions de contrôle une première fois avant le draw.

  //Initialisation des années des images.
  annee[0] = 2012;
  annee[1] = 2007;
  annee[2] = 1914;
  annee[3] = fin; //la dernière année, c'est la fin.

  //Initialisation de la logique d'années.
  anneeDebut=annee[0]; //l'année du début, pour éviter de toujours appeler annee[0]
  anneeCourante=anneeDebut+5; //année qui donne le temps "présent". On commence 2 avant la première image.
  anneeDiff=0;// initialisation, pour éviter un zéro //anneeDiff, c'Est le nombre d'année entre l'année courant et l'année cible.
  anneeCible=anneeDebut; // initialisation, pour éviter un zéro //l'année vbers laquelle on tend.
  indexCible=0;// initialisation, pour éviter un zéro. indexCible est l'index de l'image vers laquelle on tend.

  //Loading de la police d'écritrure. Important pour éviter un lag lors de la première écriture.
  myFont = loadFont("LinLibertineB-80.vlw");

  //Initialisation pour le noise et le blur des images
  renduModif=new color[lengthPixels]; 
  renduBlur=new color[lengthPixels]; 
  imageHackWeb=new color[lengthPixels]; 
  compCourt = new float[lengthPixels]; // décraration du tableau des différences entre les images pour les changements rapides, d'année en année.
  for (int j=0; j<lengthPixels;j++) { // initialisation.
    compCourt[j]=0;
  }

  // Calcul de comparaison entre les images pour les changements. 
  float[][] calculCourt = new float[nbImageNew+nbImageOld][lengthPixels]; //variable du calcul de la comparaison entre chaque image et ses pixels. //variable déclaré ici et locale au setup.
  for (int i=0;i<img.length-2;i++) { // Boucle, qui lira tant que la condition n'est pas fini le code. (Ici, comme on veut comparer 1 et 2, 2 et 3, on doit réduire le nbImageNew de 1.) length-2, c'Est pour pas prendre en compte la dernière img qui est le résultat
    img[i].loadPixels(); //ouvre l'accès aux pixels pour lire et écrire dans l'image. // pour avoir la différence en 1 et 2
    img[i+1].loadPixels();//ouvre l'accès aux pixels pour lire et écrire dans l'image. 
    for (int j=0; j<lengthPixels;j++) { //parcour tout les pixels de l'image
      calculCourt[i][j]=bitShiftDiff(img[i].pixels[j], img[i+1].pixels[j]);//appelle une focntion qui fait la différence entre chaque pixel [j] de chaque image [i]
    }
  }

  //Cacul Pour additionner la comparaison et mettre celle-ci dans la dernière image.
  for (int j=0; j<lengthPixels;j++) {//Parcours tous les pixels
    for (int i=0;i<img.length-1;i++) {//Parcours toutes les images
      compCourt[j]=compCourt[j]+calculCourt[i][j];//additione chaque pixel [j] de chaque image [i]
    }
    compCourt[j]=compCourt[j]/float(max(img.length, 1)); //lorsque toutes les images sont parcouru, divise le tout par le nombre d'image //comCour servira de guide au Noise
    imageHackWeb[j]=color(compCourt[j]);
  }


  //Préparation des série de blur pour gagner du frameRate
  renduBlurAll = new int[10][lengthPixels];
  for (int i=0; i<renduBlurAll.length;i++) { //Préremplis 10 tableau de blur, car c'Est un processus lourd
    for (int j=0+3; j<lengthPixels-3;j++) { // parcours tous les pixels. suaf 0 et 1 pour éviter un array out of bound
      if (j%5==i%4) {
        int jmoins3=bitShiftRandom(compCourt[j-3]);
        int jmoins2=bitShiftRandom(compCourt[j-2]);
        int jmoins1=bitShiftRandom(compCourt[j-1]);
        int jegal=bitShiftRandom(compCourt[j]);
        int jplus1=bitShiftRandom(compCourt[j+1]);
        int jplus2=bitShiftRandom(compCourt[j+2]);
        int jplus3=bitShiftRandom(compCourt[j+3]);
        int jMoy=bitShiftBlur7(jmoins3, jmoins2, jmoins1, jegal, jplus1, jplus2, jplus3); //calcul de moyenne.
        //    renduBlurAll[i][j-3]=color(155);
        renduBlurAll[i][j-2]=jMoy;
        renduBlurAll[i][j-1]=jMoy;
        renduBlurAll[i][j]=jMoy;
        renduBlurAll[i][j+1]=jMoy;
        renduBlurAll[i][j+2]=jMoy;
        // renduBlurAll[i][j+3]=color(155);
      }
    }
  }
}

void draw() {
  //frameRate(2);
  if (!pause) { //Si l'image n'est pas sur pause.
    choixAnneePrint(); // choisi quand l'année de l'image doit être imprimé.
    choixIndexCible(); //Permet de choisir l'année de cible.
    anneeDiff=(anneeCourante)-(anneeCible); //fait le décompte avec le prochain changement.

    loadPixels(); //ouvre l'accès aux pixels de l'image du frame précédent.

    assoupFacteur=pow(anneeDiff+1.5, -0.9)/(baseParAn)*2; //calcul du facteur d'assouplissement (le fade) entre le noise et l'image cible
    //  println( "anneeCourante:"+anneeCourante+"  anneeCible:"+anneeCible+"  indexCible:" + indexCible + "  anneeDiff:"+anneeDiff+ " assoupFacteur:" + assoupFacteur); //debug

    int choixBlur=int(random(0, 10)); //choix du blur prérendu
    if (imageHackWebShow) {//si c'Est la dernière année
      for (int j=0; j<lengthPixels;j++) { // parcours tous les pixels.
        pixels[j]=assouplissement(additionModif(pixels[j], renduBlurAll[choixBlur][j]), imageHackWeb[j]); //appelle la fonction qui fait le merge entre l'image précédent, le noise, l'image cible.
      }
    }    
    else {//sinon
      for (int j=0; j<lengthPixels;j++) { // parcours tous les pixels.
        pixels[j]=assouplissement(additionModif(pixels[j], renduBlurAll[choixBlur][j]), img[indexCible].pixels[j]);
      }
    }

    updatePixels(); // Permet d'enregistrer les changements dans le buffer de la carte graphique pour l'imprimer.

    if (ecrireAnnee) { //On doit écrire l'année après l'impression de la photo modifié.
      fill(255); //Choix de la couleurs.
      textFont(myFont, 60); //Choix de la grandeur.
      text(anneeCourante, 20, img[0].height-20); //Ériture en bas à gauche.
      ecrireAnnee=false; //On désactive l'écriture. Le calcul de si on doit écrire ce fait ailleurs.
    }

    if (frameCount%nbStepParAn2==0) {//Si on a fini le nombre de steps par année.
      anneeCourante--; //on réduit de une année.
    } 

    if (anneeCourante<fin) { //Si on a atteint la fin
      anneeCourante=anneeDebut+20; // On recommence au début, plus 20 années, pour faire une transition. Simple et efficace.
      anneeCible=anneeDebut; // l'année cible devient celle du début
      indexCible=0; // l'index cible devient celle du début
      imageHackWebShow=false;
    }
  }
  //debugText();
  // println("frameRate:"+frameRate);
}
void debugText() {
  textFont(myFont, 12); 
  fill(155);
  rect(375, 475, 300, 150);
  fill(255, 0, 0);
  text("anneeCourante:"+anneeCourante, 400, 500);
  text("FIN LOAD:"+finLoading+"  frameLoaded"+frameLoaded, 400, 550); //Ériture en bas à gauche.
  text("frameRate:"+frameRate, 400, 575); //Ériture en bas à gauche.
  text("frameCount:"+frameCount, 400, 600); //Ériture en bas à gauche.
}

void mousePressed() {
  if (pause) { //permet de faire une pause de changement d'image
    pause=false;
  }
  else {
    pause=true;
  }
}

void choixIndexCible() {//fonction qui gère les année et les images à afficher.  

  for (int i=0;i<annee.length;i++) { //Fait le tour de l'array d'année des photos.
    if (annee[i]==anneeCourante+1) {// Vérifie si c'est l'année suivante est l'année d'une photo.
      if (annee[i]==annee[img.length-1]) {//Si on atteint la dernière image
        imageHackWebShow=true;
        indexCible=i; //on ne change pas la prochaine image à montrer (Comme l'image est dans un array, c'est un index qu'on change)
        anneeCible=annee[constrain(i+1, 0, annee.length-1)]; //l'année cible devient la fin
      }
      else { //si ce n'est pas la dernière image
        imageHackWebShow=false;
        indexCible=constrain(i+1, 0, img.length-1); //on change l'index pour celui de la prochaine image à montrer
        anneeCible=annee[constrain(i+1, 0, annee.length-1)]; //l'année cible devient l'année de la prochaine image
      }
      break;  //arrête l'exécution de la boucle for.
    }
  }
}

void choixAnneePrint() {//fonction qui gère les année et les images à afficher.  
  boolean anneeLongue=false;
  for (int i=0;i<annee.length;i++) { //Fait le tour de l'array d'année des photos.
    if (annee[i]==anneeCourante) {   // Vérifie si c'est l'année suivante est l'année d'une photo.
      anneeLongue=true;
      if (annee[i]==annee[annee.length-1]) {//Si on atteint la dernière image
        // on n'imprime pas
      }
      else { //si ce n'est pas la dernière image
        ecrireAnnee=true; //Comme c'est une année de photo, on active l'écriture de l'année courante.
      }
    }
  }
  nbStepParAn2=baseParAn;
  if (anneeLongue) { //bug ici lorsque 2 années ce suivent..
    nbStepParAn2=baseParAn*3;
  }
}


int bitShiftBlur7(int _argb1, int _arbg2, int _arbg3, int _arbg4, int _arbg5, int _arbg6, int _arbg7) { //cacul de la différence entre l'image 1 et l'image 2. Noter qu'on retourne un float et non une couleur.

  // Using "right shift" as a faster technique than red(), green(), and blue()
  // decomposition
  int r1 = (_argb1 >> 16) & 0xFF;  
  int g1 = (_argb1 >> 8) & 0xFF;   
  int b1 = _argb1 & 0xFF;     

  int r2 = (_arbg2 >> 16) & 0xFF;  
  int g2 = (_arbg2 >> 8) & 0xFF;   
  int b2 = _arbg2 & 0xFF; 

  int r3 = (_arbg3 >> 16) & 0xFF;  
  int g3 = (_arbg3 >> 8) & 0xFF;   
  int b3 = _arbg3 & 0xFF; 

  int r4 = (_arbg4 >> 16) & 0xFF;  
  int g4 = (_arbg4 >> 8) & 0xFF;   
  int b4 = _arbg4 & 0xFF; 

  int r5 = (_arbg5 >> 16) & 0xFF;  
  int g5 = (_arbg5 >> 8) & 0xFF;   
  int b5 = _arbg5 & 0xFF; 

  int r6 = (_arbg6 >> 16) & 0xFF;  
  int g6 = (_arbg6 >> 8) & 0xFF;   
  int b6 = _arbg6 & 0xFF; 

  int r7 = (_arbg7 >> 16) & 0xFF;  
  int g7 = (_arbg7 >> 8) & 0xFF;   
  int b7 = _arbg7 & 0xFF; 

  //calcul. Le abs doit être fait sur chacune des valeurs, et non pas sur l'ensemble du nombre.
  int aD=255;
  int rD = constrain((r1+r2+r3+r4+r5+r6+r7)/7, 0, 255); //calcul de moyenne
  int gD = constrain((g1+g2+g3+g4+g5+g6+g7)/7, 0, 255);
  int bD = constrain((b1+b2+b3+b4+b5+b6+b7)/7, 0, 255);//constrain s'assure de rester dans le range 0-255

    // recomposition
  aD = aD << 24; 
  rD = rD << 16; 
  gD = gD << 8; 

  int argbDiff = aD | rD | gD | bD; // Addition les série de 8 bits dans un 32 bits.
  return argbDiff;
}

float bitShiftDiff(color _argb1, color _arbg2) { //cacul de la différence entre l'image 1 et l'image 2. Noter qu'on retourne un float et non une couleur.

  // Using "right shift" as a faster technique than red(), green(), and blue()
  // decomposition
  int r1 = (_argb1 >> 16) & 0xFF;  
  int g1 = (_argb1 >> 8) & 0xFF;   
  int b1 = _argb1 & 0xFF;     

  int r2 = (_arbg2 >> 16) & 0xFF;  
  int g2 = (_arbg2 >> 8) & 0xFF;   
  int b2 = _arbg2 & 0xFF; 

  //calcul. Le abs doit être fait sur chacune des valeurs, et non pas sur l'ensemble du nombre.
  int aD=255;
  int rD = abs(r1-r2); //calcul de différences
  int gD = abs(g1-g2); //peut oimporte si c'est positif ou négatif, le but dest de savoir si c'est une grosse différence, d'où le abs()
  int bD = abs(b1-b2);
  // on addition kles différences de toute les RBG, car on veut un facteur et non une couleur.
  float returnComp=(rD+gD+bD);

  return returnComp;
}


color bitShiftRandom( float comp) {

  float fCommun=comp*0.3; //facteur pour le random commun entre le R,G,B pour éviter une pixélisation trop évidente
  float fUnique=comp*0.05;//facteur pour le random unique entre le R,G,B pour éviter une uniformité trop grise.
  float randomCommun=random(-fCommun, fCommun); //random commun 

    int aD=255; //pas besoin de l'alpha
  int rD = constrain(round(random(-fUnique, fUnique)+randomCommun)+triche64bit, 50, 205);  // constrain: pour éviter des valeurs qui dépasserai le seuil de la couleur (0-255) et adoucir (55-205)
  int gD = constrain(round(random(-fUnique, fUnique)+randomCommun)+triche64bit, 50, 205);  // round: pour que le random soit juste, car l'arrondissement ce fait habituellement 0.1=1, mais là, il faut 0.49=0 0.5=1
  int bD = constrain(round(random(-fUnique, fUnique)+randomCommun)+triche64bit, 50, 205);//triche64bit car on avait addition 127 pour avoir du négatif sur un 8 bits(valeur de 0à255, sans négatif)

  // recomposition
  aD = aD << 24; 
  rD = rD << 16; 
  gD = gD << 8; 

  color argbDiff = aD | rD | gD | bD; // Addition les série de 8 bits dans un 32 bits.
  return argbDiff;
}

color additionModif(color _oldImg, color _add) { //addition des modifications entre les images

  //int a1 = (_oldImg >> 24) & 0xFF;
  int r1 = (_oldImg >> 16) & 0xFF;  
  int g1 = (_oldImg >> 8) & 0xFF;   
  int b1 = _oldImg & 0xFF;    

  // int aC = (_add >> 24) & 0xFF;
  int rC = (_add >> 16) & 0xFF;  
  int gC = (_add >> 8) & 0xFF;   
  int bC = _add & 0xFF; 


  //calculs
  int aD=255; //pas besoin de l'alpha
  int  rD=constrain(r1+rC-triche64bit, 0, 255);//
  int  gD=constrain(g1+gC-triche64bit, 0, 255);
  int  bD=constrain(b1+bC-triche64bit, 0, 255);

  // recomposition
  aD = aD << 24; 
  rD = rD << 16; 
  gD = gD << 8; 

  color argbDiff = aD | rD | gD | bD; // Addition les série de 8 bits dans un 32 bits.

  return argbDiff;
}


int assouplissement(int colorPres, int colorCible) {//assouplissement entre l'image modifié et l'image cible

    //int a1 = (_oldImg >> 24) & 0xFF;
  int r1 = (colorPres >> 16) & 0xFF;  
  int g1 = (colorPres >> 8) & 0xFF;   
  int b1 = colorPres & 0xFF;    

  // int aC = (_add >> 24) & 0xFF;
  int rC = (colorCible >> 16) & 0xFF;  
  int gC = (colorCible >> 8) & 0xFF;   
  int bC = colorCible & 0xFF; 

  //calculs
  int aD=255; //pas besoin de l'alpha
  int  rD=constrain(round((rC - r1) * assoupFacteur + r1), 0, 255);
  int  gD=constrain(round((gC - g1) * assoupFacteur + g1), 0, 255);
  int  bD=constrain(round((bC - b1) * assoupFacteur + b1), 0, 255);

  // recomposition
  aD = aD << 24; 
  rD = rD << 16; 
  gD = gD << 8; 

  color argbDiff = aD | rD | gD | bD; // Addition les série de 8 bits dans un 32 bits.

  return argbDiff;
}



