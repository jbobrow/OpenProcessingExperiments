

int marge = 15;
float x1 = marge; 
float y1 = 0;
float dh = 0;       // Direction horizontale // 1.0 = >> 0.0 = <<
int balle = 1;

// Initialisation
void setup() {
  size(400, 400);
  // size(screen.width,screen.height);
  background(0);
  frameRate(60);     // Cadence de l'animation
  smooth();
}

// Animation 
void draw() {
  // Dessine le fond
  noStroke();
  fill(0, 5);
  rect(0, 0, width, height);

  // Déplace le curseur
  for(int i = 0; i < balle; i ++) {
    // Limites horizontales
    if (x1 <= marge || x1 >= width-marge) {
      y1 += marge;
      dh = (dh+0.5)%1;
      balle += 1;


      if(y1 > height-marge){
        y1 = marge;
        balle = 1;
      }
    }

    // Direction
    if (round(dh) == 1) {
      x1 ++;
      // println( round(dh) +" >>");
    } 
    else if (round(dh) == 0) {
      x1 --;
      // println( round(dh) +" <<");
    }


    fill(255, 255);
    ellipse(x1, y1, 5, 5);

  }




}













