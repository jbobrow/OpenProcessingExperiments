
class Bibitte {
  PImage img;
  float x;
  float y;
  float demieLargeur;
  float demieHauteur;

  Bibitte(float x, float y, PImage img) {
    this.x = x;
    this.y = y;
    this.img = img;
    demieLargeur = img.width/2;
    demieHauteur = img.height/2;
  }

  void draw() {

    x = x + random(-2,2);
    y = y + random(-2,2);

    if ( x > width - demieLargeur) x = width - demieLargeur;
    else if ( x < demieLargeur) x = demieLargeur;
    else if ( y > height - demieHauteur) y = height - demieHauteur;
    else if ( y < demieHauteur) y = demieHauteur;

    // Dessiner la bibitte
    
    image(img,x-demieLargeur,y-demieHauteur);
    
  }
}


