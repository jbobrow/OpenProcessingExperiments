
/*Concept: J'ai voulu représenter le temps qui défile. Avec le temps, 
un cercle relié au centre de la scène par une ligne se dessine. Il est possible 
de changer la couleur de la ligne en appuyant sur c, et en cliquant, il est possible 
de changer la couleur du cercle.

Il est aussi possible de changer le sens de rotation avec s et d, de changer la vitesse 
de rotation avec v et b et de recommencer en appuyant sur t.
 */

//Déclaration de variable angle, vitesse et sens
float angle;
int vitesse = 1;
int sens = 1;

//Déclaration de 3 variables couleur pour la couleur du cercle
int couleur1 = 3;
int couleur2 = 128;
int couleur3 = 248;

//Déclaration de 3 variables pour la couleur de la ligne
float Couleur_ligne_r1= random(255);
float Couleur_ligne_v1= random(255);
float Couleur_ligne_b1= random(255);


//S'affichera une seule fois au lancement
void setup() {
  background(0);
  noStroke();
  size(500, 500);
}


// S'affichera en boucle 
void draw() {

  //Variation de la variable angle
  angle +=vitesse*0.02*sens;

  //Appel des fonctions lign et cercle
  ligne();
  cercle();
  }


//Fonction cercle: dessin et translation du cercle
void cercle() {

  pushMatrix();
  smooth();
  translate(width/2, height/2);
  rotate(angle);
  noStroke();
  fill(couleur1, couleur2, couleur3);
  ellipse (180, 180, 50, 50);
  popMatrix();
  }


//Fonction ligne: dessin et translation des lignes
void ligne() {

  pushMatrix();
  smooth();
  translate(width/2, height/2);
  rotate(angle);
  stroke(Couleur_ligne_r1, Couleur_ligne_v1, Couleur_ligne_b1);
  strokeWeight(0.6);
  line(0, 0, 180, 180);
  popMatrix();
  }


//Fonction keyPressed: Si on clique sur une touche, il y aura 
//une action définie

void keyPressed() {

  //Si on clique sur v (pour "vitesse") alors:
  if (key == 'v') {
    //la vitesse sera positive
    vitesse += 2;
  }
  //Si on clique sur b alors: 
  if (key == 'b') {
    //la vitesse sera négative
    vitesse += -2;
  }  
  //Si on clique sur s alors:
  if (key == 's') {
    //invertion du sens de rotation (dans le sens inverse des aiguilles d'une montre)
    sens = -1;
  }  
  //Si on clique sur d, alors:
  if (key == 'd') {
    //invertion du sens de rotation (dans le sens des aiguilles d'une montre)
    sens = +1;
  }  

  //Si on clique sur c alors:
  if (key == 'c') {
    //La couleur change car Couleur_balle_r1, Couleur_balle_v1 et Couleur_balle_b1 prennent de nouvelles valeurs
    Couleur_ligne_r1 = int(random(255));
    Couleur_ligne_v1 = int(random(255));
    Couleur_ligne_b1 = int(random(255));
  }
  
  //Si on clique sur t, alors:
  if (key == 't') {
    //L'animation recommencera
    background(0);
  }
}

//Fonction mousePressed: quand on clique, il y a un évènement bien précis
void mousePressed() {

  //Si on clique:
  if (mousePressed) {
    //Changement de valeur pour les variables couleur1, couleur2 et couleur3
    couleur1 = couleur1 + 12;
    couleur2 = couleur2 +7;
    couleur3 = couleur3 - 13;
  }

  // Si couleur1 a comme valeur 255:
  if (couleur1 == 255) {
    //Changement de valeur pour les variables couleur1, couleur2 et couleur3, et donc retour aux valeurs de base pour ces 3 variables.
    couleur1 = 3;
    couleur2 = 128;
    couleur3 = 248;
  }
}


