
//By Sophie Lejot
//ModifiÃ© par Marion Desmonnet
// corrigé par Emilie

//le thème du motif est il respecté : 3*
//Le motif initial est il visible au lancement : 3*
//Le sketch fonctionne-t-il cbien : 3*
//Le copyright est il présent : 3*
//Le code est il commenté clairement: 2*
//Le motif change t'il au clic : 3*
//La boucle for est-elle utilisée : 3*
//Y-a t'il des conditions if : 3*

//dÃ©finition des variables :
float x, y, l, h, z, w;
int ecart=1;
color vert=color(0, 255, 0); //couleur petits ronds
color bleu=color(0, 255, 255); //couleur grands ronds

void setup () {

  size(640, 640);
  noFill(); //pas de remplissage
  smooth() ; //lissage
  l = 20 ;
  h = 20 ;
  z = 40;
  w = 40;
}

void draw() {

  background(255);

  //petits ronds verts :
  for (int i=23; i<height; i+=60) {// condition de rÃ©pÃ©tition)
    for (int j=23; j<width; j+=60) {
      fill(vert);
      noStroke();
      ellipse(i, j, l, h);
    }
  }

  //grands ronds bleus :
  for (int x=50; x<height; x+=60) {// condition de rÃ©pÃ©tition)
    for (int y=50; y<width; y+=60) {
      fill(bleu);
      ellipse(x, y, z, w);
    }
  }


  //action lorsque l'on presse le bouton de la souris :
  if (mousePressed) {
    background(255);

    //redÃ©finition des variables :
    z = mouseX-200;
    w = mouseY-200;
    vert=color(0, 255, mouseX);
    bleu=color(mouseX, 0, mouseY, 70);

    for (int i=23; i<height; i+=60) {// condition de rÃ©pÃ©tition)
      for (int j=23; j<width; j+=60) {
        fill(vert);
        ellipse(i, j, l, h);
      }
    }

    for (int x=50; x<height; x+=60) {// condition de rÃ©pÃ©tition)
      for (int y=50; y<width; y+=60) {
        fill(bleu);
        ellipse(x, y, z, w);
      }
    }
  }
}

void keyPressed() {

  //enregistre captures d'Ã©cran si l'on presse 's' :
  if ( key == 's') {
    saveFrame("petitsronds-##.png");
  }
}



