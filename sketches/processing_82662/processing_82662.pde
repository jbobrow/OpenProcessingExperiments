

//** On crée une class avec un nom **//
class Noeud {

  //** création des variables **//
  float rouge = random(150);
  float vert = random(255);
  float bleu = random(0);
  float taille = random(5, 20);
  float posX;
  float posY;
  
  //** on définit les paramètres de la class **//
  Noeud (float _posX, float _posY){
    posX = _posX;
    posY = _posY;
  }

  //** on définit une action à associer à la class **//
 void trace() {
   
  fill (rouge, vert, bleu); //* on définit la couleur aléatoirement *//
  ellipse (posX, posY, taille, taille); //* on définit l'ellipse avec les variables créées aupparavant *//
  }
}

//* on créer une class "Pluie" *//
class Pluie {
  
  //* on définit les variables *//
  float x = 0;  //* position *//
  float y = 0;  //* position *//
  float w = 0; //* taille *//
  float a, b, c;  //* couleur *//
  
  //** on définit les paramètres de la class **//
  Pluie (float px, float py, float tw){
    w = tw;
    y = py;
    x = px;
  }

void eau () {
  w = random (50);
  x = random(600);
  y = random(600);
  a = random (55);
  b = random (100);
  c = random (255);
  fill (a, b, c, 40);  //* on définit une couleur aléatoire *//
  ellipse(x, y, w, w);  //* on crée une ellipse avec une position et une taille changeante *//
}
  
  
  
  
  
  
  
  
}
//** Appel des class Noeud et Pluie en créant un tableau de manière à l'avoir beaucoup de fois **//
Noeud n;
Noeud [] no = new Noeud [1000];
Pluie pl;
Pluie [] p = new Pluie [1];

//** création des variables **//
  float a = 800;
  float b = 900;
  float c = 600;
  float d = 700;
  float r = random(150);  //* variable pour la couleur rouge *//
  float v = random(255);  //* variable pour la couleur verte *//
  float bl = random(0);   //* variable pour la couleur bleue *//
  int i = int (random (1000)); //* permet au i d'être un nombre entier tiré au sort de 0 à 1000 *//
  boolean dessine;  //* permet à dessine d'être vrai ou faux *//
  boolean goute;   //* permet à goute d'être vrai ou faux *//


void setup () {
  size (600, 600);  //* format de la page *//
  background (#ffffff); //* définition de la couleur du fond *//
  noStroke ();  //* on précise que l'on ne veut pas de contour *//
  p[0]= new Pluie ( random(500), random(500), random (50));
}

void draw () {
  //* si dessine est vrai alors il se passera tout ce qu'il y a dans le if *//
    if (dessine) {
      //** définition des couleurs des filaments **//
      fill(r, v, bl);
  
      //** création du premier filament **//
      a = a + .005;
      b = b + .005;
      float aa = noise(a) * width; //* on crée une autre variable avec noise pour avoir des courbes qui vont sur toute la page *//
      float bb = noise (b)* height;  
      ellipse (aa, bb, 1, 1);
      //** création du deuxième filament **//
      c = c+0.005;
      d = d+0.005;
      float cc = noise(c) * width; //* même chose que pour le premier filament *//
      float dd = noise (d) * height;
      ellipse (cc, dd, 1, 1);
      //** création de la rencontre entre les deux filaments **//
      float distance = dist (aa, bb, cc, dd); //* calcul de la distance entre les deux filaments *//
      
      if (distance<30){
          no[i] = new Noeud (random(0, width), random(0, height)); //* on définit les paramètres de la class Noeud *// 
          no[i].trace();  //* on crée un nouvelle ellipse en faisant appel à notre class *//
      }
    }
  //* si goute est vrai alors on fait appel à la class Pluie *//
    if (goute) {
      p[0].eau ();
    }
  //* si on clique sur la souris, alors dessine est vrai et donc les filaments se dessinent et les ellipses apparraissent suivant les paramètres définis avant **//
    if (mousePressed){
      dessine=true;
      goute=false;  //* pour que lorsque l'on a déjà appuyé sur espace la class Pluie ne soit plus appelée *//
    }
  //* si l'on appuie sur une touche alors il se passera ce qu'on mettra *//
    if (keyPressed) {
      //* on précise que lorsque la touche appuyer est espace alors tout est "effacer" *//
      if (key == 'd') {
        background(250);
        goute=false;  //* on dit que goute est faux pour arrêter l'appel à la class Pluie *//
        dessine=false;  //* de même pour dessine, pour arrêter les filaments et ellipses de se dessiner *//
      }
      //* on précise que si la touche appuyée est espace alors on fait appel à la class Pluie *//
      if (key == ' '){
        goute=true;  //* on dit que goute est vrai pour que la class Pluie puisse entrer en action *//
        dessine=false;  //* pour que les filaments et ellipses arrêtent de tracer *//
        int m = 0;  //* on crée une variable pour l'opacité *//
        m = m + 10;  //* on précise que cette variable augmentera de 10 (à chaque fois que l'on clique où si on reste appuyé) *//
        fill (#ffffff, m);  //* on précise la couleur et l'opacité *//
        rect (0, 0, 600, 600); //* on crée un rectangle qui est transparent et qui petit à petit va devenir opaque *//
      }
    }
}



