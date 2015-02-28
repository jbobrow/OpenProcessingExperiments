
//Zombie Runner par Pieux Marine et Water Benny 1/06/13
//Ce progamme est celui d'un jeu ou le but est d'eviter un enemie qui s'avance vers vous tout en restant immobile sur une plaque pour lui infliguer des degats.

//Début du code:

//définition de toutes les variables:
//Images:
PImage fond ;PImage BH;PImage zombie;PImage inter;PImage bdv;PImage tdm;PImage victoire;PImage perdu;PImage zombie2;
//entiers de petite taille.
int x; int y;int x3; int y3 ;int c;
//décimaux:
float vie;float x1;float y1; ;float p;float viezombie;float distance;float rayon ;
//_____________________________________________________________________________________________________________________________________________________________________________________________
void setup() {
  size(1000, 500);//taille de la fenêtre
  frameRate(300);//nombre de chargements par seconde
  //chargement de chaque image dans le dossier du programme
  inter = loadImage("Images/inter.png");
  bdv = loadImage("Images/bdv.png");
  fond = loadImage ("Images/fond.png");
  zombie = loadImage ("Images/zombie.png");
  zombie2 = loadImage("Images/zombie2.png");
  BH = loadImage ("Images/BH.png");
  tdm = loadImage("Images/tdm.png");
  victoire =loadImage("Images/victoire.png");
  perdu = loadImage("Images/perdu.png");
  x=100;
  y=100;
  x3=850;
  y3=225;
  c=0;
  vie= 150;
  x1=900;
  y1=250;
  p=0;
  viezombie=200;
  rayon=27.5;
}

//___________________________________________________________________________________________________________________________________________________________________________________________________
void draw() {

  imageMode(CORNER);//les images des voids suivants ont leur point de référence dans le coin supérieur gauche
  image (fond, 0, 0);//chargement de l'arrière plan du jeu
  //appel des voids
  inter ();
  vie();
  Pause();
  viezombie();

  imageMode(CENTER);//les images des voids suivants ont leur point de référence au centre 
  //appel des voids
  Heros();
  ennemi();
  victoire();
  perdu();
}


 
 

//_____________________________Ce void gère l'affichage et le mouvement du héros _______________________________________________________________________________
void Heros() {
 
  image (BH, x, y);// fait appel à l'image du héros et l'affiche aux coordonnées x et y prédéfinies
  if (p==0) {//ici la condition p=0 indique que le jeu est en marche (voir void pause)

    if (keyPressed) {//la fonction keyPressed permet d'effectuer une action à l'appui d'une touche du clavier
        if (key== 'z'||key== 'Z') {//on définit ici la touche z pour l'action suivante. On précise z et Z pour éviter tout problème de majuscule
        if (y>75) {//cette condition fait en sorte que le héros ne dépasse pas les bords de l'écran. Elle prend en compte l'épaisseur du cadre et des dimensions du personnage
          y=y-1;// cette action définit le déplacement vertical vers le haut du héros. x et y étant les coordonnées du héros
        }
        }
//identique mais pour un mouvement vertical vers le bas
        else if (key== 's'||key== 'S') {
          if (y<425) {
            y=y+1;
          }
        }
//mouvement horizontal vers la gauche
        else if  (key== 'Q' || key == 'q'){
          if (x>50) {
            x=x-1;
          }
        }

//mouvement horizontal vers la droite
        else if (key == 'd'|| key == 'D') {
          if (x<950) {
            x=x+1;
          }
        }
      }
    }
  
  else {//cette condition est le retour de la condition de mise en marche du jeu. Si le jeu a été mis en pause, les variables x et y restent fixes (voir void pause)
    x=x;
    y=y;
  }
}


//____________________________________________________________________void de l'interface____________________________________________________________________________

void inter() {
  //appel à l'image de l'interface
  image(inter, 0, 0);
}
//ce void est temporairement vide mais sera utile lors de l'avancement du jeu

//__________________________________________________________void de la vie du héros__________________________________________________________________________________________________
void vie() {
  image (bdv, 800, 5, vie, 20);//appel de l'image de la barre de vie à la position x=800 et y=5 de longueur prédéfinie (vie) représentant les points de vie du héros et d'épaisseur 20
  if (x==x1 && y==y1) {//condition qui indique que le héros et l'ennemi sont à la même position
    if (vie>0) {//condition qui indique que la vie du héros n'est pas nulle 
      if (p==0) {//condition qui indique que le jeu est en marche (voir void pause)
        vie = vie-0.2;//dommages infligés par l'ennemi sur le héros
      }
      else { //condition qui indique que le jeu est en paus, la vie ne peut dont pas descendre (voir void pause)
        vie=vie;
      }
    }
  }
}


//______________________________________________void gérant la présence de l'ennemi____________________________________________________________________________________________________________________
void ennemi() {
  if (p==0) {//condition qui indique que le jeu est en marche (voir void pause)
    if (x1>x) {//condition qui permet de détecter que l'ennemi est à droite du héros 
      x1=x1-0.5;//déplacement horizontal vers la gauche de l'ennemi
      c=1;//variable modifiant l'orientation de l'image de l'ennemi
      
    }
    //fonctionnement identique pour la gauche
    if (x1<x) {
      x1=x1+0.5;
      c=0;
      
    }
//fonctionnement identique pour le haut
    if (y1<y) {
      y1=y1+0.5;
      
    }
//fonctionnement identique pour le bas
    if (y1>y) {
      y1=y1-0.5;

    }
  }
  else {//condition qui indique que le jeu est mis en pause (voir void pause)
    x1=x1;
    y1=y1;
  }
  //condition qui modifie l'image selon l'orientation de l'ennemi
  if(c==0){
    //condition qui modifie l'image selon l'orientation de l'ennemi
    image(zombie,x1,y1);
  }
  if(c==1){
    image(zombie2,x1,y1);
  }
    
}
//_________________________________________________________void de mise en pause___________________________________________________________________________________________
void Pause() {
  if (keyPressed) {//appel à la fonction keyPressed
    if (key == 'p'|| key == 'P') {//on définit la touche p pour la mise en pause du jeu
      p=1;//quand p=1 la plupart des variables du jeu se fixent
    }
    if (key == 'r' || key == 'R') {//on définit la touche r pour la reprise du jeu
      p=0;//quand p=0 les variables ne sont plus fixes
    }
  }
}
//_________________________________________________void gérant la vie et les dommages sur le zombie________________________________________________________________________________________________________________________________
void viezombie() {
  image(bdv, 60, 5, viezombie, 20);//appel à l'image de la barre de vie du zombie, fonctionnement identique à celui du héros
  imageMode(CENTER);//image mise en mode centre pour faire exception au mode corner du void draw 
  image(tdm, 850, 225);//appel à l'image tête de mort en position x=850 et y=225
  rectMode(CENTER);//mise en mode centre du rectangle pour faire exception au mode corner du void draw
  noFill();//on évite le remplissage du rectangle pour ne pas cacher l'image
  rect(850, 225, rayon*2, rayon*2);//mise en place du rectangle
  distance = dist(x, y, 850, 225);//définition de la variable distance qui est la distance entre les points x et y du héros et les coordonnées (850,225) qui sont les coordonnées du rectangle
  if (distance<rayon) {//condition qui dit que si la variable distance est inférieure au rayon du cercle inscrit au carré, l'action suivante est mise en oeuvre
    if (viezombie>0) {//condition qui demande que la vie du zombie ne soit pas nulle
      viezombie = viezombie-0.1;//dommages infligés au zombie
    }
  }
}
//_______________________________________________________void appelé en cas de victoire____________________________________________________________________________________________________________________________
void victoire() {
  if (viezombie<1) {//condition de la victoire
    image(victoire, 500, 250);//appel à l'image indiquant la victoire de coordonnées (500,250)
    p=1;
  }
}
//_______________________________________________void appelé en cas de défaite_________________________________________________________________________________________________________________
void perdu() {
  if (vie < 1) {//condition de la défaite
    image(perdu, 500, 250);//appel à l'image indiquant la défaite de coordonnées (500,250)
    p=1;
  }
}
//__________________________________________________________________________________fin du programme ___________________________________________________________________________________________






