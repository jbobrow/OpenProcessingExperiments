


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
   for (int j = 0; j < rangees ; j++ ) {
     
     float x = i * largeurColonne;
     float y =  j * hauteurRangee;
     
     fill(255, 127);
     rect(x, y, largeurColonne-1, hauteurRangee-1);
     
    }
  }

  
  
}


