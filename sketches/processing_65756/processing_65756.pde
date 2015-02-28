

// MULTIPLIER LES INSTANCES D'UN OBJET

// On crée une liste d'objets
Personne[] population = new Personne[20] ;

void setup() {
 
 size (500,500) ;
 background(255) ;
 smooth() ;
 
 // Une boucle remplit la liste en instanciant les objets
 for (int i = 0; i < population.length; i++) {
 // Pour chaque nouvel objet, on tire au sort des valeurs de couleur :
 int rouge = int(random(255)) ;
 int vert = int(random(255)) ;
 int bleu = int(random(255)) ;
 // On crée/instancie un objet en lui passant les valeurs de couleur :
 population[i] = new Personne(rouge, vert, bleu) ;
 }
 
}


void draw() {
 
 background(255) ;
 
 // Dessin des objets
 for(int i=0; i < population.length; i++) {
 population[i].bouger() ;
 population[i].dessiner() ;
 } 
  
}


class Personne {
  
 // Les variables de la classe
 color peau ;
 int x ;
 int y ;
 
 // Le constructeur de la classe
 Personne (int r, int v, int b) {
 
 // Attribution des couleurs de peau à l'aide des paramètres du constructeur
 peau = color(r, v, b) ;
 // Valeurs de position
 x = int(random(500)) ;
 y = int(random(500)) ;
   
 }
 
 // AJOUTER UNE MÉTHODE POUR BOUGER
 void bouger() {
  
  x += int(random(-2,2)) ;
  y += int(random(-2,2)) ;
   
 }
 
 void dessiner() {
 
 fill (peau) ; // Couleur de peau
 noStroke() ; // Supprimer le contour pour le visage
 ellipse(x, y, 50, 50) ; // Tête
 fill (255) ; // Repasser en blanc pour les yeux
 stroke (255) ; // Passer en blanc pour la bouche
 line (x-10, y+15, x+10, y+15) ; // Bouche
 noStroke() ; // Supprimer le contour pour les yeux
 ellipse (x-10, y-5, 10, 10) ; // Œil gauche
 ellipse (x+10, y-5, 10, 10) ; // Œil droit
 
 }
  
}

