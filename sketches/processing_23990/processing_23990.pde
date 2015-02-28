
int colonnes = 5;
int rangees = 5;

int[][] visage; // tableau 2D

void setup(){
  size(400,400);
  smooth();
  noStroke();
  
  visage = new int[colonnes][rangees]; // chaque cellule prend comme valeur 0
  
  // Changer la valeur de certaines cellules
  visage[1][1] = 255;
  visage[3][1] = 255;
  visage[1][3] = 255;
  visage[2][3] = 255;
  visage[3][3] = 255;
  
}

void draw(){
  background(255);
  
  float largeurColonne = width/colonnes;
  float hateurRangee = height/rangees;
  
  fill(0);
  for(int i=0 ; i < colonnes ; i++){  
    for(int j=0 ; j < rangees ; j++){  
      color couleur =  visage[i][j];
      fill(couleur);
      float x = i*largeurColonne;
      float y = j*hateurRangee;
      rect( x+1 , y+1 , largeurColonne-2 , hateurRangee-2 );
    }
  }
}

