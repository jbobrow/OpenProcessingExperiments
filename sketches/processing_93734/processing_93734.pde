
int colonnes, rangees, temps, currentTime, compteurTableauX, compteurTableauY;
float largeurColonne, hauteurRangee, espace;
float []tableauX;
float []tableauY;
ArrayList arrayCercle;
color couleur01, couleur02;
void setup() {
  size(400, 400);
  smooth();
  background(0);
  colonnes = 10;
  rangees = colonnes;
  espace = 20;
  compteurTableauX = 0;
  compteurTableauY = 0;
  temps = 175;
  largeurColonne = width / colonnes;
  hauteurRangee = height / rangees;
  couleur01 = color(255, 255, 255);//couleur du centre
  couleur02 = color(0, 0, 0);
  arrayCercle = new ArrayList();
  //for (int k = 0;k < colonnes * rangees;k++) {
  for ( int i = 0; i < colonnes;  i++ ) {
    for ( int j = 0; j < rangees; j++ ) {
      if (i%2 ==0) {
        if (j%2 ==0) arrayCercle.add(new Cercle(i * largeurColonne+espace, j * hauteurRangee+espace, largeurColonne, hauteurRangee, couleur01, couleur02));
        else arrayCercle.add(new Cercle(i * largeurColonne+espace, j * hauteurRangee+espace, largeurColonne, hauteurRangee, couleur02, couleur01));
      }
      else {
        if (j%2 ==0) arrayCercle.add(new Cercle(i * largeurColonne+espace, j * hauteurRangee+espace, largeurColonne, hauteurRangee, couleur02, couleur01));
        else arrayCercle.add(new Cercle(i * largeurColonne+espace, j * hauteurRangee+espace, largeurColonne, hauteurRangee, couleur01, couleur02));
      }
    }
    //if (i%2 ==0) {
    //arrayCercle.add(new Cercle(k % colonnes * largeurColonne + espace, int(k / rangees) * hauteurRangee + espace, largeurColonne, hauteurRangee, couleur01, couleur02));

    //else {
    // arrayCercle.add(new Cercle(k % colonnes * largeurColonne + espace, int(k / rangees) * hauteurRangee + espace, largeurColonne, hauteurRangee, couleur02, couleur01));
  }
  tableauX = new float[colonnes];
  tableauY = new float[rangees];
  for ( int i = 0; i < colonnes;  i++ ) {
    for ( int j = 0; j < rangees; j++ ) {
      tableauX[i] = i * largeurColonne;
      tableauY[j] = j * hauteurRangee;
    }
  }
}
void draw() {
  fill(0, 50);
  rect(0, 0, width, height);
  if (millis() - currentTime > temps) {
    currentTime = millis();
    compteurTableauX++;
  }
  for (int i = arrayCercle.size() - 1; i >= 0; i--) {
    Cercle unCercle = (Cercle) arrayCercle.get(i);
    unCercle.display();
    float distance = dist(unCercle.x, unCercle.y, mouseX, mouseY);
    if (mousePressed) {
      if (distance <= hauteurRangee / 2) unCercle.animer();
    }
    if (distance <= hauteurRangee / 2) unCercle.rotation();
    if (compteurTableauX >= tableauX.length) {
      compteurTableauX = 0;
      compteurTableauY++;
      if (compteurTableauY >= tableauY.length) compteurTableauY = 0;
    }
    float distance_02 = dist(unCercle.x, unCercle.y, tableauX[compteurTableauX] + espace, tableauY[compteurTableauY] + espace);
    if (distance_02 <= hauteurRangee / 2) unCercle.animationOpacite();
  }
}

class Cercle {
  float x, y, hauteur, largeur, compteur, compteurRotation, positionInitialeY, opacite;
  color couleur01, couleur02, melangeCouleur;
  Cercle(float _x, float _y, float _largeur, float _hauteur, color _couleur01, color _couleur02) {
    x = _x;
    y = _y;
    hauteur = _hauteur;
    largeur = _largeur;
    couleur01 = _couleur01;
    couleur02 = _couleur02;
    positionInitialeY = y;
    compteur = 0;
    opacite = 255;
    compteurRotation = 0;
  }
  void display() {
    noStroke();
    y += compteur;
    for (int i = 0;i < hauteur;i++) {
      pushMatrix();
      translate(x,y);
      rotate(compteurRotation);
      melangeCouleur = lerpColor(couleur01, couleur02, map(i, 0, hauteur, 0, 1));
      fill(melangeCouleur, map(i, 0, hauteur, 0, opacite));
      ellipse( 0, - i / 4, hauteur-i, largeur-i );
      popMatrix();
    }
    if (y - hauteur > height) {
      compteur = 0;
      y = positionInitialeY;
      opacite = 0;
    }
    if (opacite <= 255) {
      opacite += 25;
    }
  }
  void animer() {
    compteur = 10;
  }
  void rotation(){
    compteurRotation += 5;
  }
  void animationOpacite() {
    opacite = 0;
  }
}

