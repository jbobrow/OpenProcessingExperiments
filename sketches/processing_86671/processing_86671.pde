
int colonnes = 10;
int rangees = 10;

float largeurColonne;
float hauteurRangee;


void setup() {
  size(400, 400);
  smooth();
  
  largeurColonne = width/colonnes;
  hauteurRangee = height/rangees;

}


void draw() {

  background(0);

  noStroke();

  for (int i = 0; i < colonnes; i++ ) {
    fill(255, 127);
    float x = i * largeurColonne;
    rect( x , 0, largeurColonne-1, hauteurRangee-1);
  }

  for (int j = 0; j < rangees ; j++ ) {
    fill(255, 127);
    float y =  j * hauteurRangee;
    rect(0, y , largeurColonne-1, hauteurRangee-1);
  }
  
}
