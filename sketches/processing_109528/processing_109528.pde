
ArrayList<Balle> maBalle;
int nbBalle;

void setup()
{
  size(600, 400, JAVA2D);
  //stroke(0);
  strokeWeight(2);
  //fill(0);  

  nbBalle = 20;
  maBalle = new ArrayList<Balle>();
  for (int i=0; i<nbBalle; i++)
  {
    maBalle.add(new Balle(new PVector(random(20, width-20), random(20, height-20))));
  }
}

void draw()
{
  background(0);

  if (mousePressed)
  {
    maBalle.add(new Balle(new PVector(mouseX, mouseY)));
  }

  if (maBalle.size() >= 70)
  {
    maBalle.remove(0);
  }

  for (int i = 0; i < maBalle.size(); i++)
  {
    Balle b = maBalle.get(i);
    b.display();
  }
}

class Balle
{
  //variables globales
  PVector location; 
  PVector velocity;
  float t; // taille de la balle
  int col = 200;
  int incr = 20;
  float theta;
  float size;
  float a;

  //Mon constructeur, celui doit toujours avoir le même nom que la class afin d'être reconnu comme un constructeur.
  Balle(PVector _location)
  {
    //initialisation des variables.
    t = random(10, 20);
    theta = 0;
    location = _location;
    velocity = new PVector(random(-3, 3), random(-3, 3));
  }

  void display()
  {
    location.add(velocity);

    //detection des murs
    if (location.x <= t || location.x >= width-t)
    {
      velocity.x *= -1;
    }
    if (location.y <= t || location.y >= height-t)
    {
      velocity.y *= -1;
    }

    size = map(sin(theta), -1, 1, .5*t, 2*t);
    a = map(sin(theta), -1, 1, 30, 100);
    fill(col, a);
    stroke(255,a);
    ellipse(location.x, location.y, size, size);
    theta += .05;
  }
}



