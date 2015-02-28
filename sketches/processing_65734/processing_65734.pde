

void setup() {
  
PImage Warhol = loadImage("Warhol.jpg") ;
size (600, 600) ;

for (int a = 0 ; a < width ; a++) {
 // Récupérer les valeurs de couleur sur tous les pixels en largeur
 color couleur = Warhol.get(a,200) ; // get (x,y) ;
 // Dessiner :
 stroke (couleur) ;
 line (a,0,a,height) ;
}

}

