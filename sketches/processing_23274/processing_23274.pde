
// Right click to start and stop the animation
// Left click and drag to add active cells


int colonnes = 32;
int rangees = 32;
int[][] cellules2d;
int[][] voisin2d;
int lastUpdate;
boolean hold;

void setup() {
  size(256,256);
  cellules2d = new int[colonnes][rangees];
  voisin2d = new int[colonnes][rangees];
  for ( int c =0; c < colonnes; c=c+1 ) {
    for ( int r =0; r < colonnes; r=r+1 ) {
      //cellules2d[c][r] = random(0,1) > 0.5;
      cellules2d[c][r] = 0;//floor(random(2))*255;
      voisin2d[c][r] = 0;
    }
  }
  lastUpdate = millis();
  hold = true;
}


void draw() {

  background(0);

  if ( mousePressed && mouseButton == LEFT   ) {
    
    activateCellUnderMouse();
    
  }
  
  if ( !hold  && millis() - lastUpdate > 125 ) {
    lastUpdate = millis();
    //if ( mousePressed == false && keyPressed == false) {

    // Le jeu de la vie
    // Trouver les huits voisins
    for ( int c =0; c < colonnes; c=c+1 ) {
      for ( int r =0; r < colonnes; r=r+1 ) {
        int voisins = 0;
        if ( cellules2d[(c-1 + colonnes) % colonnes][(r-1 + rangees) % rangees] == 255 ) voisins = voisins + 1;
        if ( cellules2d[c][(r-1 + rangees) % rangees] == 255 ) voisins = voisins + 1;
        if ( cellules2d[(c+1) % colonnes][(r-1 + rangees) % rangees] == 255 ) voisins = voisins + 1;
        if ( cellules2d[(c-1 + colonnes) % colonnes][r] == 255 ) voisins = voisins + 1;
        if ( cellules2d[(c+1) % colonnes][r] == 255 ) voisins = voisins + 1;
        if ( cellules2d[(c-1 + colonnes) % colonnes][(r+1) % rangees] == 255 ) voisins = voisins + 1;
        if ( cellules2d[c][(r+1) % rangees] == 255 ) voisins = voisins + 1;
        if ( cellules2d[(c+1) % colonnes][(r+1) % rangees] == 255 ) voisins = voisins + 1;
        voisin2d[c][r] = voisins;
      }
    }

    // Appliquer les regles
    for ( int c =0; c < colonnes; c=c+1 ) {
      for ( int r =0; r < colonnes; r=r+1 ) {
        if ( cellules2d[c][r] == 255) { // Cellule vivante
          
          if ( voisin2d[c][r] < 2 || voisin2d[c][r] > 3) cellules2d[c][r] = max(cellules2d[c][r] - 200,0);
        } 
        else { // Cellule morte
          
          if ( voisin2d[c][r] == 3) {
            cellules2d[c][r] = 255;
          } else {
            cellules2d[c][r] = max(cellules2d[c][r] - 200,0);
          }
        }
      }
      }
    }



    // Dessiner les cellules
    float largeur = width/colonnes;
    float hauteur = height/rangees;
    fill(255);
    for ( int c =0; c < colonnes; c=c+1 ) {
      for ( int r =0; r < colonnes; r=r+1 ) {
        fill(cellules2d[c][r]);
        //if ( cellules2d[c][r] ) {
          rect( largeur * c, hauteur * r, largeur, hauteur );
        //}
      }
    }
  
}

void mousePressed() {
 if ( mouseButton == LEFT) {
   activateCellUnderMouse(); 
 } else {
   hold = !hold;
 }
}



void activateCellUnderMouse() {
  // Dessiner
    float largeur = width/colonnes;
    float hauteur = height/rangees;
    for ( int c =0; c < colonnes; c=c+1 ) {
      for ( int r =0; r < colonnes; r=r+1 ) {
        if ( mouseX > c * largeur && mouseX < (c+1) * largeur
          && mouseY > r * hauteur && mouseY < (r+1) * hauteur ) {
          cellules2d[c][r] = 255;
        }
      }
    }
}                                               
