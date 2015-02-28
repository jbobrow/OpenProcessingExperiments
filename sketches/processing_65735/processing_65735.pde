

PImage Warhol ;

// Variables de hauteur de scan
int y = 0 ;

void setup() {
  
Warhol = loadImage("Warhol.jpg") ;
size (600,600) ;
// frameRate (1);

}

void draw() {

for (int a = 0 ; a < width ; a++) {
 // Récupérer les valeurs de couleur sur tous les pixels en largeur
 color couleur = Warhol.get(a,y) ; // get (x,y) ;
 // Dessiner :
 stroke (couleur) ;
 line (a,0,a,height) ;
}

// Faire varier y, pour scanner toutes les lignes de l'image (hauteur)
y++ ;
if (y >= height) { y = 0 ; }

}

