
int colonnes = 5;
int rangees = 5;

int[ ][ ] visage;

void setup() {
  size(400,400);
  
  visage = new int[colonnes][rangees];
  
  
  for ( int i = 0 ; i < colonnes; i++ ) {
    for ( int j = 0 ; j < rangees; j++ ) {
      visage[i][j] = int(random(0,255));
    }
  }
}

void draw () {
  background(127);
  
  float largeurColonne = width / colonnes;
  float hauteurRangee = height / rangees;
  
  for ( int i = 0 ; i < colonnes; i++ ) {
    for ( int j = 0 ; j < rangees; j++ ) {
      fill( visage[i][j] );
      rect( i * largeurColonne, j * hauteurRangee, largeurColonne, hauteurRangee);
    }
  }
  
  
}



void mousePressed() {
  
  int i = int(mouseX / (width / colonnes));
  int j = int(mouseY / (height / rangees));
  
  println(i+ " "+j);
  
  visage[i][j] = int( random(0,255) );
  
}
