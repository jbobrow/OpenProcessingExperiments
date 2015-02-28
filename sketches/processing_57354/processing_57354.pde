
//Objet Baie brute
class Baies1 {

float x, y;

 Baies1(float x1, float y1) {
   x = x1;
   y = y1;
 }

 void draw() {
  fill(0);
  rect(x, y, echelle*largeur, -echelle*hauteur);
 }
 
}

