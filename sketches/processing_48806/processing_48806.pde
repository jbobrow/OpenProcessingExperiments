
int w = 20; //largeur des carres
int h = 20; //hauteur des carres
int cols = 20; //nombre de colonnes
int rows = 20; //nombre de lignes
float densite = 0.3; //densite de cases occupées

int sx = 10; // abscisse de la sortie
int sy = 20; // ordonnée de la sortie

int a,b; //variables intermédiaires
int k;
int[] intermediaire;
ArrayList liste;

float[][][] grille;


void setup() {
  //size(cols*w,rows*h); (bug de compilation ? marche en théorie
  size(400,400);
  background(0);
  frameRate(12);
  stroke(205);
  grille = new float[cols][rows][4];
  liste = new ArrayList();
  intermediaire = new int[2];
  
  //on positionne aléatoirement les cases initiales
  for (int i=0; i<(floor(float(cols)*float(rows)*densite)); i++) {
    grille[(int)random(cols)][(int)random(rows)][0] = 1; //améliorer cette fonction
    //quand la densité est trop élevée, compte tenu du fait qu'il n'y a pas de test sur l'occupation d'une case
    //il y a une dimunition logique de la densité : trouver un algorithme peu couteux qui permet
    //de contourner le problème
  }
  grille[sx-1][sy-1][0]=0;
  
  //première boucle qui évalue tout le tableau linéairement
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      if (grille[i][j][0]==1) {
  forces(i,j); } //créer une fonction qui calcule pr chaque case (i,j) occupée dx et dy resp. grille[i][j][1] et grille[i][j][2]
  }
  }
}

void draw() {
  //AFFICHAGE
  for (int i=0; i<cols; i++) {
    for(int j=0; j<rows; j++) {
      if (grille[i][j][0]==0) {
      fill(255);
      } else { if(grille[i][j][3]==1) { fill(0,255,0); } else { fill(255,0,0); } }
      rectMode(CENTER);
      rect(w*i+w/2,h*j+h/2,w,h);
      grille[i][j][3]=0;
    }
  }
  rectMode(CENTER);
  fill(0,0,255);
  rect(w*sx-w/2,h*sy-h/2,w,h); // on compte les cases en partant de 0 !!!
 
  //DEPLACEMENT 
  
  //deuxième boucle qui évalue tout le tableau linéairement
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      if (grille[i][j][0]==0) {
  voisins(i,j); }
  }
  }
  // voisins(i,j) qui détermine les cases voisines qui veulent aller
  //dans la case vide (a,b) en question -> renvoie une liste "liste"
  //contenant les coordonnées des cases "voisines" en question
  //si une case est sur la sortie, on l'enlève
  grille[sx-1][sy-1][0]=0;
  grille[sx-1][sy-1][1]=0;
  grille[sx-1][sy-1][2]=0;
  grille[sx-1][sy-1][3]=0;
}

//
void voisins(int i,int j) {
a = i; b = j;
   if (i==0) {//la case se trouve sur le bord gauche
      if (j==0) { destination(i,j+1);
                  destination(i+1,j);
      }
      else if(j==rows-1) {
                  destination(i,j-1);
                  destination(i+1,j);
      }
      else {      destination(i,j-1);
                  destination(i+1,j);
                  destination(i,j+1);
      }
    }
   else if (i==cols-1) {//la case se trouve sur le bord droit
      if (j==0) { destination(i,j+1);
                  destination(i-1,j);
      }
      else if(j==rows-1) {
                  destination(i,j-1);
                  destination(i-1,j);
      }
      else {      destination(i,j-1);
                  destination(i-1,j);
                  destination(i,j+1);
      }
    }
   else if (j==0) { 
                  destination (i,j+1);
                  destination (i+1,j);
                  destination (i-1,j);
    }
   else if (j==rows-1) { 
                  destination (i,j-1);
                  destination (i-1,j);
                  destination (i+1,j);
   }
   else {         destination(i-1,j);
                  destination(i,j-1);
                  destination(i,j+1);
                  destination(i+1,j);
   }   
  
  //on choisit quelle case va aller dans la case vide (aléatoirement) et on investit la case
  if (liste.size()>0) {
  k = (int)random(liste.size());
  grille[i][j][0]=1;
  forces(i,j);
  grille[i][j][3]=1;
  //on "vide" l'ancienne
  grille[((int[])liste.get(k))[0]][((int[]) liste.get(k))[1]][0]=0;
  grille[((int[])liste.get(k))[0]][((int[]) liste.get(k))[1]][1]=0;
  grille[((int[])liste.get(k))[0]][((int[]) liste.get(k))[1]][2]=0;
  grille[((int[])liste.get(k))[0]][((int[]) liste.get(k))[1]][3]=0;
  
  //on assigne aux autres quelles ont déjà été "jouées" pour ce tour-ci
  for (int l=0; l<(liste.size()-1); l++) {
    if (l != k) { grille[((int[])liste.get(l))[0]][((int[]) liste.get(l))[1]][3]=1; }
  }
  }
  //on réinitialise "liste"
  liste = new ArrayList();
    
}

//destination ajoute à la liste "liste" les éléments qui veulent aller dans la case vide de coordonnées (a,b)
void destination(int i,int j) {
  if (grille[i][j][0]==1) { if (grille[i][j][3]==0) {
    if (abs(grille[i][j][1]) > abs(grille[i][j][2])) { 
      if (a==(i+int(grille[i][j][1]/abs(grille[i][j][1])))) {
      intermediaire[0] = i;
      intermediaire[1] = j;
      liste.add(intermediaire); } }
    else { 
      if (b==(j+int(grille[i][j][2]/abs(grille[i][j][2])))) {
      intermediaire[0] = i;
      intermediaire[1] = j;
      liste.add(intermediaire); } }
  }
  }
  }
  
void forces(int i,int j) {
  grille[i][j][1] = float(sx-1-i)/sqrt(sq(float(sx-1-i))+sq(float(sy-1-j))) ;
  grille[i][j][2] = float(sy-1-j)/sqrt(sq(float(sx-1-i))+sq(float(sy-1-j))) ;
}

void mousePressed() {
  setup();
}                                                                                               
