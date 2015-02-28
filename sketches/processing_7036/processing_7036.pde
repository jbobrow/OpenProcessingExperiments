
class Bouffe
{
  float x, y;
  int taille;
  color couleur;
  
  Bouffe()
  {
    taille = 20;
    couleur = #FFFFFF;
    x = random(width);
    y = random(height);
  }
  
  Bouffe(float _x, float _y)
  {
    taille = 20;
    couleur = #FFFFFF;
    x = _x;
    y = _y;
  }
  
  void dessiner()
  {
    stroke(0);
    strokeWeight(2);
    fill(couleur);
    ellipse(x,y,taille,taille);
  }
}

