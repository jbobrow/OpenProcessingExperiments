
//par Fanny C
//modified by Emilie R
//evaluated by Fanny Claudon

//thÃ¨me respectÃ© ***
//le motif initial visible au lancement ***
//le sketch fonctionne bien ***
//copyright prÃ©sent ***
//code commentÃ© clairement ***
//le motif change au clic ***
//la boucle for est prÃ©sente ***
//pas de conditions if 

float l = 30;
float h = 30;

float rouge,vert,bleu; //variables

void setup() {
  size(400, 400); //taille de la fenÃ�Âªtre
  background(255); //fond blanc
  smooth(); //lissage
  noStroke(); //pas de contours
  frameRate(10); //nombre d'images/sec
  rouge=150; //on dÃ�Â©termine les variables
  vert=bleu=0;
}

void draw() {

    background(255); //fond blanc
  
  for (int i = 0; i<width; i+= 50) {  //mise en place de la grille du motif arriÃ�Â¨re plan
    for (int j = 0; j<height; j += 50) { //mise en place de la grille du motif arriÃ�Â¨re plan

      fill(rouge, vert, bleu); //couleur des rectangles
      rect(i + random(10), j + random(10), l, h); //rectangles qui se placent sur la grille alÃ�Â©atoirement
    }
  }  

  for (int i = 1; i<width; i+= 45) {  //mise en place de la grille de 1er plan
    for (int j = 1; j<height; j += 45) { //mise en place de la grille de 1er plan

      fill(rouge+100, vert, bleu); //couleur des rectangles
      rect(i + random(-5, 5), j + random(-5, 5), l, h); //rectangles qui se placent sur la grille alÃ�Â©atoirement
    }
  }
  if (mousePressed == true) { //si on clic, la couleur change
    rouge=vert=random(100,200); //le rouge et vert varient alÃ�Â©atoirement
    bleu=mouseX; //le bleu varie selon la position de la souris
    fill(rouge, vert, bleu);

  }else{ //sinon, le motif reprend les couleurs de base
  rouge=150;
  vert=bleu=0;
 }
}

void keyPressed() { //Capture d'Ã�Â©cran clavier : n'importe quelle touche
  save("image.png");
}



