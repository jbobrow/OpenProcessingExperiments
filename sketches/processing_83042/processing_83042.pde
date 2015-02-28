
//variable pour le nombre de balles
int nbreBalle = 10;

//Déclaration de l'objet "Balle"
Balle[] balles = new Balle[nbreBalle];

void setup() {
  smooth(); //Lisser les traits
  size(800, 600,P3D); //Taille de la fenêtre

  //Cette boucle va créer 10 balles colorées, au centre de l'écran
  for (int i = 0; i < nbreBalle; i++) {
    balles[i] = new Balle(width/2, height/2,  color(255));
  }
}

void draw() {
  fill(0,50,90,10);
  ellipse(400,300,300,300); //dessin de la grosse boule
 
  noStroke();
  fill(0,14); // Couleur avec transparence.
  rect(0, 0, width, height);
  



  //Cette boucle va déplacer et afficher les 10 balles colorées
  for (int i = 0; i < nbreBalle; i++) {
    balles[i].bouge();
    balles[i].testCollision(mousePressed); //CLIQUER SUR LA GROSSE BOULE 
    balles[i].display();
  }
}

class Balle {    // La classe des 10 balles
  //Déclaration des paramètres de base des balles
  float x;
  float y;
  float vitesseX;
  float vitesseY;
  color couleur;

  //Constructeur des balles
  Balle (float nouvX, float nouvY, color nouvCouleur) {
    x      = nouvX;
    y      = nouvY;
    couleur    = nouvCouleur;

    vitesseX = 2 + random(-5,5);
    vitesseY = 2 + random(-5,5);
  }

  //Dessin des balles
  void display() {
  fill(40,80,110);
  ellipse(x, y, 20, 20);
  }

  //Déplacement des balles
  void bouge() {
     x = x + vitesseX;
     y = y + vitesseY;
  }

  void testCollision(boolean dansLaBoule) {   

    //pour faire entrer les balles dans la grosse boule avec le click
    if(dansLaBoule) {
      

    float distance=dist(x,y,width/2,height/2);
    
    if (distance>150) { //distance rayon(limite) de la grosse boule
      
       vitesseX = vitesseX * -1;
       vitesseY = vitesseY * -1;
    }
    
    
    }
    //Si les balles touchent un mur, elles rebondissent
    if (x > width-20 || x < 20) {
       vitesseX = vitesseX * -1;
    }
    if (y > height-20 || y < 20) {
       vitesseY = vitesseY * -1;
    }
    
  if (keyPressed) {  //pour sauvegarder en jpg avec la touche"s"
  if (key == 's') {
     save("ballsinone.jpg");
   }
  }
 }
}




