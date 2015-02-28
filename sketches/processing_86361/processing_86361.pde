
// la taile du triangle
int taille = 400;

void setup() {

  // taille de la fenetre
  size(500, 500);
  // fond blanc
  background(255);
  noStroke();
}

void draw() {

  // le repere est mis en bas au milieu
  translate(width/2, height);

  // J'execute une boucle 7 fois
  for (int boucle=0;boucle<7;boucle++) {

    // a chaque boucle, le repère est reduit de moitié
    scale(0.5);

    // on utilise le reste de 
    if (boucle%2 == 0 ) {
      fill(#FF0000);
    }
    else {
      fill(#FFFFFF);
    }
    triangle(-taille, 0, taille, 0, 0, -taille*2);
  }
}



