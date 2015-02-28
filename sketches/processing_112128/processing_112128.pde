
ArrayList<Balle> maBalle;
int nbBalle;
float angle;

void setup() {
  size(640, 480);

  nbBalle = 40;
  maBalle = new ArrayList<Balle>();
  for (int i=0; i<nbBalle; i++)
  {
    maBalle.add(new Balle(new PVector(random(20, width-20), random(20, height-20))));
  }
}

void draw()
{
  background(#B8E1F2);

  if (mousePressed)
  {
    maBalle.add(new Balle(new PVector(mouseX, mouseY)));
  }

  if (maBalle.size() >= 100)
  {
    maBalle.remove(0);
  }

  for (int i = 0; i < maBalle.size(); i++)
  {
    Balle b = maBalle.get(i);
    b.display();
  }
/*
  if (frameCount % 3 == 0) {
    saveFrame("line-######.gif");
  }
  angle += 0.05;
  if (angle > 2*TWO_PI) {
    noLoop();
  }
*/  
}

void keyPressed() {
  save(random(12345)+".png");
}

class Balle
{
  //variables globales
  PVector loc, velocity; 
  float t; // taille de la balle
  float col = 200;
  int incr = 20;
  float theta;
  float size, sw;
  float a, r2;
  float r = .5;
  color c;
  color[] colors = {
    #249AA7, #ABD25E, #F8C830, #F1594A
  };

  //Mon constructeur, celui doit toujours avoir le mÃªme nom que la class afin d'Ãªtre reconnu comme un constructeur.
  Balle(PVector _location) {
    //initialisation des variables.
    t = 25;
    theta = random(PI);
    loc = _location;
    velocity = new PVector(random(-r, r), random(-r, r));
    int r2 = int(random(0, 4));
    c = colors[r2];
  }

  void display()
  {
    loc.add(velocity);

    //detection des murs
    if (loc.x <= t || loc.x >= width-t)
    {
      velocity.x *= -1;
    }
    if (loc.y <= t || loc.y >= height-t)
    {
      velocity.y *= -1;
    }

    size = map(sin(theta), -1, 1, 1.5*t, 3*t);
    //sw = map(sin(theta), -1, 1, 1, 10);
    sw = 6;
    a = map(sin(theta), -1, 1, 30, 60);
    //col = map(sin(theta), -1, 1, 0, 150);
    fill(255);
    strokeWeight(sw);
    stroke(c);
    ellipse(loc.x, loc.y, size, size);
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, size/2, size/2);
    theta += .05;
  }
}
