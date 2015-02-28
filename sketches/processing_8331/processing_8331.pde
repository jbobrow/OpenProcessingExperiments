
class Ball {

  color couleur;
  float x, y, taille;

  Ball(float depart_x, float depart_y, float t) {
    x = depart_x;
    y = depart_y;
    taille = t;
    couleur = color(random(255), 255, 255); // hue, saturation, brightness
  }

  void draw() {
    move();
    display();
  }

  void move() {
    // bouger aléatoirement en fonction de sa taille
    x += random(-taille/5,taille/5);
    y += random(-taille/5,taille/5);
    // boucler sur les bords du Sketch
    if (x > width + taille) x = -taille;
    if (x < -taille) x = width + taille;
    if (y > height + taille) y = -taille;
    if (y < -taille) y = height + taille;
  }

  void display() {
    smooth();
    // comme chaque bestiole change l'orientation, il faut mémoriser
    // l'orientation d'origine pour pouvoir y revenir après chaque dessin
    pushMatrix();

    stroke(random(0,50),0,0,5);
    // dessiner le corps
    fill(0,0,40);
    translate(x,y);
    // le corps est composé de plein de cercles
    for(int i=0; i<360; i+=30) {
      pushMatrix();

      point(0,0);
      popMatrix();
    }


    popMatrix(); // revenir à l'orientation d'origine

  }

}


