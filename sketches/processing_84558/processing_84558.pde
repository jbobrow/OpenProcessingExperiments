

import java.util.Collections; // necessaire pour le listeMelangee des cartes (fonction shuffle pour le mélange)

int dimx=2000, dimy=1100;
int lCarte=192, hCarte=279; // dimension de chaque carte mesurées sur l'image cartes.png
int e1=1, e2=3; // coefficient d'echelle e1/e2 pour l'affichage des images par rapport à la taille originale de cartes.png"
PImage jeuDeCartes, dos;  // Declare variable de  type PImage (type image)
PImage []laCarte = new PImage[55]; // tableau de cartes (extraites du fichier cartes.png)
PImage carte=createImage(lCarte, hCarte, RGB); // 
//create an ArrayList object
ArrayList listeDeCarteOrdonnee= new ArrayList(55); // liste d'objet entier (la liste des cartes ordonnées)
ArrayList listeDeCarteMelangee = listeDeCarteOrdonnee; // ou mélangées
ArrayList mainNord=new ArrayList(8);                  // liste des mains distribués (8 cartes)
ArrayList mainOuest=new ArrayList(8);
ArrayList mainSud=new ArrayList(8);
ArrayList mainEst=new ArrayList(8);
int [] ordre=new int[55];
int[] listeOrdonnee=new int[listeDeCarteOrdonnee.size()]; // même liste sous forme de tableau pour extraire plus
int[] listeMelangee=new int[listeDeCarteMelangee.size()]; // facilement les valeurs
// int []listeMelangee= new int[55];
int etape=0;// etape de la machine d'état
float [] rx=new float[55];  // valeurs random pour le splash
float [] ry=new float[55];
long tempsInit, tempsEcoule;
int j=0;

int y=0, x=0;

/* la fonction setup() est une spécificité de Processing
 cette focntion permet l'initialisation des paramètres et des données 
 elle est exécuté une fois au lancement) 
 */
void setup() {  
  // création de la police utilisée pour l'affichage
  textFont(createFont("Georgia", 14));
  // début de l'initialisation des listes de cartes sous forme de arrayList puis converties en tableau
  for (int i=0;i<55;i++) {
    listeDeCarteOrdonnee.add(i);
  }
  listeDeCarteMelangee = listeDeCarteOrdonnee;
  listeMelangee=convertirEnListedEntiers(listeDeCarteMelangee); // conversion
  listeOrdonnee=convertirEnListedEntiers(listeDeCarteOrdonnee); // conversion
  //au début du fonctionnement la liste mélangée et la liste ordonnée sous identique

    size(1000, 550); // dimension de la fenêtre graphique 
  initialiserEcran();   // effacer l'écran (fond vert, plateau de jeu)

  memoriserJeuDeCartesInitial(); // fonction d'initialisation des images de cartes
  frameRate(30); // fréquence de  re-dessin de l'écran graphique (n par seconde)
}

/* la fonction draw est une fonction spécifique de Processing
 elle est exécutée en boucle à la fréquence précisée par frameRate() dans le setup() 
 sans qu'il soit nécessaire de le programmer. elle ne s'interrompt que par l'arrêt du programme.
 */
void draw() {
  /* Pseudo machine d'état pour gérer la succession des affichages
   */
  switch(etape) {
  case 0: 
    afficherCartes(); // affichage du jeu de carte en tableau
    break;
  case 1: 
    commencer(50, height-hCarte*e1/e2-5);   // ramassage des cartes une à une et mise en bas de l'écran dans l'ordre de ramassage
    break;
  case 2: 
    ramasser(50, height-hCarte*e1/e2-5);   // regroupement des cartes en tas
    break;
  case 3: 
    retounerPaquet(50, 570); // simulation du retournement du paquet
    break;
  case 4: 
    melangerCartes();
    break;
  case 5: 
    montrerlisteMelangee(10, 10);
    break;    
  case 6:
    ramasser(10, 10);
    break;    
  case 7:
    retounerPaquet(10, 10);
    break;     
  case 8:
    deplacer(width/2-lCarte/2*e1/e2, height/2-hCarte/2*e1/e2);
    break;
  case 9: 
    melangerCartes();
    break;    
  case 10:
    //montrer(10, 150);
    distribuer();
    tempsInit=millis();
    break;
  case 20:
    //montrer(10, 150);
    splash();
    break;
  default:
    break;
  }
  afficherCommande();
  j=j+1;
  if (j>200) {
    j=0;
    initialiserEcran();
    initialiserMains();
    for (int ii=0;ii<55;ii++) {
      rx[ii]=random(0, width);
      ry[ii]=random(0, height);
    }
    etape=20;
  }
}

// définition des classes (des fonctions)

void initialiserEcran() {
  background(0, 125, 0);
}

void afficherCommande() {
  int delta=150;
  int posy=50;
  int deltay=20;
  noStroke();
  fill(0, 125, 125);
  rect(width-delta, posy, 120, 5*deltay);
  fill(255, 255, 255);
  text("Commencer: C ou c", width-delta, posy+deltay);
  text("Ramasser: R ou r", width-delta, posy+2*deltay);
  text("Distribuer: D ou d", width-delta, posy+3*deltay);
  text("Splash: S ou s", width-delta, posy+4*deltay);
  noFill();
}

/* 
 La fonction memoriserJeuDeCartesInitial() extrait du fichier image du jeu de carte complet, 
 l'image de chaque carte numerotées de 1 à 54, la carte[0]  est le dos.
 */
void   memoriserJeuDeCartesInitial() {
  jeuDeCartes = loadImage("cartes.png"); // chargement de l'image du plateau de carte (cette image n'est pas affichée)

  /* la boucle for sur i permet de ballayer toute l'image (54 cartes + fond)
   la division entière de i par 13 et le reste de la division par 13 permet de générer x et y du tableau
   */
  for (int i=0;i<=53;i=i+1) {
    y=i/13;                                
    x=i%13;
    carte = jeuDeCartes.get(lCarte*x, hCarte*y, lCarte, hCarte);
    // la methode .get perent d'extraire une partie de l'image
    laCarte[i+1]=carte; // l'imge est mémorisée dans le tableau d'image représentant les cartes
  }
  laCarte[0]= jeuDeCartes.get(lCarte*2, hCarte*4, lCarte, hCarte); // laCarte[0] est le dos.
  dos=laCarte[0];
}

/* 
 La fonction afficherCartes() affiche le tableau de cartes dans l'ordre du fichier initial
 */
void   afficherCartes() {
  y=j/13;
  x=j%13;
  image(laCarte[j+1], lCarte*x*e1/e2, hCarte*y*e1/e2, lCarte*e1/e2, hCarte*e1/e2);
  //la fonction image(x,y,larg,haut) permet d'afficher une image à la position (x,y) avec les dimensions (larg x haut)
  if (j==53) {
    image(laCarte[0], lCarte*2*e1/e2, hCarte*4*e1/e2, lCarte*e1/e2, hCarte*e1/e2);
    etape=1;
    j=-1;
  }
}


//void afficherJeu() {
//  image(jeuDeCartes, 0, 0, jeuDeCartes.width*e1/e2, jeuDeCartes.height*e1/e2);
//  noStroke();
//  fill(0, 125, 0);          // Setting the interior of a shape (fill) to grey 
//  rect(193*e1/e2*3, 280*e1/e2*4, 193*e1/e2*10, 280*e1/e2);
//  noFill();
//}

void commencer(int posx, int posy) {
  y=j/13;
  x=(j+13)%13;
  // println(j+","+x+","+y);
  noStroke();
  fill(0, 125, 0);          
  rect((lCarte+1)*e1/e2*x, (hCarte+1)*e1/e2*y, (lCarte+1)*e1/e2, (hCarte+1)*e1/e2);
  noFill();
  image(laCarte[j], posx+40*e1/e2*j, posy, lCarte*e1/e2, hCarte*e1/e2);
  if (j==54) {
    //memoriserJeuDeCartes();
    etape=2;
    j=0;
    //print(laCarte);
  }
}


void ramasser(int x, int y) {
  for (int k=1;k<=54;k=k+1) {
    image(laCarte[listeMelangee[k]], x+20*k*(20-j)/20, y, lCarte*e1/e2, hCarte*e1/e2);
    //println(j);
  }
  fill(0, 125, 0);          // remplir de vert au dela de la dernier carte pour effacer
  rect(x+20*54*(20-j)/20+193*e1/e2, y, 193*e1/e2, 280*e1/e2);
  noFill();

  if (j==20) {
    switch(etape) {
    case 2:
      etape=3;
      break;
    case 6:
      etape=7;
    default:
      break;
    }
    j=-1;
  }
}

void retounerPaquet(int x, int y) {
  if (j<20) {
    initialiserEcran();
    image(laCarte[listeMelangee[54]], x, y, lCarte*e1/e2*(20-j)/20, hCarte*e1/e2);
  }
  if (j>20 &&  j<40) {
    initialiserEcran();
    int k=j-20;
    image(dos, x, y, lCarte*e1/e2*(k)/20, hCarte*e1/e2);
  }
  if (j==40) {
    initialiserEcran();
    image(dos, x, y, lCarte*e1/e2, hCarte*e1/e2);
    j=-1;
    switch(etape) {
    case 3:
      etape=4;
      break;
    case 7:
      etape=8;
    default:
      break;
    }
  }
}

void melangerCartes() {
  listeDeCarteMelangee.remove(0);
  Collections.shuffle(listeDeCarteMelangee);
  listeDeCarteMelangee.add(0, 0);
  listeMelangee=convertirEnListedEntiers(listeDeCarteOrdonnee);
  switch (etape) {
  case 4:
    etape=5;
    break;
  case 9:
    etape=10;
    break;
  default:
    break;
  }
  j=-1;
}

void montrerlisteMelangee(int x, int y) {
  for (int k=1;k<=54;k=k+1) {
    image(laCarte[listeMelangee[k]], x+20*k*(j)/20, y, lCarte*e1/e2, hCarte*e1/e2);
  }
  if (j==20) {
    etape=6;
    j=-1;
  }
}


void montrer(int x, int y) {
  for (int k=1;k<=32;k=k+1) {
    image(laCarte[listeMelangee[k]], x+20*k*(j)/20, y, lCarte*e1/e2, hCarte*e1/e2);
    //println(k+","+ listeMelangee[k]);
  }
}

void deplacer(int x, int y) {
  int oldx, oldy, deltax, deltay, x1=10, y1=10;
  oldx= x1+(x-x1)*(j)/11;
  oldy=y1+(y-y1)*(j)/11;
  deltax= x1+(x-x1)*(j+1)/11;
  deltay=y1+(y-y1)*(j+1)/11;
  fill(0, 125, 0);          // remplir de vert au dela de la dernier carte pour effacer
  rect(oldx, oldy, (lCarte+2)*e1/e2, (hCarte+2)*e1/e2);
  noFill();
  image(dos, deltax, deltay, lCarte*e1/e2, hCarte*e1/e2);
  if (j==10) {
    etape=9;
    j=-1;
  }
}

void distribuer() {
  int k=(j)%4;
  int val;
  //println(j+","+k);
  switch (k) {
  case 0:
    pushMatrix();
    translate(width/2, 50);
    rotate(j*PI/64);
    image(laCarte[listeMelangee[j+1]], 0, 25, lCarte*e1/e2, hCarte*e1/e2);
    popMatrix();
    val=listeMelangee[j+1];
    mainNord.add(val);
    break;
  case 1:
    pushMatrix();
    translate(50, height/2);
    rotate(-PI/2+j*PI/64);
    image(laCarte[listeMelangee[j+1]], 0, 25, lCarte*e1/e2, hCarte*e1/e2);
    popMatrix();
    mainOuest.add(listeMelangee[j+1]);
    break; 
  case 2:
    pushMatrix();
    translate(width/2, height-50);
    rotate(-PI+j*PI/64);
    image(laCarte[listeMelangee[j+1]], 0, 25, lCarte*e1/e2, hCarte*e1/e2);
    popMatrix();
    mainSud.add(listeMelangee[j+1]);
    break;
  case 3:
    pushMatrix();
    translate(width-50, height/2);
    rotate(-3*PI/2+j*PI/64);
    image(laCarte[listeMelangee[j+1]], 0, 25, lCarte*e1/e2, hCarte*e1/e2);
    popMatrix();
    mainEst.add(listeMelangee[j+1]);
    break;
  default:
    break;
  }

  if (j==32) {
//    println(mainNord);
//    println(mainOuest);
//    println(mainSud);
//    println(mainEst);
    etape=11;
    j=-1;
  }
}



int[] convertirEnListedEntiers(ArrayList<Integer> integers)
{
  int[] ret = new int[integers.size()];
  for (int i=0; i < ret.length; i++)
  {
    ret[i] = integers.get(i).intValue();
  }
  return ret;
}

void initialiserMains() {
  mainNord.clear();
  mainOuest.clear();
  mainSud.clear();
  mainEst.clear();
}


void splash() {
  if (j<=10) {
    for (int k=1;k<=54;k=k+1) {
      image(laCarte[k], rx[k], ry[k], lCarte*e1/e2, hCarte*e1/e2);
      //println(j);
    }
  }
  if (j==30) {
    for (int ii=0;ii<55;ii++) {
      rx[ii]=random(0, width);
      ry[ii]=random(0, height);
    }
    j=-1 ;
  }
}
void keyPressed() {
  switch(key) {
  case 'c': 
  case 'C': 
    j=0;
    initialiserEcran();
    afficherCartes();
    initialiserMains();
    etape=0;
    break;
  case 'r': 
  case 'R': 
    j=0;
    initialiserEcran();
    initialiserMains();
    etape=6;
    break;
  case 'd':   
  case 'D': 
    j=0;
    initialiserEcran();
    initialiserMains();
    etape=9;
    break;
  case 's':   
  case 'S': 
    j=0;
    initialiserEcran();
    initialiserMains();
    for (int ii=0;ii<55;ii++) {
      rx[ii]=random(0, width);
      ry[ii]=random(0, height);
    }
    etape=20;
    break;    
  default:
    break;
  }
}



