
//** On crÃ©e une class avec un nom **//
class Noeud {

  //** crÃ©ation des variables **//
  float rouge = random(150);
  float vert = random(255);
  float bleu = random(0);
  float taille = random(5, 20);
  float posX;
  float posY;
  
  //** on dÃ©finit les paramÃ¨tres de la class **//
  Noeud (float _posX, float _posY){
    posX = _posX;
    posY = _posY;
  }

  //** on dÃ©finit une action Ã  associer Ã  la class **//
 void trace() {
   
  fill (rouge, vert, bleu); //* on dÃ©finit la couleur alÃ©atoirement *//
  ellipse (posX, posY, taille, taille); //* on dÃ©finit l'ellipse avec les variables crÃ©Ã©es aupparavant *//
  }
}

//* on crÃ©er une class "Pluie" *//
class Pluie {
  
  //* on dÃ©finit les variables *//
  float x = 0;  //* position *//
  float y = 0;  //* position *//
  float w = 0; //* taille *//
  float a, b, c;  //* couleur *//
  
  //** on dÃ©finit les paramÃ¨tres de la class **//
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
  fill (a, b, c, 40);  //* on dÃ©finit une couleur alÃ©atoire *//
  ellipse(x, y, w, w);  //* on crÃ©e une ellipse avec une position et une taille changeante *//
}
  
  
  
  
  
  
  
  
}
//** Appel des class Noeud et Pluie en crÃ©ant un tableau de maniÃ¨re Ã  l'avoir beaucoup de fois **//
Noeud n;
Noeud [] no = new Noeud [1000];
Pluie pl;
Pluie [] p = new Pluie [1];

//** crÃ©ation des variables **//
  float a = 800;
  float b = 900;
  float c = 600;
  float d = 700;
  float r = random(150);  //* variable pour la couleur rouge *//
  float v = random(255);  //* variable pour la couleur verte *//
  float bl = random(0);   //* variable pour la couleur bleue *//
  int i = int (random (1000)); //* permet au i d'Ãªtre un nombre entier tirÃ© au sort de 0 Ã  1000 *//
  boolean dessine;  //* permet Ã  dessine d'Ãªtre vrai ou faux *//
  boolean goute;   //* permet Ã  goute d'Ãªtre vrai ou faux *//


void setup () {
  size (600, 600);  //* format de la page *//
  background (#ffffff); //* dÃ©finition de la couleur du fond *//
  noStroke ();  //* on prÃ©cise que l'on ne veut pas de contour *//
  p[0]= new Pluie ( random(500), random(500), random (50));
}

void draw () {
  //* si dessine est vrai alors il se passera tout ce qu'il y a dans le if *//
    if (dessine) {
      //** dÃ©finition des couleurs des filaments **//
      fill(r, v, bl);
  
      //** crÃ©ation du premier filament **//
      a = a + .005;
      b = b + .005;
      float aa = noise(a) * width; //* on crÃ©e une autre variable avec noise pour avoir des courbes qui vont sur toute la page *//
      float bb = noise (b)* height;  
      ellipse (aa, bb, 1, 1);
      //** crÃ©ation du deuxiÃ¨me filament **//
      c = c+0.005;
      d = d+0.005;
      float cc = noise(c) * width; //* mÃªme chose que pour le premier filament *//
      float dd = noise (d) * height;
      ellipse (cc, dd, 1, 1);
      //** crÃ©ation de la rencontre entre les deux filaments **//
      float distance = dist (aa, bb, cc, dd); //* calcul de la distance entre les deux filaments *//
      
      if (distance<30){
          no[i] = new Noeud (random(0, width), random(0, height)); //* on dÃ©finit les paramÃ¨tres de la class Noeud *// 
          no[i].trace();  //* on crÃ©e un nouvelle ellipse en faisant appel Ã  notre class *//
      }
    }
  //* si goute est vrai alors on fait appel Ã  la class Pluie *//
    if (goute) {
      p[0].eau ();
    }
  //* si on clique sur la souris, alors dessine est vrai et donc les filaments se dessinent et les ellipses apparraissent suivant les paramÃ¨tres dÃ©finis avant **//
    if (mousePressed){
      dessine=true;
      goute=false;  //* pour que lorsque l'on a dÃ©jÃ  appuyÃ© sur espace la class Pluie ne soit plus appelÃ©e *//
    }
  //* si l'on appuie sur une touche alors il se passera ce qu'on mettra *//
    if (keyPressed) {
      //* on prÃ©cise que lorsque la touche appuyer est espace alors tout est "effacer" *//
      if (key == 'd') {
        background(250);
        goute=false;  //* on dit que goute est faux pour arrÃªter l'appel Ã  la class Pluie *//
        dessine=false;  //* de mÃªme pour dessine, pour arrÃªter les filaments et ellipses de se dessiner *//
      }
      //* on prÃ©cise que si la touche appuyÃ©e est espace alors on fait appel Ã  la class Pluie *//
      if (key == ' '){
        goute=true;  //* on dit que goute est vrai pour que la class Pluie puisse entrer en action *//
        dessine=false;  //* pour que les filaments et ellipses arrÃªtent de tracer *//
        int m = 0;  //* on crÃ©e une variable pour l'opacitÃ© *//
        m = m + 10;  //* on prÃ©cise que cette variable augmentera de 10 (Ã  chaque fois que l'on clique oÃ¹ si on reste appuyÃ©) *//
        fill (#ffffff, m);  //* on prÃ©cise la couleur et l'opacitÃ© *//
        rect (0, 0, 600, 600); //* on crÃ©e un rectangle qui est transparent et qui petit Ã  petit va devenir opaque *//
      }
    }
}



