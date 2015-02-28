
/** 
 * Athletisme Le Challenge: Le challenge ultime de l'athlète ! Sauter par dessus 60 haies en récoltant le plus de points possible ! Attention, la difficulté augmente à chaque niveau. Rendez-vous jusqu'à votre objectif et passez au niveau suivant. La route pour la victoire vous attend !
 * Comment jouer:
 * Maintenez le bouton de la souris pour charger de la puissance
 * Relâcher pour sauter plus ou moins haut selon la puissance décuplée.
 * Les plus petites haies valent 10 points
 * les haies plus hautes valent 20 points
 * Si vous percuttez : Une petite haie : -10 points
 * Une grande haie: -20 points
 *
 * Par Carl Beaumier. 
 */

/* -------------------------------------------------------------------------- 
 Athletisme Le Challenge:  
 Un jeu où l'on incarne un athlète qui doit sauter un certains nombres de haies avant de passer au niveau suivant. Il y a 3 niveaux et la vitesse d'avancé des haies augmente à chaque niveaux. MAintenez appuyer la barre d'espace pour charger de la puissance, puis relâcher pour sauter plus ou moins haut selon la puissance décuplée.  Il y a un habillage esthétique, une intelligence artificielle qui perd de temps en temps, un feedback qui suit la balle dans le jeu et un ajout d'explosion lorsque la balle touche une palette. 
 Les haies valent plus ou moins de points si on saute par-dessus.
 Si le coureur percutte une haie, il perdra le montant total de score de la valeur de cette haie.
 
 Ecrit par Carl Beaumier 
 Creative Commons Attribution-Noncommercial-Share Alike 2.5 Canada 
 La classe Feedback est basée sur la classe Snake
 
 Version 1 
 
 --------------------------------------------------------------------------*/

//Si le coureur saute ou pas
boolean coureurQuiSaute= false;

// Gestion des images
PImage imageIntro;
PImage imageFin;
PImage nuageImage;

// Constantes d'etat
static final int INTRODUCTION = 0;
static final int JEU = 1;
static final int CONCLUSION = 2;


// Gestion des etats
int etat = INTRODUCTION;

//Initialisation des ArrayLists pour les classes
ArrayList haie;
ArrayList nuages;

//Initialisation des classes
Coureur coureur;
Fond fond;
Collision collision;

//Gestion du score
int score;
int scoreSauter;
int scoreRecord = 0;

//Fait de la memoire pour instaurer une typoraphie
PFont typo;

void setup(){
  size(512,256); // Grandeur du sketch
  smooth();// Anti-alialiasing
  frameRate(75);// Gerer le framerate

  //Charger les images dans le sketch
  imageIntro = loadImage("intro.jpg");
  imageFin = loadImage("fin.jpg");
  nuageImage = loadImage("nuage.png");

  //Initialisation des nouvelles classes
  fond = new Fond();
  collision = new Collision();

  //Initialisation des nouveaux ArrayLists
  haie = new ArrayList();
  nuages = new ArrayList();

  //Initialisation des configurations des nuages dans le ciel
  nuageConfig();

  //Initialisation des différents niveaux selon le nombre de haies sautées
  if(scoreSauter < 10){// Si le joueur a moins de 10 haies sautés...
    niveau1Config(); //Initialiser les configurations relatives au niveau 1...
  } 
  if (scoreSauter >= 10 && scoreSauter < 30){// Si le joueur a entre 10 et 30 haies sautées...
    niveau2Config();//Initialiser les configurations relatives au niveau 2...
  }
  if(scoreSauter >= 30){// Si le joueur a au dessus de 30 haies sautées...
    niveau3Config();//Initialiser les configurations relatives au niveau 3...
  }
  // Chargement de la typo
  typo = loadFont("CourierNewPSMT-12.vlw"); // Chargement de la fonte

}

void draw(){
  // Skelette du Jeu
  if( etat == INTRODUCTION ) {
    introduction(); // Intro
  } 
  else if ( etat == JEU) {
    jeu(); //jouer
  } 
  else {
    conclusion();//conclusion
  }

}

void introduction() {
  reset(); // Resetter les scores
  imageMode(CENTER);
  image(imageIntro,width/2,height/2,width,height); //Image d'introduction
}

void jeu() {
  background(255);//background

  //Afficher tout ce qui est relatif au background
  fond.afficher();
  nuageAfficher();

  //Affichage du coureur
  coureur.afficher();
  //Afficher les niveaux selon le nombre de haies sautés
  if(scoreSauter < 10){// Si le joueur a moins de 10 haies sautés...
    niveau1Anim(); //Charge les animations du niveau 1
  } 
  if (scoreSauter >= 10 && scoreSauter <30){// Si le joueur a entre 10 et 30 haies sautées...
    niveau2Anim();//Charge les animations du niveau 2
  }

  if(scoreSauter >= 30 && scoreSauter <60){// Si le joueur a entre 30 et 60 haies sautées...
    niveau3Anim();//Charge les animations du niveau 2 
  }
  //Affichage des comportements du coureur
  coureur.sauter();
  coureur.chargement();

  // Initialiser les collisions du coureur avec les haies
  collision.detecter();

  //Affichage du texte et pointage
  ecriturePointage();
  ecriturePuissance();
  ecritureHaieSauter();

  if(scoreSauter >= 60){//Si le joueur réussi a sauter par dessus la dernière haie
    etat = CONCLUSION; // charge la conclusion
  }
}

void conclusion() {
  image(imageFin,width/2,height/2,width,height); //Afficher l'image de conclusion
  // Updater le score record si le score est plus eleve
  if (score > scoreRecord){
    scoreRecord = score;
  }
  // Afficher les scores
  textFont(typo,15); //Prendre la fonte chargee dans le setup
  fill(255);
  text("Score Final:" + score, width/2+10, height/2);
  fill(255,0,0);
  text("Score Record:" + scoreRecord, width/2+10, height/2+30);
}

//Fait sauter le coureur lorsque le bouton de la souris est relache
void mouseReleased(){
  coureur.mouseReleased();
}

//Fait que le coureur reparte toujours a la hauteur du sol
void mousePressed(){
  //Passer d'une partie à l'autre du jeu en cliquant avec la souris
  if( etat == INTRODUCTION ) {

    etat = JEU;
  } 
  else if ( etat == CONCLUSION) {
    etat = INTRODUCTION;
  } 
  else {
    // jeu
  }
  coureur.mousePressed();
}

void ecriturePointage() {
  //Ecriture du pointage
  textAlign(CENTER); //Centrer le texte
  textFont(typo,12); //Prendre la fonte chargee dans le setup
  // Ecrit le texte selon les limites du jeu, a droite  
  if(score < 0){//mettre le texte en rouge si score est negatif
    fill(255,0,0);
    text("Score:" + score, 470, 18);
  }
  else{
    fill(255); //mettre le texte en blanc
    text("Score:" + score, 470, 18);
  }

}

void ecriturePuissance(){
  //Ecriture de la puissance
  textAlign(CENTER); //Centrer le texte
  textFont(typo,12); //Prendre la fonte chargee dans le setup
  fill(0,0,255); //mettre le texte en bleu
  // Ecrit le texte selon les limites du jeu, a gauche 
  text("Puissance",35,18);
}

void ecritureHaieSauter(){

  //Ecriture du pointage
  textAlign(CENTER); //Centrer le texte
  textFont(typo,12); //Prendre la fonte chargee dans le setup
  // Ecrit le texte selon les limites du jeu, a droite  
  fill(255); //mettre le texte en blanc
  text("Total haies sautées:" + scoreSauter, 432, 33);

}






